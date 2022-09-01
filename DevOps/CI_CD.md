# Continuous Integration

### What is Continuous Integration?
[Source](https://aws.amazon.com/devops/continuous-integration/)
> Continuous integration is a DevOps software development practice where developers regularly merge their code changes into a central repository, after which automated builds and tests are run. Continuous integration most often refers to the build or integration stage of the software release process and entails both an automation component (e.g. a CI or build service) and a cultural component (e.g. learning to integrate frequently). The key goals of continuous integration are to find and address bugs quicker, improve software quality, and reduce the time it takes to validate and release new software updates.

### Why is Continuous Integration Needed?
[Source](https://aws.amazon.com/devops/continuous-integration/)
> In the past, developers on a team might work in isolation for an extended period of time and only merge their changes to the master branch once their work was completed. This made merging code changes difficult and time-consuming, and also resulted in bugs accumulating for a long time without correction. These factors made it harder to deliver updates to customers quickly.

### How does Continuous Integration Work?
[Source](https://aws.amazon.com/devops/continuous-integration/)
> With continuous integration, developers frequently commit to a shared repository using a version control system such as Git. Prior to each commit, developers may choose to run local unit tests on their code as an extra verification layer before integrating. A continuous integration service automatically builds and runs unit tests on the new code changes to immediately surface any errors.

### How do you code review with Continuous Integration?
[This answer](https://softwareengineering.stackexchange.com/a/121665) points out something important:
> a good point could be made that 'why bother reviewing if the CI test automation hasn't run on it?', so perhaps the best would be to give developers each a private branch that the CI server will build and test for them. That way they first commit and push there, then once it passes get it reviewed, then merge to mainline (where it will get another run through the CI server).

From personal experience I have found this to be important.
1. Developer writes code on a feature branch
2. Every time code is commited, CI runs on that branch and ensures that the code builds properly. If the code does not build properly then that developer will have to make another commit which fixes the issue(s)
3. When the developer is done with their branch, they make a merge request
4. Other developers review the merge request, only after the pipelines successfully complete. This ensures that other developers are not wasting their time reviewing code that is incorrect. Reviewers should check for things that are harder to detect via automation, such as ensuring best practices are followed or ensuring that security vulnerabilities are not introduced.

---

# Continuous Delivery

### What is Continuous Delivery?
[Source](https://aws.amazon.com/devops/continuous-delivery/)
> Continuous delivery is a software development practice where code changes are automatically prepared for a release to production. A pillar of modern application development, continuous delivery expands upon continuous integration by deploying all code changes to a testing environment and/or a production environment after the build stage. When properly implemented, developers will always have a deployment-ready build artifact that has passed through a standardized test process.
> 
> Continuous delivery lets developers automate testing beyond just unit tests so they can verify application updates across multiple dimensions before deploying to customers. These tests may include UI testing, load testing, integration testing, API reliability testing, etc. This helps developers more thoroughly validate updates and pre-emptively discover issues. With the cloud, it is easy and cost-effective to automate the creation and replication of multiple environments for testing, which was previously difficult to do on-premises.

---

# Continuous Deployment

### Continuous Delivery vs. Continuous Deployment
[Source](https://aws.amazon.com/devops/continuous-delivery/)
> With continuous delivery, every code change is built, tested, and then pushed to a non-production testing or staging environment. There can be multiple, parallel test stages before a production deployment. The difference between continuous delivery and continuous deployment is the presence of a manual approval to update to production. With continuous deployment, production happens automatically without explicit approval.
