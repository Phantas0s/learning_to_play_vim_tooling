-- Escape all the cursor representation in codeblock for HTML and EPUB only

-- This filter is super brittle - it depends on minted escapeinside metadata (жж),
-- on the \cur{} latex element, and the filter new_command.lua
-- TODO All these values should be somehow centralized in metadata and then used everywhere

local cursor_count = 0

local function cursor_span(m)
    cursor_count = cursor_count + 1
    return '<mark class="cursor" id="cursor-' .. cursor_count .. '">' .. m .. '</mark>'
end

function Code(el)
    if el.text:find("ж\\cur{.-}ж") then
        el.text = el.text:gsub("\\([^%a])", "%1")
        el.text = el.text:gsub("ж\\cur{(.-)}ж", cursor_span)
        return pandoc.RawInline('html', '<code>' .. el.text .. '</code>')
    end
    if el.text:find("ж\\high{.-}ж") then
        el.text = el.text:gsub("\\([^%a])", "%1")
        el.text = el.text:gsub("ж\\high{(.-)}ж", cursor_span)
        return pandoc.RawInline('html', '<code>' .. el.text .. '</code>')
    end
    return el
end

function CodeBlock(block)
    if block.text:find("ж\\cur{.*}ж") then
        block.text = block.text:gsub("\\([^%a])", "%1")
        block.text = block.text:gsub("ж\\cur{(.-)}ж", cursor_span)
        return pandoc.RawBlock('html', '<pre class="text"><code>' .. block.text .. '</code></pre>')
    end
    if block.text:find("ж\\high{.-}ж") then
        block.text = block.text:gsub("\\([^%a])", "%1")
        block.text = block.text:gsub("ж\\high{(.-)}ж", cursor_span)
        return pandoc.RawBlock('html', '<pre class="text"><code>' .. block.text .. '</code></pre>')
    end
    return block
end
