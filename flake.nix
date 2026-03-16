{
  description = "React example application demonstrating Akeyless OIDC identity provider integration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.default = pkgs.buildNpmPackage {
        pname = "akeyless-oidc-identity-provider-example";
        version = "0.0.0-dev";
        src = self;
        npmDepsHash = "sha256-IBqZaU2SiOdXxPclbx+C4MLjSrUBl0TGCguBf6YORRU=";
        dontNpmBuild = false;
        npmBuildScript = "build";
        meta = {
          description = "React example application demonstrating Akeyless OIDC identity provider integration";
          homepage = "https://github.com/pleme-io/akeyless-oidc-identity-provider-example";
          license = pkgs.lib.licenses.mit;
        };
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ nodejs_22 ];
      };
    });
}
