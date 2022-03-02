local battery = game:GetService("ReplicatedStorage").Battery
local n = 0
local count = 25
local clone
local Total
--while n < count do
	--clone = battery:Clone()
	--clone.Parent = game.Workspace.Batteries
	--clone.Anchored = false
	--clone.Size = Vector3.new(5,3,3)
	--clone.Position = Vector3.new(math.random(-245,225),50,math.random(-245,225))
	--n+=1
	
	
--end



while true do

	CurrentBatteries = game.Workspace.Batteries:GetChildren().len
	print(CurrentBatteries)
	
	wait(10)
	if CurrentBatteries ~= nil then
		Total = count - CurrentBatteries
		n = 0
	else
		Total = count
		n = 0
	end
	if CurrentBatteries == nil or CurrentBatteries < count  then
		while n < Total do
			clone = battery:Clone()
			clone.Parent = game.Workspace.Batteries
			clone.Anchored = false
			clone.Size = Vector3.new(5,3,3)
			clone.Position = Vector3.new(math.random(-245,225),50,math.random(-245,225))
			n+=1
		end
	wait(10)
	
		
		end
		end
