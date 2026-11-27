-- Create an index for HTML files
-- Spans are transformed into latex \index with the script new_command.lua
-- Inspiration: https://stackoverflow.com/questions/65639306/how-to-add-a-alphabetical-index-with-pandoc

local idx = {}

local function makeId(string)
    return string:gsub(" ", "-")
end

-- Build a map of link
local function buildMap(dic, indices)
    table.sort(indices)
    for _,v in ipairs(indices) do
        local key = string.upper(string.sub(v, 1, 1))
        local id = makeId(v)
        if(dic[key] == nil) then
            dic[key] = {pandoc.Para(pandoc.Link(v,"#"..id))}
        else
            table.insert(dic[key],pandoc.Para(pandoc.Link(v,"#"..id)))
        end
    end
    return dic
end

-- Create links for indexes for each span with class "index"
-- Each link get the id of the index itself (problem for multiple pages for one index... could increment the index)
function Span(el)
    for _,c in ipairs(el.classes) do
        if c == 'index' then
            local index = pandoc.utils.stringify(el.content)
            local id = makeId(index)
            table.insert(idx,index)
            -- Return an empty span used as anchor
            return pandoc.Span("", {id = id})
        end
    end
end

-- Populate a DIV with all the linked indexes
-- Div created with script new_command (dependency)
function Div(el)
    if el.identifier == 'compiled_index' then
        local list = buildMap({},idx)
        local lists = {}
        for key, items in pairs(list) do
            local inner_list = {}
            for _,item in pairs(items) do
                table.insert(inner_list, item)
            end
            table.insert(lists,pandoc.DefinitionList{{key, inner_list}})
        end
    return lists
    end
end
