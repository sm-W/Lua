os.execute("chcp 65001")	--设置代码页为UTF-8

a = 5
local b = 7

function fun()
	c = 8
	local d = 9
	print("In Function:" .. c, d)
end

fun()
print("Out Function:" .. c, d)

do
	local a = 10
	b = 20
	print(a, b)
end

print(a, b)

