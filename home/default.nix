{ config, pkgs, ...}:

{
    # Git configuration
    programs.git = {
      enable = true;
      userName = "iEvensen";
      #userEmail = "idar.evensen@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "kate";
        };
    };

    # Other dotfiles or Home Manager configs
    ###

    # Packages to install for the user
    home.packages = with pkgs; [

    ];
}
