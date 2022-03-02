local tool = script.Parent
local player = tool:FindFirstAncestorWhichIsA("Player")
local character = player.Character
local humanoid = character.Humanoid


local function onEquip()
	print("Equipped")
	

 end

local function onUnequip()
	humanoid.HeadScale.Value = 1
end

local function onActivate()
	
	
	humanoid.HeadScale.Value += .25
	print("Activated")

 end

local function onDeactivate()
end

tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)
tool.Activated:Connect(onActivate)
tool.Deactivated:Connect(onDeactivate)