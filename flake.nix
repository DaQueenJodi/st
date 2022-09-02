{
  inputs = {
    nixpkgs.url = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
  in {
    packages.${system}.st = nixpkgs.legacyPackages.${system}.st.overrideAttrs (
      old: {
        src = builtins.path {
          name = "st-source";
          path = ./.;
        };
      }
    );
  };
}
