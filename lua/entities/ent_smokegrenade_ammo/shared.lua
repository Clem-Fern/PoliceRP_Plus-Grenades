ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Smoke Grenade"
ENT.Category = "PoliceRP Plus"

ENT.Spawnable		= true
ENT.AdminOnly = false
ENT.DoNotDuplicate = true

if SERVER then
AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)

	if (!tr.Hit) then return end
	
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	
	local ent = ents.Create("ent_smokegrenade_ammo")
	
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()
	ent.Planted = false
	
	return ent
end

function ENT:Initialize()
	self.CanTool = false

	local model = ("models/items/boxmrounds.mdl")
	
	self.Entity:SetModel(model)
	
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:DrawShadow(false)
	
	self.Entity:SetCollisionGroup(COLLISION_GROUP_NONE)
	
	local phys = self.Entity:GetPhysicsObject()
	
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(40)
	end

	self.Entity:SetUseType(SIMPLE_USE)
end

function ENT:Use(activator, caller)
	if (activator:IsPlayer()) and not self.Planted then
		if(!activator:HasWeapon("wep_smokegrenade")) then
			activator:Give("wep_smokegrenade")
		else
			activator:GiveAmmo(5, "prp_smoke")
		end
		self.Entity:Remove()
	end
end

end

if CLIENT then

function ENT:Initialize()
end

function ENT:Draw()
	
	self.Entity:DrawModel()
	
end

end