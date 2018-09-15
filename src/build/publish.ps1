param([string]$betaver)

if ([string]::IsNullOrEmpty($betaver)) {
	$version = [Reflection.AssemblyName]::GetAssemblyName((resolve-path '..\interface\ISimpleHttpListener.Rx\bin\Release\netstandard2.0\ISimpleHttpListener.Rx.dll')).Version.ToString(3)
	}
else {
	$version = [Reflection.AssemblyName]::GetAssemblyName((resolve-path '..\interface\ISimpleHttpListener.Rx\bin\Release\netstandard2.0\ISimpleHttpListener.Rx.dll')).Version.ToString(3) + "-" + $betaver
}

.\build.ps1 $version

Nuget.exe push ".\NuGet\SimpleHttpListener.Rx.$version.symbols.nupkg" -Source https://www.nuget.org