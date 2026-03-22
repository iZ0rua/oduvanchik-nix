{ pkgs, lib, ... }: # This is the function header

let
  # 1. Define your bundle here, outside the main configuration set
  myDotnetBundle = with pkgs.dotnetCorePackages; combinePackages [
    sdk_9_0-bin
    sdk_10_0-bin
  ];

  runtimeLibs = with pkgs; [
    libx11
    libice
    libsm
    fontconfig
    icu
    zlib
    libGL
  ];
in 
{
  # 2. Now use it inside your configuration
  home.packages = [
    myDotnetBundle
    # ... your other dev packages (git, gcc, etc) ...
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${myDotnetBundle}/share/dotnet";
    LD_LIBRARY_PATH = "${lib.makeLibraryPath runtimeLibs}";
  };
}

