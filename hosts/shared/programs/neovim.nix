{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      ripgrep
      libgcc
      libstdcxx5
    ];
  };
}
