{
  pkgs,
  username,
  host,
  ...
}:

let 
  myAliases = {
		# System commands
		nr = "nh os switch --hostname ${host} /home/${username}/new_nixos";
		nu = "nh os switch --hostname ${host} --update /home/${username}/new_nixos";
		ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
		
		# Navigation
		".." = "cd ..";
		"..." = "cd ../..";
		dot = "cd /home/${username}/new_nixos";
		
		# Enhanced commands
		cat = "bat";
		ll = "eza -lh --icons --grid --group-directories-first";
		la = "eza -lah --icons --grid --group-directories-first";
		lt = "eza -a --tree --icons";
		c = "clear";
		
		# System info
		ff = "fastfetch";
		pf = "pfetch";
		
		# Git shortcuts
		gs = "git status";
		ga = "git add";
		gc = "git commit -m";
		gp = "git push";
		gpl = "git pull";
		gst = "git stash";
		gsp = "git stash; git pull";
		gcheck = "git checkout";
  };

in

{
    programs.bash = {
    	enable = true;
    	shellAliases = myAliases;
  	};
 
 		programs.zsh = {
    	enable = true;
    	shellAliases = myAliases;
    	syntaxHighlighting.enable = true;
    	autosuggestion.enable = true;
    	enableCompletion = true;
    		initExtra = "
      	pfetch
      	source /home/${username}/new_nixos/user/p10k.zsh";
    		plugins  = [
     				{name = "powerlevel10k"; 
						src = pkgs.zsh-powerlevel10k;
						file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    				}
					];
  	};
}
