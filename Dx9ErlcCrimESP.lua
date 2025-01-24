local nameESP = true --False for no nametags

local dataModel = dx9.GetDatamodel()
local players = dx9.FindFirstChild(dataModel, "Players")
local lp = dx9.get_localplayer()

--Find if player has "Is_Wanted" Child which is a stringValue given to wanted players. If they do, apply ESP
for _,v in pairs(dx9.GetChildren(players)) do
    local plrName = dx9.GetName(v)
    if plrName ~= lp.Info.Name then
        for j,k in pairs(dx9.GetChildren(v)) do
            if dx9.GetName(k) == "Is_Wanted" then
                local pos = dx9.GetPosition(dx9.FindFirstChild(dx9.GetCharacter(v), "Head"))
                if pos then
                    local pos2 = dx9.WorldToScreen({pos.x, pos.y, pos.z})
                    if nameESP then
                    dx9.DrawCircle({pos2.x, pos2.y}, {0,0,255}, 8)
                    dx9.DrawString({pos2.x - 30, pos2.y + -30}, {255,255,255}, plrName)
                    else
                        dx9.DrawCircle({pos2.x, pos2.y}, {0,0,255}, 8)
                    end
                end
            end
        end
    end
end
