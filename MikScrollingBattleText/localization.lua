-------------------------------------------------------------------------------------
-- Title: Mik's Scrolling Battle Text
-- Author: Mik
-------------------------------------------------------------------------------------

-- Create "namespace."
MikSBT = {};

-------------------------------------------------------------------------------
-- Mod Constants
-------------------------------------------------------------------------------

MikSBT.MOD_NAME		= "MikScrollingBattleText"
MikSBT.VERSION_NUMBER	= 3.01;
MikSBT.VERSION_STRING	= "v3.01";
MikSBT.WINDOW_TITLE	= "Mik's Scrolling Battle Text " .. MikSBT.VERSION_STRING;

MikSBT.COMMAND		= "/msbt";


-------------------------------------------------------------------------------
-- English (Default)
-------------------------------------------------------------------------------

------------------------------
-- Commands
------------------------------
MikSBT.COMMAND_RESET		= "reset";
MikSBT.COMMAND_DISABLE		= "disable";
MikSBT.COMMAND_ENABLE		= "enable";
MikSBT.COMMAND_DISPLAY		= "display";
MikSBT.COMMAND_SHOWVER		= "version";
MikSBT.COMMAND_STATS		= "stats";
MikSBT.COMMAND_SEARCH	      = "search";
MikSBT.COMMAND_DEBUG		= "debug";
MikSBT.COMMAND_HELP		= "help";

MikSBT.COMMAND_USAGE = {
 "Usage: " .. MikSBT.COMMAND .. " <command> [params]",
 " Commands:",
 "  " .. MikSBT.COMMAND_RESET .. " - Reset the current profile to the default settings.",
 "  " .. MikSBT.COMMAND_DISABLE .. " - Disables the mod.",
 "  " .. MikSBT.COMMAND_ENABLE .. " - Enables the mod.",
 "  " .. MikSBT.COMMAND_SHOWVER .. " - Shows the current version.",
 "  " .. MikSBT.COMMAND_STATS .. " - Reports stats about table recycling.",
 "  " .. MikSBT.COMMAND_SEARCH .. " filter - Sets a filter for searching event types.",
 "  " .. MikSBT.COMMAND_DEBUG .. " - Toggles debug mode.",
 "  " .. MikSBT.COMMAND_HELP .. " - Show the command usage.",
};


------------------------------
-- Output messages
------------------------------

MikSBT.MSG_DEBUG_ENABLE			= "Debug mode has been enabled.";
MikSBT.MSG_DEBUG_DISABLE		= "Debug mode has been disabled.";
MikSBT.MSG_SEARCH_ENABLE		= "Event search mode has been enabled.  Searching for: ";
MikSBT.MSG_SEARCH_DISABLE		= "Event search mode has been disabled.";
MikSBT.MSG_DISABLE			= "The mod is now disabled.";
MikSBT.MSG_ENABLE				= "The mod is now enabled.";
MikSBT.MSG_HITS				= "Hits";
MikSBT.MSG_CRIT				= "Crit";
MikSBT.MSG_CRITS				= "Crits";
MikSBT.MSG_MULTIPLE_TARGETS		= "Multiple";
MikSBT.MSG_VULERNABLE_TRAILER		= " (%d vulnerability)";
MikSBT.MSG_OVERHEAL_TRAILER		= " <%d>";
MikSBT.MSG_PROFILE_RESET		= "Profile Reset";
MikSBT.MSG_ENVIRONMENTAL_DROWNING	= "Drowning";
MikSBT.MSG_ENVIRONMENTAL_FALLING	= "Falling";
MikSBT.MSG_ENVIRONMENTAL_FATIGUE	= "Fatigue";
MikSBT.MSG_ENVIRONMENTAL_FIRE		= "Fire";
MikSBT.MSG_ENVIRONMENTAL_LAVA		= "Lava";
MikSBT.MSG_ENVIRONMENTAL_SLIME	= "Slime";



------------------------------
-- Font info
------------------------------

