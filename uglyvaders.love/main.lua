DEBUG = true

player = {x=0,y=400,w=100,h=20,bullets={}}

function love.load()
    player.fire = function()
        d("fire")
        bullet = {x=player.x+player.w/2,y=player.y-player.h/2}
        table.insert(player.bullets, bullet)
    end
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + 1
    elseif love.keyboard.isDown("left") then
        player.x = player.x - 1
    end
    --[[if love.keyboard.isDown("up") then
        player.y = player.y - 1
    elseif love.keyboard.isDown("down") then
        player.y = player.y + 1
    end]]--
    if love.keyboard.isDown("space") then
        player.fire()
    end
end

function love.draw()
    
    -- draw player
    love.graphics.setColor(200, 200, 200)
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)

    -- draw bullets
    for _,b in pairs(player.bullets) do
        love.graphics.setColor(255, 255, 255)
        d("drawing bullet. total bullets = " .. #player.bullets)
        love.graphics.rectangle("fill", b.x, b.y, 10, 10)
    end

end

function d(s)
    if DEBUG then
        print("debug: " .. s)
    end
end