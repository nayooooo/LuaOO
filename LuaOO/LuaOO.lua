--[[
    @authod 云风
    @website https://blog.codingnow.com/cloud/LuaOO
]]

-- _class用来保存所有类模板
local _class = {}

-- 此方法用于定义类，super为基类
function class(super)
	local class_type = {}  -- 类模板
	class_type.ctor = false  -- 构造函数
	class_type.super = super  -- 赋值基类

	-- 定义new成员方法
	class_type.new = function(...)
        local obj = {}  -- 对象
        do
            local create  -- create 用于实现递归调用，目的是调用基类的ctor函数
            create = function(c, ...)
                if c.super then  -- 如果有基类，优先调用基类的ctor函数
                    create(c.super, ...)
                end
                if c.ctor then  -- 调用构造函数
                    c.ctor(obj, ...)
                end
            end
            create(class_type, ...)
        end
        -- obj继承_class[class_type]，其实就是下面的vtbl，obj就是类对象
        setmetatable(obj, { __index = _class[class_type] })
        return obj
    end

	local vtbl = {}  -- 类容器
	_class[class_type] = vtbl

    -- class_type 新增成员的时候，存到vtbl中
	setmetatable(class_type, {
        __newindex = function(t, k, v)
			vtbl[k] = v
		end
	})

	-- 如果子类有成员，则直接调用，否则从基类中找成员调用并将基类中的成员复制在子类的容器中
	if super then
		setmetatable(vtbl, {
            __index = function(t, k)
				local ret = _class[super][k]
				vtbl[k] = ret  -- 自动在子类中创建该成员
				return ret
			end
		})
	end

    -- 返回类模板，可以添加ctor函数，可以添加成员函数，这些都会被加到vtbl中，
    -- 当执行new方法的时候，就会执行vtbl的ctor函数，返回obj
    -- 执行成员方法的时候，就会执行obj的成员方法，因为obj继承了vtbl，所以会执行vtbl的成员方法
    -- 如果vtbl没有成员方法，则从其基类中查找
	return class_type
end

return class
