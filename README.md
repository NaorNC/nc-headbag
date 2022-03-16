## Video & Screenshot

- click - https://streamable.com/bvcerd

![nc-headbag](https://i.ibb.co/ZcnTVKy/image.png)

# nc-headbag

- Important to know - you can only use the mask when the hands of the person in front of you are raised.
- The HeadBag is ready for use, everything works at %100.
- If you run into a problem, you are always welcome to contact me at Discord (found on my github profile)

# Installation

- Download the scripts and put them in the ```[resource] or [standalone]``` folder.
- Add the following code to your ```server.cfg/resouces.cfg```

```
ensure nc-headbag
```

# Add the item to your core

In ```shared.lua``` enter the following Item.

```lua 
["head_bag"] 					 = {["name"] = "head_bag", 			 	["label"] = "Head Bag", 						["weight"] = 5, 		["type"] = "item", 		["image"] = "head_bag.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Put mask on hostage."},
```

# Inventory image

- Add the head_bag.png to your inventory -> html -> images
- In the ```images``` folder put the image - head_bag
