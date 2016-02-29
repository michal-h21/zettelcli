-- kpse.set_program_name "luatex"
-- require "hb_lualoader"
local unicode = require "unicode"
local usub = unicode.utf8.sub
local ulen = unicode.utf8.len
tfx = require "termfx"

tfx.init()
tfx.outputmode(tfx.output.COL256)
tfx.clear(tfx.color.WHITE, tfx.color.BLACK)
s = "Příliš žluťoučký kůň úpěl"
x = math.floor((tfx.width() - ulen(s)) / 2)
y = math.floor(tfx.height() / 2)
for r= 0, 5 do
  for g = 0,5 do
    for b = 0, 5 do
      local col = tfx.rgb2color(r,g,b) 
      local y = r + 1
      local x = g *  6 + b + 1
      tfx.setcell(x,y , " ", 0, col)
    end
  end
end

for i = 0, 5 do
  tfx.setcell(6 * 6 + 2, i + 1, string.format("%i",i))
end

for i = 0, 5 do
  tfx.setcell(i*6+1, 8, string.format("%i",i))
  for l =  0, 5 do
    tfx.setcell(i*6 + l+ 1, 7, string.format("%i", l))
  end
end


for i=1, ulen(s) do
  tfx.setcell(x, y, usub(s, i, i))
  x = x + 1
end
tfx.present()
quit = false
x = x - ulen(s)
y = y + 2
repeat
  tfx.setcursor(x, y)
  tfx.present()
  evt = tfx.pollevent()
  quit = evt.char == "q"
  if evt.char then
    tfx.setcell(x, y, evt.char)
    x = x + 1
    tfx.setcursor(x, y)
    tfx.present()
    -- tfx.scrollregion(1,y, tfx.width, y, 0,-1)
  end
until quit
tfx.shutdown()
print "konec"
