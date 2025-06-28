$(Configuration) 当前项目配置的名称，例如“Debug”。
$(DevEnvDir) Visual Studio 的安装目录（定义为驱动器 + 路径）；包括尾随反斜杠 ()。
$(FrameworkDir) .NET Framework 的安装目录。
$(FrameworkSDKDir) 安装 .NET Framework 的目录。.NET Framework 可能作为 Visual Studio 的一部分安装，也可能单独安装。
$(FrameworkVersion) Visual Studio 使用的 .NET Framework 版本。与 结合$(FrameworkDir)，是 Visual Studio 使用的 .NET Framework 版本的完整路径。
$(FxCopDir) 文件的路径fxcop.cmd。fxcop.cmd并非所有 Visual Studio 版本都安装了该文件。
$(IntDir) 为中间文件指定的目录路径。如果是相对路径，中间文件将转到附加到项目目录的此路径。此路径应以反斜杠 () 结尾。它解析为中间目录属性的值。不要使用它$(OutDir)来定义此属性。
$(OutDir) 输出文件目录的路径。如果是相对路径，则输出文件将转到附加到项目目录的此路径。此路径应以反斜杠 () 结尾。它解析为输出目录属性的值。不要使用它$(IntDir)来定义此属性。
$(Platform) 当前项目平台的名称，例如“Win32”。
$(PlatformShortName) 当前体系结构的简称，例如“x86”或“x64”。
$(ProjectDir) 项目的目录（定义为驱动器 + 路径）；包括尾随的反斜杠 ()。
$(ProjectExt) 项目的文件扩展名。文件扩展名前包含“.”。
$(ProjectFileName) 项目的文件名（定义为基本名称+文件扩展名）。
$(ProjectName) 项目的基本名称。
$(ProjectPath) 项目的绝对路径名（定义为驱动器+路径+基本名称+文件扩展名）。
$(PublishDir) 发布目标的输出位置；包括尾随反斜杠 ()。默认为文件$(OutDir)app.publish\夹。
$(RemoteMachine) 设置为“调试”属性页上的“远程计算机”属性的值。有关更多信息，请参阅更改 C/C++ 调试配置的项目设置。
$(RootNameSpace) 包含应用程序的命名空间（如果有）。
$(SolutionDir) 解决方案的目录（定义为驱动器 + 路径）；包括尾随反斜杠 ()。仅在 IDE 中构建解决方案时定义。
$(SolutionExt) 解决方案的文件扩展名。文件扩展名前包含“.”。仅在 IDE 中构建解决方案时定义。
$(SolutionFileName) 解决方案的文件名（定义为基本名称 + 文件扩展名）。仅在 IDE 中构建解决方案时定义。
$(SolutionName) 解决方案的基本名称。仅在 IDE 中构建解决方案时定义。
$(SolutionPath) 解决方案的绝对路径名（定义为驱动器 + 路径 + 基本名称 + 文件扩展名）。仅在 IDE 中构建解决方案时定义。
$(TargetDir) 构建的主要输出文件的目录（定义为驱动器 + 路径）；包括尾随反斜杠 ()。
$(TargetExt) 构建的主要输出文件的文件扩展名。文件扩展名前包含“.”。
$(TargetFileName) 构建的主要输出文件的文件名（定义为基本名称 + 文件扩展名）。
$(TargetName) 构建的主要输出文件的基本名称。
$(TargetPath) 构建的主输出文件的绝对路径名（定义为驱动器 + 路径 + 基本名称 + 文件扩展名）。
$(VCInstallDir) 包含 Visual Studio 安装的 C++ 内容的目录。此属性包含目标 Microsoft C++ (MSVC) 工具集的版本，该版本可能与主机 Visual Studio 不同。例如，使用 构建时$(PlatformToolset) = v140，$(VCInstallDir)包含 Visual Studio 2015 安装的路径。
$(VSInstallDir) 安装 Visual Studio 的目录。此属性包含目标 Visual Studio 工具集的版本，该版本可能与主机 Visual Studio 不同。例如，使用 构建时$(PlatformToolset) = v110，$(VSInstallDir)包含 Visual Studio 2012 安装的路径。
$(WebDeployPath) 从 Web 部署根目录到项目输出所属位置的相对路径。
$(WebDeployRoot) 位置的绝对路径。例如，c:\inetpub\wwwroot。