local defined_envs = nil

local function get_defined(meta)
    if defined_envs ~= nil then
        return defined_envs
    end

    defined_envs = {}

    local env_meta = meta['pandoc-latex-environment']
    if env_meta == nil then
        return defined_envs
    end

    for environment, classes in pairs(env_meta) do
        defined_envs[environment] = {}
        for _, klass in ipairs(classes) do
            local str = pandoc.utils.stringify(klass)
            if str:match('^[a-zA-Z][%w%.:%-%_]*$') then
                defined_envs[environment][str] = true
            end
        end
    end

    return defined_envs
end

local function has_all_classes(current_classes, required_classes)
    for class, _ in pairs(required_classes) do
        if not current_classes[class] then
            return false
        end
    end
    return true
end

function Pandoc(doc)
    get_defined(doc.meta)
    return doc:walk({
        Div = function(el)
            if not (FORMAT == 'latex' or FORMAT == 'beamer') then
                return nil
            end

            local current_classes = {}
            for _, class in ipairs(el.classes) do
                current_classes[class] = true
            end

            for environment, required_classes in pairs(defined_envs) do
                if has_all_classes(current_classes, required_classes) then
                    local label = ''
                    if el.identifier ~= '' then
                        label = '\n\\label{' .. el.identifier .. '}'
                    end

                    local title = ''
                    if el.attributes['title'] then
                        title = '[' .. el.attributes['title'] .. ']'
                    end

                    local before = pandoc.RawBlock('tex',
                        '\\begin{' .. environment .. '}' .. title .. label ..
                        '\n')
                    local after = pandoc.RawBlock('tex',
                        '\\vspace{4pt}\n\\end{' .. environment .. '}')

                    el.content = {before} .. el.content .. {after}
                    return el
                end
            end
        end
    })
end
