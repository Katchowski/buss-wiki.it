local loadSites = get("loadSites")
local list = get("list")

loadSites.on_click(showList())

function getSites()
    local res = fetch({
        url = "https://api.buss.lol/domains",
        method = "GET"
    })
    return res
end

function showList()
    loadSites.set_content("Loading...")
    local response = getSites()
    local data = response:json()
    createList(data)
end

function createList(data)
    list.set_content(data)
end