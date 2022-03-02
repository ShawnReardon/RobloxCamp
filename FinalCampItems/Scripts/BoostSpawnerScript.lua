
	local SpeedBoost = game:GetService("ServerStorage").GameItems.SpeedBoost
	local n = 0
	local count = math.random(10,25)
	local clone
	local Total
	print("EnteredBoosts")
	while true do

		local CurrentBatteries = game.Workspace.Boosts:GetChildren().len
		print(CurrentBatteries)
	
		wait(10)
		local count = math.random(10,25)
		print("Count".. count)
		if CurrentBatteries ~= nil then
				Total = count - CurrentBatteries
				n = 0
		else
				Total = count
				n = 0
		end
		
		if CurrentBatteries == nil or CurrentBatteries < count  then
			
			while n < Total do
				clone = SpeedBoost:Clone()
				clone.Parent = game.Workspace.Boosts
				clone.Anchored = false
				clone.Size = Vector3.new(5,3,3)
				clone.Position = Vector3.new(math.random(-245,225),50,math.random(-245,225))
				n+=1
			end
	
	
		
		end
	end

