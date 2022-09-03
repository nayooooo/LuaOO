local animal = require("animal.animal")

-- 主函数
local function main()
    bird = animal.new("bird")

    print(bird:getName())
    bird:setName("flippy bird")
    print(bird:getName())
end

main()
