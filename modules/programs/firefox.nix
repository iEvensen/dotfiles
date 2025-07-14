{ pkgs, config, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-devedition-unwrapped {
      extraPolicies = {
        ExtensionSettings = { };
      };
    };
  };

  home.persistence."/persist/${config.home.homeDirectory}" = {
    directories = [
      ".mozilla"
    ];
  };
}
