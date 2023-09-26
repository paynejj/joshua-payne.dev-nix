let vars = import ../../../vars.nix; in
{
  enable = true;
  userName = vars.git_username;
  userEmail = vars.git_email;
  extraConfig = {
    init.defaultBranch = "main";
    pull.rebase = true;
    push.autoSetupRemote = true;
    fetch.prune = true;
    rebase = {
      # Any un-committed changes are automatically pushed/popped on rebase.
      autoStash = true;
      autoSquash = true;
    };
    status = {
      short = true;
    };
  };
}
