{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    zsh
    tmux
    tig
    bpytop
    fzf
    go
    gnumake
    asdf-vm
  ];

  home.sessionVariables = {
    CGO_ENABLED = "1";
  };

  programs.zsh = {
    enable = true;

    initContent = lib.mkOrder 500 ''
      COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
    '';

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "aliases"
        "asdf"
        "command-not-found"
        "common-aliases"
        "docker"
        "docker-compose"
        "git"
        "fzf"
        "golang"
        "gcloud"
      ];
    };

    shellAliases = {
      top = "bpytop";
      htop = "bpytop";
      cur = "cursor .";

      tls = "tmux ls";
      ta = "tmux attach";

      tst = "tig status";
      tlo = "tig log";
      gswm = "git switch main";

      gm = "go mod vendor && go mod tidy";
      gt = "go mod tidy";

      mk = "make build";
      ml = "make build && make lint";

      src = "source ~/.zshrc";
    };
  };
}

