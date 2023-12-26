#set page(
    margin: (x: 2cm, y: 2cm)
)
#set text(
    font:  "New Computer Modern",
    // font: "Times New Roman",
    size: 14pt,
    hyphenate: false,
)

#set par(
    justify: true,
    leading: 1.5em,
)

#show heading: it => [
    #set text(14pt, weight: "bold")
    #align(center, block(upper(it.body)))
]

#show figure.caption: it => [
    #set text(9pt, style: "italic")
    #v(8pt)
    #block([#it.supplement #it.counter.display(it.numbering): #it.body])
]

#align(center, text(weight: "light" )[
    (title)
    \
    \
    \
    BY
    \
    \
    *EKEKWE,* TANYALOUISE KELECHI CHISOM

    *(20CG028072)*
    \
    \
    \
    *A PROJECT SUBMITTED TO THE DEPARTMENT OF COMPUTER AND INFORMATION SCIENCES, COLLEGE OF SCIENCE AND TECHNOLOGY, COVENANT UNIVERSITY OTA, OGUN STATE.*
    \
    \
    \
    *IN PARTIAL FULFILMENT OF THE REQUIREMENTS FOR THE AWARD OF THE BACHELOR OF SCIENCE (HONOURS) DEGREE IN COMPUTER SCIENCE.*
    \
    \
    \
    *JULY, 2024*
])

#set page(
    numbering: "i"
)

#par(text(weight: "light" )[
    = CERTIFICATION
    \

I hereby certify that this project, was carried out by Tanyalouise Kelechi Chisom EKEKWE in the Department of Computer and Information Sciences, College of Science and Technology, Covenant University, Ogun State, Nigeria, under my supervision.
])

#pagebreak()

#par(text(weight: "light" )[
    = DEDICATION
    \

This project is dedicated to God Almighty, my parents, siblings, friends and lecturers who have been a source of inspiration and encouragement to me throughout my stay in Covenant University.

])

#pagebreak()

#par(text(weight: "light" )[
    = ACKNOWLEDGEMENTS
    \

    TEXT HERE

])

#pagebreak()

#set outline(
    fill: ""
)

#show outline.entry.where(
    level: 1,
): it => {
    v(5pt)
    strong(upper(it))
}

= Table of Contents

\

#table(
    columns: (1fr, auto, auto),
  [*CONTENT*], [*PAGE*],
  stroke: none,
  inset: 0pt,
)

#outline(
    title: "",
    indent: auto
)

#pagebreak()

#show outline.entry.where(
    level: 1,
): it => {
    v(8pt, weak: true)
    strong(upper(it))
}

= List of Figures

\

#table(
    columns: (1fr, auto, auto),
  [*CONTENT*], [*PAGE*],
  stroke: none,
  inset: 0pt,
)

#outline(
    title: "",
    target: figure.where(kind: image)
)

#pagebreak(weak: true)

= List of Tables

\

#table(
    columns: (1fr, auto, auto),
  [*CONTENT*], [*PAGE*],
  stroke: none,
  inset: 0pt,
)

#outline(
    title: "",
    target: figure.where(kind: image)
)

#pagebreak(weak: true)

#par(text(weight: "light" )[
    = ABSTRACT
    \

ABSTRACT
])

