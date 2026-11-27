--- # not-in-format - keep document parts out of selected output formats.
--
-- This Lua filter for Pandoc that keeps parts of a document out of
-- selected outputs formats.
--
-- @author Julien Dutant <julien.dutant@kcl.ac.uk>, Albert Krewinkel
-- @copyright 2021 Julien Dutant, Albert Krewinkel
-- @license MIT - see LICENSE file for details.
-- @release 1.0

--- Main Div filter.
-- Removes Divs tagged with `not-in-format` if the
-- output format matches one of the Div's attributes
-- @param element a Div element
-- @return an empty block if the Div classes include `not-in-format`
-- and the target format

-- Modified to take also variables into account.
-- For example, with a variable `-V printmode` in pandoc,
-- we can exclude any build with that var by using
-- `:::{.not-in-format .printmode}`
-- `:::`

-- Extended and modified with only-in-format

function Div(element)
  -- not-in-format: remove div if format or variable matches
  if element.classes:includes('not-in-format') then
    local format_match = element.classes:find_if(function(x)
      return FORMAT:match(x)
    end)
    if format_match then
      return {}
    end

    local var_match = element.classes:find_if(function(x)
      return PANDOC_WRITER_OPTIONS.variables[x] ~= nil
    end)
    if var_match then
      return {}
    end

    return
  end

  -- only-in-format: keep div only if format or variable matches
  if element.classes:includes('only-in-format') then
    local format_match = element.classes:find_if(function(x)
      return FORMAT:match(x)
    end)
    if format_match then
      return
    end

    local var_match = element.classes:find_if(function(x)
      return PANDOC_WRITER_OPTIONS.variables[x] ~= nil
    end)
    if var_match then
      return
    end

    return {}
  end
end
