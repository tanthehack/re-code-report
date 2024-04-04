#import "template/bach.typ": bach

#show: content => bach(
    title: "DEVELOPMENT OF AN INTELLIGENT CODE REVIEWER RECOMMENDATIONS SYSTEM FOR PROGRAMMING CONVENTIONS",
    author: "Ekekwe Tanyalouise",
    matric: "30XX123456",
    supervisor: "Dr. Supervisor",
    reference-path: "../references.bib",
    content,
)

#par([
    = CHAPTER ONE: INTRODUCTION
    \
    == BACKGROUND INFORMATION
    \

    The evolution of coding standards and best practices has deep roots, dating back to the early days of programming @dijkstra_1972_structured. As software development methodologies and technologies have advanced, so too have coding standards. This co-evolution is particularly evident when examining the shift from structured programming in the 1960s to object-oriented programming in the 1980s @pratap_2023_the. Early coding standards emerged alongside structured programming to promote modular, readable code and followed a clear control flow; these characteristics became essential as software projects grew in complexity @michael_2015_the. Structured programming approaches like top­down design and control flow statements (if statements, loops) rely on well ­formatted code to be easily understandable and maintainable. Object-­oriented design principles like encapsulation and code reusability are best achieved through consistent naming conventions and code organization. 

\

Among software engineering techniques, programming conventions play a critical role in promoting the readability of source code @id_2023. These conventions, which can encompass aspects like indentation, naming conventions, and code formatting, act as a shared language for developers, allowing them to quickly grasp the purpose and structure of the code, even if written by someone else @chen_2018_an. /*Understandably, new programmers are eager to understand the basic functions of languages and to develop programs that work, often neglecting to apply coding conventions during their development workflow.*/ According to #cite(<kourie_2008_reflections>, form: "prose"), there is a need to formally educate students to become professional, responsible, and reliable developers capable of producing quality code. However, #cite(<wiese_2017_teaching>, form: "prose") identifies a gap in the existing literature directed at teaching programming conventions during the initial stages of programming education. A concerning find, as poorly formatted and inconsistently named code becomes a major hurdle as projects grow in size and complexity, hindering both understanding and maintenance. /*Furthermore, failing to follow established conventions creates friction within development teams, as inconsistent coding styles make it difficult for teammates to collaborate effectively.*/ If early adoption of programming conventions is prioritized, beginner programmers can lay a solid foundation of clean, maintainable, and collaborative code throughout their software development journey @keuing_tutoring. 

\

One potential solution to bridge this gap and encourage early adoption of coding conventions is through intelligent code review tools @kim_automated_code. These tools are already widely used in professional software development to automate tasks like identifying syntax errors and potential bugs @sadowski_mordern. In the context of learning conventions, these tools can be leveraged as a valuable learning resource for beginners. According to #cite(<bancroft_2006_program>, form: "prose"), feedback or recommendations are essential in the learning process, especially when they are available on request. Imagine a code reviewing tool that not only highlights potential errors but also flags sections that deviate from established coding standards. This real­ time feedback can raise beginners’ awareness of the importance of proper formatting, naming conventions, and code organization. By integrating educational resources and suggestions directly into the development workflow, intelligent code reviewing tools can become powerful allies for beginner programmers, helping them write clean, maintainable, and well ­structured code from the very beginning. 

\

While established code reviewing platforms like those offered by GitHub and Codacy are valuable tools in the programmer’s arsenal, they have a blind spot, coding conventions. These platforms primarily focus on identifying functional errors and bugs, ensuring the code works as intended @bada_modern. However, they often fall short in addressing whether the code adheres to established coding conventions. Some might offer essential error messages related to “code smells” or stylistic inconsistencies, but lack the depth and interactivity needed to be a true learning resource for beginners who need to understand the “why” behind coding conventions @wessel_github.  This gap in feedback leaves aspiring programmers vulnerable to developing bad habits and writing code that becomes a tangled mess down the line. 

