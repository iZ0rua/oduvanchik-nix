{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;

      gamescopeSession.enable = true;

      extraCompatPackages = [ pkgs.proton-ge-bin ];
      package = pkgs.millennium-steam;
    };

    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };
  };

  hardware.steam-hardware.enable = true;
  services.joycond.enable = true;
}
