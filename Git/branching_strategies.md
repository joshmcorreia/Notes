# Git Branching Strategies

- [Branching Strategies Explained - YouTube](https://www.youtube.com/watch?v=U_IFGpJDbeU)

## Trunk-Based Development
- https://trunkbaseddevelopment.com/
- There are multiple variations of trunk-based development, some times teams commit directly to master, and other times teams make small short-lived feature branches that are then merged back into `main`.

## Feature Branches/GitHub Flow
- `main` is a long-lived branch that nobody can push to and changes can only be added via merges.
- New features are worked on in a feature branch and then merged back into `main`.

## Forking
- Used by open source repositories where contributors are different from maintainers.
- Contributors make a fork of the repository so that they have write permissions. The contributor makes a branch with a change, then makes a merge request from their fork into the original repository.

## Release Branches
- One branch per release.
- Useful when you need to support multiple versions of your code, such as extended release cycles when an older version of your code may receive bug fixes.

## GitFlow
**Note:** This branching strategy is considered legacy and is rarely used anymore.
- https://nvie.com/posts/a-successful-git-branching-model/
- Multiple long-lived branches exist, such as `main`, `develop`, and `release`.
