local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local itemNumber = math.huge

local jk = {}
for _, v in pairs(game:GetService("ReplicatedStorage").chestRewards:GetDescendants()) do
    if v.Name ~= "Light Karma Chest" or v.Name ~= "Evil Karma Chest" then
        table.insert(jk, v.Name)
    end
end

local jk1 = {}
for _, v in pairs(game:GetService("Workspace").mapCrystalsFolder:GetDescendants()) do
    if v:FindFirstChild("Crystal") then
        table.insert(jk1, v.Name)
    end
end

local tbl_Rocks = {}
for i, v in pairs(game:GetService("Workspace").machinesFolder:GetChildren()) do
    if v:FindFirstChild("Rock") then
        table.insert(tbl_Rocks, v.Name)
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

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})

local function children(s,get)
for _,v in pairs(s:GetChildren()) do
	get(v)
end
end

local function setValue(item,index)
	item.Value = index
end

local T1 = Window:MakeTab({Name = "Main",Icon = "rbxassetid://",PremiumOnly = false})
local T2 = Window:MakeTab({Name = "Crystal",Icon = "rbxassetid://",PremiumOnly = false})
local T5 = Window:MakeTab({Name = "Rocks",Icon = "rbxassetid://",PremiumOnly = false})
local T6 = Window:MakeTab({Name = "Brawl",Icon = "rbxassetid://",PremiumOnly = false})
local T7 = Window:MakeTab({Name = "Chest",Icon = "rbxassetid://",PremiumOnly = false})
--local T8 = Window:MakeTab({Name = "Tool",Icon = "rbxassetid://",PremiumOnly = false})
local T3 = Window:MakeTab({Name = "ESP",Icon = "rbxassetid://",PremiumOnly = false})
local T4 = Window:MakeTab({Name = "Misc",Icon = "rbxassetid://",PremiumOnly = false})

local Settings = {
	WorkOut = false,
	AutoMob = false,
	WorkOut1 = false,
	Rocks = "",
	personal = false,
	Rebirth = false,
	Hot = false,
	Crystals = "",
        AutoPets = false,
        Stop = false,
        Stop1 = false,
        InfiniteJump = false,
        Esp = false,
        PlayerEsp = false,
        Tracers = false,
        EspNames = false,
        Boxes = false,
        Sorry = false
}

T1:AddToggle({
Name = "Auto Farm",
Default = false,
Callback = function(State)
Settings.WorkOut = State
while wait() do
    if Settings.WorkOut == false then break end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
    c()
    --game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9e9,9e9,9e9)
        if not Settings.WorkOut then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
        end
end
end})

T1:AddToggle({
Name = "Punch Farm ?",
Default = false,
Callback = function(State)
Settings.AutoMob = State
spawn(function()
while wait() do
    if Settings.AutoMob == false then break end
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
end})

T5:AddDropdown({
Name = "Select Rocks",
Default = tbl_Rocks[1],
Options = tbl_Rocks,
Callback = function(object)
	Settings.Rocks = object
end})

T5:AddToggle({
Name = "Auto Durability",
Default = false,
Callback = function(State)
Settings.WorkOut1 = State
spawn(function()
while wait() do
    if Settings.WorkOut1 == false then break end
    pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game:GetService("Workspace").machinesFolder[Settings.Rocks].Rock.CFrame
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")

            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack.Punch)
        end)
end
end)
end})

T1:AddToggle({
Name = "Personal Feature",
Default = false,
Callback = function(State)
Settings.personal = State
while wait() do
	if Settings.personal == false then break end
	pcall(function()
                if Settings.personal then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8980, -30, -6049)
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack.Punch)
                end
            end)
	end
end})


T4:AddButton({
Name = "No Tool Cooldown",
Callback = function()
c()
game:GetService("Players").LocalPlayer.Backpack.Punch:FindFirstChildOfClass("NumberValue").Value = 0
end})

T1:AddToggle({
Name = "Auto Rebirth",
Default = false,
Callback = function(State)
Settings.Rebirth = State
spawn(function()
while wait() do
    if Settings.Rebirth == false then break end
    game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
end
end)
end})

