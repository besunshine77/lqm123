-- loadfile("a.lua")
--dofile每次都会执行，并且需要加上后缀
-- for j=1,10 do
-- 	dofile("a.lua")
-- end

--require只执行一次，会保存已经加载过的文件,不会重复加载，只要写文件名
-- for i=1,3,1 do
-- require("a")
-- end


-- local game = require("game")
-- game.play()
-- game.pause()

--不需要返回值
require("module")
data.setlevel(50)
print(data.getlevel())
print(data.level)--level为全局时可以访问到，不为全局时值为nil