\

Intelligent code reviewing tools, designed specifically for beginners, can address this limitation by transforming code review into a powerful learning resource. These tools leverage AI and established coding standards to go beyond simply highlighting missed conventions (Kim et. al., #cite(<kim_automated_code>, form: "year")) This study proposes a real­time mentor who does not just point out formatting issues (a language linter) but also suggests best practices and alternative approaches based on the specific code and its intended function. /*This personalized learning experience empowers beginners to adhere to conventions and truly understand the rationale behind them, fostering a deeper grasp of good coding practices.*/ The shift towards a more interactive and personalized learning experience could significantly improve the quality, maintainability, and understanding of code written by beginners. Ultimately, this will lead to a smoother transition into professional software development by equipping them with the necessary skills to write clean, maintainable, and collaborative code from the outset. 
])

#par([
    \
    == STATEMENT OF THE PROBLEM
    
    \

The initial stages of learning to program are often focused on core functionalities and building working programs, coding standards often get sidelined. Understandably, new programmers are eager to understand the basic functions of languages and to develop programs that work, often neglecting to apply coding conventions during their development workflow. According to research conducted by #cite(<joni_discourse>, form: "prose"), 90% of students used the wrong coding standards in programming exercises and #cite(<temp_semnatic>, form: "prose") finds that these bad habits persist up till into students’ 4th year of a BS degree. The tendency to skip learning these established practices can create significant problems for beginners down the line. By neglecting to adhere to coding standards and conventions, beginners risk developing poor coding habits that can impact the readability, maintainability, and scalability of their code @marko_benefits.

\

The effects of poor code quality don't stop at developers themselves. It adversely affects the software industry as a whole by introducing a concept known as technical debt @han_rem. Technical debt is a metaphor that refers to the hidden costs of neglecting good coding practices. Just like financial debt accrues interest over time, poorly written code accumulates complexity and becomes harder to understand and modify as the project grows @digkas_td.  This leads to several problems such as e.g, higher costs as bug fixes and new features become cumbersome, and an increased risk of software failure due to vulnerabilities.

\

Although existing code review platforms offer insights into basic coding style issues, there's an opportunity to enhance their capabilities for beginners, particularly by addressing the gap in feedback on the "why" behind conventions (Wessel et. al., #cite(<wessel_github>, form:"year")).  Understanding the rationale is crucial for preventing bad habits and tangled code that create future maintenance and collaboration challenges. This highlights the need for better integration of coding conventions into the learning process. This study aims to address this need by developing an intelligent code-reviewing tool with a tutoring focus. A novel approach that has the potential to significantly improve the overall quality of code produced in our industry.

])

#set enum(numbering: "i.")

#par([
    \
    == AIM AND OBJECTIVES

    \

    The aim of this study is to develop an intelligent code reviewing tool designed with a tutoring focus to empower beginner programmers in understanding and applying coding coventions using Natural Language Processing techniques and static code analysis. The objectives of this study are:

    \

    + To identify the specific challenges faced by beginner programmers in learning programming conventions.
    + To gather and process the coding styles and general standards data for the static code analyzer to identify potential style violations based on those datasets.
    + To design and develop the intelligent explanation module and the interactive guidance features of the code reviewing tool.
    + To design the user interface and user experience of the intelligent code review tool.
    + To implement a working prototype of the intelligent code review tool.
])

#par([
    \
    == METHODOLOGY
    
    \

    + Review of existing literature on programming education and analyzing and observation of existing systems.
    + Acquiring sufficient datasets from coding standards documents or open-source code repositories and processing them using data processing tools such as Python libraries (Pandas, Natural Language Toolkit (NLTK) or Spacy). 
    + Modelling and designing the components of the intelligent code review tool using UML diagrams such as an activitiy diagram, sequence diagram, use case diagram etc. as well as system architecture diagrams. 
    + Designing the user interface and user experince of the tool using the design tool Figma. 
    + Implementation of a working protoype of the tool using the React framework for the frontend, Rust for the static analyzer component and for the backend and transfer learning with Dolphin Model based on Mixtral @hartford_dolphin for the explanation module.

    \
])

