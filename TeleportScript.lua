-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeleportGui"
screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Create the main teleport window
local teleport = Instance.new("TextButton")
teleport.Name = "Teleport"
teleport.Size = UDim2.new(0, 400, 0, 200)
teleport.Position = UDim2.new(0.5, -200, 0.5, -100)
teleport.BackgroundColor3 = Color3.fromHex("#547792")
teleport.Text = ""
teleport.AutoButtonColor = false
teleport.Active = true
teleport.Draggable = true
teleport.Parent = screenGui

local teleportCorner = Instance.new("UICorner")
teleportCorner.CornerRadius = UDim.new(0, 8)
teleportCorner.Parent = teleport

-- Small tab
local smallTab = Instance.new("Frame")
smallTab.Size = UDim2.new(0, 200, 0, 40)
smallTab.Position = UDim2.new(0.5, -100, 0, 5)
smallTab.BackgroundColor3 = Color3.fromHex("#94B4C1")
smallTab.Parent = teleport

local smallTabCorner = Instance.new("UICorner")
smallTabCorner.CornerRadius = UDim.new(0, 8)
smallTabCorner.Parent = smallTab

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Ali Hub"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 20
titleLabel.Parent = smallTab

-- Big tab container
local tab = Instance.new("Frame")
tab.Size = UDim2.new(0, 380, 0, 140)
tab.Position = UDim2.new(0.5, -190, 0, 50)
tab.BackgroundColor3 = Color3.fromHex("#94B4C1")
tab.Parent = teleport

local tabCorner = Instance.new("UICorner")
tabCorner.CornerRadius = UDim.new(0, 8)
tabCorner.Parent = tab

-- X Button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 20
closeButton.Parent = teleport

local closeUICorner = Instance.new("UICorner")
closeUICorner.CornerRadius = UDim.new(0, 8)
closeUICorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Arrow Toggle
local arrowButton = Instance.new("TextButton")
arrowButton.Name = "ArrowButton"
arrowButton.Size = UDim2.new(0, 30, 0, 30)
arrowButton.Position = UDim2.new(1, -70, 0, 5)
arrowButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
arrowButton.Text = "⇄"
arrowButton.TextColor3 = Color3.new(1, 1, 1)
arrowButton.Font = Enum.Font.SourceSansBold
arrowButton.TextSize = 20
arrowButton.Parent = teleport

local arrowUICorner = Instance.new("UICorner")
arrowUICorner.CornerRadius = UDim.new(0, 8)
arrowUICorner.Parent = arrowButton

local expanded = true
local originalSize = teleport.Size
local collapsedSize = UDim2.new(0, 300, 0, 100)

arrowButton.MouseButton1Click:Connect(function()
	if expanded then
		teleport:TweenSize(collapsedSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
	else
		teleport:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
	end
	expanded = not expanded
end)

-- Teleport Toggle Button
local teleportButton = Instance.new("TextButton")
teleportButton.Name = "Teleport"
teleportButton.Size = UDim2.new(0, 360, 0, 40)
teleportButton.Position = UDim2.new(0.5, -180, 0, 10)
teleportButton.BackgroundColor3 = Color3.fromHex("#213448")
teleportButton.Text = "Teleport"
teleportButton.TextColor3 = Color3.new(1, 1, 1)
teleportButton.Font = Enum.Font.SourceSansBold
teleportButton.TextSize = 20
teleportButton.Parent = tab

local teleportButtonCorner = Instance.new("UICorner")
teleportButtonCorner.CornerRadius = UDim.new(0, 6)
teleportButtonCorner.Parent = teleportButton

-- Teleport Section
local teleportSection = Instance.new("Frame")
teleportSection.Size = UDim2.new(0, 360, 0, 0)
teleportSection.Position = UDim2.new(0.5, -180, 0, 60)
teleportSection.BackgroundColor3 = Color3.fromRGB(53, 53, 136)
teleportSection.BorderSizePixel = 0
teleportSection.Parent = tab
teleportSection.ClipsDescendants = true

local teleportSectionCorner = Instance.new("UICorner")
teleportSectionCorner.CornerRadius = UDim.new(0, 6)
teleportSectionCorner.Parent = teleportSection

-- Toggle section open/close
local open = false
teleportButton.MouseButton1Click:Connect(function()
	if open then
		teleportSection:TweenSize(UDim2.new(0, 360, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
	else
		teleportSection:TweenSize(UDim2.new(0, 360, 0, 70), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
	end
	open = not open
end)

-- Value button (5 → 50 loop)
local val = 5
local valButton = Instance.new("TextButton")
valButton.Size = UDim2.new(0, 60, 0, 30)
valButton.Position = UDim2.new(0, 10, 0, 10)
valButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
valButton.Text = tostring(val)
valButton.TextColor3 = Color3.new(1, 1, 1)
valButton.Font = Enum.Font.SourceSans
valButton.TextSize = 18
valButton.Parent = teleportSection

local valCorner = Instance.new("UICorner")
valCorner.CornerRadius = UDim.new(1, 0)
valCorner.Parent = valButton

valButton.MouseButton1Click:Connect(function()
	val = val + 5
	if val > 50 then val = 5 end
	valButton.Text = tostring(val)
end)

-- Direction buttons
local directions = {"Front", "Back", "Left", "Right", "Up", "Down"}
for i, dir in ipairs(directions) do
	local dirButton = Instance.new("TextButton")
	dirButton.Size = UDim2.new(0, 60, 0, 20)
	dirButton.Position = UDim2.new(0, 80 + ((i-1)%3)*70, 0, 10 + math.floor((i-1)/3)*25)
	dirButton.BackgroundColor3 = Color3.fromRGB(70, 70, 150)
	dirButton.Text = dir
	dirButton.TextColor3 = Color3.new(1, 1, 1)
	dirButton.Font = Enum.Font.SourceSans
	dirButton.TextSize = 14
	dirButton.Parent = teleportSection

	local dirCorner = Instance.new("UICorner")
	dirCorner.CornerRadius = UDim.new(1, 0)
	dirCorner.Parent = dirButton

	dirButton.MouseButton1Click:Connect(function()
		local character = game.Players.LocalPlayer.Character
		if not character then return end
		local hrp = character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end

		local look = hrp.CFrame.LookVector
		local right = hrp.CFrame.RightVector
		local up = Vector3.new(0, 1, 0)
		local offset

		if dir == "Front" then offset = look * val
		elseif dir == "Back" then offset = -look * val
		elseif dir == "Left" then offset = -right * val
		elseif dir == "Right" then offset = right * val
		elseif dir == "Up" then offset = up * val
		elseif dir == "Down" then offset = -up * val
		end

		hrp.CFrame = hrp.CFrame + offset
	end)
end

-- Circular toggle visibility button (Positioned above and centered)
local toggleCircle = Instance.new("TextButton")
toggleCircle.Size = UDim2.new(0, 40, 0, 40)
toggleCircle.Position = UDim2.new(0.5, -20, 0, -40)  -- Centered above the window
toggleCircle.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
toggleCircle.Text = "O"
toggleCircle.TextColor3 = Color3.new(1, 1, 1)
toggleCircle.Font = Enum.Font.SourceSansBold
toggleCircle.TextSize = 16
toggleCircle.Parent = screenGui  -- Parent to screenGui, not teleport

local toggleUICorner = Instance.new("UICorner")
toggleUICorner.CornerRadius = UDim.new(1, 0)
toggleUICorner.Parent = toggleCircle

toggleCircle.MouseButton1Click:Connect(function()
	teleport.Visible = not teleport.Visible
end)