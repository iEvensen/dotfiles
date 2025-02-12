{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ];
  # Network Configuration
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };
  # NisOS Flake and nix Configuration
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      trusted-users = ["root" "idev" "@wheel"];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };
  };

  security = {
    rtkit.enable = true;
  };
  # Set your time zone.
  time.timeZone = "Europe/Oslo";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  system = {
    stateVersion = "24.11";
    autoUpgrade = {
      enable = true;
      dates = "weekly";
      };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
