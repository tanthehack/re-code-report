#import "@preview/i-figured:0.2.4"
#import "@preview/lovelace:0.3.0"

// if none, give "blank page template"
#let blankify(thing) = {
  if thing == none {
    align(horizon + center)[
      This page has been intentionally left blank.\
      // Except for the line above this.\
      // And this.

      // You get the idea.
    ]
  } else {
    par[#thing]
  }
}

// make a figure of code and pretend it's an image
#let code-figure(caption: none, code, lab: none) = [
  #show figure: i-figured.show-figure
  #set par(justify: false, leading: 0.75em)
  #figure(
    block(fill: luma(240), width: 90%, inset: 10pt, radius: 5pt, code),
    caption: caption,
    kind: image,
    supplement: "Figure",
  )
  #if lab != none {
    label(lab)
  }
]

// make a table figure and break it across a page if need be
#let table-figure(caption: none, data, lab: none) = [
  #set par(justify: false, leading: 0.85em)
  #show figure: set block(breakable: true)
  #show figure: i-figured.show-figure
  #figure(
    caption: caption,
    align(left)[
      #data
      #box(width: 1fr)
    ],
  )
  #if lab != none {
    label(lab)
  }
  #v(-1em)
]

// make an algorithm
#let algorithm-figure(name: none, lab: none, list) = [
  #show figure: it => i-figured.show-figure(it, extra-prefixes: ("algorithm": "alg:"))

  #figure(
    kind: "algorithm",
    supplement: [Algorithm],
    align(left)[
      #lovelace.pseudocode-list(
        line-numbering: none,
        stroke: none,
        booktabs: true,
        title: box(width: 80%)[*Algorithm #ref(label("alg:" + lab))*: #name],
        list,
      )
      #box(width: 1fr)
    ],
  )
  #label(lab)
  #v(-1em)
]

// convert num to string for chapter headings
#let stringify(num) = {
  if (num == "1" or num == [1]) {
    return "One"
  }
  if (num == "2" or num == [2]) {
    return "Two"
  }
  if (num == "3" or num == [3]) {
    return "Three"
  }
  if (num == "4" or num == [4]) {
    return "Four"
  }
  if (num == "5" or num == [5]) {
    return "Five"
  }

  return num
}

