print('file loaded')

local loadSites = get('loadSites')
local list = get('list')

print('get elements complete')

loadSites.on_click(function()
    print('button clicked')
    local res = fetch({
        url = "https://api.buss.lol/domains",
        method = "GET",
        headers = {["Content-Type"] = "Application/json"}
    })
    list.set_content(res)
end)