-- Timeout monitoring module
local function withTimeout(timeLimit, func)
    -- 保存原始hook配置
    local prevHook, prevMask, prevCount = debug.gethook()
    local startTime = os.clock()
    local isHighFreq = false

    -- 动态频率切换
    local function checkHook()
        local remaining = timeLimit - (os.clock() - startTime)
        if remaining < timeLimit * 0.2 and not isHighFreq then
            debug.sethook(mainHook, "l", 1)
            isHighFreq = true
            print("[Switch to HIGH frequency]")
        end
    end

    -- 主hook函数
    local function mainHook()
        if os.clock() - startTime > timeLimit then
            debug.sethook()
            error(string.format("Timeout (%.2fs)", timeLimit), 2)
        end
        checkHook()
    end

    -- Initial low-frequency setup
    debug.sethook(mainHook, "l", 1000)
    print("Start LOW frequency monitoring")

    -- Execute target code
    local ok, err = pcall(func)

    -- Restore original hooks
    debug.sethook(prevHook, prevMask, prevCount)
    print("Restored original hooks\n")

    return ok, err
end

-- Test case
local function main()
    -- Test 1: Infinite loop
    print("==== Test 1: Infinite Loop ====")
    local ok, err = withTimeout(2, function()
        while true do end
    end)
    if not ok then print("Result:", err) end

    -- Test 2: Normal execution
    print("==== Test 2: Normal Code ====")
    withTimeout(1, function()
        for i = 1, 3 do
            print("Step", i)
            os.execute("sleep 0.5")  -- Works on Unix systems
        end
    end)

    print("==== Program Continues ====")
end

main()