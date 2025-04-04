{ config, pkgs, ... }:

let
  homeDirectory = "/home/%USER_NICK%";
in
{
  nixpkgs.config =
    {
      allowUnfree = true;
    };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "%USER_NICK%";
  home.homeDirectory = "${homeDirectory}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  fonts.fontconfig.enable = true;

  services.dunst.enable = true;

  home.packages = [
    # Dev tools
    pkgs.lazygit
    pkgs.git
    pkgs.neovim
    pkgs.tmux
    pkgs.ripgrep
    pkgs.fd

    # Game deving
    # pkgs.godot_4

    # Slack tools
    pkgs.discord
    pkgs.spotify

    # Compilers/interpreters/package managers etc
    pkgs.gcc
    pkgs.go
    pkgs.nodejs
    pkgs.rustc
    pkgs.cargo

    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.droid-sans-mono

    pkgs.brightnessctl

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    (pkgs.writeShellScriptBin "nixos-rebuild-pathed" ''
      nixos-rebuild -I nixos-config=${homeDirectory}/.config/nixos/configuration.nix $@
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