-- Holds the available fonts.
MikSBT.AVAILABLE_FONTS = {
 [1] = {Name="Adventure", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\adventure.ttf"},
 [2] = {Name="Backsplatter", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\backsplatter.ttf"},
 [3] = {Name="Budhand", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\budhand.ttf"},
 [4] = {Name="Comic", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\comic.ttf"},
 [5] = {Name="Creeper", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\creeper.ttf"},
 [6] = {Name="Friz", Path="Fonts\\FRIZQT__.TTF"},
 [7] = {Name="Porky", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\porky.ttf"},
 [8] = {Name="Signature", Path="Interface\\Addons\\MikScrollingBattleText\\Fonts\\signature.ttf"},
};

-- Holds the available font outlines.
MikSBT.AVAILABLE_OUTLINES = {
 [1] = {Name="None", Style=""},
 [2] = {Name="Thin", Style="OUTLINE"},
 [3] = {Name="Thick", Style="THICKOUTLINE"},
};

-- Holds the available text aligns.
MikSBT.AVAILABLE_TEXT_ALIGNS = {
 [1] = {Name="Left", AnchorPoint="BOTTOMLEFT"},
 [2] = {Name="Center", AnchorPoint="BOTTOM"},
 [3] = {Name="Right", AnchorPoint="BOTTOMRIGHT"},
};


------------------------------
-- Animation info
------------------------------

MikSBT.AVAILABLE_SCROLL_DIRECTIONS = {
 [1] = {Name="Up"},
 [2] = {Name="Down"},
}

-- Holds the available animation styles.
MikSBT.AVAILABLE_ANIMATION_STYLES = {
 [1] = {Name="Straight", AllowedScrollDirections={1,2}},
 [2] = {Name="Left Parabola", AllowedScrollDirections={1,2}},
 [3] = {Name="Right Parabola", AllowedScrollDirections={1,2}},
};


------------------------------
-- Trigger info
------------------------------

-- Holds the available trigger types.
MikSBT.AVAILABLE_TRIGGER_TYPES = {
 [1] = {Name="Self Health"},
 [2] = {Name="Self Mana"},
 [3] = {Name="Pet Health"},
 [4] = {Name="Enemy Target Health"},
 [5] = {Name="Friendly Target Health"},
 [6] = {Name="Search Pattern"},
};


------------------------------
-- Defaults
------------------------------
MikSBT.DEFAULT_PROFILE_NAME = "Default";

-- %a = amount of the attack, heal, gain, loss, etc.
-- %n = name of enemy/player
-- %s = name of the spell, ability, buff, debuff, power type, etc.
-- %t = damage type
MikSBT.DEFAULT_CONFIG = {
 CreationVersion 					= MikSBT.VERSION_NUMBER,
 ShowPartialEffects				= true,
 ShowOverheals					= true,
 ShowGameDamage					= false,
 UseStickyCrits					= true,
 AnimationStep					= 2,
 MasterFontSettings = {
  Normal 						= {FontIndex=1, OutlineIndex=3, FontSize=18},
  Crit 						= {FontIndex=1, OutlineIndex=3, FontSize=26},
 },
 DisplaySettings = {
  Incoming =  {
   Show						= true,
   FrameOffsets					= {x=-60, y=-160},
   AnimationStyle					= 2,
   ScrollDirection				= 2,
   ScrollHeight					= 260,
   FontSettings = {
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    TextAlignIndex				= 3,
   },
  },
  Outgoing = {
   Show						= true,
   FrameOffsets					= {x=60, y=-160},
   AnimationStyle					= 3,
   ScrollDirection				= 2,
   ScrollHeight					= 260,
   FontSettings = {
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    TextAlignIndex				= 1,
   },
  },
  Notification = {
   Show						= true,
   FrameOffsets					= {x=0, y=100},
   AnimationStyle					= 1,
   ScrollDirection				= 1,
   ScrollHeight					= 150,
   FontSettings = {
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize = 0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize = 0},
    TextAlignIndex				= 2,
   },
  },
 },
 EventSettings = {
  MSBT_EVENTTYPE_INCOMING_DAMAGE = {
   Show						= true,
   Message						= "(%n) -%a",
   FontSettings = {
    Color						= {r=1, g=0, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_MISS = {
   Show						= true,
   Message						= "Miss!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_DODGE = {
   Show						= true,
   Message						= "Dodge!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_PARRY = {
   Show						= true,
   Message						= "Parry!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_BLOCK = {
   Show						= true,
   Message						= "Block!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_ABSORB = {
   Show						= true,
   Message						= "Absorb!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_IMMUNE = {
   Show						= true,
   Message						= "Immune!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_DAMAGE = {
   Show						= true,
   Message						= "(%s) -%a",
   FontSettings = {
    Color						= {r=0.502, g=0, b=0.502},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_DOT = {
   Show						= true,
   Message						= "(%s) -%a",
   FontSettings = {
    Color						= {r=0.502, g=0, b=0.502},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_MISS = {
   Show						= true,
   Message						= "(%s) Miss!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_DODGE = {
   Show						= true,
   Message						= "(%s) Dodge!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_PARRY = {
   Show						= true,
   Message						= "(%s) Parry!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_BLOCK = {
   Show						= true,
   Message						= "(%s) Block!",
   FontSettings = {
    Color						= {r=0, g=0, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_RESIST = {
   Show						= true,
   Message						= "(%s) Resist!",
   FontSettings = {
    Color						= {r=0.502, g=0, b=0.502},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_ABSORB = {
   Show						= true,
   Message						= "(%s) Absorb!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_IMMUNE = {
   Show						= true,
   Message						= "(%s) Immune!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_SPELL_REFLECT = {
   Show						= true,
   Message						= "(%s) Reflect!",
   FontSettings = {
    Color						= {r=0.502, g=0, b=0.502},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_INCOMING_HEAL = {
   Show						= true,
   Message						= "(%s - %n) +%a",
   FontSettings = {
    Color						= {r=0, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   }
  },
  MSBT_EVENTTYPE_INCOMING_HOT = {
   Show						= true,
   Message						= "(%s - %n) +%a",
   FontSettings = {
    Color						= {r=0, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   }
  },
  MSBT_EVENTTYPE_INCOMING_ENVIRONMENTAL = {
   Show						= true,
   Message						= "-%a %s",
   FontSettings = {
    Color						= {r=1, g=0, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },


  MSBT_EVENTTYPE_OUTGOING_DAMAGE = {
   Show						= true,
   Message						= "%a",
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_MISS = {
   Show						= true,
   Message						= "Miss!",
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_DODGE = {
   Show						= true,
   Message						= "Dodge!",
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PARRY = {
   Show						= true,
   Message						= "Parry!",
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_BLOCK = {
   Show						= true,
   Message						= "Block!",
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_ABSORB = {
   Show						= true,
   Message						= "Absorb!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_IMMUNE = {
   Show						= true,
   Message						= "Immune!",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_EVADE = {
   Show						= true,
   Message						= "Evade!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=22},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_DAMAGE = {
   Show						= true,
   Message						= "%a (%s)",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_DOT = {
   Show						= true,
   Message						= "%a (%s)",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_MISS = {
   Show						= true,
   Message						= "Miss! (%s)",
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_DODGE = {
   Show						= true,
   Message						= "Dodge! (%s)",
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_PARRY = {
   Show						= true,
   Message						= "Parry! (%s)",
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_BLOCK = {
   Show						= true,
   Message						= "Block! (%s)",
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_RESIST = {
   Show						= true,
   Message						= "Resist! (%s)",
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=0.698},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_ABSORB = {
   Show						= true,
   Message						= "Absorb! (%s)",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_IMMUNE = {
   Show						= true,
   Message						= "Immune! (%s)",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_REFLECT = {
   Show						= true,
   Message						= "Reflect! (%s)",
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_SPELL_EVADE = {
   Show						= true,
   Message						= "Evade! (%s)",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=22},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_HEAL = {
   Show						= true,
   Message						= "+%a (%s - %n)",
   FontSettings = {
    Color						= {r=0, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=22},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_HOT = {
   Show						= true,
   Message						= "+%a (%s - %n)",
   FontSettings = {
    Color						= {r=0, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },


  MSBT_EVENTTYPE_OUTGOING_PET_DAMAGE = {
   Show						= true,
   Message						= "Pet %a",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },

  },
  MSBT_EVENTTYPE_OUTGOING_PET_MISS = {
   Show						= true,
   Message						= "Pet Miss!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_DODGE = {
   Show						= true,
   Message						= "Pet Dodge!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_PARRY = {
   Show						= true,
   Message						= "Pet Parry!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_BLOCK = {
   Show						= true,
   Message						= "Pet Block!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_ABSORB = {
   Show						= true,
   Message						= "Pet Absorb!",
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_IMMUNE = {
   Show						= true,
   Message						= "Pet Immune!",
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_EVADE = {
   Show						= true,
   Message						= "Pet Evade!",
   FontSettings = {
    Color						= {r=1, g=0.502, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_DAMAGE = {
   Show						= true,
   Message						= "Pet %a (%s)",
   FontSettings = {
    Color						= {r=0.33, g=0.33, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
    Crit 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_MISS = {
   Show						= true,
   Message						= "Pet Miss! (%s)",
   FontSettings = {
    Color						= {r=0.33, g=0.33, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_DODGE = {
   Show						= true,
   Message						= "Pet Dodge! (%s)",
   FontSettings = {
    Color						= {r=0.33, g=0.33, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_PARRY = {
   Show						= true,
   Message						= "Pet Parry! (%s)",
   FontSettings = {
    Color						= {r=0.33, g=0.33, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_BLOCK = {
   Show						= true,
   Message						= "Pet Block! (%s)",
   FontSettings = {
    Color						= {r=0.33, g=0.33, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_RESIST = {
   Show						= true,
   Message						= "Pet Resist! (%s)",
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=0.698},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_ABSORB = {
   Show						= true,
   Message						= "Pet Absorb! (%s)",
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_IMMUNE = {
   Show						= true,
   Message						= "Pet Immune! (%s)",
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_OUTGOING_PET_SPELL_EVADE = {
   Show						= true,
   Message						= "Pet Evade! (%s)",
   FontSettings = {
    Color						= {r=1, g=0.502, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=22},
   },
  },



  MSBT_EVENTTYPE_NOTIFICATION_DEBUFF = {
   Show						= true,
   Message						= "[%s]",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0, g=0.502, b=0.502},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_BUFF = {
   Show						= true,
   Message						= "[%s]",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.698, g=0.698, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_ITEM_BUFF = {
   Show						= true,
   Message						= "[%s]",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.698, g=0.698, b=0.698},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_BUFF_FADE = {
   Show						= true,
   Message						= "-[%s]",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.698, g=0.698, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_COMBAT_ENTER = {
   Show						= true,
   Message						= "+Combat",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_COMBAT_LEAVE = {
   Show						= true,
   Message						= "-Combat",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=1, g=1, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_POWER_GAIN = {
   Show						= true,
   Message						= "+%a %s",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_POWER_LOSS = {
   Show						= true,
   Message						= "-%a %s",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=1, g=1, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_CP_GAIN = {
   Show						= true,
   Message						= "%a CP",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_CP_FULL = {
   Show						= true,
   Message						= "%a CP Finish It!",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=1, g=0.502, b=0},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_HONOR_GAIN = {
   Show						= true,
   Message						= "+%a Honor",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=0.698},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_REP_GAIN = {
   Show						= true,
   Message						= "+%a Reputation (%s)",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=0.698},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_REP_LOSS = {
   Show						= true,
   Message						= "-%a Reputation (%s)",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.502, g=0.502, b=0.698},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_SKILL_GAIN = {
   Show						= true,
   Message						= "%s: %a",
   IsSticky						= false,
   FontSettings = {
    Color						= {r=0.333, g=0.333, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=0},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_EXPERIENCE_GAIN = {
   Show						= true,
   Message						= "%a XP",
   IsSticky						= true,
   FontSettings = {
    Color						= {r=0.756, g=0.270, b=0.823},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=26},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_PC_KILLING_BLOW = {
   Show						= true,
   Message						= "Killing Blow! (%s)",
   IsSticky						= true,
   FontSettings = {
    Color						= {r=0.333, g=0.333, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=20},
   },
  },
  MSBT_EVENTTYPE_NOTIFICATION_NPC_KILLING_BLOW = {
   Show						= false,
   Message						= "Killing Blow! (%s)",
   IsSticky						= true,
   FontSettings = {
    Color						= {r=0.333, g=0.333, b=1},
    Normal 						= {FontIndex=0, OutlineIndex=0, FontSize=20},
   },
  },
 },

 Triggers = {
  MSBT_TRIGGER_LOW_HEALTH = {
   EventSettings = {
    Show				= true,
    Message				= "Low Health! (%1)",
    IsSticky			= false,
    FontSettings = {
     Color				= {r=1, g=0.502, b=0.502},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    TriggerType			= 1,
    Threshold			= 40,
   },
  },
  MSBT_TRIGGER_LOW_MANA = {
   EventSettings = {
    Show				= true,
    Message				= "Low Mana! (%1)",
    IsSticky			= false,
    FontSettings = {
     Color				= {r=0.502, g=0.502, b=1},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {DRUID=true,HUNTER=true,MAGE=true,PALADIN=true,PRIEST=true,SHAMAN=true,WARLOCK=true},
    TriggerType			= 2,
    Threshold			= 35,
   },
  },
  MSBT_TRIGGER_LOW_PET_HEALTH = {
   EventSettings = {
    Show				= true,
    Message				= "Low Pet Health! (%1)",
    IsSticky			= false,
    FontSettings = {
     Color				= {r=1, g=0.502, b=0.502},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {HUNTER=true,WARLOCK=true},
    TriggerType			= 3,
    Threshold			= 40,
   },
  },
  MSBT_TRIGGER_EXECUTE = {
   EventSettings = {
    Show				= true,
    Message				= "Execute!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {PALADIN=true,WARRIOR=true},
    TriggerType			= 4,
    Threshold			= 20,
   },
  },
  MSBT_TRIGGER_COUNTER_ATTACK = {
   EventSettings = {
    Show				= true,
    Message				= "Counterattack!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {HUNTER=true},
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES", "CHAT_MSG_COMBAT_PARTY_MISSES",
                                 "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE", "CHAT_MSG_SPELL_PARTY_DAMAGE"},
    SearchPatterns		= {"VSPARRYOTHERSELF", "SPELLPARRIEDOTHERSELF"},
   },
  },
  MSBT_TRIGGER_MONGOOSE_BITE = {
   EventSettings = {
    Show				= true,
    Message				= "Mongoose Bite!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {HUNTER=true},
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES", "CHAT_MSG_COMBAT_PARTY_MISSES",
                                 "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE", "CHAT_MSG_SPELL_PARTY_DAMAGE"},
    SearchPatterns		= {"VSDODGEOTHERSELF", "SPELLDODGEDOTHERSELF"},
   },
  },
  MSBT_TRIGGER_CLEARCAST = {
   EventSettings = {
    Show				= true,
    Message				= "Clearcast!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {MAGE=true,SHAMAN=true},
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS"},
    SearchPatterns		= {"You gain Clearcast"},
   },
  },
  MSBT_TRIGGER_RIPOSTE = {
   EventSettings = {
    Show				= true,
    Message				= "Riposte!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {ROGUE=true},
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES", "CHAT_MSG_COMBAT_PARTY_MISSES",
                                 "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE", "CHAT_MSG_SPELL_PARTY_DAMAGE"},
    SearchPatterns		= {"VSPARRYOTHERSELF", "SPELLPARRIEDOTHERSELF"},
   },
  },
  MSBT_TRIGGER_WINDFURY = {
   EventSettings = {
    Show				= true,
    Message				= "Windfury!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS"},
    SearchPatterns		= {"You gain %d extra attacks through Windfury"},
   },
  },
  MSBT_TRIGGER_NIGHTFALL = {
   EventSettings = {
    Show				= true,
    Message				= "Nightfall!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=0.709, g=0, b=0.709},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {WARLOCK=true},
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS"},
    SearchPatterns		= {"You gain Shadow Trance"},
   },
  },
  MSBT_TRIGGER_OVERPOWER = {
   EventSettings = {
    Show				= true,
    Message				= "Overpower!",
    IsSticky			= true,
    FontSettings = {
     Color				= {r=1, g=1, b=0},
     Normal 			= {FontIndex=0, OutlineIndex=0, FontSize=26},
    },
   },
   TriggerSettings = {
    Classes				= {WARRIOR=true},
    TriggerType			= 6,
    TriggerEvents			= {"CHAT_MSG_COMBAT_SELF_MISSES", "CHAT_MSG_SPELL_SELF_DAMAGE"},
    SearchPatterns		= {"VSDODGESELFOTHER", "SPELLDODGEDSELFOTHER"},
   },
  },
 },

 Suppressions = {
  MSBT_SUPPRESSION_WISDOM_MANA_GAINS = {
   Enabled				= true,
   SearchPattern			= "+[35][039] " .. MANA,
  },
 },
};
