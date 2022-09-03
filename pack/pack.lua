local pack = {}

local packMt = {
    __index = function(tabel, key)
        return "It's not here!"
    end
}

setmetatable(pack, packMt)

-- Hello World
local function HelloWorld()
    print("Hello World!")
end

-- 计算从1加到num的整数和
local function recursion(num)
    if num < 1 then
        return -1
    end
    if num == 1 then
        return 1
    end

    return num + recursion(num - 1)
end

-- 登记函数
pack.HelloWorld = HelloWorld
pack.recursion = recursion

-- 返回函数表
return pack
