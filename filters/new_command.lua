-- ltx-com.lua - Create latex commands depending on specific span classes
-- See pandoc Span: https://pandoc.org/MANUAL.html#divs-and-spans

-- Example: [h]{.cursor}ello becomes <span class="cursor">h</span> or \cur{h}

require('filters/utils')

local function com(s) return '\\' .. s end

local inlines = {
    cursor = com('cur'),
    highlight = com('high'),
    mne = com('mne'),
    invert = com('invert'),
    index = com('index'),
    opt = com('opt'),
}

function Span(elem)
    local coms = {}
    for _,c in ipairs(elem.classes) do
        if inlines[c] then
            coms[#coms+1] = inlines[c]
        end
    end
    if #coms > 0 then
        local pre = pandoc.RawInline('latex', table.concat(coms))
        return {pre,elem}
    else
        return nil
    end
end

local blocks = {
    compiled_index = '\\phantomsection\\label{index}\\printindex'
}

-- Create a latex rawblock (i.e \printindex)
-- Create a div with identifier compiled_index
function Div(elem)
    if blocks[elem.identifier] then
        local pre = pandoc.RawBlock('latex', blocks[elem.identifier])
        return {pre,elem}
    else
        return nil
    end
end
