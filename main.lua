local loadSites = get("loadSites")
showList()


function getSites()
    local res = fetch({
        url = "https://api.buss.lol/domains",
        method = "GET"
    })
    return res
end

function showList()
    local response = getSites()
    local data = response:json()
    createList(data)
end

function createList(data)
    --call php script--
end