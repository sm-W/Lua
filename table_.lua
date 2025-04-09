--初始化表
mytable = {}
--指定值
mytable[1] = "Lua"
--移除引用
mytable = nil

mytable = {}
print("mytable的类型是 ", type(mytable))

mytable[1] = "Lua"
mytable["wow"] = "修改前"
print("mytable索引为1的元素是 ", mytable[1])
print("mytable索引为wow的元素是 ", mytable["wow"])

alternatetable = mytable

print("alternatetable索引为1的元素是 ", alternatetable[1])
print("alternatetable索引为wow的元素是 ", alternatetable["wow"])

--alternatetable 的类似于指针，与mytable指向同一个table
alternatetable["wow"] = "修改后"
print("mytable索引为wow的元素是 ", mytable["wow"])

--释放变量
alternatetable = nil
print("alternatetable是 ", alternatetable)

--mytable仍然可以访问
print("mytable索引为wow的元素是 ", mytable["wow"])

mytable = nil
print("mytable是 ", mytable)


fruits = {"banana", "orange", "apple"}

print("连接后的字符串 ", table.concat(fruits))
--指定连接字符, 此处用", "连接
print("连接后的字符串 ", table.concat(fruits, ", "))
--指定索引, start=2, end=3
print("连接后的字符串 ", table.concat(fruits, ", ", 2, 3))

--插入删除元素
table.insert(fruits, "mango")
print("index=4 is ", fruits[4])
--指定位置插入元素
table.insert(fruits, 2, "grapes")
print("index=2 is ", fruits[2])
--删除最后一个元素
table.remove(fruits)
print("index=5 is ", fruits[5])

print("排序前...")
for i, v in ipairs(fruits) do
    print(i,v)
end
--此处可定义排序函数，默认是升序(<)
table.sort(fruits, function (a, b) return a > b end)

print("排序后...")
for i, v in ipairs(fruits) do
    print(i,v)
end

--获取table中的最大值
function table_maxn(t)
    local mn=nil
    for k, v in ipairs(t) do
        if mn == nil then
            mn = v
        end
        if mn < v then
            mn = v
        end
    end
    return mn
end

tbl = {[1] = 2, [2] = 6, [3] = 34, [26] = 5}
print("tbl的最大值为 ", table_maxn(tbl))
print("tbl长度 ", #tbl) --#tbl和table.getn都会在索引中断处停止计数

--table长度函数
function table_len(t)
    local len = 0
    for k, v in pairs(t) do --ipairs只遍历连续索引，pairs遍历所有索引
        len = len + 1
    end
    return len
end

print("tbl长度 ", table_len(tbl))
