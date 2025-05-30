local lineCount = 0

local function lineCounter(event, line)
    if event == "line" then
        lineCount = lineCount + 1
        print("执行行:", line, "总行数:", lineCount)
    end
end

-- 设置每行执行时触发钩子
debug.sethook(lineCounter, "", 2)

for i = 1, 3 do
    print("循环迭代", i)
end

-- 移除钩子
debug.sethook()

print("总执行行数:", lineCount)