local waitTime = 15
local damage = game.ServerStorage.Values.HealthToTake.Value
--Replace with Batteries like UE4 demo
function takeHealth()
	
	local players = game:GetService("Players"):GetChildren()
	
	for _, player in pairs(players) do
		local humanoid = player.Character.Humanoid
		if humanoid then
			print("Touched")
			-- Player character touched health pack
			local currentHealth = humanoid.Health
			local newHealth = currentHealth - damage
			humanoid.Health = newHealth
		end
	
		
		
		
	end
	
	

	
	
	
	
end
while true do
	wait(5)
	takeHealth()
	
end