#set enum(numbering: "1.")

#set par(
    justify: true,
    leading: 1em,
)

#show figure.where(
    kind: table
): set figure.caption(position: top)

#show figure.where(
    kind: table
): set block(breakable: true)

#figure(
table( 
    columns: (.2fr, 1fr, 1fr),
    inset: 10pt,
    align: (center, left, left),
    table.header[*S/N*][*OBJECTIVES*][*METHODOLOGY*], 
    $1$, 
    [ 
    To identify the specific challenges faced by beginner programmers in learning programming conventions.
    ], 
    [*Extensive Literature Review and Existing Systems*
        \ 
        + Review of existing literature on programming education
        + Direct analysis and observation of existing systems.
    ], 
    $2$, 
    [ 
        To gather and process the coding styles and general standards data for the static code analyzer to identify potential style violations based on those datasets.
    ], 
    [*Data Gathering and Processing*
    \ 
    + Acquiring sufficient datasets from coding standards documents or open-source code repositories
    + Processing the data using data processing tools such as Python libraries (Pandas, Natural Language Toolkit (NLTK) or Spacy).
    ], 
    $3$, 
    [ 
        To design and develop the intelligent explanation module and the interactive guidance features of the code reviewing tool.
    ],
    [
        *Design and Development of Components*
        \
    Modelling and designing the components of the intelligent code review tool using UML diagrams such as an activitiy diagram, sequence diagram, use case diagram etc. as well as system architecture diagrams.
    ],
    $4$, 
    [ 
        To design and develop the intelligent explanation module and the interactive guidance features of the code reviewing tool.
    ],
    [
        *Design and Development of Components*
        \
    Modelling and designing the components of the intelligent code review tool using UML diagrams such as an activitiy diagram, sequence diagram, use case diagram etc. as well as system architecture diagrams.
    ],
    $5$, 
    [ 
        To implement a working prototype of the intelligent code review tool.
    ],
    [
        *Implementation of a working Prototype*
        \
    Implementation of a working protoype of the tool using the React framework for the frontend, Rust for the static analyzer component and for the backend and transfer learning with Dolphin Model based on Mixtral @hartford_dolphin for the explanation module.
    ]
),
caption: [Objectives-Methodology Mapping Table]
)

#set par(
    justify: true,
    leading: 1.5em,
)

#par([
    \
    \
    == SIGNIFICANCE OF THE STUDY

    \

    This project proposes a novel intelligent code review tool that addresses the lack of beginner-friendly learning resources on coding conventions. By offering real-time feedback, explanations, and interactive guidance, this tool empowers beginners to write cleaner code from the outset, while also introducing a potentially revolutionary approach to developer education through open-source LLMs and interactive features.

    \

    The benefits of this project extend far beyond individual programmers. Widespread adoption of this tool by educational institutions can lead to a new generation of developers writing cleaner, more maintainable code. This translates to significant cost savings for businesses due to improved code quality and maintainability. Additionally, fostering a common understanding of coding conventions can enhance collaboration and communication among developers, leading to more efficient code reviews and faster development cycles. Finally, equipping beginner programmers with a solid foundation in coding conventions can significantly reduce the time and resources required to onboard them into new projects. Overall, this project has the potential to significantly impact the software development industry by empowering programmers, fostering innovation in education, and ultimately contributing to a more efficient and productive development landscape.
])

