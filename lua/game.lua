-- local game = {}
-- game.play=function( )
-- 	print("play")
-- end

-- game.stop=function( )
-- 	print("stop")
-- end
-- game.pause=function( )
-- 	print("pause")
-- end
-- return game
gName = "我是老变量";
-- 一个table,即将成为新的环境
local newG = {};
setmetatable(newG, {__index = _G});
-- 将当前全局环境重新设置为新的table
setfenv(1, newG);
 gName = "我是新变量"; 
-- 输出值 print(gName); print(_G.gName);