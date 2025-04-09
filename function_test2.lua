os.execute("chcp 65001")	--设置代码页为UTF-8

function testFun(tab, fun)
	for k, v in pairs(tab) do
		print(fun(k, v));
	end
end

tab={key1="val1", key2="val2"};
testFun(tab,
function(key, val)	--匿名函数
	return key .. "=" .. val;
end
);
