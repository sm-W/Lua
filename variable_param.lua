os.execute("chcp 65001")	--设置代码页为UTF-8

function add(...)
	local s = 0
	for i, v in ipairs{...} do
		s = s + v
		print(i)
	end
	return s
end

print(add(3, 4, 5, 6, 7))

