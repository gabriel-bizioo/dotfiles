# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "HAL-9000"; # Define your hostname.
  networking.wireless.enable = true;

  nix.settings.experimental-features = [ "nix-command"  "flakes" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  security.rtkit.enable = true;
  environment.variables = {
      EDITOR = "nvim";
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services = {
  # Configure keymap in X11
      xserver.xkb = {
          layout = "br";
          variant = "thinkpad60";
      };

      pipewire = {
         enable = true;
         alsa.support32Bit = true;
         pulse.enable = true;
      };

      pipewire.wireplumber.configPackages = [
         (pkgs.writeTextDir "share/wireplumber/bluetooth.lua.d/51-bluez-config.lua" ''
           bluez_monitor.properties = {
	       ["bluez5.enable-sbc-xq"] = true,
	       ["bluez5.enable-msbc"] = true,
	       ["bluez5.enable-hw-volume"] = true,
	       ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
	    }
         '')
      ];

      blueman.enable = true;

      displayManager.sddm = {
      	  enable = true;
          wayland.enable = true;
      };
  };

  # Configure console keymap
  console.keyMap = "br";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bizio = {
    isNormalUser = true;
    description = "bizio";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
  };

  home-manager = {
      extraSpecialArgs = { inherit inputs; };
      users = {
           "bizio" = import ./home.nix;
      };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  xdg.portal.wlr.enable=true;

  programs.sway = { 
      enable = true;
      wrapperFeatures.gtk = true;
      extraPackages = with pkgs; [
        swaylock
        swayidle
        wl-clipboard
        mako
        grim
        slurp
        rofi-wayland
      ];
      extraSessionCommands = ''
          export SDL_VIDEODRIVER=wayland
          export QT_QPA_PLATFORM=wayland
          export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
          export _JAVA_AWT_WM_NONREPARENTING=1
          export MOZ_ENABLE_WAYLAND=1
      '';
  };

  programs.waybar.enable = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
      neovim
      gcc
      rustc
      nodejs
      valgrind
      gdb
      cargo
      zip
      unzip
      htop
      git
      wine
      protontricks
      wget
      wlroots
      wayland
      vulkan-tools
      mpvpaper
      kitty
      bat
      lsd
      eza
      fastfetch
      gammastep
      fish
      starship
      rofi-wayland
      qbittorrent
      firefox
      tor-browser
      steam
      protonup-ng
      discord
      pavucontrol
      _7zz
      p7zip
      gnome.zenity
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
