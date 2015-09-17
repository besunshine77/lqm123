--如何实现table的深拷贝
--如何计算table的长度
-- for k,v in pairs(_G) do
-- 	print(k,v)
-- end

-- function clone( x)
--   x=
-- end
-- a={x=3,y=5}
-- b=clone(a)
-- b.x=8
-- print(a.x)
-- function clone(o)
--     local t = {}
--     local function _copy(o)
--         if type(o) ~= "table" then
--             return o
--         elseif t[o] then
--             return t[o]
--         end
--         local new_table = {}
--         t[o] = new_table
--         for key, value in pairs(o) do
--             new_table[_copy(key)] = _copy(value)
--         end
--         return setmetatable(new_table, getmetatable(o))
--     end
--     return _copy(o)
-- end

-- -- 下面的代码，t2 是 t1 的引用，修改 t2 的属性时，t1 的内容也会发生变化

-- -- local t1 = {a = 1, b = 2}
-- -- local t2 = t1
-- -- t2.b = 3    -- t1 = {a = 1, b = 3} <-- t1.b 发生变化

-- -- clone() 返回 t1 的副本，修改 t2 不会影响 t1
-- local t1 = {a = 1, b = 2}
-- local t2 = clone(t1)
-- t2.b = 3    -- t1 = {a = 1, b = 2} <-- t1.b 不受影响
-- print(t1.b)

t = {x = 1} 
    t1 = t;
    t1.x = 2;
    print(t.x)
    