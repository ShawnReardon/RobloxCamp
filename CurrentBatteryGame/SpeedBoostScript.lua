local part = script.Parent
local myTransparency = 1
local ticks = 0
local pointValue = 1
local Players = game:GetService("Players")


local function givePoints(player)
    
 	local playerStats = player:WaitForChild("leaderstats")
    local playerPoints= playerStats:WaitForChild("Boosts")
 
    
    playerPoints.Value = playerPoints.Value + pointValue	
    
end

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
		
end



function touched(otherPart)
	
	local touchedPlayer = otherPart.Parent:FindFirstChildWhichIsA("Humanoid")
	
	if touchedPlayer then
		
		local player = touchedPlayer.Parent
		print("Player = ", player)
		
		
		local playerToAward = Players:GetPlayerFromCharacter(otherPart.Parent)

		givePoints(playerToAward)
    	part:Destroy()
	
	else
		--print("Not a Player")

		end
	
end



part.Touched:Connect(touched)
wait(10)
alternateTransparency()
