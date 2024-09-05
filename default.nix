{ lib, stdenvNoCC, writeShellScript, ... }:

stdenvNoCC.mkDerivation {
  pname = "reedthesis";
  version = "1.0.0";

  outputs = [ "tex" ];

  src = ./.;

  nativeBuildInputs = [
    (writeShellScript "force-tex-output.sh" ''
     out="''${tex-}"
     '')
  ];

  installPhase = ''
    runHook preInstall

    path="$tex/tex/latex/reedthesis"

    mkdir -p "$path"

    cp reedthesis.cls "$path/"

    runHook postInstall
  '';
  
  meta = with lib; {
    platforms = platforms.all;
  };
}
