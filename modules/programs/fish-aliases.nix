{ pkgs, lib, ... }:
let
  dc = "${pkgs.docker-compose}/bin/docker-compose";
in
{
  # Shared fish aliases used by both system and home-manager configurations
  fishAliases = {
    inherit dc;

    # Tool replacements
    cat = "bat";
    du = "${pkgs.ncdu}/bin/ncdu --color dark -rr -x";
    ls = "${pkgs.eza}/bin/eza";
    la = "${lib.getExe pkgs.eza} --long --all --group --header --group-directories-first --sort=type --icons";
    lg = "${lib.getExe pkgs.eza} --long --all --group --header --git";
    lt = "${lib.getExe pkgs.eza} --long --all --group --header --tree --level ";
    ping = "${pkgs.prettyping}/bin/prettyping";
    tree = "${pkgs.eza}/bin/eza -T";
    xdg-open = "${pkgs.mimeo}/bin/mimeo";

    # Navigation
    ".." = "cd ..";

    # Docker
    dps = "${dc} ps";
    dcd = "${dc} down --remove-orphans";
    drm = "docker images -a -q | xargs docker rmi -f";

    # Nix
    nixgc = "nix-collect-garbage";
    nixgcd = "sudo nix-collect-garbage -d";
    update = "nix flake update";
    supdate = "sudo nix flake update";
    upgrade = "sudo nixos-rebuild switch --flake";

    # Locations
    dot = "cd ~/Sources/dotfiles";
    doc = "cd ~/Documents";
    neovim = "cd ~/Projects/neovim";
    work = "cd ~/Projects/workspace";
    www = "cd ~/Projects/wwwsite/";
  };
}
