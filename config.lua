Config = {}

Config.Inventory = 'qb-inventory' -- Change this to your inventory resource name

Config.UsingSkills = false -- Using mz-skills

Config.Debug = true -- Shows Zone debug and other debug related items

Config.DiscordLog = {
    active = true,
    webhook = '',
    username = 'Crafting Logs',
    image = 'https://cdn.discordapp.com/attachments/1038991411967688774/1039391680564035684/Untitled-1.png',
    color = 1957995
}

Config.CraftingLocations = {
    ['craftingitems'] = {
        location = vector3(1722.96, 3322.76, 41.22), -- Location to Craft the CircleZone for qb-target
        items = {
            ['lockpick'] = { -- Name of Item to Craft
                amount = 1, -- Amount of Item to Give to the Player
                name = 'Lockpick', -- Name of Item to Display on the UI
                skillRequired = 0, -- Skill Required to Craft Item 
                materialsNeeded = { -- Materials Needed to Craft Item
                    [1] = {
                        item = 'metalscrap', -- Name of Item Needed
                        amount = 20, -- Amount of Item Needed
                    },
                    [2] = {
                        item = 'plastic',
                        amount = 32,
                    },
                    [3] = {
                        item = 'metalscrap', -- Name of Item Needed
                        amount = 20, -- Amount of Item Needed
                    },
                },
            },
            ['screwdriverset'] = { -- Name of Item to Craft
                amount = 1, -- Amount of Item to Give to the Player
                name = 'Screwdriver Set', -- Name of Item to Display on the UI
                skillRequired = 0, -- Skill Required to Craft Item 
                materialsNeeded = { -- Materials Needed to Craft Item
                    [1] = {
                        item = 'metalscrap', -- Name of Item Needed
                        amount = 20, -- Amount of Item Needed
                    },
                    [2] = {
                        item = 'plastic',
                        amount = 42,
                    },
                },
            },
            ['electronickit'] = { -- Name of Item to Craft
                amount = 1, -- Amount of Item to Give to the Player
                name = 'Electronic Kit', -- Name of Item to Display on the UI
                skillRequired = 0, -- Skill Required to Craft Item 
                materialsNeeded = { -- Materials Needed to Craft Item
                    [1] = {
                        item = 'metalscrap', -- Name of Item Needed
                        amount = 30, -- Amount of Item Needed
                    },
                    [2] = {
                        item = 'plastic',
                        amount = 45,
                    },
                    [3] = {
                        item = 'aluminum',
                        amount = 28,
                    },
                },
            },
            ['handcuffs'] = { -- Name of Item to Craft
                amount = 1, -- Amount of Item to Give to the Player
                name = 'Handcuffs', -- Name of Item to Display on the UI
                skillRequired = 0, -- Skill Required to Craft Item 
                materialsNeeded = { -- Materials Needed to Craft Item
                    [1] = {
                        item = 'metalscrap', -- Name of Item Needed
                        amount = 30, -- Amount of Item Needed
                    },
                    [2] = {
                        item = 'steel',
                        amount = 45,
                    },
                    [3] = {
                        item = 'aluminum',
                        amount = 28,
                    },
                },
            },
            ['repairkit'] = { -- Name of Item to Craft
                amount = 1, -- Amount of Item to Give to the Player
                name = 'Repair Kit', -- Name of Item to Display on the UI
                skillRequired = 0, -- Skill Required to Craft Item 
                materialsNeeded = { -- Materials Needed to Craft Item
                    [1] = {
                        item = 'metalscrap', -- Name of Item Needed
                        amount = 30, -- Amount of Item Needed
                    },
                    [2] = {
                        item = 'steel',
                        amount = 45,
                    },
                    [3] = {
                        item = 'plastic',
                        amount = 28,
                    },
                },
            },
            ['radioscanner'] = { -- Name of Item to Craft
                amount = 1, -- Amount of Item to Give to the Player
                name = 'Radio Scanner', -- Name of Item to Display on the UI
                skillRequired = 0, -- Skill Required to Craft Item 
                materialsNeeded = { -- Materials Needed to Craft Item
                    [1] = {
                        item = 'electronickit', -- Name of Item Needed
                        amount = 2, -- Amount of Item Needed
                    },
                    [2] = {
                        item = 'plastic',
                        amount = 52,
                    },
                    [3] = {
                        item = 'steel',
                        amount = 40,
                    },
                },
            },
            ['armor'] = { -- Name of Item to Craft
                amount = 1, -- Amount of Item to Give to the Player
                name = 'Armor', -- Name of Item to Display on the UI
                skillRequired = 0, -- Skill Required to Craft Item 
                materialsNeeded = { -- Materials Needed to Craft Item
                    [1] = {
                        item = 'metalscrap', -- Name of Item Needed
                        amount = 30, -- Amount of Item Needed
                    },
                    [2] = {
                        item = 'steel',
                        amount = 45,
                    },
                    [3] = {
                        item = 'plastic',
                        amount = 28,
                    },
                    [4] = {
                        item = 'iron',
                        amount = 28,
                    },
                },
            },
            ['drill'] = { -- Name of Item to Craft
                amount = 1, -- Amount of Item to Give to the Player
                name = 'Drill', -- Name of Item to Display on the UI
                skillRequired = 0, -- Skill Required to Craft Item 
                materialsNeeded = { -- Materials Needed to Craft Item
                    [1] = {
                        item = 'metalscrap', -- Name of Item Needed
                        amount = 30, -- Amount of Item Needed
                    },
                    [2] = {
                        item = 'steel',
                        amount = 45,
                    },
                    [3] = {
                        item = 'plastic',
                        amount = 28,
                    },
                    [4] = {
                        item = 'iron',
                        amount = 28,
                    },
                },
            },
            ['ironoxide'] = { -- Name of Item to Craft
                amount = 1, -- Amount of Item to Give to the Player
                name = 'Ironoxide', -- Name of Item to Display on the UI
                skillRequired = 0, -- Skill Required to Craft Item 
                materialsNeeded = { -- Materials Needed to Craft Item
                    [1] = {
                        item = 'iron',
                        amount = 28,
                    },
                    [2] = {
                        item = 'glass',
                        amount = 28,
                    },
                },
            },
            ['aluminumoxide'] = { -- Name of Item to Craft
                amount = 1, -- Amount of Item to Give to the Player
                name = 'Aluminumoxide', -- Name of Item to Display on the UI
                skillRequired = 0, -- Skill Required to Craft Item 
                materialsNeeded = { -- Materials Needed to Craft Item
                    [1] = {
                        item = 'aluminum',
                        amount = 28,
                    },
                    [2] = {
                        item = 'glass',
                        amount = 28,
                    },
                },
            },
            ['pistol_ammo'] = { -- Name of Item to Craft
                amount = 1, -- Amount of Item to Give to the Player
                name = 'Pistol Ammo', -- Name of Item to Display on the UI
                skillRequired = 0, -- Skill Required to Craft Item 
                materialsNeeded = { -- Materials Needed to Craft Item
                    [1] = {
                        item = 'metalscrap',
                        amount = 28,
                    },
                    [2] = {
                        item = 'steel',
                        amount = 28,
                    },
                    [3] = {
                        item = 'copper',
                        amount = 26,
                    },
                },
            },
        }
    }
    
}
