{
  description = ''IUP FFI bindings'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-niup-v3_30_6.flake = false;
  inputs.src-niup-v3_30_6.owner = "dariolah";
  inputs.src-niup-v3_30_6.ref   = "v3_30_6";
  inputs.src-niup-v3_30_6.repo  = "niup";
  inputs.src-niup-v3_30_6.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-niup-v3_30_6"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-niup-v3_30_6";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}