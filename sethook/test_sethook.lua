local startTime = os.clock()

-- 每行都检查的版本
debug.sethook(function()
    if os.clock() - startTime > 2 then
        print("\n警告: 代码执行超过2秒,已安全终止!")
        debug.sethook() -- 关闭钩子
        error("TIME_LIMIT_EXCEEDED") -- 特殊错误标识并中断程序
    end
end, "l", 1)

local i = 1
local ok, err = pcall(function()
    while true do
        print(i, ":安全测试循环")
        i = i + 1
    end
end)

-- 错误处理
if not ok and err:find("TIME_LIMIT_EXCEEDED") then
    print("程序已按预期终止")
elseif not ok then
    print("意外错误:", err)
end