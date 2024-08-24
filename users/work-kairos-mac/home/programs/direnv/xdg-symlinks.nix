{ enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = true;
    vals = {
      "direnv/direnvrc".source = ./symlinked/direnvrc;
    };
  }
]