#par([
    \
    == SCOPE OF THE STUDY
    \

    This project maintains a strict development focus to address the gap in learning resources concerning coding conventions for beginner programmers.  The intelligent code reviewing tool being developed will leverage existing open-source large language models trained on code to provide explanations and justifications.  The user interface will prioritize clarity and ease-of-use for beginners, incorporating interactive features like visual aids, tutorials, and code refactoring suggestions to solidify understanding.  
    
    \

    While the project excludes user research or the development of entirely new LLM models, it will concentrate on fine-tuning existing open-source options.  Development will be completed within a 16-week timeframe, targeting beginner programmers with a foundational grasp of a chosen programming language. This clearly defined scope ensures the project remains focused on development while delivering a valuable tool to empower beginner programmers and enhance their coding skills. 
])

#par([
    \
    == LIMITATIONS OF THE STUDY
    \

    The major limitations of this study include the following:
    
    \

    + *Limited Language Support:* Initially, the tool will only be able to review code written in one programming language, limiting its reach to programmers using that specific language.
    
    + *Training Data Dependency:* The quality of explanations and justifications provided by the LLM component heavily relies on the training data.  Limited or biased data could lead to inaccurate or misleading responses.

    + *Limited Scope of Conventions:* The first iteration of the tool will focus on a core set of coding conventions.  We plan to expand the scope to address a wider range of conventions in future versions.
])

#par([
    \
    == STRUCTURE OF THE RESEARCH

    \

    Chapter One of the project contains an explanation of the project, problems with existing solutions, the need for an improved solution, the method of implementation, the significance of the study, and the limitations. Chapter Two describes the existing systems related to the project topic, the methodology, algorithm, and techniques used in related systems. Chapter Three describes the analysis and system design. Chapter Four shows the implementation of the system in detail and the results obtained. Chapter Five summarises the project and gives recommendations, suggestions, conclusions, and references.
])

#pagebreak(weak: true)

#par([
    = CHAPTER TWO: LITERATURE REVIEW
    \
    == PREAMBLE
    \

    The importance of coding conventions remains a hurdle for beginners in today's software development landscape, particularly when it comes to ensuring clean and well-formatted code. This literature review lays the groundwork for a solution: an intelligent code review system utilizing open-source, code-focused LLMs and static analysis. This literature begins with a review of programming conventions or coding standards, coding smells and code quality, code quality management, lack of programming conventions and it's effects. _not finished_
])

#par([
    \

    == REVIEW OF PROGRAMMING CONVENTIONS
    
    \

    Programming conventions, also known as coding conventions or coding standards, are repositories of rules and guidelines that encompass all aspects of improving code quality @smit_2011_code. These act as software development guidelines that set limitations, promote specific practices, or enforce constraints @rodrigues_2019_towards.  
    
    \

    However, programming conventions are not static. As programming languages evolve and new paradigms emerge, these conventions co-evolve to influence how code is structured, written, and maintained. For example, the transition from procedural languages, C, to object-oriented languages, C++ and Java, introduced entirely new conventions related to class structures, inheritance, and polymorphism @pressman_2014_software. 
])

#par([
    \

    === BRIEF HISTORY OF PROGRAMMING CONVENTIONS

    \

    In the early days, 1940s-1960s, of languages like FORTRAN and COBOL, conventions focused primarily on basic formatting and readability due to limited processing power and the linear nature of these languages @michael_2015_the. Clear documentation was crucial for maintaining code written on punch cards, so conventions often encouraged detailed comments and code structure mirroring the documentation layout.

    \

With the rise of procedural programming languages like C in the 1960s-1980s, conventions evolved to address modularity and control flow. Indentation became a cornerstone for defining code blocks and functions, promoting better organization and readability @kernighan_c. As code sharing and collaboration increased, platform-specific conventions emerged to ensure portability and maintainability across different systems @pressman_2014_software.

    \

The shift to object-oriented languages like C++ and Java in the 1980s-2000s necessitated entirely new conventions for class structures, inheritance, and polymorphism @meyer_obj. Community-driven coding standards like PEP 8 for Python, @vanrossum_2001_pep, or Google's JavaScript Style Guide further emphasized code consistency within specific programming communities @google. These trends continue in the modern age, with conventions focusing on maintainability and scalability in complex, distributed software projects @beck_xp Integration with code analysis tools further enforces adherence to conventions, ensuring clean, maintainable code remains a priority regardless of the programming language or paradigm used.
])

