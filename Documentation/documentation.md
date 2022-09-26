# Documentation Notes

## Best Practices
[styleguide Documentation Best Practices](https://google.github.io/styleguide/docguide/best_practices.html)
> A small set of fresh and accurate docs are better than a sprawling, loose assembly of “documentation” in various states of disrepair.

> Docs work best when they are alive but frequently trimmed, like a bonsai tree.

> Dead docs are bad. They misinform, they slow down, they incite despair in engineers and laziness in team leads. They set a precedent for leaving behind messes in a code base. If your home is clean, most guests will be clean without being asked.

> It’s easy to write something a computer understands, it’s much harder to write something both a human and a computer understand. Your mission as a Code Health-conscious engineer is to write for humans first, computers second. Documentation is an important part of this skill.

[What are good and bad ways to document a software project?](https://stackoverflow.com/questions/1796376)
> the most important things to document are the decisions. This goes for everything from requirements to architectural choices. What are the requirements of module X? How are these requirements represented in the architecture? Why did you choose architectural pattern A over B? What are the benefits?

> too much documentation, and you end up spending as much time maintaining the documentation as you do maintaining the project

[Source Code Documentation Best Practices](https://easternpeak.com/blog/source-code-documentation-best-practices/)
> It is good for knowledge transfer. Not all code is equally obvious. There might be some complex algorithms or custom workarounds that are not clear enough for other developers.

> Product documentation describes dependencies between system modules and third-party tools. Thus, it may be needed for integration purposes.

> Some teams may prefer to skip code documentation in order to save time, money and effort. Keep in mind though that this might result in even more significant expenses once the product is transferred to another team or when updates are required down the line.

## The purpose of a README
[About READMEs](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes)
> You can add a README file to your repository to tell other people why your project is useful, what they can do with your project, and how they can use it.

> A README is often the first item a visitor will see when visiting your repository. README files typically include information on:
> - What the project does
> - Why the project is useful
> - How users can get started with the project
> - Where users can get help with your project
> - Who maintains and contributes to the project


## Confluence vs READMEs
[Why You Shouldn’t Use Confluence for Code Documentation](https://medium.com/codex/why-you-shouldnt-use-confluence-for-code-documentation-9363d025951c)
- Developers work in code repositories, not Confluence
- Small changes to code can make documentation stale, such as adding or removing a button
- Developers may not be aware of all the documentation on Confluence
- Lack of peer review (no merge requests in Confluence like there are in code repos)

[As a software engineer, how would you differentiate between what to document in a confluence page vs readme in your project stored in source code repo?](https://www.quora.com/As-a-software-engineer-how-would-you-differentiate-between-what-to-document-in-a-confluence-page-vs-readme-in-your-project-stored-in-source-code-repo)
> Readme contains details of how to compile and run the code, maybe details of anything special you might have to do to run the system locally for development and/or testing. Confluence contains overarching documentation which doesn't specifically belong to one piece of code.

> Keeping documentation up to date enough to be useful is a large overhead and should not be taken on lightly. Some documents are genuinely useful and worth the effort, many are not and wherever possible one should not waste time creating documents which will not be kept up to date. The tricky part is identifying the dividing line.

> 
