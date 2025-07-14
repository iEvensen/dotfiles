{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "codebook";
  users.users = {
    ievensen = {
      isNormalUser = true;
      initialHashedPassword = "$7$CU..../....w0X1o8Pvt3FYDLO7PAGmD.$xmVRVe4EziFuc7961.Kr/Z6tCfCNhGSbj/ZxdTG.r04";
      openssh.authorizedKeys.keys = [
      ];
      extraGroups = [
        "wheel"
        "video"
        "audio"
        "plugdev"
        "pipewire"
      ];
    };
  };

  # Modules loaded
  system = {
    disks.extraStoreDisk.enable = false;
    bluetooth.enable = true;
  };

  service = {
    blueman.enable = true;
    touchpad.enable = true;
  };
}
