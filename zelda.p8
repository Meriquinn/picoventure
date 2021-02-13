pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
function _init()
	p1={}
	p2={}
	plrinit(p1)
	plrinit(p2)
end

function _update()
	if(p1.move==true)	plrmove(p1,0)
	if(p2.move==true) plrmove(p2,1)
end

function _draw()
	cls()
	map(0,0,0,0,16,16)
	plrdraw(p1)
	plrdraw(p2)
end
-->8
function plrinit(a)
	a.x=2
	a.y=2
	a.nx=2
	a.ny=2
	a.move=true
	a.dir={"down",false,0}
	a.step=0
	a.check=0
	menu=false
	a.holding=false
	a.item={}
	ws=1
	size={}
	size[1]={0,0}
	size[2]={1,0}
	size[3]={0,1}
	size[4]={1,1}
end

function plrmove(b,c)
	b.step+=0.125
	if b.step>=1 then
		b.step=0
		if btn(⬆️,c) and menu==false then
		 b.ny=b.y-ws
		 b.dir[1]="up"
		elseif btn(⬇️,c) and menu==false then
		 b.ny=b.y+ws
		 b.dir[1]="down"
		elseif btn(⬅️,c) and menu==false then
		 b.nx=b.x-ws
		 b.dir={"left",false,b.dir[3]}
		elseif btn(➡️,c) and menu==false then
			b.nx=b.x+ws
			b.dir={"right",true,b.dir[3]}
		end
		if collision(b)==false then
			if b.x!=b.nx or b.y!=b.ny then
				b.x=b.nx
				b.y=b.ny
				if b.dir[1]=="up" or b.dir[1]=="down" then
					if b.dir[2]==true then
						b.dir[2]=false
					else
						b.dir[2]=true
 				end
				end
				if b.dir[3]==0 then
					b.dir[3]=2
				else
					b.dir[3]=0
				end
			end
		elseif b.x!=b.nx or b.y!=b.ny then
			sfx(0)
			b.nx=b.x
			b.ny=b.y
		end
	end
end

function collision(d)
	g=0
	for f=1,4 do
		if fget(mget(d.nx+size[f][1],d.ny+size[f][2]),1)==true then
			g+=1
		end
	end
	if g>=1 then
		return true
	else
		return false
	end
end

function plrdraw(e)
	if(e.dir[1]=="up") spr(18,e.x*8,e.y*8,2,2,e.dir[2])
	if(e.dir[1]=="down") spr(16,e.x*8,e.y*8,2,2,e.dir[2])
	if(e.dir[1]=="left") spr(20+e.dir[3],e.x*8,e.y*8,2,2,e.dir[2])
	if(e.dir[1]=="right") spr(20+e.dir[3],e.x*8,e.y*8,2,2,e.dir[2])
