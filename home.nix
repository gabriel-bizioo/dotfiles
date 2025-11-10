{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bizio";
  home.homeDirectory = "/home/bizio";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ 
        "Hack"
        "FiraCode"
        "JetBrainsMono"
    ]; })

    (pkgs.writeShellScriptBin "openpodbay" ''
        echo "I'm sorry ${config.home.username}, but I'm afraid I can't do that."
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".screenrc".source = dotfiles/screenrc;
  };


  gtk = {
      enable = true;

      theme = {
          name = "tokyonight";
          package = pkgs.tokyonight-gtk-theme;
      };

      gtk3.extraConfig = {
          Settings = ''gtk-application-prefer-dark-theme=1'';
      };

      gtk4.extraConfig = {
          Settings = ''gtk-application-prefer-dark-theme=1'';
      };
  };
  programs.git = {
      enable = true;
      userName = "gabriel-bizioo";
      userEmail = "gabriel.bizio@ufpr.br";
  };

  home.sessionVariables = {
      C3SL = "ssh.c3sl.ufpr.br";
      GTK_THEME = "tokyonight";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
 
