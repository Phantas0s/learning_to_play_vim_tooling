-- Add the correct path head for image
-- In case we want different image version depending of the build
-- For example, between print (black and white) and digital PDF (colors)

require('filters/utils')

local img_prefix_meta="image_dir"
local vars = {}

-- Parse the meta and save them into a table
function Meta(meta)
  for k, v in pairs(meta) do
    vars[k] = pandoc.utils.stringify(v)
  end
end

-- If there is the image prefix in meta,
-- prepend it to every image's source
function Image(el)
  if vars[img_prefix_meta] then
    el.src = vars[img_prefix_meta] .. el.src
    return el
  else
    return el
  end
end

return {
    {Meta = Meta},
    {Image = Image}
}
