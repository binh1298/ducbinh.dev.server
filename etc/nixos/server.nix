{
  pkgs,
  inputs,
  ...
}: {
  home = {
    username = "binh1298";
    homeDirectory = "/home/binh1298";
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
