
{
	description = "";
	
	inputs = {
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7.url = "github:nixos/nixpkgs/1ebb7d7bba2953a4223956cfb5f068b0095f84a7";
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14.url = "github:nixos/nixpkgs/ac5c1886fd9fe49748d7ab80accc4c847481df14";
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4.url = "github:nixos/nixpkgs/7445ccd775d8b892fc56448d17345443a05f7fb4";
		 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308.url = "github:nixos/nixpkgs/d7570b04936e9b0f5268e0d834dee40368ad3308";
		 nixpkgs-4a6ce1efede1f89a857e0cc514d5d11e56621527.url = "github:nixos/nixpkgs/4a6ce1efede1f89a857e0cc514d5d11e56621527";
			
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		
		
		
		
		
		
		

		 
		 nix2container.url = "github:nlewo/nix2container";
	};
	
	outputs = inputs@{ self, nixpkgs, 
	
	
	
	
	 nix2container , 
	 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7, 
	 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14, 
	 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4, 
	 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308, 
	 nixpkgs-4a6ce1efede1f89a857e0cc514d5d11e56621527, 
	 }: let
	  supportedSystems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" "aarch64-linux" ];
	  
	  
	  forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
		inherit system;
		 nix2containerPkgs = nix2container.packages.${system}; 
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs = import nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7 { inherit system; };
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs = import nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14 { inherit system; };
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs = import nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4 { inherit system; };
		 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs = import nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308 { inherit system; };
		 nixpkgs-4a6ce1efede1f89a857e0cc514d5d11e56621527-pkgs = import nixpkgs-4a6ce1efede1f89a857e0cc514d5d11e56621527 { inherit system; };
		
		
		pkgs = import nixpkgs { inherit system;  };
		
		
	  });
	in {
	
	  devShells = forEachSupportedSystem ({ pkgs, 
		
		
		
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs, 
		 nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs, 
		 nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs, 
		 nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs, 
		 nixpkgs-4a6ce1efede1f89a857e0cc514d5d11e56621527-pkgs, 
		 ... }: {
		devShell = pkgs.mkShell {
		  # The Nix packages provided in the environment
		  packages =  [
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.poetry  
			nixpkgs-4a6ce1efede1f89a857e0cc514d5d11e56621527-pkgs.python3  
			
		  ];
		};
	  });
	
	  runtimeEnvs = forEachSupportedSystem ({ pkgs,
		
		
		
		 nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs,  nixpkgs-4a6ce1efede1f89a857e0cc514d5d11e56621527-pkgs,  ... }: {
		runtime = pkgs.buildEnv {
		  name = "runtimeenv";
		  paths = [ 
			nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs.cacert   
			
		   ];
		};
	   });

	   devEnvs = forEachSupportedSystem ({ pkgs,
		
		
		
	    nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs,  nixpkgs-4a6ce1efede1f89a857e0cc514d5d11e56621527-pkgs,  ... }: {
		development = pkgs.buildEnv {
		  name = "devenv";
		  paths = [ 
			nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash  
			nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full  
			nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.poetry  
			nixpkgs-4a6ce1efede1f89a857e0cc514d5d11e56621527-pkgs.python3  
			
		   ];
		};
	   });
       
	   
	   
	   

ociImage_pkgs = forEachSupportedSystem ({ pkgs, nix2containerPkgs, system ,  nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs,  nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs,  nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs,  nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs,  nixpkgs-4a6ce1efede1f89a857e0cc514d5d11e56621527-pkgs,  ... }: {
  

  
  ociImage_pkgs_base = nix2containerPkgs.nix2container.buildImage {
    name = "m1xxos/todo-backend-base";
    config = {
      cmd = [  ];
      entrypoint = [  ];
      env = [
        
      ];
      ExposedPorts = {
        
      };
    };
    maxLayers = 100;
    layers = [
       (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-ac5c1886fd9fe49748d7ab80accc4c847481df14-pkgs.cacert
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-1ebb7d7bba2953a4223956cfb5f068b0095f84a7-pkgs.bash
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-7445ccd775d8b892fc56448d17345443a05f7fb4-pkgs.coreutils-full
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-d7570b04936e9b0f5268e0d834dee40368ad3308-pkgs.poetry
			];
		})  (nix2containerPkgs.nix2container.buildLayer { 
			copyToRoot = [
				nixpkgs-4a6ce1efede1f89a857e0cc514d5d11e56621527-pkgs.python3
			];
		}) 
      
    ];
  };
  

  
  
  ociImage_pkgs_base-as-dir = pkgs.runCommand "image-as-dir" { } "${inputs.self.ociImage_pkgs.${system}.ociImage_pkgs_base.copyTo}/bin/copy-to dir:$out";
  
  });



	   
	};
}
