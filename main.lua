http.get("https://api.buss.lol/domains", nil, function(code, data)
    if (code ~= 200) then
        print("HTTP request failed")
    else
        print(code)
        file = io.open("sites.json", "w")
        io.write(data)
        
    end
end)

function showList()
    local response = fetch("sites.json")
    local data = response:json()
    createList(data)
end

function createList(data)
    local mainUL = {}
    for i = 1, #data.result do
        local studentLI = {
            name = data.result[i].name,
            marks = {}
        }
        for key, value in pairs(data.result[i].marks) do
            table.insert(studentLI.marks, {
                subject = key,
                score = value
            })
        end
        table.insert(mainUL, studentLI)
    end
    for _, student in ipairs(mainUL) do
        print(student.name)
        for _, mark in ipairs(student.marks) do
            print(mark.subject .. ": " .. mark.score)
        end
        print()
    end
end