{ inputs
, config
, lib
, ...
}:
{
  users.groups.nix-access-tokens = { };
  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    settings = {
      experimental-features = "nix-command flakes impure-derivations ca-derivations";
      auto-optimise-store = true;
      trusted-users = [
        "root"
        "ievensen"
        "@wheel"
      ];
      download-buffer-size = 524288000;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };
}
