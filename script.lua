print('file loaded')

local loadSites = get('loadSites')
local list = get('list')

print('get elements complete')

loadSites.on_click(ShowList)

print('button clicked')

function ShowList()
    list.set_content('showList called')
    local response = getSites()
    local data = response:json()
    createList(data)
end

function GetSites()
    print('getSites called')
    local res = fetch({
        url = "https://api.buss.lol/domains",
        method = "GET",
        headers = {["Content-Type"] = "Application/json"}
    })
    return res
end

function CreateList(data)
    print('createList called')
    list.set_content(res)
end