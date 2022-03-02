local tool = script.Parent
local player = tool:FindFirstAncestorWhichIsA("Player")
local character = player.Character
local humanoid = character.Humanoid
 
local function onEquip()
	leftArm = humanoid.Parent:FindFirstChild("LeftLowerArm")
	leftArm.Transparency = 1
	rightArm = humanoid.Parent:FindFirstChild("RightLowerArm")
	rightArm.Transparency = 1

 end
local function onUnequip()
	leftArm.Transparency = 0
	rightArm.Transparency = 0
end
 
local function onActivate()
	if game.Lighting.ClockTime >= 8 and game.Lighting.ClockTime < 16 then
		game.Lighting.ClockTime = 20
	else
		game.Lighting.ClockTime = 8
	end
end
 
local function onDeactivate()
end
 
tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)
tool.Activated:Connect(onActivate)
tool.Deactivated:Connect(onDeactivate)
