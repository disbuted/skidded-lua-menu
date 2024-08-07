local nums = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0}
local remote1;
local remote1args
local remote2;
local remote2args
local remote3;
local remote3args
local remote4;
local remote4args
local index = 0

for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
    for z, x in pairs(nums) do
        if string.match(v.Name, tostring(x)) then
            index += 1
            if index == 1 then
                remote1 = v:FindFirstChildOfClass("RemoteFunction")
            elseif index == 2 then
                remote2 = v:FindFirstChildOfClass("RemoteFunction")
            elseif index == 3 then
                remote3 = v:FindFirstChildOfClass("RemoteFunction")
            elseif index == 4 then
                remote4 = v:FindFirstChildOfClass("RemoteFunction")
            end
        end
    end
end
function deepclone(table)
    local tbl = {}
    for i, v in pairs(table) do
        if typeof(v) == "table" then
            table.insert(tbl, deepclone(v))
        else
            table.insert(tbl, v)
        end
    end
    return tbl
end
hookfunction(remote1.InvokeServer, function(args)
    print("Found Remote1")
    if not remote1args then
        if typeof(args) == "table" then
            remote1args = deepclone(args)
        else
            remote1args = args
        end
    end
end)
hookfunction(remote2.InvokeServer, function(args)
    if not remote2args then
        print("Found Remote2")
        if typeof(args) == "table" then
            remote2args = deepclone(args)
        else
            remote2args = args
        end
    end
end)
hookfunction(remote3.InvokeServer, function(args)
    if not remote3args then
        print("Found Remote3")
        if typeof(args) == "table" then
            remote3args = deepclone(args)
        else
            remote3args = args
        end
    end
end)
hookfunction(remote4.InvokeServer, function(args)
    if not remote4args then
        print("Found Remote4")
        if typeof(args) == "table" then
            remote4args = deepclone(args)
        else
            remote4args = args
        end
    end
end)

task.spawn(function()
    repeat task.wait() until remote1args
    while task.wait(1) do
        remote1:InvokeServer(remote1args)
    end
end)
task.spawn(function()
    repeat task.wait() until remote2args
    while task.wait(1) do
        remote2:InvokeServer(remote2args)
    end
end)
task.spawn(function()
    repeat task.wait() until remote3args
    while task.wait(1) do
        remote3:InvokeServer(remote3args)
    end
end)
task.spawn(function()
    repeat task.wait() until remote2args
    while task.wait(1) do
        remote4:InvokeServer(remote2args)
    end
end)
repeat task.wait() until remote1args or remote2args or remote3args or remote4args
-- main script