#par([
    \

    === MAIN TYPES OF PROGRAMMING CONVENTIONS

    \

    There three main types of coding conventions which include: Naming conventions, Formatting conventions and commenting conventions.

    \

    In programming, naming conventions establish guidelines for naming variables, functions, classes, and other code elements. These conventions promote consistency, clarity, and readability throughout the codebase @herka_naming. Following them allows developers to readily grasp the purpose and role of different code elements. For instance, using descriptive names like `calculateTotalPrice` instead of cryptic abbreviations enhances code understandability and maintainability @pugh_2018.

    \

    Formatting conventions encompass practices related to the visual structure of code. These conventions dictate aspects such as indentation, spacing, line breaks, and the use of code blocks @piater_2005_formatting. Adhering to formatting standards enhances code maintainability and comprehension. Consistent formatting makes code easier to read, debug, and modify, especially when multiple developers collaborate on a project @broad.

    \

    Commenting conventions provide guidelines for writing clear, concise, and informative comments within the codebase @piater_2005_formatting. Comments are essential for explaining the functionality and intent of the code, especially in complex or critical sections. Effective comments help developers understand the reasoning behind specific code decisions, making it easier to maintain and update the code in the future @broad.
])

#par([
    \

    == REVIEW ON CODING SMELLS AND CODE QUALITY

    \

In software development, code quality plays a pivotal role in determining the reliability, maintainability, and efficiency of a software system. While robust code ensures a program's reliability and efficiency, clear and readable code simplifies future modifications and updates. High-quality code not only enhances the functionality and performance of an application but also simplifies the process of future modifications and updates. 

    \

    Code quality is a concept that lacks a precise definition in the literature, often characterized by vague and varied interpretations @keuning_quality. To comprehensively assess or categorize code quality, it is essential to consider the static properties of the code as opposed to the dynamic properties of code such as correctness, test coverage, and runtime performance. The evaluation of these static properties, as outlined by #cite(<stegeman>, form: "prose"), encompasses criteria such as documentation, layout, naming, flow, expressions, idiom, decomposition, and modularization. Adherence to coding standards is essential across all these categories to ensure a high level of code quality.
    
    \

    However, problems found in these categories (Stegeman et. al., #cite(<stegeman>, form: "year")), are called "code smells". This term was introduced by #cite(<fowler_refac>, form: "prose"). Code smells might hint at deeper problems in the design of functionally correct code, affecting the quality of code @tufano_smells, @alb_detect. These smells can be a consequence of prioritizing short-term goals like reusability over long-term maintainability. While reusability is desirable for well-crafted software @pandey, pressures like frequent requirement changes, increasing project size, and time constraints can lead to code deterioration @verma_smells.

    \

    One crucial aspect of code quality lies in the inherent trade-offs developers face when optimizing different code characteristics. For instance, prioritizing code readability and understandability might come at the expense of achieving peak performance @sas_trade. Conversely, highly optimized code for speed might be less maintainable in the long run, requiring more effort for future modifications.
])

#par([
    \
    
    == REVIEW ON CODE QUALITY MANAGEMENT

    \

    Code quality management refers to the systematic process of overseeing and ensuring the quality of code within a software development project. It involves implementing strategies, practices, and tools to maintain high standards of reliability, maintainability, and efficiency in the codebase @sonar_what.

    \
    
    For a long time, peer code review, a manual inspection of code by other developers on a software development team, has been recognised at a tool for improving the quality of code (Sadowski et. al., #cite(<sadowski_mordern>, form: "year")). Through peer code review, developers can identify potential issues like bugs, code smells, and suboptimal coding practices. This collaborative approach fosters knowledge sharing, improves coding consistency, and ultimately elevates the overall quality of the codebase.
])

