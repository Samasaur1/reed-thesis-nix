{
  description = "The Reed College thesis LaTeX class";

  inputs = {
  };

  outputs = { self, nixpkgs, ... }:
    let
      allSystem = nixpkgs.lib.systems.flakeExposed;
      forAllSystems = nixpkgs.lib.genAttrs allSystem;
      define = f: forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = {
            };
          };
        in
          f pkgs
      );
    in {
      packages = define (pkgs: { default = pkgs.callPackage ./. {}; });
    };
}
