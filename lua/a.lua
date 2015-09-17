-- print("helloworld")


--//////////////////////////////////////////////////////
--表中可以有元素和方法
-- t={
	
-- 	name="zhangsan",
-- 	test=function (  )
-- 		print("test")

-- 	end

-- }
-- t.test()=
-- for k,v in pairs(t) do	

-- 	print(k,v)
-- end
-- print(getmetatable(t))


--//////////////////////////////////////////////////////////
--相加运算符元方法，两个table相加
--只要某个值的元表里含有__add 这个元方法,那就可以使用+号进行运算
-- local mt = {}
-- mt.__add=function ( table,key )
-- 	print("相加的时候会调用")
-- end
-- local t1 = {}
-- local t2 = {}
-- --給两个表设置新的元表
-- setmetatable(t1,mt)
-- setmetatable(t2,mt)
-- local result = t1+t2


--///////////////////////////////////////////////////////////
--创建一个元表

-- local mt = {}
-- mt.__add = function(s1, s2)
--     local result = ""
--     if s1.sex == "boy" and s2.sex == "girl" then
--         result = "完美的家庭。"
--     elseif s1.sex == "girl" and s2.sex == "girl" then
--         result = "不好"; 
--     else
--         result = "不好" 
--     end
--     return result;
--     end
-- -- 创建两个table,可以想象成是两个类的对象
--     local s1 = {
--         name = "Hello",
--         sex = "girl"}
--     local s2 = {
--         name = "Good",
--         sex = "girl"}
-- -- 给两个table设置新的元表
-- setmetatable(s1, mt); 
-- setmetatable(s2, mt); 
-- -- 进行加法操作
-- local result = s1 + s2;
--  print(result);



--///////////////////////////////////////////////
--获取一个table中不存在的元素的时候。默认的返回nil
在调用table不存在的字段时,会调用__index元方法
local t = {name="hehe"}
local mt = {
--这里的__index元方法是一个函数
__index=function( table,key )
	print("虽然你调用了我不存在的字段"..key)

end
--这里的__index元方法是一个table
-- __index={
-- money="90000000"
-- }

}
print(t.money)--返回nil
setmetatable(t,mt)
print(t.name)
print(t.money)--不存在的字段调用__index



--///////////////////////////////////////////////////////////////
--元表可以是 一个函数也可以是一个table
--调用函数的时候也会去元表里面查找
-- local smartMan = {
-- name="none",
-- age=23,
-- money=9000000,
-- sayhello=function( )
-- 	print("大家好，我是聪明的豪")

-- end
-- }

--  local t1 = {}
--  local t2 = {}
--  local mt = {
-- __index=smartMan
-- }
-- setmetatable(t1,mt)
-- setmetatable(t2,mt)
-- print(t1.money)
-- print(t2.money)
-- print(t2.sayhello())

--//////////////////////////////////
--监控对table不存在的字段进行赋值
--__index用于查询,__newindex用于更新
-- local smartMan = {
-- name="none",
-- age=23,
-- money=9000000,
-- sayhello=function( )
-- 	print("大家好，我是聪明的豪")

-- end
-- }
-- -- local t1 = {}
-- local t1 = {sayHello = function()
-- print("大家two");
-- end}
-- local mt = {
-- 	__index=smartMan,
-- 	__newindex=function( )
-- 		print( "字段不存在不要赋值");
-- 	end

-- }
-- setmetatable(t1,mt)
-- -- 对t1不存在的字段sayhello进行赋值，会调用__newindex
-- t1.sayhello=function( )
-- 	print("en")
-- end
-- t1.sayhello();





--//////////////////////////////////////
-- local smartMan = { name = "none"}
--__newindex元方法也可以赋予一个table值
-- local other = {name = "大家好,我是很无辜的table"} local t1 = {}
-- local mt = {
--        __index = smartMan,
--        __newindex = other
--   }
-- setmetatable(t1, mt); 
-- print("other的名字,赋值前:" .. other.name); 
-- t1.name = "小偷"; 
-- print("other的名字,赋值后:" .. other.name); 
-- print("t1的名字:" .. t1.name);



--///////////////////////////////////////

--忽略元表

--  local smartMan = {
--             name = "none"
-- }
-- local t1 = {
-- hehe = 123
-- }
--   local mt = {
--             __index = smartMan,
--             __newindex =
-- function(t, k, v) print("别赋值!")
-- end
-- }
       
--  local smartMan = {
--        name = "none"
-- }
-- local t1 = {
-- hehe = 123 
-- }
-- local mt = {
--     __index = smartMan,
--     __newindex =function(t, k, v) print("别赋值!")
-- end 
-- }
-- setmetatable(t1, mt); 
-- print(rawget(t1, "name"));
-- print(rawget(t1, "hehe")); 
-- --通过rawget函数可以忽略元表的__index功效,纯粹地从t1中调用字段
-- rawset(t1, "name", "小偷"); 
-- print(t1.name);
--rawget的第一个参数是要调用的table,第二个参数是table的字段名。
-- 因此,通过rawget调用t1的name字段,只能返回nil,而调用hehe字段,则能正确取得值。