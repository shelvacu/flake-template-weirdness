{
  outputs = { self, nixpkgs, ... }: {
    deriv = nixpkgs.legacyPackages.x86_64-linux.writeTextFile {
      destination = "/flake.nix";
      text = "{ outputs = { ... }: { a = \"hello\"; }; }";
      name = "flake template";
    }; 
    templates.default = {
      path = "${self.deriv}";
      description = "blarg";
    };
  };
}
