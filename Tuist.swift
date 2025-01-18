import ProjectDescription

let tuist = Tuist(
//    Create an account with "tuist auth" and a project with "tuist project create"
//    then uncomment the section below and set the project full-handle.
//    * Read more: https://docs.tuist.io/guides/quick-start/gather-insights
//
//    fullHandle: "{account_handle}/{project_handle}",
    project: .tuist(
        compatibleXcodeVersions: "15.4",
        swiftVersion: "5.10",
        plugins: [
            .local(path: .relativeToRoot("Plugins/ModulePlugin")),
            .local(path: .relativeToRoot("Plugins/ThirdPartyDependency"))
        ],
        generationOptions: .options(),
        installOptions: .options()
    )
)
