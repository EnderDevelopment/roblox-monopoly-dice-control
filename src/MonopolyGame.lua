-- Monopoly Game Script

local MonopolyGame = {}

-- Player data
MonopolyGame.Players = {}

-- Dice values
MonopolyGame.Dice = {1, 1}

-- Initialize a new player
function MonopolyGame:NewPlayer(playerName, startingMoney)
    self.Players[playerName] = {
        money = startingMoney,
        position = 1
    }
end

-- Roll the dice
function MonopolyGame:RollDice()
    self.Dice[1] = math.random(1, 6)
    self.Dice[2] = math.random(1, 6)
    return self.Dice[1] + self.Dice[2]
end

-- Move player
function MonopolyGame:MovePlayer(playerName, spaces)
    if self.Players[playerName] then
        self.Players[playerName].position = (self.Players[playerName].position + spaces - 1) % 40 + 1
    end
end

-- Add money to player
function MonopolyGame:AddMoney(playerName, amount)
    if self.Players[playerName] then
        self.Players[playerName].money = self.Players[playerName].money + amount
    end
end

-- Subtract money from player
function MonopolyGame:SubtractMoney(playerName, amount)
    if self.Players[playerName] then
        self.Players[playerName].money = self.Players[playerName].money - amount
    end
end

return MonopolyGame