end
__gfx__
dddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ddd777dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dd7777dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d77776dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d7776ddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d666dddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
dddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000111110000000000001110000000000000111110000000000000000000000000000000000000000000111110000000000011100000004444444444444444
00001baabb1000000000011111000000000011babbb1000000000011111100000000001111110000000011bb11b1000000011111110110004444444444444444
00011b11bbb11000000001aaaa1000000001aa1baabb1000001011baabbb1100001011bb11bb11000001aa11aa1b1000001aa1aaaa1aa1004444444444444444
001a11aaaab1a10000011a1111a110000111baa1bb1bb1000011aa1bbaabbb100011aa11aa1bbb100111baa1aa1bb100001aa111111aa1004444444444444444
001a1a1111a1a100001a11baab11a10000111baa11a1bb100011baa1bb1bbb100011baa1aa1bbb1000111ba1111bbb10001111baab1111004411111111111144
001a11111111a100001a1bbaabb1a1000000111b1ba1bb1000011baa11a1bb1000011ba1111bbb1000001111bb1bbb10001b1bbaabb1b1004414444444444144
001bb111111bb100001a1b1babb1a1000011a1a11aa1b1000000111b1ba1b10000001111bb1bb1000011a1a1bb1bb100001b1b1babb1b1004414444444444144
0001aa1aa1aa1000001b11bbabb1b100001aa1aa1aa110000011a1a11aa1b1000011a1a1bb1bb100001aa1a1bb1b1000001b11bbabb1b1004414444444444144
0001ba1aa1ab1000000111bbbb1110000001baaa1ab10000001aa1aa1aa11000001aa1a1bb1b10000001baa1bb110000001b11bbbb11b1004414444444444144
001b1baaaab1b1000001b1bbb1b1b10000001bbb1b1100000001baaa1ab100000001baa1bb11000000001b11bb110000001b11bbb1bb10004414444444444144
01ab11111111b100001ab1bb1bb1b1000000111111b10000000011111111000000001bb1bb110000000011bb11b100000001b1bb1bbb10004414444444444144
01a11bbbb1aab100001a1b11bbab110000001b1aa1bb1000000001aa1bb110000000011b11b1100000001bbbbbab10000001bb11bbab10004414444444444144
0011baaaa1aa10000001baaaaabb100000001a1aa1bb1000000001aa1bb1a100000001abbba1a10000001aaaaabb10000001baaaaabb10004414444444444144
0001111bbb11000000011bbbbb11100000001b111111100000001111bb11a1000000111aaa11a10000001bb11111100000011bbbb11110004411111111111144
0011baa1111110000001111111aa11000000111aaaa100000001aaaa111aa1000001aaa1111aa1000000111aaaa100000001111111aa11004444444444444444
00011111111100000000111111111000000111111111100000011111111111100001111111111110000111111111100000001111111110004444444444444444
0000001111100000000110111101100000011111110000000000000000000000000011111100000001a100000001111000000011110000000000001111000000
0000011babb10000001aa1baab1aa100001aa1aaaa100000000001111110000001111aaa1b11000001a1000000133311000111bbbb1110000000114444110000
000111baab111000001aa111111aa10000111a1111a1100001011baaabb1110011111111a11a100001a100000001aa31001aa11bb11aa1000001444444441000
001a1bbaabb1a1000011111111111100001a11baab11a100011aa1bbaaabbb1001111aaa11aa100001a3100000131a31001aa1aaaa1aa1000001442222441000
001a111b1111a100001b111aa111b100001a1bbaabb1a100011baa1bb1bbbb101111aa11a1a1b10001aa100001aa313100111b1111b111000014421111244100
001a1aaaaaa1a100001b1a1aa1a1b100001b1bbabbb1b1000011baa11a1bb100011a1aaaaba1bb10013a31001aaa1010001b11111111b1000114411111144110
011bb111111bb100001b1aaaaaa1b10000011bbab1b11000001111b1ba1b1000001baa1aab1bbb10001aa101aaa10000001b11111111b1000114411111144110
1aa1ab1111ba1000001b1ba11ab1b100000011bbab110000011a1a11aa1b10000001baab111111000013a31aaa100000001b1a1aa1a1b1000141441111441410
01a1ba1aa1ab1000001b1ba11ab1b1000001bb1bbb1b100001aa1aa1aa11000000111111bb1bb1000001a1aaa1000000001b1a1aa1a1b1000141244444421410
00111baaaab100000001b1baab1b10000001bab1bb1bb100001baaa1ab10000001bab1bbbbb1aa1000001aaa1000000000011baaaab1b1000124114994114210
0001b111111b100000011b1111b110000001bbab111baa10011111111110000001aa1baaaab1aa100001aaa1311000000001b111111b10000124441111444210
00111babb1bb10000001abbbbbba100000011bbaabb1aa101aa1bbb1bab1100000111bbbbbb111000001aa1aaa3110000001babbbbbb10000124244444424210
001bb1baa1111000001bbaaaaaabb100000011bbb11111001aa1bb1aabb1a100001aa1111111aa10000011013aaa31110001bbaaaaab10000012224994222100
0001111bb1aa100001a11bbbbbb11a10000001111aa100000111111bbb11a100001baa11111aab1000000000113aaaaa00001bbbb11110000012224444222100
0000001111aa11001aaab111111baaa1000000111aa110000001aaa1111aa1000001ba11111ab1000000000000111111000111111aab11000001122442211000
00000001111110000111111111111110000000001111100000111111111111100000111b00111000000000000000000000001111111110000000011111100000
000000000000000001a0011111100a100001100000011000001100111110110000000000001000a1000000000000000044411111111114440000000000000000
0000001111000000a01a1a1111a1a10a001aa100001aa10001aa11aaaa11aa100000000001100a10000001111100000044144444444441441111111111111111
000001bbbb1000001001111111111001001aa100001aa10001a11b1111b11a10000000110111100a00011baabb11000044144444444441441444444444444441
00001bbbbbb10000001a111bb111a1000011110000111100001a11bbbb11a1000000001b111aa101111aa1bbaabb110044144444444441441999999999999991
00011bbaabb11000001a1b1bb1b1a100001bb111111bb100001a1bbaabb1a100000001abb1bab110011baa1bb1bbbb1044144444444441441111111111111111
001a11111111a100001a1baaaab1a100001bb11bb11bb100001a1babb1b1a10000001aa111aa1ab10011baa11a1bbb1044144444444441440121999999991210
001a1aaaaaa1a100001bbaa11aabb100001b1bb11bb1b100001b11bbbb11b100000011aab1aa1ba100111111ba1bb10044144444444441440121911919191210
001a11111111a1000011aa1aa1aa110000111baaaab111000001111bbb11100000001a1a1111bba1011aa111aa1b100044144444444441440121999999991210
001b11111111b10000011aaaaaa11000001b1b1bb1b1b10000011bb1bb1b100001111111baab1bb101aa1aa1aa11000044199999999991440121919119191210
00111a1111a111000001b111111b1000001a11bbbb11a1000001babb11ba10001aa1bbb11baaa1b1111baaa1ab10000044122222222221440121999999991210
001b1a1aa1a1b1000001bb1bb1bb1000001a11111111a1000001bbabbbab10001aa1bbbb11111bb11a1111111110000044122222222221441121111111111211
01bb11aaaa11bb100001bb1aa1bb1000001a1b1111b1a100000111baaabb100001111111b1bbbb101aa1bbbb1bb1110044122222222221441944444444444491
01bb11111111bb100001111bb1111000a00111aaaa11100a0001aa1bbb1110001a1bbabbb1bbbb1001a1bbb1aaab1a1044122222222221441111111111111111
01b1aa1bb1aa1b100011aa1111aa110010001b1111b100010011aa1111aa11001aa1bba1101bb100001111111bb11a1044111111111111440002214942122000
0011aa1111aa11000011aa1bb1aa110000a101bbbb101a000011bb111111110001aa1b1100011000000001aaa111aa1044444444444444440002214942122000
000111111111100000011111111110000a100011110001a000011111111110000111111110000000000011111111111044444444444444440000221111220000
00011111111110005166666d001d5100011111111111111011111111111111114444444444111111444444444444444411111111111111111111111111111111
0015515ddd555100516ddddd0165551014444444444444411666666666666661499999999914444149999999999999941aaaaaaaaaaaaaa11aaaaaaaaaaaaaa1
0155d111111d5510516ddddd16655d5112414444444414211655555555555561492222111114444149122222211111941a122222222221a11aa1111aa1111aa1
111d15dddd51d5515155555516d11dd114444444444444411655555555555561492222144414444149122222219991941a122222222221a11aa1881aa1881aa1
15515dddddd51111111111111dd11dd111111111111111111555511551155551491111144414444149111111119991941a122222222221a11aa1881aa1881aa1
15d15dddddd51d5166d5166615dd5d5114444444444444411111111111111111491444144414444149111111119991941a112222222211a11aa1881aa1881aa1
15d15dddddd51d51ddd516dd0156551012414444444414210155555555555510491444144419999149111144419991941a111111111111a11aa1111aa1111aa1
15d155dddd551d51555515550016510014444444444444410166556666556610491444144411111149111144419991941a111111111111a11aaaaaaaaaaaaaa1
1511555dd5551d51111111115551555511111111111111110165665555665610491444199911111149111144419991941aaaaaaaaaaaaaa11aaaaaaaaaaaaaa1
115d15555551155116d1d66155161555144444444444444101655555555556104914441111111111491221444199919411111111111111111111111111111111
155dd111111dd1511111d66155161555124144444444142101555555555555104919991111111111491221444199919418a121a11a121a8118a121a11a121a81
1555ddd1dddd551116d1ddd151161155144444444444444101555555555555104911111111111111491221444199919418a121a11a121a8118a121a11a121a81
155555515555555116d1111151565155111111111111111100155155551551004911111111111111491221444199919418a121aaaa121a8118a121aaaa121a81
015555515555551016d1d66151d6d155122122122122122100015655556510004922222222222224491111111111119418a1111111111a8118a1111111111a81
00155551155551001dd1ddd151111155122122122122122100001555555100004999999999999994499999999999999418aaaaaaaaaaaa8118aaaaaaaaaaaa81
00011111111110001111111155555555011111111111111000000111111000004444444444444444444444444444444411111111111111111111111111111111
__label__
66606660600006606660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60006060600060006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66006660600066606600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60006060600000606000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60006060666066006660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000001111100000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000001bbaab10000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000011bbb11b11000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000001a1baaaa11a100000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000001a1a1111a1a100000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000001a11111111a100000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000001bb111111bb100000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000001aa1aa1aa1000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000001ba1aa1ab1000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000001b1baaaab1b100000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000001b11111111ba10000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000001baa1bbbb11a10000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000001aa1aaaab1100000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000011bbb1111000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000111111aab1100000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000111111111000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
7272727272727272727272000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7200000000000000000072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7200000000000100000072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7200000000000100000072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7200000000000000000072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7200000000000000000072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7200000000007200000072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7200000000007200000072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7200000000007200000072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7272000000007272727272000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0072000000000000000072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0072727272000000000072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000727272727272000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000211501e1501a15016150121400a1400f130121300f1300010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
