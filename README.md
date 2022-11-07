# qw-crafting
QBCore Customizable Crafting System

# Preview
https://streamable.com/nhimf7

# Install
- setup your inventory resource in the config under `Config.Inventory`
- If you are going to be using [mz-skills](https://github.com/MrZainRP/mz-skills) then you need to add the following config to the mz-skills config file...

```lua
["Crafting"] = {
    ["Current"] = 0,
    ["RemoveAmount"] = 0,
    ["Stat"] = "CRAFTING_ABILITY",
    ['icon'] = 'fas fa-crate-empty', 
 },
```
- follow the rest of the config to setup all of your crafting locations and items
