rconsolename("i83&dirir") --dk
rconsoleprint("@@GREEN@@")

local stuffs = {}
for i = 1, 1000 do
    table.insert(stuffs, (math.random(1,300).. "." ..math.random(0,50).. "." .. math.random(0,50).. "." .. math.random(1,300))) -- Inserts completely random generated numbers in a table
end

for i,v in next, shit do
    rconsoleprint(v)
    rconsoleprint("\n")
    wait()
end
