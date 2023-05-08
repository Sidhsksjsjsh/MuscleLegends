jk = {}
for _, v in pairs(game:GetService("ReplicatedStorage").chestRewards:GetDescendants()) do
    if v.Name ~= "Light Karma Chest" or v.Name ~= "Evil Karma Chest" then
        table.insert(jk, v.Name)
    end
end

jk1 = {}
for _, v in pairs(game:GetService("Workspace").mapCrystalsFolder:GetDescendants()) do
    if v:FindFirstChild("Crystal") then
        table.insert(jk1, v.Name)
    end
end
Rocks = {}
for i, v in pairs(game:GetService("Workspace").machinesFolder:GetChildren()) do
    if v:FindFirstChild("Rock") then
        table.insert(Rocks, v.Name)
    end
end
function c()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if
            v.ClassName == "Tool" and v.Name == "Handstands" or v.Name == "Situps" or v.Name == "Pushups" or
                v.Name == "Weight"
         then
            v:FindFirstChildOfClass("NumberValue").Value = 0
            repeat
                wait()
            until game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
        end
    end
end

local library = loadstring(game:HttpGet("https://pastebin.com/raw/Uub92rmN"))()


local Window = library:AddWindow("Sync X - Cheating Tool",
    {
        main_color = Color3.fromRGB(170, 0, 0),
        min_size = Vector2.new(373, 433),
        toggle_key = Enum.KeyCode.RightShift,
    })
    
local T1 = Window:AddTab("Main")
local T2 = Window:AddTab("Crystal")
local T3 = Window:AddTab("ESP")
local T4 = Window:AddTab("Misc")

T1:AddSwitch("auto farm", function(State)
Settings.WorkOut = State
game:GetService("RunService").Stepped:connect(
    function()
        pcall(
            function()
                if Settings.WorkOut then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                end
            end
        )
    end
)
spawn(function()
while Settings.WorkOut do
    wait()
    pcall(
        function()
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            c()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9e9,9e9,9e9)
            if not Settings.WorkOut then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
            end
        end
    )
end
end)
end)

T1:AddSwitch("auto mob", function(State)
Settings.AutoMob = State
spawn(function()
while Settings.AutoMob do
    wait()
    pcall(
        function()
            for i, v in pairs(game:GetService("Workspace").enemyNPCs["Battle Island"]:GetChildren()) do
                if v:IsA("Folder") and v:FindFirstChildOfClass("Model") then
                    for i, v in pairs(v:GetChildren()) do
                        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                            repeat
                                wait()
                                pcall(
                                    function()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            v.PrimaryPart.CFrame
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(
                                            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Punch")
                                        )
                                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                                            "punch",
                                            "rightHand"
                                        )
                                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                                            "punch",
                                            "leftHand"
                                        )
                                    end
                                )
                            until v.Parent.stats.Health == 0
                        end
                    end
                end
            end
        end
    )
end
end)

end)
T1:AddSwitch("auto durability", function(State)
Settings.WorkOut1 = State
game:GetService("RunService").Stepped:connect(
    function()
        pcall(
            function()
                if Settings.WorkOut1 then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                end
            end
        )
    end
)
spawn(function()
while Settings.WorkOut1 do
    wait()
    pcall(
        function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game:GetService("Workspace").machinesFolder[Rocks].Rock.CFrame
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")

            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack.Punch)
        end
    )
end
end)
end)



local RocksList = T2:AddDropdown("Rocks", function(object)
	Settings.Rocks = object
end)

RocksList:Add(Rocks)

T1:AddSwitch("personal feature", function(State)
Settings.personal = State
game:GetService("RunService").Stepped:connect(
    function()
        pcall(
            function()
                if Settings.personal then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8980, -30, -6049)
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(
                        game:GetService("Players").LocalPlayer.Backpack.Punch
                    )
                end
            end
        )
    end
)
end)


T1:AddButton("no tool cooldown", function()
c()
game:GetService("Players").LocalPlayer.Backpack.Punch:FindFirstChildOfClass("NumberValue").Value = 0
end)

T1:AddSwitch("auto rebirth", function(State)
Settings.Rebirth = State
spawn(function()
while Settings.Rebirth do
    wait(0.1)
    game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
end
end)
end)
 
T1:AddSwitch("auto join brawl", function(State)
Settings.Hot = State
spawn(function()
while Settings.Hot do
    wait(2)
    game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
end
end)
end)

T1:AddButton("get all chest", function()
for i = 1, #jk do
    wait(2)
    game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(jk[i])
end

end)

local cry = T2:AddDropdown("Crystal", function(object)
	Settings.Crystals = object
end)

cry:Add(jk1)

T2:AddSwitch("auto crystal", function(State)
Settings.AutoPets = State
spawn(function()
while Settings.AutoPets do
    wait()
    game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", jk1)
end
end)
end)

T1:AddSwitch("anti delete pets", function(State)
Settings.Stop = State
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {...}
        if self.Name == "sellPetEvent" and Args[1] == "sellPet" and Settings.Stop then
                return 
        end
    return OldNameCall(self, unpack(Args))
end)
end)

T1:AddSwitch("anti rebirth", function(State)
Settings.Stop1 = State
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {...}
        if self.Name == "rebirthRemote" and Args[1] == "rebirthRequest" and Settings.Stop1 then
                return 
        end
    return OldNameCall(self, unpack(Args))
end)
end)

T1:AddSwitch("infinite jump", function(State)
Settings.InfiniteJump = State
game:GetService("UserInputService").JumpRequest:connect(
    function()
        if Settings.InfiniteJump then
            game:GetService "Players".LocalPlayer.Character:FindFirstChildOfClass "Humanoid":ChangeState("Jumping")
        end
    end
)
end)

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()


T3:AddSwitch("enable esp", function(State)
    Settings.Esp = State
    ESP:Toggle(Settings.Esp)
end)

T3:AddSwitch("player esp", function(State)
    Settings.PlayerEsp = State
    ESP.Players = Settings.PlayerEsp
end)
T3:AddSwitch("tracers esp", function(State)
    Settings.Tracers = State
    ESP.Tracers = Settings.Tracers
end)
T3:AddSwitch("name esp", function(State)
    ESP.Names = Settings.EspNames
    Settings.EspNames = State
end)
T3:AddSwitch("boxes esp", function(State)
    Settings.Boxes = State
    ESP.Boxes = Settings.Boxes
end)

T4:AddSwitch("inviscam", function(State)
Settings.Sorry = State
if Settings.Sorry then
    game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Invisicam"
else
    game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Zoom"
end
end)

T4:AddButton("Serverhop", function()
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport() 
end)
T4:AddButton("Rejoin", function()
game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer) 
end)

for i,v in pairs(game:GetService("ReplicatedStorage").funs:GetChildren()) do
local OldNameCall = nil
OldNameCall =
    hookmetamethod(
    game,
    "__namecall",
    function(self, ...)
        local Args = {...}
        if self.Name == v.Name or self.Name == "maxstat" then
            return nil
        end
        return OldNameCall(self, unpack(Args))
    end
)
end 
