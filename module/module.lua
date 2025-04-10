--module就是一个table
module = {}

--定义一个常量
module.constant = "这是一个常量"

--定义一个函数
function module.func1()
    io.write("这是一个公有函数\n")
end

local function func2()  --私有函数不需要+module.，否则会变成一个公有接口
    print("这是一个私有函数\n")
end

function module.func3()
    func2()
end

return module

--使用require()函数调用module
--require("<module_name>") 或者 require "<module_name>"
