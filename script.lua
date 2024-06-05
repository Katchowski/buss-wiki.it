print('Hello, World!')

--local loadSites = get('loadSites')
local list = get('list')

--loadSites.set_content('Loading...')
list.set_content('It is working!')

print('Hello Again, World!')

--[[loadSites.on_click(ShowList())

function GetSites()
    local res = fetch({
        url = "https://api.buss.lol/domains",
        method = "GET"
    })
    return "returned value"
end

function ShowList()
    loadSites.set_content('Loading...')
    local response = getSites()
    local data = response:json()
    createList(data)
end

function CreateList(data)
    list.set_content('It is working!')
end]]--