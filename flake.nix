{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    conduit = {
      url = "gitlab:famedly/conduit";

      # Assuming you have an input for nixpkgs called `nixpkgs`. If you experience
      # build failures while using this, try commenting/deleting this line. This
      # will probably also require you to always build from source.
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    # Matrix
    nix-matrix-appservices.url = "gitlab:coffeetables/nix-matrix-appservices";
  };

  outputs = {
    self,
    nixpkgs,
    nix-matrix-appservices,
    nixpkgs-unstable,
    ...
  } @ inputs: {
    nixosConfigurations.sorry2004 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        ./matrix.nix
        nix-matrix-appservices.nixosModule
        {
          nixpkgs.overlays = [
            (final: prev: {
              mautrix-signal = nixpkgs-unstable.legacyPackages.x86_64-linux.mautrix-signal;
            })
          ];
        }
      ];
    };
  };
}
