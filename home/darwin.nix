{ lib, ... }:

{
  programs.zsh.oh-my-zsh.plugins = lib.mkAfter [
    "iterm2"
    "brew"
    "macos"
  ];

  programs.zsh.shellAliases = lib.mkMerge [
    { brup = "brew update && brew upgrade && brew cleanup"; }
  ];
}