// template
#let bach(
  title: none,
  surname: none,
  names: none,
  matric: none,
  abstract: none,
  abbreviations: none,
  supervisor: none,
  dedication: none,
  acknowledgements: none,
  reference-path: none,
  programme: none,
  date: datetime.today(),
  appendices: none,
  content,
) = {
  // set page attributes
  set page(
    paper: "a4",
    margin: (left: 1.25in, right: 1in, top: 1in, bottom: 1in),
  )

  /************************* TEXT *************************/

  // text is times new roman, 12pt
  set text(font: "Times New Roman", size: 12pt, lang: "en", hyphenate: false)

  // this looks most similar to Word's "1.5" line spacing
  //
  // should be 175% of line height
  // according to https://practicaltypography.com/line-spacing.html
  // but typst and word calculate things differently
  // this looks "close enough"
  set par(justify: true, leading: 12.6pt)

  // fix for nbhyp
  show "-": sym.hyph.nobreak

  // make et al. italics
  show "et al.": [_et al._]

  /************************* TABLES *************************/

  // table headings bold
  show table.cell.where(y: 0): set text(weight: "bold")

  // reduce line spacing in tables
  show table.cell: set par(leading: 0.7em)

  // pad a bit
  set table(inset: 5pt)

  // remove the left/right edges
  set table(stroke: (x, y) => (
    left: if x > 0 {
      1pt
    },
    top: 1pt,
    bottom: 1pt,
  ))

  /************************* HEADINGS *************************/

  // make heading refs. say "Chapter"
  set ref(supplement: it => {
    if it.func() == heading {
      "Chapter"
    }
  })

  // heading sizes
  show heading.where(level: 1): set text(size: 14pt)
  show heading.where(level: 2): set text(size: 13pt)
  show heading.where(level: 3): set text(size: 12pt)

  // make heading be centred + all caps
  show heading.where(level: 1): it => [
    // special figure numbering
    // #i-figured.reset-counters(it, return-orig-heading: false)
    #set par(justify: false)
    #set align(center)
    #upper(it.body)
    #linebreak()
    #linebreak()
  ]

  // make level four ones have A. B. C
  show heading.where(level: 4): set heading(numbering: (..nums) => numbering("A.", nums.pos().rev().first()))

  /************************* FIGURES *************************/

  // special figure numbering
  show figure: it => {
    set par(leading: 0.6em)
    i-figured.show-figure(it)
  }

  // figure captions bold
  show figure.caption: strong

  // table captions top
  show figure.where(kind: "i-figured-table"): set figure.caption(position: top)

  // table captions left
  show figure.caption.where(kind: "i-figured-table"): it => align(left)[#it]

  /************************* EQUATIONS *************************/

  // special equation numbering
  show math.equation: i-figured.show-equation

  /************************* RAW *************************/

  // code should have tighter lines if it's a block
  show raw: it => {
    if it.block == true {
      set par(leading: 0.75em)
      it
    } else {
      it
    }
  }

  /************************* SPECIAL PAGES *************************/

  /************************* TITLE *************************/

  align(
    horizon + center,
    [
      #set text(weight: "bold", size: 16pt)
      #set par(justify: false)
      #upper([
        #title

        #linebreak()
        #linebreak()
        #linebreak()

        by

        #linebreak()
        #linebreak()
        #linebreak()

        #surname, #text(weight: "regular")[#names]
        #linebreak()
        (#matric)

        #linebreak()

        A Project Submitted to the Department of Computer and Information Sciences,
        College of Science and Technology, Covenant University Ota, Ogun State.

        #linebreak()

        In Partial Fulfilment of the Requirements for the Award of the Bachelor of
        Science (Honours) Degree in #programme.

        #linebreak()

        #date.display("[month repr:long], [year]")
      ])
    ],
  )

  pagebreak(weak: true)

  /************************* CERTIFICATION *************************/

  // start showing page numbers from ii.
  set page(
    numbering: "i",
    number-align: center,
  )

  [
    #heading[Certification]

    I hereby certify that this project was carried out by #names #upper[#surname] in the Department of Computer and Information Sciences, College of Science and Technology, Covenant University, Ogun State, Nigeria, under my supervision.
    #linebreak()
    #linebreak()
    #linebreak()
    #linebreak()
    #linebreak()
    #linebreak()
    #grid(
      columns: (55%, auto),
      gutter: 7pt,
      [*#supervisor*], align(bottom)[#line(length: 100%)],
      [_Supervisor_], align(center)[*Signature and Date*],
    )
    #linebreak()
    #linebreak()
    #linebreak()
    #linebreak()
    #linebreak()
    #linebreak()
    #grid(
      columns: (55%, auto),
      gutter: 7pt,
      [*Prof. Olufunke O. Oladipupo*], align(bottom)[#line(length: 100%)],
      [_Head of Department_], align(center)[*Signature and Date*],
    )

    #pagebreak(weak: true)
  ]

  /************************* DEDICATION *************************/

  [
    #heading[Dedication]

    // setting paragraph spacing in here
    // so that it doesnt affect headings
    #show par: set block(below: 18pt)
    #blankify(dedication)
    #pagebreak(weak: true)
  ]

  /************************* ACKNOWLEDGEMENTS *************************/

  [
    #heading[Acknowledgements]
    #show par: set block(below: 18pt)
    #blankify(acknowledgements)
    #pagebreak(weak: true)
  ]

  /************************* TABLES *************************/

  // no more dots between entry and page in table
  // or default title
  set outline(fill: none, title: none)

  /************************* TABLE OF CONTENTS *************************/
  [
    // tighten lines
    #set par(leading: 0.8em)

    // make level 1 headings become "chapter x: title"
    #show outline.entry.where(level: 1): it => {
      // #it.text works for non-numbered headings
      // #it.body returns (number, title, page)
      let x = it.body.fields().at("text", default: "THISISAHACK")
      if x == "THISISAHACK" {
        x = it.body.fields().at("children")

        // if stringifying it changes it, it's a normal chaper
        if stringify(x.at(0)) != x.at(0) {
          v(13pt) // add a bit of space
          x = "Chapter " + stringify(x.at(0)) + ": " + x.at(2)
        } else {
          // it's an appendix
          x = "Appendix " + stringify(x.at(0)) + ": " + x.at(2)
        }
      }

      if x == "References" {
        v(13pt)
      }

      // show the linked chapter number and title
      link(it.element.location())[#strong(upper(x))]
      box(width: 1fr)
      link(it.element.location())[#strong(it.page)]
    }

    // make indentation the way they want
    #show outline.entry.where(level: 2).or(outline.entry.where(level: 3)): it => {
      box()[
        #link(it.element.location())[#it.body.fields().at("children").at(0)]
      ]
      box(width: 1.6em)
      box(width: 1fr, inset: (right: 1em, rest: 0em))[
        #link(it.element.location())[#it.body.fields().at("children").slice(2).join()]
      ]
      link(it.element.location())[#it.page]
    }

    // manual heading and cover page elem
    #heading[TABLE OF CONTENTS]
    *CONTENT* #box(width: 1fr) *PAGES*

    *COVER PAGE* #box(width: 1fr) *i*
    #v(-5pt)

    // show rest
    #set par(justify: false)
    #outline(
      depth: 3,
      indent: n => if n != 1 {
        box(width: 1.5em) * n
      },
    )

    #pagebreak(weak: true)
  ]

  /************************* LIST OF FIGURES *************************/
  [
    // override "table headings bold"
    #show table.cell.where(y: 0): set text(weight: "regular")

    // override "pad a bit"
    #set table.cell(inset: 0pt)

    // increase spacing a bit
    #set par(leading: 0.8em)

    // make a new borderless table for every entry
    // could have probably just "built" a table instead
    #show outline.entry: it => {
      // build the list
      let c = []
      for value in it.body.fields().at("children").slice(4) {
        // once we see a space, the rest is probably source info. so stop
        if value == [ ] {
          break
        }
        c += value
      }

      // reduce spacing
      show table: set block(below: 3pt, above: 0pt)

      // show the table
      table(
        columns: (15%, 70%, 10%),
        inset: 10pt,
        stroke: 0pt,
        align: (left, left, right),
      )[#link(it.element.location())[#it.body.at("children").at(2)]][#link(it.element.location())[#c]][#link(
          it.element.location(),
        )[#it.page]]
    }

    // manual heading and table header
    #heading[List of Figures]
    #show table: set block(below: 14pt, above: 0pt)
    #table(
      columns: (15%, 70%, 10%),
      inset: 0pt,
      stroke: 0pt,
      align: (left, center, right),
    )[*FIGURES*][*TITLE OF FIGURES*][*PAGES*]

    // rest
    #i-figured.outline(target-kind: image, title: none)

    #pagebreak(weak: true)

    /************************* LIST OF TABLES *************************/

    // manual heading and table header
    #heading[List of Tables]
    #show table: set block(below: 14pt, above: 0pt)
    #table(
      columns: (15%, 70%, 10%),
      inset: 0pt,
      stroke: 0pt,
      align: (left, center, right),

    )[*TABLES*][*TITLE OF TABLES*][*PAGES*]

    // rest
    #i-figured.outline(target-kind: table, title: none)

    #pagebreak(weak: true)
  ]

  /************************* ABBREVIATIONS *************************/

  [
    #show table.cell.where(y: 0): set text(weight: "regular")
    #set table.cell(inset: 5pt)
    #set par(leading: 0.8em)

    // sort the provided abbreviations
    #if abbreviations != none {
      heading[Abbreviations]

      table(
        columns: (1fr),
        align: (left),
        stroke: 0pt,
        ..(abbreviations.sorted()),
      )

      pagebreak(weak: true)
    }
  ]

  /************************* ABSTRACT *************************/
  [
    #heading[Abstract]

    // tighten lines
    #set par(leading: 0.5em)
    #blankify(abstract)

    #pagebreak(weak: true)
  ]

  // revert to normal numbering
  set page(numbering: "1")

  /************************* CONTENT *************************/
  [
    // make heading have "chapter x" on top and caps
    #show heading.where(level: 1): it => [
      #i-figured.reset-counters(it, return-orig-heading: false, extra-kinds: ("algorithm",))
      #set par(justify: false)
      #set align(center)
      #linebreak()
      #upper("Chapter " + stringify(counter(heading).display()))
      #linebreak()
      #upper(it.body)
      #linebreak()
    ]

    #show heading.where(level: 2).or(heading.where(level: 3)).or(heading.where(level: 4)): it => [
      // add a bit more space after prev. paragraphs
      #v(0.5em)
      #par(leading: 0.7em)[
        #counter(heading).display()
        #box(width: 1em)
        #it.body
      ]
      // bring the content a bit closer to it
      #v(-0.5em)
    ]

    // code block font
    #show raw: set text(font: "FiraCode Nerd Font Mono")

    // set heading, page, enum numbering
    #set heading(numbering: "1.1")
    #set enum(numbering: (it => strong[#numbering("(i)", it)]), indent: 1cm, body-indent: 0.5cm, number-align: start)
    #counter(page).update(1)

    // bit of space below paragraphs
    #show par: set block(below: 18pt)

    #content

    #pagebreak(weak: true)
  ]

  /************************* REFERENCES *************************/
  [
    #bibliography(
      reference-path,
      title: "References",
      style: "american-psychological-association",
    )

    #pagebreak(weak: true)
  ]

  /************************* APPENDICES *************************/
  [
    #if appendices != none {
      // make heading refs. say "Appendix"
      set ref(supplement: it => {
        if it.func() == heading {
          "Appendix"
        }
      })

      show heading.where(level: 1): it => [
        #set par(justify: false, leading: 0.7em)
        #set text(size: 13pt)
        #upper("Appendix " + counter(heading).display()): #it.body
        #v(6pt)
      ]

      counter(heading).update(0)
      set heading(numbering: "A")

      // make figure numbering have A<num>
      show figure: it => i-figured.show-figure(it, numbering: (..nums) => "A" + repr(nums.pos().last()))

      for x in appendices [
        #heading(x.at(0))

        #x.at(1)

        #pagebreak(weak: true)
      ]
    }
  ]
}