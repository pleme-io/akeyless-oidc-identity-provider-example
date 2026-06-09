{
  description = "React example application demonstrating Akeyless OIDC identity provider integration";
  inputs = {
    nixpkgs.follows = "substrate/nixpkgs";
    substrate = { url = "github:pleme-io/substrate";};
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "npm";
    builder = "package";
    pname = "akeyless-oidc-identity-provider-example";
    npmDepsHash = "sha256-IBqZaU2SiOdXxPclbx+C4MLjSrUBl0TGCguBf6YORRU=";
    dontNpmBuild = false;
    npmBuildScript = "build";
    description = "React example application demonstrating Akeyless OIDC identity provider integration";
  };
}
