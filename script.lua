local loadSites = get('loadSites')
local list = get('list')
local status = get('status')
local searchbox = get('search')

status.set_content('get elements complete')

loadSites.on_click(function()
    status.set_content('button clicked')
    local data = fetch({
        url = 'https://api.buss.lol/domains',
        method = 'GET',
        headers = {['Content-Type'] = 'Application/json'}
    })
    status.set_content('fetch complete')
    local res = json.stringify(data)
    list.set_content(table.concat(Split(res, '}')))
end)

--https://stackoverflow.com/questions/1426954/split-string-in-lua
function Split(inputstr, sep, search)
    search = searchbox.get_content()
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        if search == nil then
            str = str .. '\n'
            table.insert(t, (str))
        else
            str = str .. '\n'
            if string.find(str, search) ~= nil then
                table.insert(t, (str))
            end
        end
      
    end
    return t
end
  