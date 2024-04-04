#set page(
    margin: (x: 2cm, y: 2cm)
)
#set text(
    font: "New Computer Modern",
    size: 12pt,
    hyphenate: false,
)

#show heading: it => [
    #set text(14pt, weight: "bold")
    #align(center, block(upper(it.body)))
]

#show figure.caption: it => [
    #set text(11pt, style: "normal")
    #v(10pt)
    #strong(block([#it.supplement #it.counter.display(it.numbering): #it.body]))
]

#align(center, text(weight: "light", size: 16pt)[
    *DEVELOPMENT OF AN INTELLIGENT CODE REVIEWER RECOMMENDATIONS SYSTEM FOR PROGRAMMING CONVENTIONS*
    \
    \
    \
    BY
    \
    \
    \
    *EKEKWE,* TANYALOUISE KELECHI CHISOM

    *(20CG028072)*
    \
    \
    \
    \
    \
    *A PROJECT SUBMITTED TO THE DEPARTMENT OF COMPUTER AND INFORMATION SCIENCES, COLLEGE OF SCIENCE AND TECHNOLOGY, COVENANT UNIVERSITY OTA, OGUN STATE.*
    \
    \
    \
    \
    \
    *IN PARTIAL FULFILMENT OF THE REQUIREMENTS FOR THE AWARD OF THE BACHELOR OF SCIENCE (HONOURS) DEGREE IN COMPUTER SCIENCE.*
    \
    \
    \
    \
    \
    *APRIL, 2024*
])

#set par(
    justify: true,
    leading: 1.33em,
)

#set page(
    numbering: "i"
)

#par([
    = CERTIFICATION
    \

I hereby certify that this project, was carried out by Tanyalouise Kelechi Chisom EKEKWE in the Department of Computer and Information Sciences, College of Science and Technology, Covenant University, Ogun State, Nigeria, under my supervision.
])

#pagebreak()

#par([
    = DEDICATION
    \

This project is dedicated to God Almighty, my parents, siblings, friends and lecturers who have been a source of inspiration and encouragement to me throughout my stay in Covenant University.

])

#pagebreak()

#par([
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
    strong(it)
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
    text(weight: "regular", [#it])
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
    target: figure.where(kind: table)
)

#pagebreak(weak: true)

#par([
    = ABSTRACT
    \

ABSTRACT
])

#pagebreak(weak: true)


#set page(
    numbering: "1"
)

#counter(page).update(1)

#set heading(numbering: "1.1")

#show heading: it => [
    #set text(14pt, weight: "bold")
    #align(center, [#counter(heading).display() #upper(it.body)])
]