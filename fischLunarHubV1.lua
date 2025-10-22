local Fluent = loadstring(game:HttpGet("https://github.com/schattnkatz98/fluentCustom/releases/latest/download/main.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local ws = game:GetService("Workspace")
local player = game:GetService("Players").LocalPlayer
local zones = ws:WaitForChild("zones"):WaitForChild("player")
local AllRods = {}

local locations = {
        ["Abyssal Specter Rod"] = CFrame.new(-3804.219482, -565.938110, 1870.353760, -3804.219482422, -565.938110352, 1870.353759766, 1.000000000, 0.000000000, 0.000000000, 0.000000000, 1.000000000, 0.000000000),
        ["Arctic Rod"] = CFrame.new(19576.126953, 132.337082, 5305.944336, 19576.126953125, 132.337081909, 5305.944335938, -0.321763873, 0.826084375, -0.462658644, -0.820539832, 0.000521302, 0.571589291),
        ["Avalanche Rod"] = CFrame.new(19771.052734, 413.333038, 5418.708496, 19771.052734375, 413.333038330, 5418.708496094, -0.675413251, -0.341303200, -0.653704584, -0.381730348, 0.920257986, -0.086065434),
        ["Brick Rod"] = CFrame.new(-32091.771484, 9997.905273, -23313.857422, -32091.771484375, 9997.905273438, -23313.857421875, -0.401405215, -0.259794146, -0.878282905, -0.382241398, -0.823909283, 0.418407887),
        ["Carbon Rod"] = CFrame.new(454.083618, 150.590073, 225.328827, 454.083618164, 150.590072632, 225.328826904, 0.985374212, -0.170404434, 0.000000142, 0.000000142, 0.000001729, 1.000000000),
        ["Champions Rod"] = CFrame.new(-4277.329590, -602.254883, 1839.042236, -4277.329589844, -602.254882812, 1839.042236328, -0.997859359, 0.000000000, 0.065397061, 0.000000000, 1.000000000, 0.000000000),
        ["Depthseeker Rod"] = CFrame.new(-4466.246094, -596.111450, 1875.071655, -4466.246093750, -596.111450195, 1875.071655273, 0.938948810, -0.000000000, -0.344056875, 0.000000000, 1.000000000, -0.000000000),
        ["Ethereal Prism Rod"] = CFrame.new(-4359.839355, -11172.432617, 3718.919678, -4359.839355469, -11172.432617188, 3718.919677734, -0.172945380, -0.015099254, -0.984815717, -0.087165222, 0.996193886, 0.000033543),
        ["Fast Rod"] = CFrame.new(447.183563, 148.225739, 220.187454, 447.183563232, 148.225738525, 220.187454224, 0.981104493, 0.000012649, 0.193478703, -0.052246124, 0.962867677, 0.264870107),
        ["Flimsy Rod"] = CFrame.new(471.107697, 148.361710, 229.642441, 471.107696533, 148.361709595, 229.642440796, 0.841614008, 0.077472821, -0.534493923, 0.006784361, 0.988063335, 0.153898612),
        ["Fortune Rod"] = CFrame.new(-1513.819580, 141.283279, 752.977478, -1513.819580078, 141.283279419, 752.977478027, -0.038049698, 0.999275863, 0.000011325, -0.000011325, -0.000011802, 1.000000000),
        ["Kings Rod"] = CFrame.new(1375.900635, -810.154297, -303.509247, 1375.900634766, -810.154296875, -303.509246826, -0.749020100, 0.662445903, -0.011614412, -0.083796054, -0.077329040, 0.993478119),
        ["Kraken Rod"] = CFrame.new(-4415.242188, -995.197388, 2054.630127, -4415.242187500, -995.197387695, 2054.630126953, 0.000000000, 0.000000000, -1.000000000, 0.000000000, 1.000000000, 0.000000000),
        ["Long Rod"] = CFrame.new(485.695038, 171.656326, 145.746109, 485.695037842, 171.656326294, 145.746109009, -0.630167365, -0.776459217, -0.000005335, 0.000005335, -0.000011206, 1.000000000),
        ["Lost Rod"] = CFrame.new(2879.876953, 135.791916, 2727.481445, 2879.876953125, 135.791915894, 2727.481445312, 0.970463336, -0.168695927, -0.172460333, 0.141582936, -0.180552125, 0.973321974),
        ["Lucky Rod"] = CFrame.new(446.085999, 148.253006, 222.160004, 446.085998535, 148.253005981, 222.160003662, 0.974526405, -0.223054990, 0.023340467, 0.196993902, 0.901088715, 0.386306256),
        ["Magnet Rod"] = CFrame.new(-242.587631, 139.601608, 1958.367065, -242.587631226, 139.601608276, 1958.367065430, 0.448886991, -0.160295755, 0.879093707, 0.057846200, 0.986928284, 0.150420845),
        ["Nocturnal Rod"] = CFrame.new(-141.874237, -515.313477, 1139.045288, -141.874237061, -515.313476562, 1139.045288086, 0.161644459, -0.986849070, 0.000018775, 0.000018775, 0.000022113, 1.000000000),
        ["Plastic Rod"] = CFrame.new(454.425385, 148.169739, 229.172424, 454.425384521, 148.169738770, 229.172424316, 0.951755166, 0.070973627, -0.298537821, -0.000000343, 0.972884834, 0.231290117),
        ["Poseidon Rod"] = CFrame.new(-4086.173340, -556.944580, 895.043762, -4086.173339844, -556.944580078, 895.043762207, -0.000000119, 0.000000000, -1.000000119, 0.000000000, 1.000000000, 0.000000000),
        ["Rapid Rod"] = CFrame.new(-1499.877319, 139.276520, 756.464355, -1499.877319336, 139.276519775, 756.464355469, -0.246068597, -0.250960022, 0.936199546, 0.031782426, 0.963289857, 0.266575575),
        ["Reinforced Rod"] = CFrame.new(-986.474365, -245.473938, -2689.792480, -986.474365234, -245.473937988, -2689.792480469, 0.950221658, -0.248433635, 0.188041329, -0.188312545, 0.022896469, 0.981842279),
        ["Rod Of The Depths"] = CFrame.new(1705.160522, -902.678589, 1448.060547, 1705.160522461, -902.678588867, 1448.060546875, -0.067548752, 0.000000000, -0.997715950, 0.000000000, 1.000000000, 0.000000000),
        ["Rod Of The Zenith"] = CFrame.new(-13625.116211, -11034.431641, 357.601990, -13625.116210938, -11034.431640625, 357.601989746, 0.766061246, -0.000000000, -0.642767608, 0.000000000, 1.000000000, -0.000000000),
        ["Scurvy Rod"] = CFrame.new(-2828.218506, 213.457199, 1512.209595, -2828.218505859, 213.457199097, 1512.209594727, -0.939700961, -0.341998369, 0.000000000, -0.341998369, 0.939700544, 0.000000000),
        ["Steady Rod"] = CFrame.new(-1499.367432, 139.230103, 758.399902, -1499.367431641, 139.230102539, 758.399902344, -0.246068597, -0.250960022, 0.936199546, 0.031782426, 0.963289857, 0.266575575),
        ["Summit Rod"] = CFrame.new(20210.169922, 736.058289, 5712.171875, 20210.169921875, 736.058288574, 5712.171875000, 0.000015855, -0.946918845, 0.321472645, -1.000000000, -0.000015855, 0.000002623),
        ["Tempest Rod"] = CFrame.new(-4927.727539, -594.364868, 1856.835571, -4927.727539062, -594.364868164, 1856.835571289, 0.751858234, -0.000000000, -0.659324884, 0.000000000, 1.000000000, -0.000000000),
        ["Training Rod"] = CFrame.new(457.693817, 148.357544, 230.414291, 457.693817139, 148.357543945, 230.414291382, 1.000000000, -0.000000000, 0.000000000, 0.000000000, 0.975410998, 0.220393807),
        ["Trident Rod"] = CFrame.new(-1482.911255, -224.787842, -2194.624268, -1482.911254883, -224.787841797, -2194.624267578, -0.466092706, -0.536795318, 0.703284025, -0.319611132, 0.843386114, 0.431912750),
        ["Zeus Rod"] = CFrame.new(-4270.884766, -625.938599, 2664.466553, -4270.884765625, -625.938598633, 2664.466552734, 0.499959469, 0.000000000, 0.866048813, 0.000000000, 1.000000000, 0.000000000),
    }

local Window = Fluent:CreateWindow({
    Title = "Lunar Hub",
    SubTitle = "by skulduggery98",
    Size = UDim2.fromOffset(580, 360),
    TabWidth = 120,                
    Acrylic = true,                 
    Theme = "Rose"                     
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Event = Window:AddTab({ Title = "Event", Icon = "gift" }),
    Farm = Window:AddTab({ Title = "Farm", Icon = "carrot" }),
    Pets = Window:AddTab({ Title = "Pets", Icon = "egg" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
    
}

local Options = Fluent.Options

local function infoMessage(msg)
     Fluent:Notify({
        Title = "information",
        Content = msg,
        SubContent = nil,
        Duration = 5
    })
end

local function teleport(name)
    local lp   = game:GetService("Players").LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()

    local cf = locations[name]
    if not cf then return end

    char:PivotTo(cf)
end

local function getRodNames()
    for k,v in pairs(locations) do
        table.insert(AllRods, k)
    end
end
getRodNames()

-- unique Zonennamen (erstes Vorkommen bleibt)
local function getZones()
    local folder = workspace:WaitForChild("zones"):WaitForChild("player")
    local seen, names = {}, {}
    for _, z in ipairs(folder:GetChildren()) do
        local n = z.Name
        if not seen[n] then
            seen[n] = true
            names[#names+1] = n 
        end
    end
    return names
end


Fluent:Notify({
        Title = "information",
        Content = "😼 script succesfully executed 😼",
        SubContent = "🦈 discord.gg/daddys",
        Duration = 5
    })

 Tabs.Farm:AddButton({
        Title = "Teleport Spawn",
        Description = "teleports you to moosewood",
        Callback = function()
            teleport('Moosewood')
        end
 })

  Tabs.Main:AddButton({
        Title = "Infinite Yield",
        Description = "opens Infinite Yield",
        Callback = function()
            infoMessage("loadet inf yield enjoy :)")
            loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
        end
 })

  Tabs.Main:AddButton({
        Title = "Dex Explorer",
        Description = "opens Dex",
        Callback = function()
            infoMessage("loadet dex enjoy :)")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
        end
 })

 Tabs.Farm:AddButton({
        Title = "Show Boats",
        Description = "Show the boat ui",
        Callback = function()
            workspace.world.npcs["Moosewood Shipwright"].shipwright.giveUI:InvokeServer({["idle"] = workspace.world.npcs["Moosewood Shipwright"].description.idle,["npc"] = workspace.world.npcs["Moosewood Shipwright"],["voice"] = 8})
        end
 })

  Tabs.Farm:AddButton({
        Title = "Instant Catch",
        Description = "catches fish instant skipping minigame",
        Callback = function()
            game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100,false)
        end
 })

Tabs.Farm:AddButton({
        Title = "Sell All",
        Description = "sell all fisch",
        Callback = function()
            game:GetService("ReplicatedStorage").events.SellAll:InvokeServer({["idle"] = workspace.world.npcs["Marc Merchant"].description.idle,["npc"] = workspace.world.npcs["Marc Merchant"],["voice"] = 12})
        end
 })

 local Toggle = Tabs.Main:AddToggle("Autofarm", {Title = "Autofarm", Default = false })

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.Autofarm.Value)
    end)

Options.Autofarm:SetValue(false)


 local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "WalkSpeed",
        Description = "change Walk Speed",
        Default = 2,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(Value)
            game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Value
            print(Value)
        end
    })
    Slider:SetValue(16)

local Dropdown = Tabs.Farm:AddDropdown("Dropdown", {
        Title = "Zone",
        Values = getZones(), --AllZones
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("Moosewood")
    Dropdown:OnChanged(function(name)
        local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        char:PivotTo(zones[name].CFrame)
    end)


local Dropdown = Tabs.Farm:AddDropdown("Dropdown", {
        Title = "Rods",
        Values = AllRods,

        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue(nil)
    Dropdown:OnChanged(function(value)
        teleport(value)
    end)

 local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
        Title = "Dropdown",
        Description = "You can select multiple values.",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = true,
        Default = {"seven", "twelve"},
    })

   local TColorpicker = Tabs.Main:AddColorpicker("TransparencyColorpicker", {
        Title = "Colorpicker",
        Description = "but you can change the transparency.",
        Transparency = 0,
        Default = Color3.fromRGB(96, 205, 255)
    })

local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            infoMessage(Value)
        end
})


InterfaceManager:SetLibrary(Fluent)
InterfaceManager:BuildInterfaceSection(Tabs.Settings)



-- for k, v in pairs(Tabs) do
--     v:AddParagraph({
--         Title = "Paragraph",
--         Content = "This is a paragraph.\npage " .. tostring(k)
--     })

-- end