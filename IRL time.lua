--the world is changing as we know it...
--time is never the same
--we look at the bright sun as our eyes burn
--theres no going back
--we cant do anything about it
--until now
--so i present to you
--irl time
--no longer burn ur eyes
--the time syncs with the outside time

for i,v in pairs(game:GetService("Lighting"):GetChildren()) do if v:IsA("Sky") then v:Destroy() end end
while wait(1) do game:GetService("Lighting").TimeOfDay = os.date("%H") .. ":" .. os.date("%M") .. ":" .. os.date("%S") end
