# GitLab CI/CD Rules
The official documentation on rules can be found [here](https://docs.gitlab.com/ee/ci/yaml/#rules)

## Only run a job during a merge request
This will run the specified job during a merge request event, meaning if you put up a merge request this job will be run during that pipeline. Be careful not to use this for jobs that deploy code because that code will be deployed before the merge request is accepted.
```
rules:
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
```

## Only run a job after a successful merge request
This will run the specified job during a successful merge request event, meaning the merge request was actually merged into the target branch. It is important to add these rules to deploy steps to make sure that code is not deployed until it has been approved and successfully merged.

GitLab does not currently have a built-in trigger to check when a merge request succeeds, but this can be accomplished by checking the target branch and whether or not the commit was a push. [Source](https://stackoverflow.com/a/63893810)
```
rules:
    - if: '$CI_PIPELINE_SOURCE == "push" && $CI_COMMIT_REF_NAME == "master"'
```

## Handling Cancelled Jobs
When cancelling jobs in GitLab, scripts do not have a chance to properly clean up. This is a problem when instances are started and not properly shut down. An example of this that I've encountered at work is as follows:
1. Our validation test job starts which spins up multiple AWS instances
2. New code is committed to GitLab, so the current jobs are automatically cancelled in favor of the CI/CD pipeline being run for the new commit
3. The multiple AWS instances that were spun up in step 1 continue to run since the cleanup script is never run. This is very costly in the long term and unnecessary.

Tickets for this issue have been raised with GitLab in the following places:
1. https://gitlab.com/gitlab-org/gitlab-foss/-/issues/34861
2. https://gitlab.com/gitlab-org/gitlab-foss/-/issues/20727
3. https://gitlab.com/gitlab-org/gitlab/-/issues/15603

Until GitLab decides to implement a way to clean up after jobs are cancelled, there are a couple (not great) solutions.

### Handling Automatically Cancelled Jobs
The first solution involves disabling auto-cancel. In GitLab you can go to `Settings -> CI/CD -> General Pipelines -> Disable "Auto-cancel redundant pipelines"`. This will prevent jobs from being automatically cancelled when new code is committed, but at the cost of redundant pipelines being run.

The second solution involves using the [`interruptible`](https://docs.gitlab.com/ee/ci/yaml/#interruptible) keyword. If set to `false` on a job, it can be used to prevent a job from stopping mid-execution. This is especially crucial around sections that spin up things like AWS, because they can cost lots of money if not cleaned up properly.

### Handling Manually Cancelled Jobs
Unfortunately the only solution to this currently involves telling users to not cancel jobs. It sucks, but that's the best we've got, at least until GitLab decides to fix the tickets listed above.

## Prevent Merges That Are Behind On Commits
To prevent merges that break code and mess up the Git history, it is important to block merges until the branch-to-be-merged is up to date with the branch that it will be merged into.

TODO: relevant post [here](https://stackoverflow.com/questions/45015210)
