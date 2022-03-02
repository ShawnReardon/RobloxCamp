local tool = script.Parent
local Players = game:GetService("Players")
local player = tool:FindFirstAncestorWhichIsA("Player")
local playerStats = player:WaitForChild("leaderstats")
local playerPoints= playerStats:WaitForChild("Boosts")
local humanoid = Players:FindFirstChild(player.Name).Character.Humanoid
local pointCost = 1
local cooldown = 5
local isLocked = false
local boostAmount = 2
 
    
local function ResetSpeed()
	
	humanoid.WalkSpeed = 16
	isLocked = false
	
	
end
local function CooldownTimer(cooldown)
	wait(cooldown)
	ResetSpeed()
	print("Speed Reset")
end

local function BoostSpeed()
	playerPoints.Value = playerPoints.Value - pointCost	
	humanoid.WalkSpeed = humanoid.WalkSpeed * boostAmount
	isLocked = true
	CooldownTimer(cooldown)
end



local function onEquip()
	print("Equipped")
	

 end

local function onUnequip()
	print("UnEquipped")
end

local function onActivate()
	if playerPoints.Value > 0 then
		if isLocked ~= true then
			BoostSpeed()
			print("Boosted")
		end
	else
		
		
		print("Tool is Locked")
	end
	
	
	print("Activated")

 end

local function onDeactivate()
	print("Deactivated")
end

tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)
tool.Activated:Connect(onActivate)
tool.Deactivated:Connect(onDeactivate)