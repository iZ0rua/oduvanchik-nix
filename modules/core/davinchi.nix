{ config, pkgs, ... }:

let
  # 1. Call your original derivation (ensure your very first script is saved as davinci.nix)
  davinci-studio-base = pkgs.callPackage ./davinci.nix {
    studioVariant = true;
  };

  # 2. Override the version and hash for 20.1
  davinci-studio-20-1 = davinci-studio-base.overrideAttrs (old: rec {
    version = "20.1";
    src = old.src.overrideAttrs (oldSrc: {
      VERSION = version;

      # Replace this fakeHash with the actual hash you grabbed from the nix-build failure
      # Example format: "sha256-XyZ123..."
      outputHash = pkgs.lib.fakeHash;
    });
  });
in
{
  # 3. Add the customized package to your system
  environment.systemPackages = [
    davinci-studio-20-1
  ];
}
