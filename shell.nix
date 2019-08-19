let
  pkgs = import (builtins.fetchGit {
    name = "nixpkgs";
    url = "https://github.com/NixOS/nixpkgs";
    ref = "release-19.03";
    rev = "520c39049f585c05f216bc12c088e4f5fd988d73";
  }) {};
in
pkgs.callPackage ./. {}
