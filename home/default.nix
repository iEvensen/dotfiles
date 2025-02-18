{...}: let
  username = "idev";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";
in {
  programs = {
    home-manager.enable = true;
    gh.enable = true;
  };
  imports = builtins.concatMap import [
    ./cli
    ./programs
  ];
  home = {
    inherit username homeDirectory;
    stateVersion = "24.11";
  };
   # restart services on change
  systemd.user.startServices = "sd-switch";




}
