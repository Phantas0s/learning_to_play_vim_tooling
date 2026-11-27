-- Prevent tables to cut weirdly between pages, forcing an empty header on the next page

function Table(tbl)
  return {
    pandoc.RawBlock('tex', '\\Needspace*{6\\baselineskip}'),
    tbl
  }
end
