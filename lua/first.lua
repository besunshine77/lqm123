--[[print("hello world!")
a="刘秋梅"
print(a)

a=nil--]]
-- print(type("hello"))
-- print(type(12.3))
-- print(type(false))
-- print(type(print))
-- print(type(type("hello")))
-- a="one string"
-- b=string.gsub(a,"one","another")
-- print(a)
-- print(b)




-- print("10"+1)
-- print("10+1")
-- -- print("hello "+1)
-- print("hello".."hello")--连接运算符
-- print("10"..20)


-- print(10 ..20)

-- ￼line=io.read()
-- n=tonumber(line)
-- if n==nil then
-- 	error(line .. "is not a valid number")
-- else
-- 	print(n*2);

-- print(tostring(10)=="10")
-- print(10 ..""=="10")

-- m="12"
-- print(tonumber(m))
-- if tonumber(m) then
-- 	local a = 50
-- 	print(a)
-- 	print("success")
-- else
-- 	print("fail")
-- end
-- print(a)


-- print(4 and 5)
-- print(nil and 3)
-- print(false and 13)
-- print(4 or 5)
-- print(false or 5)

-- a,b=20,30
-- a,b=b,a
-- print(a,b)

-- for i=1,100,3 do
-- 	print(i)
-- end
-- local m = 1
-- while true  do
-- 	m=m+1
-- 	print(m)
-- 	if m==50 then
-- 		break;
-- 	end
-- end

-- function  max( a,b )
-- if a>b then
-- 	return a
-- else
-- 	return b
-- 	end
-- end
-- print (max(10,30))

-- function test( ... )
-- 	return 10,20,30
-- end
-- a,b,c=test(),50
-- print(a,b,c)

-- function A( ... )
-- 	function B( ... )
-- 		print("B called")
-- 	end
-- B()
-- end
-- A()
-- B()


-- days={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","saturday"}
-- print(days[3])

-- config={hello="hello lua",age=50}


--  config.words="hello world"
--  config.number=100 
-- print(config["hello"])
-- print(config.words)
-- print(config.number)
-- for  k,v in pairs(config) do
-- 	print(k,v)
-- end

-- arr={}
-- for var=1,100 do
-- 	table.insert( arr,1, var )
-- end
-- print(#arr)
-- print(table.maxn(arr))


-- arr={1,2,3,4}
-- for key,var in pairs(arr) do
--        print(key,var)
--      end
--      arr={}
--      for var=1,100 do
--       table.insert(arr,1,var)
--      end
--      for key,var in pairs(arr) do
--       print(key,var)
--      end
--      print(table.maxn(arr))


-- config={name="zhangsan",age=20,[2]="Monday",[3]="Tuesday",[1]="Wednesday"}

-- for k,v in ipairs(config) do
--   print(k,v)
-- end



--闭合函数
--一个闭合函数就是:一个函数加上该函数所需访问的所有”非局部的变量“
--count函数里的那个函数,加上非局部变量i,就构成了一个闭合函数
-- function count( ... )
--   local i = 1
--   return function()
--       i=i+1
--       return i
--   end
-- end--count函数会返回function函数，function函数会使用count函数的局部变量
-- local  fun=count()--
-- print(fun())--2
-- print(fun())--3
-- print(fun())--4

--非全局函数
--存储在局部变量中的函数称为非全局函数
   -- local eat;
--    local drink;
--   local function eat()
--         print("eat");
--         return drink();
--    end
--   drink = function()
--         print("drink");
--    end
--    print(eat())

--    --尾调用  一个函数的调用是另一个函数的最后一个动作时,这个调用就称之为尾调用。
--    function eat()
--       return drink();
-- end


--  function dieDaiQi( t )
--    local i = 0;
--    return function()
--    i=i+1
--    return t[i]
--    end
--  end
--  local t = {"a","b","c","d"}
--  local iter = dieDaiQi(t)
--  while true do
--   local  value = iter()
--   if value==nil then
--     break;
--     end
--     print(value)

-- end


-- function dieDaiQi( t) 
--  local i = 0
--  return function()
--   i=i+1
--   if i>#t then
--     return nil
--   end
--   return i,t[i]
--  end
-- end

-- local t = {"a","b","c","d"}
--  local iter = dieDaiQi(t)
--  while true do
--   local  value = iter()
--   if value==nil then
--     break;
--     end
--     print(value)

-- end


-- function fact( n ) 
--   if n==0 then
--     return 1
--   else
--     return n*fact(n-1)
--   end
-- end
-- print ("enter a number:")
-- a=io.read("*number")
-- print(fact(a))


-- error("出错啦")
-- local  name = zhangsan1
-- if name~="zhangsan"then
-- 	error("i want to find zhangsan")
-- end

-- local name = "张三1"
-- local result = assert(name=="张三","你不是张三，我要找的人是张三·")
-- print (result)

-- function test(  )
-- 	print(a[1])
-- end
-- if pcall(test)then
-- 	print("normal")
-- else
-- 	print("error")
-- end

function test(  )
	print(a[1])
end
local  status ,err=pcall(test)
if status then
	print("正常，呵呵")
else 
	print("哎出错了，我正在帮你处理")
	print(err)
	end
