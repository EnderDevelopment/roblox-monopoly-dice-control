-- Monopoly Controller Script

local MonopolyGame = require(script.Parent.MonopolyGame)
local MonopolyUI = require(script.Parent.MonopolyUI)

local MonopolyController = {}

-- Initialize the game
function MonopolyController:Init()
    -- Create a new player
    MonopolyGame:NewPlayer("Player1", 1500)

    -- Create UI elements
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local diceFrame, diceLabel = MonopolyUI:CreateDiceDisplay(playerGui)
    local moneyFrame, moneyLabel = MonopolyUI:CreateMoneyDisplay(playerGui, "Player1")

    -- Roll dice button
    local rollButton = MonopolyUI:CreateUIElement(playerGui, "TextButton", {
        Name = "RollButton",
        Size = UDim2.new(0, 100, 0, 50),
        Position = UDim2.new(0.5, -50, 0.5, 50),
        Text = "Roll Dice",
        TextSize = 24,
        TextColor3 = Color3.new(0, 0, 0)
    })

    -- Roll dice function
    rollButton.MouseButton1Click:Connect(function()
        local diceTotal = MonopolyGame:RollDice()
        diceLabel.Text = tostring(diceTotal)
        MonopolyGame:MovePlayer("Player1", diceTotal)
    end)

    -- Add money button
    local addMoneyButton = MonopolyUI:CreateUIElement(playerGui, "TextButton", {
        Name = "AddMoneyButton",
        Size = UDim2.new(0, 100, 0, 50),
        Position = UDim2.new(0.5, -50, 0.5, 100),
        Text = "Add Money",
        TextSize = 24,
        TextColor3 = Color3.new(0, 0, 0)
    })

    -- Add money function
    addMoneyButton.MouseButton1Click:Connect(function()
        MonopolyGame:AddMoney("Player1", 100)
        moneyLabel.Text = "Money: " .. tostring(MonopolyGame.Players["Player1"].money)
    end)

    -- Subtract money button
    local subtractMoneyButton = MonopolyUI:CreateUIElement(playerGui, "TextButton", {
        Name = "SubtractMoneyButton",
        Size = UDim2.new(0, 100, 0, 50),
        Position = UDim2.new(0.5, -50, 0.5, 150),
        Text = "Subtract Money",
        TextSize = 24,
        TextColor3 = Color3.new(0, 0, 0)
    })

    -- Subtract money function
    subtractMoneyButton.MouseButton1Click:Connect(function()
        MonopolyGame:SubtractMoney("Player1", 100)
        moneyLabel.Text = "Money: " .. tostring(MonopolyGame.Players["Player1"].money)
    end)
end

return MonopolyController