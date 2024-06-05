print('Hello, World!')

local loadSites = get('loadSites')
local list = get('list')

loadSites.on_click(ShowList())

print('Hello Again, World!')

function GetSites()
    local res = fetch({
        url = "https://api.buss.lol/domains",
        method = "GET"
    })
    return "returned value"
end

function ShowList()
    list.set_content('testing...')
    local response = getSites()
    local data = response:json()
    createList(data)
end

function CreateList(data)
    list.set_content('It is working!')
end