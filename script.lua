print('file loaded')

local loadSites = get('loadSites')
local list = get('list')

print('get elements complete')

loadSites.on_click(function()
    local res = fetch({
        url = "https://api.buss.lol/domains",
        method = "GET",
        headers = {["Content-Type"] = "Application/json"}
    })
    local data = res:json()
    list.set_content(data)
end)