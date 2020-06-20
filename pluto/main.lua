require("collision")

function love.load()
	math.randomseed(os.time())
	v={}
	v.y=0
	v.ok=0
	v.scor=0
	v.nivel=5
	v.cadere=0
	v.mort=0
	v.explozie=0
	jmax=0
	v.incepe=0
	v.a=0
	v.b=0
	v.okok=0
	pluto={}
	pluto.x=0
	pluto.y=0

	branza={}
	branza.x=100
	branza.y=100

	gaura={}
	gaura.x=600
	gaura.y=100

	bomba={}
	bomba.x=0
	bomba.y=0

	umbre={}
	juri={}

	images={}
	images.pluto0 = love.graphics.newImage("assets/pluto.png")
	images.pluto1 = love.graphics.newImage("assets/pluto1.png")
	images.pluto2 = love.graphics.newImage("assets/pluto2.png")
	images.pluto3 = love.graphics.newImage("assets/pluto3.png")
	images.background = love.graphics.newImage("assets/background.png")
	images.brinza = love.graphics.newImage("assets/brinza.png")
	images.brinza2 = love.graphics.newImage("assets/brinza2.png")
	images.gaura = love.graphics.newImage("assets/gaura.png")
	images.bomba = love.graphics.newImage("assets/bomba.png")
	images.foc = love.graphics.newImage("assets/foc.png")
	images.umbra = love.graphics.newImage("assets/umbra.png")
	images.cer = love.graphics.newImage("assets/cer.png")
	images.nor1 = love.graphics.newImage("assets/nor1.png")
	images.nor2 = love.graphics.newImage("assets/nor2.png")
	images.nor3 = love.graphics.newImage("assets/nor3.png")
	images.plutomare = love.graphics.newImage("assets/plutomare.png")
	images.scris = love.graphics.newImage("assets/scris.png")

end

function love.update(dt)
	if v.okok==0  then 
		v.a44=math.random(0,800)
		v.b44=math.random(0,600)
		v.a33=math.random(0,800)
		v.b33=math.random(0,600)
		v.a22=math.random(50,800)
		v.b22=math.random(0,600)
		v.a11=math.random(0,800)
		v.b11=math.random(0,600)
		v.a9=math.random(0,800)
		v.b9=math.random(0,600)
		v.a8=math.random(0,800)
		v.b8=math.random(0,600)
		v.a7=math.random(0,800)
		v.b7=math.random(0,600)
		v.a6=math.random(0,800)
		v.b6=math.random(0,600)
		v.a5=math.random(0,800)
		v.b5=math.random(0,600)
		v.a4=math.random(0,800)
		v.b4=math.random(0,600)
		v.a3=math.random(0,800)
		v.b3=math.random(0,600)
		v.a2=math.random(0,800)
		v.b2=math.random(0,600)
		v.a1=math.random(0,800)
		v.b1=math.random(0,600)
		v.a0=math.random(0,600)
	end


	if love.keyboard.isDown("space") and v.mort<1 then 
		v.incepe=1
	end
	if v.incepe == 1 then
		if love.keyboard.isDown("right") then
		pluto.x=pluto.x+4
		v.y = 1 
		end
		if love.keyboard.isDown("left") then
		pluto.x=pluto.x-4
		v.y = 2
		end
		if love.keyboard.isDown("up") then
		pluto.y=pluto.y-4
		v.y = 3
		end
		if love.keyboard.isDown("down") then
		pluto.y=pluto.y+4
		v.y = 0
		end



		if colizie(branza.x,branza.y,pluto.x,pluto.y,1) then
			v.ok=1
		end

	if colizie(gaura.x,gaura.y,pluto.x,pluto.y,50) and v.ok==1
		then 
			v.ok=0
			v.scor=v.scor+10
			branza.x=math.random(50,725)
			branza.y=math.random(50,525)
	end 

	if v.cadere==0 then
		for i=1, v.nivel, 1 do
			local umbra = {}
			local j = {}
			j.y=0
			umbra.x=math.random(50,752)
			umbra.y=math.random(50,525)
			if umbra.y> jmax then
				jmax=umbra.y
			end
			table.insert(umbre, umbra)
			table.insert(juri, j)
		end
		v.cadere=1
	end

	if v.cadere ==2 then
		for i=1, v.nivel, 1 do
			umbra=umbre[i]
			j=juri[i]
			umbra.x=math.random(50,752)
			umbra.y=math.random(50,525)
			if umbra.y> jmax then
				jmax=umbra.y
			end
			j.y=0
			table.insert(umbre, umbra)
			table.insert(juri, j)
		end
		v.cadere=1
	end

	if explozie == 1 and v.cadere==1 then
		jmax=0
		explozie=0
		v.cadere=2
	end
