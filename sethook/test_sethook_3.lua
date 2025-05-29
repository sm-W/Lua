-- 定义钩子函数

local hook_state = {
    already_changed = true,
    hook_line = 0,
    high_hook = 10,
    threshold = 2,
    hook_time = 0,
}
local function hook_func(event, line)
    if event == "line" then
        hook_state.hook_line = hook_state.hook_line + 1
        if hook_state.hook_line > hook_state.high_hook then
            print("Hook Triggered On Line:", line)
            hook_state.hook_time = hook_state.hook_time + 1
            hook_state.hook_line = 0
        end
        -- 低频hook超过threshold,改变钩子函数
        if hook_state.hook_time > hook_state.threshold then
            hook_state.already_changed = false
            hook_state.threshold = 10
        end
        -- 检查是否以及改变过
        if not hook_state.already_changed then
            -- 改变钩子函数为每行触发
            -- local old_mask = debug.gethook()
            -- local new_mask = "line"
            -- debug.sethook(hook_func, new_mask, 0)
            -- 设置标记记录已经修改
            hook_state.already_changed = true
            if hook_state.threshold == 10 then
                hook_state.high_hook = 0
            else
                hook_state.high_hook = 10
            end
            hook_state.hook_time = 0
        end
    end
end

-- Initialize hook with line counting
local initial_mask = "l"
local initial_count = 0
debug.sethook(hook_func, initial_mask, initial_count)

-- Test code with more lines per iteration
for i = 1, 20 do
    -- Multiple operations to ensure line counting
    local x = i * 2
    local y = x + 1
    local z = y * 3
    print(z)  -- Additional line
    if i % 2 == 0 then  -- Conditional line
        print("Even")
    end
end

debug.sethook()