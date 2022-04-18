{ ...
}:

{
  # Note:
  # This option doesn't exist yet, just setting it for future usage when the
  # module is created and using atm so I can install packages if it is enabled
  programs.termusic = {
    enable = true;

    overlay = {
      enable = true;
      version = "0.6.11";
      sha256 = "sha256-MdFLPlfN+GF1yUkBFH9y22okgUyxnC+/HfcvD7HXDzc=";
      cargoOutputHash = "sha256-L6tbpzUu5hN5Vy5fflT81K6bt+sI/6ru7IAOI63gDvM=";
    };
  };
}
