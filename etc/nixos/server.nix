{
  pkgs,
  inputs,
  ...
}: {
  home = {
    username = "ducbinh";
    homeDirectory = "/home/ducbinh";
    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
  };

  # Imports
  imports = [];

  # Allow unfree packages + use overlays
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [];
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];
}
