// Name of this crate
_crateName = "Items Crate";

// Crate type
_classname = "USOrdnanceBox";

// Location of player and crate
_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];
_spawnCrate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
_spawnCrate setDir _dir;
_spawnCrate setposATL _pos;

// Remove default items/weapons from current crate before adding custom gear
clearWeaponCargoGlobal _spawnCrate;
clearMagazineCargoGlobal _spawnCrate;
clearBackpackCargoGlobal _spawnCrate;

_spawnCrate addWeaponCargoGlobal ["Binocular", 5];
_spawnCrate addWeaponCargoGlobal ["Binocular_Vector", 5];
_spawnCrate addWeaponCargoGlobal ["ItemCompass", 5];
_spawnCrate addWeaponCargoGlobal ["ItemEtool", 5];
_spawnCrate addWeaponCargoGlobal ["ItemFlashlight", 5];
_spawnCrate addWeaponCargoGlobal ["ItemFlashlightRed", 5];
_spawnCrate addWeaponCargoGlobal ["ItemGPS", 5];
_spawnCrate addWeaponCargoGlobal ["ItemHatchet", 5];
_spawnCrate addWeaponCargoGlobal ["ItemKnife", 5];
_spawnCrate addWeaponCargoGlobal ["ItemMap", 5];
_spawnCrate addWeaponCargoGlobal ["ItemMatchbox", 5];
_spawnCrate addWeaponCargoGlobal ["ItemRadio", 5];
_spawnCrate addWeaponCargoGlobal ["ItemToolbox", 5];
_spawnCrate addWeaponCargoGlobal ["ItemWatch", 5];
_spawnCrate addWeaponCargoGlobal ["NVGoggles", 5];

_spawnCrate addMagazineCargoGlobal ["FoodSteakCooked", 10];
_spawnCrate addMagazineCargoGlobal ["HandChemBlue", 10];
_spawnCrate addMagazineCargoGlobal ["HandChemGreen", 10];
_spawnCrate addMagazineCargoGlobal ["HandChemRed", 10];
_spawnCrate addMagazineCargoGlobal ["HandRoadFlare", 10];
_spawnCrate addMagazineCargoGlobal ["ItemAntibiotic", 10];
_spawnCrate addMagazineCargoGlobal ["ItemBandage", 10];
_spawnCrate addMagazineCargoGlobal ["ItemBloodbag", 10];
_spawnCrate addMagazineCargoGlobal ["ItemEpinephrine", 10];
_spawnCrate addMagazineCargoGlobal ["ItemHeatPack", 10];
_spawnCrate addMagazineCargoGlobal ["ItemJerrycan", 10];
_spawnCrate addMagazineCargoGlobal ["ItemMorphine", 10];
_spawnCrate addMagazineCargoGlobal ["ItemPainkiller", 10];
_spawnCrate addMagazineCargoGlobal ["ItemSodaMdew", 10];
_spawnCrate addMagazineCargoGlobal ["PartEngine", 10];
_spawnCrate addMagazineCargoGlobal ["PartFueltank", 10];
_spawnCrate addMagazineCargoGlobal ["PartGeneric", 10];
_spawnCrate addMagazineCargoGlobal ["PartGlass", 10];
_spawnCrate addMagazineCargoGlobal ["PartVRotor", 10];
_spawnCrate addMagazineCargoGlobal ["PartWheel", 10];

_spawnCrate addBackpackCargoGlobal ["O_TravelerPack_1", 1];



// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "SelectDelay=30;DelaySelected=true;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "SelectDelay=60;DelaySelected=true;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "SelectDelay=180;DelaySelected=true;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "SelectDelay=300;DelaySelected=true;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "SelectDelay=600;DelaySelected=true;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "SelectDelay=1800;DelaySelected=true;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "DelaySelected=false;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{DelaySelected};
DelaySelected=false;
titleText [format[_crateName + " will disappear in %1 seconds.",SelectDelay],"PLAIN DOWN"]; titleFadeOut 4;
sleep SelectDelay;

// Delete crate after SelectDelay seconds
deletevehicle _spawnCrate;
titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;