let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  buildInputs =
    [ pkgs.stack
      pkgs.haskellPackages.ghc
      pkgs.haskellPackages.ghcid
      pkgs.haskellPackages.brittany
      pkgs.gcc
    ];
}
