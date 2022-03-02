print("Leaderboard Loaded")

-- Adds HighScore Hint to Top of Screen
hiscore = 0
hiperson = ""
hint = Instance.new("Hint")
hint.Parent = game.Workspace

--Stores Time Alive at Time of Death
function onHumanoidDied(humanoid, player)
	local stats = player:findFirstChild("leaderstats")
		stats["Seconds Alive"].Value = 0
end

--Begin Again on Respawn
function onPlayerRespawn(property, player)

	
	if property == "Character" and player.Character ~= nil then
		local humanoid = player.Character.Humanoid
			local p = player
			local h = humanoid
			humanoid.Died:connect(function() onHumanoidDied(h, p) end )
	end
end

-----------------------------------------------





-- Intial Setup on Join
local function onPlayerJoin(player)
--Create Content Below for Each Player

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
 
	-- Example of a IntValue
	local points = Instance.new("IntValue")
	points.Name = "Points"
	points.Value = 0
	points.Parent = leaderstats
	
	local secondsAlive = Instance.new("IntValue")
	secondsAlive.Name = "Seconds Alive"
	secondsAlive.Value = 0
	secondsAlive.Parent = leaderstats
	
	while true do
			if player.Character ~= nil then break end
			wait(5)
		end
	
		local humanoid = player.Character.Humanoid
	
	-- On Death of Player Event Call Our Function Above
	humanoid.Died:connect(
		
		function() 
			
			onHumanoidDied(humanoid, player) 
			
		end)
	
	-- On Respawn of Player Event Call Our Function Above
	player.Changed:connect(
		
		function(property) 
			
			onPlayerRespawn(property, player) 
			
		end)



	

end
 

-- Set Player "Score" per second Alive		
function award(player)
	local stats = player:findFirstChild("leaderstats")
	if stats ~= nil then
		stats["Seconds Alive"].Value = stats["Seconds Alive"].Value + 1
	end
end

-- Retrieve Stats info
function gettime(player)
	local stats = player:findFirstChild("leaderstats")
	if stats ~= nil then
		return stats["Seconds Alive"].Value
	end
	return 0
end

-- TracksTime Per Second
function TrackTime()
while true do
	wait(1)
	local players = game.Players:children()
	for i=1,#players do 
		award(players[i])
		if(gettime(players[i]) > hiscore) then hiscore = gettime(players[i]) hiplayer = players[i].Name end
	end
	if(hiplayer ~= nil) then hint.Text = "High Score: " .. hiplayer .. "  " .. hiscore end
end

end

-- Run onPlayerJoin when the PlayerAdded event fires
game.Players.PlayerAdded:Connect(onPlayerJoin)
TrackTime()

--game.Players.ChildAdded:connect(onPlayerJoin)

