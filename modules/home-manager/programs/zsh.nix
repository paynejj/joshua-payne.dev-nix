{
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  syntaxHighlighting.enable = true;
  dotDir = ".config/zsh";
  # Link homebrew apps
  initExtra = ''
            source ~/.profile
    				if [[ $(uname -m) == 'arm64' ]]; then 
    					eval "$(/opt/homebrew/bin/brew shellenv)"
    						fi
    						'';
}
