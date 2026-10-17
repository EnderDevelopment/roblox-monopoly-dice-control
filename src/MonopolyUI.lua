-- Monopoly UI Script

local MonopolyUI = {}

-- Create a new UI element
function MonopolyUI:CreateUIElement(parent, elementType, properties)
    local element = Instance.new(elementType, parent)
    for property, value in pairs(properties) do
        element[property] = value
    end
    return element
end

-- Create a dice display
function MonopolyUI:CreateDiceDisplay(parent)
    local diceFrame = self:CreateUIElement(parent, "Frame", {
        Name = "DiceFrame",
        Size = UDim2.new(0, 100, 0, 100),
        Position = UDim2.new(0.5, -50, 0.5, -50),
        BackgroundColor3 = Color3.new(1, 1, 1)
    })

    local diceLabel = self:CreateUIElement(diceFrame, "TextLabel", {
        Name = "DiceLabel",
        Size = UDim2.new(1, 0, 1, 0),
        Text = "1",
        TextSize = 24,
        TextColor3 = Color3.new(0, 0, 0)
    })

    return diceFrame, diceLabel
end

-- Create a money display
function MonopolyUI:CreateMoneyDisplay(parent, playerName)
    local moneyFrame = self:CreateUIElement(parent, "Frame", {
        Name = playerName .. "MoneyFrame",
        Size = UDim2.new(0, 200, 0, 50),
        Position = UDim2.new(0.5, -100, 0.5, -25),
        BackgroundColor3 = Color3.new(1, 1, 1)
    })

    local moneyLabel = self:CreateUIElement(moneyFrame, "TextLabel", {
        Name = playerName .. "MoneyLabel",
        Size = UDim2.new(1, 0, 1, 0),
        Text = "Money: 1500",
        TextSize = 24,
        TextColor3 = Color3.new(0, 0, 0)
    })

    return moneyFrame, moneyLabel
end

return MonopolyUI