end
end

function love.draw()
	if v.incepe==1 then
		for x=0, love.graphics.getWidth(), images.background:getWidth() do
			for y=0, love.graphics.getHeight(), images.background:getHeight() do
				love.graphics.draw(images.background, x , y )
			end
	end

	love.graphics.draw(images.gaura, gaura.x, gaura.y)

	if v.y == 0 then
    	love.graphics.draw(images.pluto0,pluto.x,pluto.y)
    		if v.ok==1 then
			    love.graphics.draw(images.brinza2,pluto.x+3,pluto.y+15)
 			end
    	end
	 if v.y == 1 then
		love.graphics.draw(images.pluto1,pluto.x,pluto.y)
		if v.ok==1 then
				love.graphics.draw(images.brinza2,pluto.x+30,pluto.y+10)
 			end
		end
	if v.y == 2 then
		love.graphics.draw(images.pluto2,pluto.x,pluto.y)
		if v.ok==1 then
			love.graphics.draw(images.brinza2,pluto.x-30,pluto.y+10)
 			end
		end
	if v.y == 3 then
		love.graphics.draw(images.pluto3,pluto.x,pluto.y)
		end
	if v.ok==0 then
		love.graphics.draw(images.brinza, branza.x , branza.y)
		end


	if v.cadere==1 then

		for i=#umbre, 1, -1 do
			local umbra = umbre [i]
			love.graphics.draw(images.umbra,umbra.x,umbra.y)
		end

	for i=#umbre, 1, -1 do
		local umbra = umbre[i]
		local j = juri[i]
		if 	j.y<=umbra.y then
			love.graphics.draw(images.bomba, umbra.x, j.y)
			j.y=j.y+0.25
		else
			love.graphics.draw(images.foc, umbra.x, umbra.y)
			if colizie(umbra.x,umbra.y,pluto.x,pluto.y, 1) then
				v.mort=1
			end
		end
		if j.y>=jmax then
			explozie=1
		end
	end
			love.graphics.print(" "..v.scor, 2, 2)
	end

	end
	if v.incepe==0 or v.mort==1 then
		v.okok=1
		for x=0, love.graphics.getWidth(), images.cer:getWidth() do
		for y=0, love.graphics.getHeight(), images.cer:getHeight() do
			love.graphics.draw(images.cer, x , y )
		end
		end
		love.graphics.draw(images.nor1,v.a1,v.b1)
		love.graphics.draw(images.nor1,v.a2,v.b2)
		love.graphics.draw(images.nor1,v.a3,v.b3)
		love.graphics.draw(images.nor1,v.a4,v.b4)
		love.graphics.draw(images.nor1,v.a5,v.b5)
		love.graphics.draw(images.nor2,v.a6,v.b6)
		love.graphics.draw(images.nor2,v.a7,v.b7)
		love.graphics.draw(images.nor2,v.a8,v.b8)
		love.graphics.draw(images.nor2,v.a9,v.b9)
		love.graphics.draw(images.nor3,v.a11,v.b11)
		love.graphics.draw(images.nor3,v.a22,v.b22)
		love.graphics.draw(images.nor3,v.a33,v.b33)
		love.graphics.draw(images.nor3,v.a44,v.b44)
		if v.incepe==0 then
			love.graphics.draw(images.plutomare,v.a0,200)
		end
		if v.mort==1 then 
			love.graphics.print("scor:"..v.scor, 10, 250, 0, 2, 2)
	else
		love.graphics.draw(images.scris, 300,100)
	end

	end

end