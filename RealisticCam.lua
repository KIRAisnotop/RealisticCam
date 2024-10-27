local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local function updateCamera()
    local character = player.Character
    if character then
        local head = character:FindFirstChild("Head")
        if head then
            -- Set camera CFrame to the head position and maintain head rotation
            camera.CFrame = CFrame.new(head.Position) * CFrame.Angles(0, head.CFrame.Yaw, 0)
        end
    end
end

-- Connect the update function to RenderStepped
RunService.RenderStepped:Connect(updateCamera)

-- Handle character respawn
player.CharacterAdded:Connect(function()
    wait(1) -- wait for the character to fully load
    updateCamera()
end)