#par([
    \

    === MODERN CODE REVIEW: A STREAMLINED APPROACH

    \

    However, the limitations of manual code review or peer review in today's fast-paced development environments are becoming increasingly apparent.  The sheer volume of code produced, coupled with time constraints, can make thorough code review a challenge (Sadowski et. al., #cite(<sadowski_mordern>, form: "year")). The immediate solution adopted today to this limitation is called Mordern Code Review (MCR). MCR is a lightweight approach to traditional code inspections or peer review (Badampudi et al., #cite(<bada_modern>, form: "year")). 

    \

    MCR's process as explained in the works by Badampudi et al., (#cite(<bada_modern>, form: "year")) follows a series of six main steps that integrate with version contol systems (e.g., Gerrit, Github and GitLab). The steps involved in this process include:

    \

+ In _Step 1_, the code author(s) or developers submit code or changes. Usually, version control systems like Gerrit and Github are used, the developer creates a pull request. 

+ In _Step 2_, the project or code owner selects one or more reviewers, using heuristics, to review the new pull requests made by the code author(s). 

+ In _Step 3_, the reviewer(s) are notified of their assignement. In 

+ In _Step 4_, the reviewer(s) check the code for defects or suggest improvement. 

+ In _Step 5_, the reviewer(s) and author(s) discuss the feedback from the review. 

+ In _Step 6_, the pull request or code change is rejected or sent back to the author(s) for refinement. If no further rework is required, the code change is merged into the codebase.

    \

    #figure(
        image("images/mcrSteps.png", width: 100%),
        caption: [
            Overview of steps in modern code reviews, adapted from (Badampudi et al., #cite(<bada_modern>, form: "year"))
        ],
    )
])

#par([
    \
    
    === INTELLIGENT CODE REVIEW TOOLS

    \

    Software development teams using the MCR process struggle to keep pace with the ever-increasing scale of software projects @core_2019, as code reviewers often have to allocate a huge amount of time in performing code review tasks due to the amount of code changes in large-scale codebases. While some part of the code review processes have been automated with the use of linters or static analysis tools that contain rules related to coding best practices @bielik_2017, there's still a huge amount of effort put into the review process, as these tools mainly detect common issues and leave important aspects such as defects, architectural issues, and testing for code @gupta_2018.

    \
    
    Although defect detection remains important in these code review processes @ling_and, industry developers increasingly value code quality aspects that promote long-term maintainability, understanding of source code and code improvement @bacchelli_2013. Many research studies aim to reduce the amount of time spent on code review processes by providing solutions to close the learning gap of these systems. Research work such as DeepCodeReviewer (DCR) by @gupta_2018, aims to recommend reviews by learning the relevancy between the source code and review and Code Review Bot, (Kim et. al., #cite(<kim_automated_code>, form: "year")), is designed to process review requests holistically regardless of such environments, and checks various quality-assurance items such as potential defects in the code, coding style, test coverage, and open source license violations.

    \

    Essentially, intelligent code review tools, such as DeepCodeReviewer (DCR) and Code Review Bot, use deep learning and automation to enhance the code review process. DCR, for example, recommends relevant code reviews based on historical data, while Code Review Bot checks for potential defects, coding style, test coverage, and open source license violations. These tools have been found to be effective in improving the efficiency of change-based code review. They have also been well-received by developers, with positive feedback and active response to reviews.
])

#par([
    \

    === STATIC ANALYSIS

    \


])

#par([
    \

    == REVIEW ON THE EFFECTS OF UNCLEAN CODE
])

#par([
    \

    === TECHINICAL DEBT
])

#par([
    \

    == REVIEW OF RELEVANT CONCEPTS

    \

    + artificial intelligence
    + transfer learning
    + LLMs
    + static analysis:
        + parsing
        + tokenization: lexical analysis
        + syntatic analysis
        + AST

])


#par([
    \

    == REVIEW OF RELATED METHODS
])

#par([
    \

    == REVIEW OF EXISTING SYSTEMS
])