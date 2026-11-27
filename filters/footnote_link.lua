-- URL footnotes used only in the print version of the book
-- TODO avoiding repeating URLs in footnote would be nice...

function Link(el)
    local url = el.target
    -- If not an internal link
    if el.content ~= url and url:sub(1, 1) ~= "#" then
        -- Delete the github nonsense on the print version to only get the relative path
        url = string.gsub(url, [[https://github.com/Phantas0s/learning_to_play_vim_companion/blob/master]], [[learning_to_play_vim_companion]], 1)
        url = string.gsub(url, [[https://github.com/Phantas0s/learning_to_play_vim_companion/tree/master]], [[learning_to_play_vim_companion]], 1)
        url = string.gsub(url, [[https://github.com/Phantas0s]], [[learning_to_play_vim_companion]], 1)
        return {
            pandoc.Span(el.content),
            pandoc.Note(url),
        }
    -- if internal link
    elseif url:sub(1, 1) == "#" then
        local label = url:sub(2)
        return {
            pandoc.Span(el.content),
            -- \nameref needs the package hyperref defined in the template
            pandoc.Note(pandoc.RawInline('latex', string.format("\\nameref{%s}, p.\\pageref{%s}",label,label))),
        }
    end

    return el.content
end

-- Python script used as inspiration

-- #!/usr/bin/python3

-- import sys

-- from pandocfilters import toJSONFilter, Para, Link, Note, Str, stringify, Space

-- def footnotify(key, value, format_, meta):
--     if key == "Link":
--         _, txt, (url, title_text) = value
--         # Ignore bare links like <http://example.com>; otherwise we run into a
--         # recursive problem where Pandoc tries to apply this same filter to the
--         # new link in the footnote. Also ignore URLs that begin with "#", since
--         # those point to sections within the document.
--         if stringify(txt) != url and not url.startswith("#"):
--             empty_attrs = ["", [], []]
--             cite_link = Link(empty_attrs, [Str(url)], [url, ""])
--             if title_text:
--                 lst = [Str(title_text)]
--                 # lst = [Str(title_text), Space(), cite_link]
--             else:
--                 # There was no title text, so we do just what links-as-notes
--                 # would do.
--                 lst = [cite_link]
--             res = txt + [Note([Para(lst)])]
--             return res

-- if __name__ == "__main__":
--     toJSONFilter(footnotify)

-- Need some adjustment but could use it if needed

