local loadSites = get('loadSites')
local list = get('list')
local status = get('status')

status.set_content('get elements complete')

loadSites.on_click(function()
    status.set_content('button clicked')
    local data = fetch({
        url = 'https://api.buss.lol/domains',
        method = 'GET',
        headers = {['Content-Type'] = 'Application/json'}
    })
    status.set_content('fetch complete')
    list.set_content(data)
end)