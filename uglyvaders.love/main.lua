DEBUG = true

player = {  x=0,y=580,w=100,h=20,s=8,
            bw=10,bh=10,bs=3,cooldown=15,
            bullets={} }

enemy = {   x=0,y=0,w=50,h=50,s=4,
            bw=10,bh=10,bs=2,cooldown=30,
            bullets={} }

function enemy:fire()
    if self.cooldown < 0 then
        self.cooldown = 30
        local bullet = {x=self.x+self.x/2,y=self.y+self.h/2}
        table.insert(self.bullets, bullet)
    end
end

function love.load()
    player.fire = function()
        if player.cooldown < 0 then
            player.cooldown = 15
            local bullet = {x=player.x+player.w/2,y=player.y-player.h/2}
            table.insert(player.bullets, bullet)
        end
    end
end

function love.update(dt)
    player.cooldown = player.cooldown - 1

    if love.keyboard.isDown("right") then
        player.x = player.x + player.s
    elseif love.keyboard.isDown("left") then
        player.x = player.x - player.s
    end

    if love.keyboard.isDown("space") then
        player.fire()
    end

    for i,b in pairs(player.bullets) do
        if b.y < -player.bh then
            table.remove(player.bullets, i)
        else
            b.y = b.y - player.bs
        end
    end
end

function love.draw()
    -- draw player
    love.graphics.setColor(200, 200, 200)
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)

    -- draw bullets
    for _,b in pairs(player.bullets) do
        love.graphics.setColor(255, 255, 255)
        love.graphics.rectangle("fill", b.x, b.y, player.bw, player.bh)
    end
end

function d(s)
    if DEBUG then
        print("debug: " .. s)
    end
end