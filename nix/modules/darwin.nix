{ pkgs, ... }: {
  nix.enable = false;
  nixpkgs.config.allowUnfree = true;

  system.defaults = {
    dock.autohide = true;
    finder.AppleShowAllExtensions = true;
  };

  environment.systemPackages = with pkgs; [
    git
  ];

  # nix 管理の fish をログインシェルにする。
  # /etc/fish 経由で /run/current-system/sw/bin と /etc/profiles/per-user/<user>/bin
  # (home.packages の置き場所) が PATH に入るので、config.fish で手書きする必要はない。
  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];

  system.stateVersion = 6;
}
