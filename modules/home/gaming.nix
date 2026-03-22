{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lutris

    
    #wineWow64Packages.stable
    wineWow64Packages.stagingFull
    #wineWow64Packages.waylandFull
    winetricks


    cabextract

    heroic-unwrapped

    ## Minecraft
    prismlauncher

    ## Cli games
    vitetris
    nethack

    osu-lazer-bin
  ];
}
