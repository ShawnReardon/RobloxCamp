local part = script.Parent
local mycolor = 1
local point = 1
local scale
local Players = game:GetService("Players")
local playersLocked = {}
local batteryTick = 0

local function givePoints(player)
    
 	local playerStats = player:WaitForChild("leaderstats")
    local playerPoints= playerStats:WaitForChild("Points")
 
    
    playerPoints.Value = playerPoints.Value + point	
    
end
function ResetBattery()
	batteryTick = 0
	mycolor = 0
	part.Transparency = 0
	--part.Position = Vector3.new(math.random(-245,225),50,math.random(-245,225))
	
	

	wait(7)
	mycolor = 1
	-- I added this to avoid the battery "respawning" next to you with you "locked" It may be broken
	local playersLocked = {}

	
	
	
end


function alternateColor()
	while true do
		 
		
	
		if mycolor == 1 then
			part.Transparency = 0
			wait(.2)
			mycolor = 2
			batteryTick+=1
		elseif mycolor == 2 then

			part.Transparency = 1
			wait(.2)
			mycolor = 1
			batteryTick+=1
			if batteryTick >= 20 then
				ResetBattery()
			end

		
		
		end
		
	
	
	end
end
-- If this isn't working just insert the code in this function beaath the comment below "$#$"
function RemovePlayerFromTable(player, humanoid)
	table.remove(playersLocked, table.find(playersLocked, player))
	print(playersLocked[#playersLocked])
	print("REMOVED")
	humanoid.WalkSpeed = humanoid.WalkSpeed / 2
end

function touched(otherPart)
	local touchedPlayer = otherPart.Parent:FindFirstChildWhichIsA("Humanoid")
	if touchedPlayer then
		
		local player = otherPart.Parent:FindFirstChildWhichIsA("Humanoid").Parent
		print("Player = ", player)
	if table.find(playersLocked,player) then
			return 1
	else
		
		table.insert(playersLocked, player)
			local humanoid = game:GetService("Players"):FindFirstChild(player.Name).Character.Humanoid
			print(humanoid.Health)
			local currentHealth = humanoid.Health
			humanoid.Health = currentHealth + 25
			print(humanoid.Health)
			local currentWalkSpeed = humanoid.WalkSpeed
			print(currentWalkSpeed)
			humanoid.WalkSpeed = currentWalkSpeed * 2

		part.Position = Vector3.new(math.random(-245,225),3,math.random(-245,225))
		print(player)
		local player_points = Players:GetPlayerFromCharacter(otherPart.Parent)

		givePoints(player_points)
			print(playersLocked[#playersLocked])
			wait(5)
			--$#$
			RemovePlayerFromTable(player, humanoid)
			
	end
	else
		
		
	end
		
end



part.Touched:Connect(touched)
alternateColor()



while true do
	for i in playersLocked do
		print(i)
	end
end





--[[


local block = script.Parent
local mycolor = 1

while true do
		 
	
	
		if mycolor == 1 then 
		block.BrickColor = BrickColor.new("Sea green")
			wait(2)
			mycolor = 2
		elseif mycolor == 2 then
			block.BrickColor = BrickColor.new("Bright orange")
			wait(2)
			mycolor = 1
		end
		print("After if")
	
	
	end


function touched(part)
	
	 
	local player = part.Parent:FindFirstChildWhichIsA("Humanoid").Parent
	
	if game.Players:FindFirstChild(player.Name) then
		print(player)
		
	else
		print("Not a Human")
	end
	
	
	
	
end

block.Touched:Connect(touched)
--]]