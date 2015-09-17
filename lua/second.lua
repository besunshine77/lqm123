--面向对象
--#############################################
--冒号的作用就是:定义函数时,给函 数的添加隐藏的第一个参数self;
-- 调用函数时,默认把当前调用者作为第一个参数传递进去
-- TSprite={
-- 	x=0,
-- 	y=0

-- }
-- --function TSprite.setPosrtion( self,x,y )
-- function TSprite:setPosrtion(x,y )
-- self.x=x;
-- self.y=y
-- print(x,y)
-- end
-- local who=TSprite
-- TSprite=nil
-- who.setPosrtion(who,1,2)
-- who:setPosrtion(3,4)


--##################################
--继承
-- Hero={attack=0}    --Hero元表
-- function  Hero:new(o )  --new 函数
-- 	o=o or{}
-- 	setmetatable(o,self)--self指的就是Hero
-- 	self.__index=self
-- 	return o
-- end

-- function Hero:skill( addAttack )--skill函数

-- 	self.attack=self.attack+addAttack--找不到attack，到父类也就是Hero元表中找

-- end

-- --oneHero=Hero:new()--调用new,为空不执行
-- --调用skill，第二个self.attack调用Hero元表，加上传进来的10，赋值给self.attack
-- --oneHero:skill(10)

-- --调用new,执行__index
-- oneHero=Hero:new({attack=100})
-- --调用skill，第二个self.attack调用Hero元表，加上传进来的10，赋值给self.attack
-- oneHero:skill(10)

-- print(oneHero.attack)
-- for k,v in pairs(oneHero) do
-- 	print(k,v)
-- end


--  function oneHero:injured(loseAttack)
--    if loseAttack > self.attack then
--       error"not engouth attack"
-- end
--  self.attack = self.attack - loseAttack/2
--  end
-- oneHero:injured(100)
-- print(oneHero.attack) -->60



--####################################################
--多继承
function search(classes,key)
    for i = 1, #classes do
        local value = classes[i][key];
        if value ~= nil then
            return value;
        end
    end 
end
--创建一个继承多个table的表
function createClass( ... )
	local parents = {}
	local child = {}
--给child设置元表
	setmetatable(child,{__index=function( table,key )
		return search(parents,key);
	end
	})

	function  child:new( )
		o={}
		setmetatable(o,child)
		child.__index=child
		return o
	end
	return child
end
-- --创建一个精灵类
TSprite = {}
function TSprite:hello()
     print("hello");
end
function TSprite:new(...)
    o = {}
    setmetatable(o, self);
    self.__index = self;
    return o; 
end
-- ⼀一个⼦子弹类 
TBullet = {}
function TBullet:fire(...) 
	print("开⽕")
end
function TBullet:new(...)
        o = {}
        setmetatable(o, self);
        self.__index = self;
return o; 
end
-- 继承了两个类的⼦子类
local BulletSprite =createClass(TSprite, TBullet)																																																																																																																																		

-- ⼦子类的对象
local bSprite =BulletSprite:new();
bSprite:hello();
bSprite:fire();


