local loadSites = get('loadSites')
local list = get('list')
local status = get('status')
local searchbox = get('search')
local ignore = '"{'

status.set_content('Status: get elements complete')

loadSites.on_click(function()
    status.set_content('Status: button clicked')
    local data = fetch({
        url = 'https://api.buss.lol/domains',
        method = 'GET',
        headers = {['Content-Type'] = 'Application/json'}
    })
    status.set_content('Status: fetch complete')
    local res = json.stringify(data)
    list.set_content(table.concat(Split(res, '}', ',')))
end)

--https://stackoverflow.com/questions/1426954/split-string-in-lua
function Split(inputstr, sep, sep2, search)
    
    search = searchbox.get_content()
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        local str2 = ''
        for el in string.gmatch(str, "([^"..sep2.."]+)") do
            if string.find(el, 'ip') == nil then
                str2 = str2 ..  el .. '\n'
            else
                str2 = str2 ..  el .. '\n\n'
            end
            str2 = str2:gsub("["..ignore.."]+", "")
        end
        if search == nil then
            table.insert(t, (str2))
        else
            if string.find(str2, search) ~= nil then
                table.insert(t, str2)
            end
        end
    end
    return t
end
  