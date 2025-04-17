let
  more = {
    services = {
      pasystray.enable = true;
    };
  };
in
[
  ./persist.nix
  ./privacy.nix
  more
]