T6:AddSlider({
Name = "Timer",
Min = 0,
Max = 20,
Default = 2,
Color = Color3.fromRGB(255,255,255),
Increment = 1,
ValueName = "Seconds",
Callback = function(Value)
_G.BrawlTimer = Value
end})

T6:AddToggle({
Name = "Auto Join Brawl",
Default = false,
Callback = function(State)
Settings.Hot = State
spawn(function()
while wait(_G.BrawlTimer) do
    if Settings.Hot == false then break end
    game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
end
end)
end})

T7:AddSlider({
Name = "Timer",
Min = 0,
Max = 20,
Default = 2,
Color = Color3.fromRGB(255,255,255),
Increment = 1,
ValueName = "Seconds",
Callback = function(Value)
_G.cTimer = Value
end})

T7:AddButton({
Name = "Get All Chest",
Callback = function()
for i = 1, #jk do
    wait(_G.cTimer)
    game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(jk[i])
end
end})

T2:AddDropdown({
Name = "Select Crystal",
Default = jk1[1],
Options = jk1,
Callback = function(object)
	Settings.Crystals = object
end})

T2:AddToggle({
Name = "Auto Crystal",
Default = false,
Callback = function(State)
Settings.AutoPets = State
spawn(function()
while wait() do
    if Settings.AutoPets == false then break end
    game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal",Settings.Crystals)
end
end)
end})

local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {...}
        if self.Name == "sellPetEvent" and Args[1] == "sellPet" and Settings.Stop == true then
                return 
        end
	if self.Name == "rebirthRemote" and Args[1] == "rebirthRequest" and Settings.Stop1 == true then
                return 
	end
    return OldNameCall(self, unpack(Args))
end)

T4:AddToggle({
Name = "Anti-Delete Pets",
Default = false,
Callback = function(State)
Settings.Stop = State
end})

T4:AddToggle({
Name = "Anti-Rebirth",
Default = false,
Callback = function(State)
Settings.Stop1 = State
end})

game:GetService("UserInputService").JumpRequest:connect(function()
if Settings.InfiniteJump == true then
    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end
end)

T4:AddToggle({
Name = "Infinite Jump",
Default = false,
Callback = function(State)
Settings.InfiniteJump = State
end})

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()


T3:AddToggle({
Name = "Enable ESP",
Default = false,
Callback = function(State)
    Settings.Esp = State
    ESP:Toggle(Settings.Esp)
end})

T3:AddToggle({
Name = "Player ESP",
Default = false,
Callback = function(State)
    Settings.PlayerEsp = State
    ESP.Players = Settings.PlayerEsp
end})

T3:AddToggle({
Name = "Tracers ESP",
Default = false,
Callback = function(State)
    Settings.Tracers = State
    ESP.Tracers = Settings.Tracers
end})

T3:AddToggle({
Name = "Name ESP",
Default = false,
Callback = function(State)
    ESP.Names = Settings.EspNames
    Settings.EspNames = State
end})

T3:AddToggle({
Name = "Boxes ESP",
Default = false,
Callback = function(State)
    Settings.Boxes = State
    ESP.Boxes = Settings.Boxes
end})

T4:AddToggle({
Name = "Inviscam",
Default = false,
Callback = function(State)
Settings.Sorry = State
if Settings.Sorry == true then
    game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Invisicam"
else
    game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Zoom"
end
end})

T4:AddButton({
Name = "Serverhop",
Callback = function()
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
end})

T4:AddButton({
Name = "Rejoin",
Callback = function()
game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer) 
end})

game:GetService("RunService").Stepped:connect(function()
if Settings.WorkOut then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
   end
if Settings.WorkOut1 then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
   end
end)

children(game.Players.LocalPlayer.Backpack,function(i)
	children(i,function(l)
		if l:FindFirstChild("attackTime") then
			setValue(i.attackTime,0)
		elseif l:FindFirstChild("strengthGain") then
			setValue(i.strengthGain,itemNumber)
		elseif l:FindFirstChild("agilityGain") then
			setValue(i.agilityGain,itemNumber)
		elseif l:FindFirstChild("durabilityGain") then
			setValue(i.durabilityGain,itemNumber)
		end
end)
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
