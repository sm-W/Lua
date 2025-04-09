-- 迭代器是一种对象，能够用来遍历标准模板库容器中的部分或全部元素
-- 泛型for迭代器
local array = {'Google', 'Runoob'}
for k, v in ipairs(array) do    --使用Lua提供的迭代函数ipairs
    print(k, v)
end

function square(iteratorMaxCount, currentNumber)
    if currentNumber < iteratorMaxCount 
    then
        currentNumber =  currentNumber + 1
        return currentNumber, currentNumber * currentNumber
    end
end

--for i, n in square(3, 0)  泛型for循环要求迭代器函数必须是一个"无参函数"，返回三个值；而square(3, 0)是一个有参函数，返回两个值
for i, n in square, 3, 0
    do
        print(i, n)
    end

function iter(a, i)
    i = i + 1
    local v = a[i]
    if v then
        return i, v
    end
end

function ipairs(a)
    return iter, a, 0
end

function elementInterator(collection)   --该函数仅在初始化时使用，后续使用闭包函数作为迭代器函数
    local index = 0
    local count = #collection
    return function ()
        index = index + 1
        if index <= count then
            return collection[index]
        end
    end
end

for element in elementInterator(array) do
    print(element)
end