{pkgs, ...}: let
  gitConfig = {
    extraConfig = {
      core.editor = "kate";
      init.defaultBranch = "main";
    };
    color.ui = true;
    pull.rebase = false;
    push.default = "upstream";
    github.user = "iEvensen";
  };
in {
  home.packages = with pkgs.gitAndTools; [
    diff-so-fancy # git diff with colors
    git-crypt # git files encryption
    hub # github command-line client
    tig # diff and commit view
    ];




    # Git configuration
    programs.git = {
      enable = true;
      userName = "iEvensen";
      userEmail = "idar.evensen@gmail.com";
      extraConfig = gitConfig;
      aliases = {
        br = "branch";
        co = "checkout";
        st = "status";
        cm = "commit -m";
      };
    };
}
