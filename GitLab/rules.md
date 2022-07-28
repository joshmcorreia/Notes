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
    - if: '$CI_PIPELINE_SOURCE == "push" && $CI_BUILD_REF_NAME == "master"'
```
