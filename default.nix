{ pkgs }:
with pkgs;
let
  godot-darwin = callPackage ./godot {};
  godot-dep = if stdenv.isDarwin then godot-darwin else godot;
in
stdenv.mkDerivation {
  name = "godot-tutorial";
  version = "0.0.0";
  buildInputs = [ godot-dep ];
  platforms = [ "x86_64-linux" "x86_64-darwin" ];
  shellHook = ''
    exec godot game/project.godot
  '';
}
