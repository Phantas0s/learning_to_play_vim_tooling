---
minted:
    default_block_language: vim
    default_inline_language: text
    block_attributes:
        - "ignorelexererrors=true"
        - "framesep=0mm"
        - "frame=none"
        - "framerule=0pt"
        - "breaklines"
        - "samepage"
        # - 'fontsize=\\footnotesize'
        - 'fontsize=\\small'
        - "bgcolor=cverbbg"
        # Digraph: z%
        - "escapeinside=жж"
        - "baselinestretch=1"
    inline_attributes:
        - "ignorelexererrors=true"
        - "bgcolorpadding=0.75mm"
        # - 'fontsize=\\footnotesize'
        - 'fontsize=\\small'
        - "bgcolor=cverbbg"
        - "escapeinside=жж"

pandoc-latex-environment:
    noteblock: [note]
    tipblock: [tip]
    warningblock: [warning]
    cautionblock: [caution]
    importantblock: [important]
    wrongblock: [wrong]
    goodblock: [good]
    twocols: [twocols]
    playtime: [playtime]
    helpblock: [help]

# Default value - overwritten for support of BW
image_dir: images/color/
---
