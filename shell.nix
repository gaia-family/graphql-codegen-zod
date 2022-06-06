let
  # pinned package repo
  stable =
    import (builtins.fetchTarball {
      name = "nixos-21.11";
      url = https://github.com/NixOS/nixpkgs/archive/21.11.tar.gz;
      sha256 = "162dywda2dvfj1248afxc45kcrg83appjd0nmdb541hl7rnncf02";
    }) {};

  # rolling package repo
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };

in stable.mkShell {
  buildInputs = [ 
    stable.nodejs-16_x 
    stable.yarn
  ];
}