{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord-canary

    (makeDesktopItem {
      name = "discord-canary-proxy";
      desktopName = "Discord Canary (Proxy)";
      genericName = "Internet Messenger";
      exec = "discordcanary --proxy-server=http://127.0.0.1:7890";
      icon = "discord-canary";
      categories = [ "Network" "InstantMessaging" ];
      terminal = false;
    })
  ];
}
