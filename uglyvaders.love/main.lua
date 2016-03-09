DEBUG = true

player = {x=0,y=400,w=100,h=20,bw=10,bh=10,bt=os.time(),bullets={}}

function love.load()
    player.fire = function()
        currentTime = os.time()
        diffTime = currentTime - player.bt
        d("curr=" .. currentTime .. " diff=" .. diffTime)
        if diffTime >= 1 then
            d("fire!")
            player.bt = currentTime
            bullet = {x=player.x+player.w/2,y=player.y-player.h/2}
            table.insert(player.bullets, bullet)
        else
            d("no fire")
        end
    end
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + 1
    elseif love.keyboard.isDown("left") then
        player.x = player.x - 1
    end

    if love.keyboard.isDown("space") then
        player.fire()
    end

    for i,b in pairs(player.bullets) do
        if b.y < -player.bh then
            table.remove(player.bullets, i)
        else
            b.y = b.y - 2
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
        d("drawing bullet. total bullets = " .. #player.bullets)
        love.graphics.rectangle("fill", b.x, b.y, player.bw, player.bh)
    end

end

function d(s)
    if DEBUG then
        print("debug: " .. s)
    end
end