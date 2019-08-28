{ lib, stdenv, godot, unzip }:
let
  godot-darwin = stdenv.mkDerivation {
    name = "godot";
    version = "3.1.1";
    src = builtins.fetchurl {
      url = "https://downloads.tuxfamily.org/godotengine/3.1.1/Godot_v3.1.1-stable_osx.64.zip";
      sha256 = "1qf6n7cxd7jd2b5rirz3fmly4g75xc69n5ra2kb8i6bmkihynsxx";
    };
    buildInputs = [ unzip ];
    unpackPhase = "unzip $src";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/bin
      cp -RL Godot.app/Contents/MacOS/Godot $out/bin/godot
    '';
  };
  godot-dep = if stdenv.isDarwin then godot-darwin else godot;
in
stdenv.mkDerivation {
  name = "godot-tutorial";
  version = "0.0.0";
  buildInputs = [ godot-dep ];
  platforms = [ "x86_64-linux" "x86_64-darwin" ];
  shellHook = ''
    godot game/project.godot
  '';
}
