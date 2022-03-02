local part = script.Parent
local myTransparency = 1
local ticks = 0
local healAmount = game.ServerStorage.Values.HealthToGive.Value

function alternateTransparency()
	while true do
		 
		if myTransparency == 1 then
			
			part.Transparency = 0
			wait(.2)
			myTransparency = 2
			ticks += 1
			
		elseif myTransparency == 2 then

			part.Transparency = 1
			wait(.2)
			myTransparency = 1
			ticks += 1
			if ticks > 30 then
				
				part:Destroy()
				
			end
			
		end
		
	end
	wait(5)
	print('DETOYER OF WORLDS')
	part:Destroy()
	
end



function touched(otherPart)
	
	local touchedPlayer = otherPart.Parent:FindFirstChildWhichIsA("Humanoid")
	
	if touchedPlayer then
		
		local player = touchedPlayer.Parent
		print("Player = ", player)
		part:Destroy()
		local humanoid = game:GetService("Players"):FindFirstChild(player.Name).Character.Humanoid
			print(humanoid.Health)
			local currentHealth = humanoid.Health
			humanoid.Health = currentHealth + healAmount
			print(humanoid.Health)
    
	
	else
		--print("Not a Player")

		end
	
end



part.Touched:Connect(touched)
wait(10)
alternateTransparency()
