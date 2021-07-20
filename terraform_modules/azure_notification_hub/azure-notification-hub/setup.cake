#load nuget:?package=ce.devops.scripts.build.cake
using System.Linq;

Environment.SetupDefaultEnvironmentVariables(Context);

BuildParameters.SetParameters(context: Context,
                            buildSystem: BuildSystem,
                            sourceDirectoryPath: "./src",
                            enablePackAndPublishSeparation: true,
                            title: "azure-notification-hub");

Build.RunTerraformModule();
