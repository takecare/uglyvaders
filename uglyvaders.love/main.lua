player = {x=0,y=400,bullets={}}

function love.load()
    player.fire = function()
        bullet = {x=player.x,player.y}
        table.insert(player.bullets, bullet)
    end
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + 1
    elseif love.keyboard.isDown("left") then
        player.x = player.x - 1
    end
    if love.keyboard.isDown("up") then
        player.y = player.y - 1
    elseif love.keyboard.isDown("down") then
        player.y = player.y + 1
    end
end

function love.draw()
    love.graphics.setColor(0, 0, 255)
    love.graphics.rectangle("fill", player.x, player.y, 100, 100)
end