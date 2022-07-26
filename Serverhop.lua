local function ServerHop()
    local ApiUrl = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&excludeFullGames=true&limit=100"
    local HttpService = game:GetService("HttpService")
    
    local Request = syn and syn.request or request or http_request
    
    if Request then
        local Success, Error = pcall(function()
            local Response = Request({
                Url = ApiUrl,
                Method = "GET"
            })
            local AvailableServers = 100
            for i,v in next, HttpService:JSONDecode(Response.Body).data do
                AvailableServers = i
            end
            local Server = math.random(1, AvailableServers)
            print(Server .. " : " .. AvailableServers)
            for i,v in next, HttpService:JSONDecode(Response.Body).data do
                if i == Server then
                    if v.playing ~= v.maxPlayers then
                        Server = v.id
                        print(Server)
                        break
                    else
                        Server = nil
                        ServerHop()
                        break
                    end
                end
            end
            
            if Server ~= nil then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Server, game.Players.LocalPlayer)
            end
        end)
        
        if not Success then
            return warn(Error)
        end
    end
end

ServerHop()
