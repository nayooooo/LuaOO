local class = require("LuaOO.LuaOO")

local animal = class()

function animal:ctor(name)
    self.name = name

    print("animal ctor")
end

function animal:getName()
    return self.name
end

function animal:setName(name)
    self.name = name
end

function animal:hello()
	print(string.format("Hello %s!", self.name))
end

return animal
