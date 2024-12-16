{
  description = "A collection of flake templates";

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          just
        ];
      };

      templates = {
        rust-xtask = {
          path = ./rust-xtask;
          description = "Rust workspace with xtask concept";
          welcomText = ''
            Rust workspace with xtask concept means having a automation writing in rust names `xtask`.
            It has some benifits in CI or develop bootstrap.
          '';
        };
      };
    };
}
