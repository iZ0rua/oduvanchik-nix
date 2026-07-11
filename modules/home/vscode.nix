{
  pkgs,
  ...
}:
let
  ollamaCuda = pkgs.ollama.override { acceleration = "cuda"; };
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      golang.go
    ];
  };

  home.packages = with pkgs; [
    pipes-rs
    cbonsai
    cmatrix
    samrewritten
    asciiquarium-transparent
    protontricks
    chromium
    gh
    obsidian
    virt-manager
    tesseract
    cool-retro-term
    ollamaCuda
  ];

  systemd.user.services.ollama = {
    Unit.Description = "Ollama server";
    Install.WantedBy = [ "default.target" ];
    Service = {
      ExecStart = "${ollamaCuda}/bin/ollama serve";
      Restart = "on-failure";
    };
  };
}
