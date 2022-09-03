local animal = require("animal.animal")
local bird = require("animal.bird")

-- 主函数
local function main()
    bird = bird.new("jiujiu")

    print(bird:getName())
    bird:setName("flippy bird")
    print(bird:getName())
end

main()
