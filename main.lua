http.get("https://api.buss.lol/domains", nil, function(code, data)
    if (code ~= 200) then
        print("HTTP request failed")
    else
        print(code)
        file = io.open("sites.json", "w")
        io.write(data)
        io.close(file)
    end
end)