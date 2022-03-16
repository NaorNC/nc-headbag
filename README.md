## Video

- Click here - streamable.com/soon

# nc-headmask

- The HeadBag is ready for use, everything works at %100.
- If you run into a problem, you are always welcome to contact me at Discord (found on my github profile)

# Installation

- Download the scripts and put them in the ```[resource] or [standalone]``` folder.
- Add the following code to your ```server.cfg/resouces.cfg```

```
ensure nc-headbag
```

# Add the item to Shared.lua

In ```shared.lua``` enter the following Item.

```lua 
["head_mask"] 					 = {["name"] = "head_mask", 			 	["label"] = "Head Mask", 						["weight"] = 5, 		["type"] = "item", 		["image"] = "head_mask.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Put mask on hostage."},
```
