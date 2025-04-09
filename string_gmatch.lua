os.execute("chcp 65001")

for word in string.gmatch("hello lua user", "%a+") --%a+：用于匹配单词，%d+：用于匹配数字，%S+：用于匹配非空字符串
    do
        print(word)
    end

