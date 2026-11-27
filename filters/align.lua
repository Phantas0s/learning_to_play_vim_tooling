local MARKER = "@@RIGHT@@"
local ESCAPE = "ж"

local function split_on_marker(text, marker)
    local parts = {}
    local pos = 1
    while true do
        local i, j = text:find(marker, pos, true)
        if not i then
            table.insert(parts, text:sub(pos))
            break
        end
        table.insert(parts, text:sub(pos, i - 1))
        pos = j + 1
    end
    return parts
end

function CodeBlock(el)
    if not el.text:find(MARKER) then return el end

    if FORMAT:match 'latex' then
        el.text = el.text:gsub(MARKER, ESCAPE .. "\\hfill" .. ESCAPE)
        return el
    else
        local parts = split_on_marker(el.text, MARKER)
        local spans = {}
        for i, part in ipairs(parts) do
            table.insert(spans, '<span>' .. part .. '</span>')
        end
        return pandoc.RawBlock('html',
            '<pre style="display:flex;justify-content:space-between;">'
            .. table.concat(spans) .. '</pre>')
    end
end

function RawBlock(el)
    if el.format == 'latex'
        and el.text:find('\\begin{minted}')
        and el.text:find(MARKER) then
        el.text = el.text:gsub(MARKER, ESCAPE .. "\\hfill" .. ESCAPE)
    end
    return el
end
