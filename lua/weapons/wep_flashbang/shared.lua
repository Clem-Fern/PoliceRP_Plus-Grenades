AddCSLuaFile()

SWEP.Base = "weapon_base_grenade"

SWEP.PrintName = "Flashbang"
SWEP.SlotPos = 2

SWEP.EquipMenuData = {
	type = "item_weapon",
	desc = "Flashbang"
};

SWEP.Category = "PoliceRP Plus"

SWEP.Grenade = "ent_flashbang_proj"

SWEP.Primary.Ammo = "prp_flashbang"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cstrike/c_eq_flashbang.mdl"
SWEP.WorldModel = "models/weapons/w_eq_flashbang.mdl"

SWEP.AutoSwitchFrom	= true
SWEP.DrawCrosshair = false

function SWEP:GetGrenadeName()
   return "ent_flashbang_proj"
end