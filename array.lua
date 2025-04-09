local myArray = {10, 20, 30, 40, 50}

myArray[#myArray + 1] = 60
table.remove(myArray, 3)

for i = 1, #myArray do
    print(myArray[i])
end

array = {}
for i=1,3 do
    array[i] = {}
    for j = 1, 3 do
        array[i][j] = i * j 
    end
end

for i = 1, 3 do
    for j = 1, 3 do
        print(array[i][j])
    end
end

local array = {}
maxRows = 3
maxColumns = 3
for i = 1, maxRows do
    for j = 1, maxColumns do
        array[i*maxColumns + j] = i * j
    end
end

for i=1, maxRows do
    for j = 1, maxColumns do
        print(array[i*maxColumns + j])
    end
end