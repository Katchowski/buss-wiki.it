local loadSites = get('loadSites')
local list = get('list')
local status = get('status')
local searchbox = get('search')
local ignore = '"{'
local data = ''
local page = 1


loadSites.on_click(function()
    data = ''
    list.set_content('')
    status.set_content('Status: Fetching Data...')
    PullDomains(page)
    status.set_content('Status: Fetch Complete')
    list.set_content(table.concat(Split(data, '}', ',')))
end)

--adapted from: https://stackoverflow.com/questions/1426954/split-string-in-lua
function Split(inputstr, sep, sep2, search)
    search = searchbox.get_content()
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        local str2 = ''
        local url = ''
        for element in string.gmatch(str, "([^"..sep2.."]+)") do
            if string.find(element, 'name') ~= nil then
                url = element .. url
            elseif string.find(element, 'tld') ~= nil then
                url = url ..  element
            end
            if string.find(element, 'ip') == nil then
                str2 = str2 ..  element .. '\n'
            else
                str2 = str2 ..  element .. '\n\n'
            end
            str2 = str2:gsub(ignore, "")
            str2 = str2:gsub(';', ": ")
        end
        url = url:gsub("["..ignore.."]+", "")
        url = url:gsub('name:', "")
        url = url:gsub('tld:', ".")
        str2 = 'buss://' .. url .. '\n' .. str2
        if search == nil then
            table.insert(t, (str2))
        else
            if string.find(str2, search) ~= nil then
                str2 = str2:gsub("["..ignore.."]+", "")
                table.insert(t, str2)
            end
        end
    end
    return t
end

function PullDomains(i)
    status.set_content('Fetching Domains')
    local tmp = fetch({
        url = 'https://api.buss.lol/domains?page=' .. i ..'&limit=100',
        method = 'GET',
        headers = {['Content-Type'] = 'Application/json'}
    })
    tmp = json.stringify(tmp)
    --tmp = tmp:gsub('domains:', "") --IFFY
    --tmp = tmp:gsub('page:', "") -- MIGHT WORK???
    --tmp = tmp:gsub('limit:', "") -- MIGHT WORK???
    data = data .. tmp
end