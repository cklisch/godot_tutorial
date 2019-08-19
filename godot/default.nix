{ stdenv, gcc, fetchFromGitHub, scons, yasm ? null }:
let
  bits = toString (if stdenv.is64bit then 64 else 32);
in
stdenv.mkDerivation rec {
  name = "godot";
  version = "3.0.6";
  src = fetchFromGitHub {
    owner  = "godotengine";
    repo   = "godot";
    rev    = "${version}-stable";
    sha256 = "0g64h0x8dlv6aa9ggfcidk2mknkfl5li7z1phcav8aqp9srj8avf";
  };
  buildInputs = [ scons gcc yasm ];
  enableParallelBuilding = true;
  buildPhase = ''
    scons platform=osx prefix=$out -j $NIX_BUILD_CORES bits=${bits}
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp bin/godot.osx.tools.${bits} $out/bin/godot
  '';
  meta = {
    homepage    = "https://godotengine.org";
    description = "Free and Open Source 2D and 3D game engine";
    license     = stdenv.lib.licenses.mit;
    platforms = [ "x86_64-darwin" ];
  };
}
