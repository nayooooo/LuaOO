local class = require("LuaOO.LuaOO")
local animal = require("animal.animal")

local bird = class(animal)

function bird:ctor(name)
    self.name = name

    print("bird ctor")
end

function bird:getName()
    return self.name
end

function bird:setName(name)
    self.name = name
end

return bird
