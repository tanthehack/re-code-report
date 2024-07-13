#import "temp.typ": *

#show: content => bach(
  title: "Development of an Intelligent Code Review Tool",
  names: "Tanyalouise Kelechi Chisom",
  surname: "Ekekwe",
  matric: "20CG028072",
  supervisor: "Dr. Itunuoluwa E. Isewon",
  reference-path: "./references.bib",
  date: datetime(year: 2024, month: 7, day: 1),
  programme: "Computer Science",
  abstract: [
    This project introduces an intelligent code review tool designed to enhance code quality and enforce programming conventions across different skill levels. The issue of poor code quality, stemming from the neglect of coding standards, presents significant challenges in software development, leading to increased technical debt and maintenance difficulties. To address this problem, the proposed tool leverages a pretrained Large Language Model (LLM), CodeLlama, and static analysis techniques to dynamically identify and provide feedback on code violations. The LLM offers contextual explanations, helping developers understand the rationale behind coding standards. \
    The methodology involved integrating the LLM with a static analysis engine, creating an intuitive user interface using React and Tailwind CSS, and ensuring efficient state management with React Redux Toolkit and Query. The backend was developed using Express.js and Python's Flask framework to manage API endpoints and interact with the LLM. User feedback was collected through interviews, focusing on metrics such as user experience, interface intuitiveness, and feedback clarity. Results from the evaluation indicate that users found the tool intuitive and its feedback helpful and clear. Comparisons with existing tools, such as FrenchPress, showed that the intelligent code review tool offers a broader scope of code issues and dynamic, contextually relevant feedback. Users reported higher satisfaction and perceived the tool as a significant improvement over current code review solution.

  ],
  dedication: [
    I dedicate this work to God, who has been my very present help in times of need during my 4-year journey in this institution. I also dedicate this work to my friends and family, who support me.
  ],
  acknowledgements: [
    My most profound gratitude goes to Almighty God, who has kept me and sustained me right from the very start of my degree up until this point. To Him be all the glory.
    
    I want to express my sincere gratitude to my younger sister, Daniella Ekekwe, who encourages me to follow my passion for computer science, especially during this project.
    
    I am extremely grateful to my parents, Mr. and Mrs. Ekekwe for their sacrifices, contributions, and prayers towards the completion of this degree. I am extremely privileged to have them in my life.
    
    My sincere gratitude also goes to my hardworking supervisor and co-supervisor, Dr. Itunuoluwa Isewon and Ms. Nathaniel Jemimah, who continuously provided their support throughout this project duration. Thank you for your excellent supervision and guidance.
  ],
  abbreviations: (
    "LLM: Large Language Model",
    "API: Application Programming Interface",
    "SCA: Software Composition Analysis",
    "CNN: Convolutional Neural Network",
    "JWT: JSON Web Token",
    "GGUF: GPT-Generated Unified Format",
    "RTK: Redux React ToolKit",
    "NLP: Natural Language Processing",
    "AI: Artificial Intelligence",
    "MCR: Modern Code Review",
    "CI/CD: Continuous Integration/Continuous Deployment",
    "TD: Technical Debt",
    "JSON: JavaScript Object Notation",
    "CSS: Cascading Style Sheet",
    "DCR: DeepCodeReviewer",
    "MCR: Modern Code Review",
    "SVM: Support Vector Machines",
    "DQN: Deep Q-Networks",
    "AST: Abstract Syntax Tree",
    "GPU: Graphics Processing Unit",
    "RAM: Random Access Memory",
  ),
  content,
)

= Introduction

== Background Information

The evolution of coding standards and best practices has deep roots, dating back to the early days of programming @structured. As software development methodologies and technologies have advanced, so have coding standards. This co‐evolution is particularly evident when examining the shift from structured programming in the 1960s to object‐oriented programming in the 1980s @pratap_evolution_2023. Early coding standards or programming conventions emerged alongside structured programming to promote modular, readable code and followed a clear control flow; these characteristics became essential as software projects grew in complexity (Oviedo, 1984). Structured programming approaches like top-down design and control flow statements (if statements, loops) rely on well formatted code to be easily understandable and maintainable (Kostyrko et al., 2023). Object‐oriented design principles like encapsulation and code reusability are best achieved through consistent naming conventions and code organization.

Among software engineering techniques, programming conventions play a critical role in promoting the readability of source code (Oliveira et al., 2020). These conventions, which can encompass aspects like indentation, naming conventions, and code formatting, act as a shared language for developers, allowing them to quickly grasp the purpose and structure of the code, even if written by someone else (Chen et al., 2018). According to Kourie & Pieterse (2008a), there is a need to formally educate students to become professional, responsible, and reliable developers capable of producing quality code. However, Wiese et al. (2017) identifies a gap in the existing literature directed at teaching programming conventions during the initial stages of programming education. A concerning find, as poorly formatted and inconsistently named code becomes a significant hurdle as projects grow in size and complexity, hindering both understanding and maintenance. If early adoption of programming conventions is prioritized, beginner programmers can lay a solid foundation of clean, maintainable, and collaborative code throughout their software development journey (Keuning et al., 2021).

One potential solution to bridge this gap and encourage early adoption of programming conventions is through intelligent code review tools (Kim et al., 2022). These tools are already widely used in professional software development to automate tasks like identifying syntax errors and potential bugs (Sadowski et al., 2018). In the context of learning conventions, these tools can be leveraged as a valuable learning resource for beginners. According to Bancroft & Roe (2006), feedback or recommendations are essential in the learning process, especially when they are available on request. Valuable feedback that can improve proper understanding of programming conventions can be provided by a code reviewing tool that not only highlights potential errors but also flags sections that deviate from established coding standards. This real time feedback can raise beginners’ awareness of the importance of proper formatting, naming conventions, and code organization. By integrating educational resources and suggestions directly into the development workflow, intelligent code reviewing tools can become powerful allies for beginner programmers, helping them write clean, maintainable, and well-structured code from the very beginning.

While established code reviewing platforms like those offered by GitHub and Codacy are valuable tools in the programmer’s arsenal, they have a blind spot, programming conventions. These platforms primarily focus on identifying functional errors and bugs, ensuring the code works as intended (Badampudi et al., 2023). However, they often fall short in addressing whether the code adheres to established programming conventions. Some might offer essential error messages related to “code smells” or stylistic inconsistencies but lack the depth and interactivity needed to be a true learning resource for beginners who need to understand the “why” behind coding conventions (Wessel et al., 2020). This gap in feedback leaves aspiring programmers vulnerable to developing bad habits and writing code that becomes a tangled mess down the line.

Intelligent code reviewing tools, designed specifically for beginners, can address this limitation by transforming code review into a powerful learning resource. These tools leverage AI and established coding standards to go beyond simply highlighting missed conventions (Kim et al., 2022). This study proposes a real-time mentor who does not just point out formatting issues (a language linter) but also suggests best practices and alternative approaches based on the specific code and its intended function. The shift towards a more interactive and personalized learning experience could significantly improve the quality, maintainability, and understanding of code written by beginners (Shen & Lee, 2020). Ultimately, this will lead to a smoother transition into professional software development by equipping them with the necessary skills to write clean, maintainable, and collaborative code from the outset. 

== Statement of the Problem
In the early stages of learning how to program, much attention is focused on how to implement basic functionality and compose a running program; thus, coding standards are usually disregarded. As noted by Kirk et al. (2020), there is a considerable gap in the instruction of code quality: 30% of introductory university programming courses include it. It is for this very reason that novice programmers are often unable to become very sensitive to code quality. Understandably, new programmers are eager to understand the basic functionalities of languages and develop programs that work, often neglecting to apply coding conventions during their development workflow (Kohlbacher et al., 2023). According to research conducted by Joni & Soloway (1986), 90% of students used the wrong coding standards in programming exercises, and Ruvo et al. (2018) finds that these bad habits persist up till into students’ 4th year of a BS degree. New coders often avoid learning conventional methods; however, disregarding coding standards and conventions encourages bad coding habits that affect code readability, maintainability, and scalability in the long run (Popić et al., 2018).

The effects of poor code quality don’t stop at the developers themselves. It adversely affects the software industry as a whole, by introducing a concept known as technical debt (Han et al., 2020). Technical debt is a metaphor that refers to the hidden costs of neglecting good coding practices. Just as financial debt accrues interest over time, poorly written code accumulates complexity and becomes harder to understand and modify as the project grows (Digkas et al., 2022). Poor code quality leads to problems such as higher costs as bug fixes and new features become cumbersome and an increased risk of software failure due to vulnerabilities.

Although existing code review platforms offer insights into basic coding style issues, there’s an opportunity to enhance their capabilities for beginners, particularly by addressing the gap in feedback on the “why” behind conventions (Wessel et al., 2020). Understanding the rationale is crucial for preventing bad habits and tangled codes that create future maintenance and collaboration challenges. This highlights the need to integrate coding conventions into the learning process better. This study addresses this need by developing an intelligent code‐reviewing tool with a tutoring focus. A novel approach that has the potential to significantly improve the overall quality of code produced in our industry.

== Aims and Objectives

The aim of this study is to develop an intelligent code‐reviewing tool designed with a tutoring focus to empower beginner programmers in understanding and applying coding conventions using a pretrained Large Language Model and simple static code analysis. The objectives of this study are:

+ To identify the specific challenges beginner programmers face in learning programming conventions. 
+ To gather and process the coding styles and general standards data for the static code analysers to identify potential style violations based on those datasets. 
+ To design and develop the intelligent explanation module and the interactive guidance features of the code reviewing tool. 
+ To design the user interface (UI) and user experience (UX) of the intelligent code review tool. 
+ To implement a working prototype of the intelligent code review tool. 

== Methodology

+ Review existing literature on programming conventions and analyse and observe existing systems.
+ Acquiring sufficient datasets from coding standards documents or open‐source code repositories and processing them using data processing tools such as Python libraries (Pandas, Natural Language Toolkit (NLTK), or Spacy).
+ Modelling and designing the intelligent code review tool components using UML diagrams such as an activity diagram, sequence diagram, use case diagram, etc., and system architecture diagrams.
+ Designing the user interface (UI) and user experience (UX) of the tool using the design tool Figma.
+ Implementation of a working prototype of the tool using the React frame- work for the frontend, Rust for the static analyser component, and for the backend and transfer learning with the CodeLlama‐7B‐Instruct‐GGUF Model based off of Meta’s CodeLlama 7b Instruct (Rozière et al., 2023a) for the explanation module.

#table-figure(
  caption: "Objectives Methodology Mapping Table",
  table(
    columns: 3,
    table.header([S/N], [Objectives], [Methodology]),
    [1], 
    [To identify the specific challenges faced by beginner programmers in learning programming conventions.], 
    [*Extensive Literature Review and Existing Systems* 

    Review existing literature related to beginner developers and programming conventions and Analyze and observe existing systems.],
    
    [2],
    [To design and develop the intelligent explanation module and the interactive guidance features of the code reviewing tool.],
    [*Design and Development of Components*
    
    Modelling and designing the intelligent code review tool components using UML diagrams such as an activity diagram, sequence diagram, use case diagram, etc., and system architecture diagrams.],

    [3],
    [To design the user interface (UI) and user experience (UX) of the intelligent code review tool.],
    [*UI/UX Design of Components*
    
    Designing the user interface (UI) and user experience (UX) of the tool using the design tool Figma.],

    [4],
    [To implement a working prototype of the intelligent code review tool.],
    [*Implementation of a working Prototype*
    
    Implementation of a working prototype of the tool using the React framework for the frontend, Redux Toolkit (RTK) Query for the Git Authentication and API endpoints, Rust for the static analyser component, and Node.JS for the backend. Implementing the explanations module using CodeLlama‐7B‐Instruct‐GGUF Model based off of Meta’s CodeLlama 7b Instruct (Rozière et al., 2023a).]
  )
)

== Significance of the Study
This project suggests a new intelligent code reviewing tool that tackles the absence of beginner friendly learning materials for beginners on conformity to syntax. First, through prompt feedback, clear explanations and counselling that is interactive, this tool enables novices to produce neat code which could present an entirely different method regarding teaching programmers via open source LLMs as well as interactive functions.

The benefits of this project extend beyond individual programmers as the integration of the proposed tool in teaching can result to cleaner and more maintainable code in the software development industry down the line. This improvement in code will also translate into significant decrease in cost for businesses. Additionally, fostering a common understanding of coding conventions can enhance collaboration and communication among developers, leading to more efficient code reviews and faster development cycles.

Most importantly, a proper grasp of coding conventions by new programmers can minimize the time and resources to be invested in orienting them for new projects. Generally speaking, this project is likely to have a very high impact on the software development industry because it empowers the programmer; it may spur innovative education and, at last, contribute to building an environment of development that is more efficient and productive.

== Scope of the Study 
This project maintains a strict development focus to address the gap in learning resources concerning programming conventions for beginner programmers. The intelligent code reviewing tool being developed will leverage existing open‐source large language models trained on code to provide explanations and justifications. 

The Interface of the system is designed to be easy and intuitive for new users. It contains interactive elements, such as step-by-step guidance through tutorials or visual guidance, all the way to the point where code refactoring recommendations are made to help them understand code violations they make in their code. This work targets the enhancement of existing open-source, large language models (LLMs) with quick engineering solutions, with no need to conduct user studies or create new LLM architectures.

While it does not include user research or the creation of entirely new LLM models, the project still intends to make existing pretrained open-source LLMs more effective by utilising prompt engineering techniques. It will involve development during the 16 weeks, and its target audience will be programmers at the beginner level who have some knowledge of JavaScript.
With this scope, we make it clear that the project is focused on the task of development but, at the same time, serves a beneficial objective—providing a handy tool for empowering beginner-level programmers to improve their coding skills.

== Limitations of the Study

The major limitations of this study include the following:

+ Limited Language Support: Initially, the tool will only be able to review code written in one programming language, JavaScript, limiting its reach to programmers using that specific language.
+ Pretrained Model Dependency: The quality of the explanations and justifications provided by the LLM component is heavily dependent on the data used during its pretraining. If the pretrained model has been exposed to limited or biased data, it could result in inaccurate or misleading responses.
+ Limited Scope of Conventions: The first iteration of the tool will focus on a core set of coding conventions. While these conventions are widely accepted and used, they may not cover all possible coding standards or best practices.

== Structure of the Research

Chapter One of the project contains an explanation of the project, problems with existing solutions, the need for an improved solution, the method of implementation, the significance of the study, and the limitations. Chapter Two describes the existing systems related to the project topic, the methodology, algorithm, and techniques used in related systems. Chapter Three describes the analysis and system design. Chapter Four shows the implementation of the system in detail and the results obtained. Chapter Five summarizes the project and gives
recommendations, suggestions, conclusions, and references.

#pagebreak(weak: true)

= Literature Review

== Preamble

The importance of coding conventions remains a hurdle for beginners in today’s software development landscape, particularly when it comes to ensuring clean and well‑formatted code. This literature review lays the groundwork for a solution: an intelligent code review system utilizing open‑source, code‑focused LLMs and static analysis. This literature encompasses the review of programming conventions or coding standards, coding smells and code quality, code quality management, lack of programming conventions and its effects

== Review of Programming Conventions

Programming conventions, also known as coding conventions or coding standards, are repositories of rules and guidelines that encompass all aspects of improving code quality @smit_code_2011. These guidelines within software development define borders, recommend certain methodologies or impose limits affecting designers’, developers’ and maintainers’ approach to software systems @rodrigues_towards_2019.

However, programming conventions are not static. As programming languages evolve and new paradigms emerge, these conventions co evolve to influence how code is structured, written, and maintained. For example, the transition from procedural languages, C, to object oriented languages, C++ and Java, introduced entirely new conventions related to class structures, inheritance, and polymorphism @pressman_software_2014.

=== Brief History of Programming Conventions

In the early days, 1940s 1960s, of languages like FORTRAN and COBOL, conventions focused primarily on basic formatting and readability due to limited processing power and the linear nature of these languages (Medoff, 2015). Clear documentation was crucial for maintaining code written on punch cards, so conventions often encouraged detailed comments and code structure mirroring the documentation layout.

With the rise of procedural programming languages like C in the 1960s 1980s, conventions evolved to address modularity and control flow. Indentation became a cornerstone for defining code blocks and functions, promoting better organization and readability (Kernighan & Ritchie, 1978). As code sharing and collaboration increased, platform specific conventions emerged to ensure portability and maintainability across different systems (Pressman & Maxim, 2014).

The shift to object oriented languages like C++ and Java in the 1980s 2000s necessitated entirely new conventions for class structures, inheritance, and polymorphism (Meyer, 1997). Community driven coding standards like PEP 8 for Python, (van Rossum et al., 2001), or Google’s JavaScript Style Guide further emphasized code consistency within specific programming communities (Google, n.d.). These trends continue in the modern age, with conventions focusing on maintainability and scalability in complex, distributed software projects (Beck, 1999). Integration with code analysis tools further enforces adherence to conventions, ensuring clean, maintainable code remains a priority regardless of the programming language or paradigm used.

=== Main Types of Programming Conventions

There three main types of coding conventions which include: Naming conventions, Formatting conventions and commenting conventions. In programming, naming conventions establish guidelines for naming variables, functions, classes, and other code elements. These conventions promote consistency, clarity, and readability throughout the codebase @herka_naming_2022. Following them allows developers to readily grasp the purpose and role of different code elements. For instance, using descriptive names like calculateTotalPrice instead of cryptic abbreviations enhances code understandability and maintainability @pugh_brief_2018. Below, in figure 2.1, are some examples of naming conventions in Python:

#code-figure(
    ```py
  # Variable and function names in lowercase_with_underscores
  total_count = 0
  calculate_total()

  # Class names in CapitalizedCamelCase
  class UserAccount:
      pass

  # Constant names in ALL_CAPS
  PI = 3.14159
  ```, 
  caption: "Some naming conventions in python",
)

Formatting conventions encompass practices related to the visual structure of code. These conventions dictate aspects such as indentation, spacing, line breaks, and the use of code blocks @piater_formatting_2005. Adhering to formatting standards enhances code maintainability and comprehension. Consistent formatting makes code easier to read, debug, and modify, especially when multiple developers collaborate on a project .

Commenting conventions provide guidelines for writing clear, concise, and informative comments within the codebase @huang_guiding_2018. Comments are essential for explaining the functionality and intent of the code, especially in complex or critical sections. Huang et al. (#cite(<huang_guiding_2018>, form: "year")) highlights challenges faced by developers in sticking to using commenting conventions in their development processes. He proposes a tool, CommentSuggester, to guide developers in making informed commenting decisions. Established from various sources, effective comments help developers understand the reasoning behind specific code decisions, making it easier to maintain and update the code in the future proposes a method @haouari_how_2011 @rani_what_2021.

== Review on Coding Smells and Code Quality

In software development, code quality plays a crucial role in determining the reliability, maintainability, and efficiency of a software system. While robust code ensures a program’s reliability and efficiency, clear and readable code simplifies future modifications and updates. High quality code not only enhances the functionality and performance of an application but also simplifies the process of future modifications and updates.

Code quality is a concept that lacks a precise definition in the literature, often characterized by vague and varied interpretations @keuning_systematic_2023. To comprehensively assess or categorize code quality, it is essential to consider the static properties of the code as opposed to the dynamic properties of code such as correctness, test coverage, and runtime performance. The evaluation of these static properties, as outlined by Stegeman et al. (#cite(<stegeman_designing_2016>, form: "year")) encompasses criteria such as documentation, layout, naming, flow, expressions, idiom, decomposition, and modularization. Adherence to coding standards is essential across all these categories to ensure a high level of code quality. 

However, problems found in these categories @stegeman_designing_2016, are called “code smells”. This term was introduced by Fowler, (#cite(<fowler_refactoring_1999>, form: "year")). Code smells might hint at deeper problems in the design of functionally correct code, affecting the quality of code @albuquerque_integrating_2023 @tufano_when_2015. These smells can be a consequence of prioritizing short term goals like reusability over long term maintainability. While reusability is desirable for well crafted software @pandey_framework_2020, pressures like frequent requirement changes, increasing project size, and time constraints can lead to code deterioration @verma_code_2023.

One crucial aspect of code quality lies in the inherent trade offs developers face when optimizing different code characteristics. For instance, prioritizing code readability and understandability might come at the expense of achieving peak performance @sas_quality_2020. Conversely, highly optimized code for speed might be less maintainable in the long run, requiring more effort for future modifications.

== Review on Code Quality Management
Code quality management refers to the systematic process of overseeing and ensuring the quality of code within a software development project. It involves implementing strategies, practices, and tools to maintain high standards of reliability, maintainability, and efficiency in the codebase @plosch_method_2010.

For a long time, peer code review, a manual inspection of code by other developers on a software development team, has been recognised at a tool for improving the quality of code @sadowski_modern_2018. Through peer code review, developers can identify potential issues like bugs, code smells, and suboptimal coding practices. This collaborative approach fosters knowledge sharing, improves coding consistency, and ultimately elevates the overall quality of the codebase.

=== Modern Code Review: A Streamlined Approach

However, the limitations of manual code review or peer review in today’s fast paced development environments are becoming increasingly apparent. The sheer volume of code produced, coupled with time constraints, can make thorough code review a challenge @sadowski_modern_2018. The immediate solution adopted today to this limitation is called Mordern Code Review (MCR).

MCR is a lightweight approach to traditional code inspections or peer review @badampudi_modern_2023. During the process, one or more reviewers assess the code for errors, adherence to coding standards, test coverage, and more. These MCR tools automate many aspects of the review process, making it faster and more efficient compared to traditional peer review methods that rely solely on manual processes @qiao_code_2024. For example, tools like GitHub, GitLab, and provide features such as inline commenting, automated code formatting checks, and integration with Continuous Integration/Continuous Deployment (CI/CD) pipelines, streamlining the review process.

MCR’s process, as explained in the works by Badampudi et al. (#cite(<badampudi_modern_2023>, form: "year")), follows a series of six main steps, shown in figure 2.2, that integrate with version control systems (e.g., Gerrit, GitHub and GitLab). The steps involved in this process include:
+	In Step 1, the code author(s) or developers submit code or changes. Usually, version control systems like Gerrit and GitHub are used, the developer creates a pull request. 
+	In Step 2, the project or code owner selects one or more reviewers, usually using heuristics, to review the new pull requests made by the code author(s). 
+ In Step 3, the reviewer(s) are notified of their assignment. 
+ In Step 4, the reviewer(s) check the code for defects or suggest improvement.
+ In Step 5, the reviewer(s) and author(s) discuss the feedback from the review.
+	In Step 6, the pull request or code change is rejected or sent back to the author(s) for refinement. If no further rework is required, the code change is merged into the codebase.

#figure(
  image("images/mcrSteps.png", width: 120%),
  caption: [Overview of steps in modern code reviews, adapted from Badampudi et al. (#cite(<badampudi_modern_2023>, form: "year"))],
)

#pagebreak(weak: true)

=== Intelligent Code Review Tools

Software development teams using the MCR process struggle to keep pace with the ever increasing scale of software projects @j_siow_core_2019, as code reviewers often have to allocate a huge amount of time in performing code review tasks due to the amount of code changes in large scale codebases. While some part of the code review processes have been automated with the use of linters or static analysis tools that contain rules related to coding best practices @bielik_learning_2017, there’s still a huge amount of effort put into the review process, as these tools mainly detect common issues and leave important aspects such as defects, architectural issues, and testing for code @gupta_intelligent_2018.

Although defect detection remains important in these code review processe @fan_efficiently_2018, industry developers increasingly value code quality aspects that promote long term maintainability, understanding of source code and code improvement @alberto_bacchelli_expectations_2013. Many research studies aim to reduce the amount of time spent on code review processes by providing solutions to close the learning gap of these systems. Research work such as DeepCodeReviewer (DCR) by Gupta (#cite(<gupta_intelligent_2018>, form: "year")), aims to recommend reviews by learning the relevancy between the source code and the review. The Code Review Bot, @kim_understanding_2022, is designed to process review requests holistically regardless of such environments and checks various quality assurance items such as potential defects in the code, coding style, test coverage, and open-source license violations.

Essentially, intelligent code review tools, such as DeepCodeReviewer (DCR) and Code Review Bot, use deep learning and automation to enhance the code review process. DCR, for example, recommends relevant code reviews based on historical data, while Code Review Bot checks for potential defects, coding style, test coverage, and open-source license violations. These tools have been found to be effective in improving the efficiency of change based code review. They have also been well received by developers, with positive feedback and active response to reviews.

=== Static Analysis Tools

Static code analysis tools play a crucial role in software development by assisting developers in enhancing the quality of their code. These tools statically evaluate source code to identify bugs, security vulnerabilities, duplications, and code smells. As noted by Møller & Schwartzbach (#cite(<moller_static_2020>, form: "year")), the practice of static analysis has also been instrumental in optimizing compilers since the 1960s and has since expanded to aid in software debugging and quality improvement @danilo_analysis_2021. The adoption of static analysis tools has become increasingly prevalent in the industry, offering developers insights into code quality standards and potential defects @ilyas_static_2016.

There are various types of static analysis tools available, each specializing in different programming languages and types of defects. Some tools focus on general purpose code analysis, while others are tailored for specific languages like C/C++, Java, or Python. These tools such as Cppcheck, FindBugs, and SonarQube, use predefined rules or patterns to identify issues and provide actionable insights to developers for improving code quality. Static analysis tools are continuously evolving to meet the changing needs of software development and to provide more comprehensive coverage in detecting defects and vulnerabilities within the codebase @nachtigall_explaining_2019.

== Review on the Effects of Unclean Code

“Unclean code” is a term used to describe source code that is difficult to maintain, evolve, and change, often due to poor software engineering practices @carvalho_ontology-based_2017. This type of code is characterized by poor readability, lack of maintainability, and the presence of “code smells” - indicators of software design problems @gupta_intelligent_2018. These code smells, like long and complex functions scattered throughout the codebase (making them harder to identify and manage) can significantly increase the likelihood of errors being introduced during modifications, change proneness, and faults remaining undetected, fault-proneness @palomba_diffuseness_2017. As a result, unclean code can lead to a vicious cycle of bugs, rework, and project delays, ultimately impacting software quality and project success.

While the importance of clean code in preventing resource loss has been well established @digkas_can_2022, unclean code remains a persistent challenge in real world software development projects @chirvase_clean_2021. Several factors contribute to this issue, including a lack of developer motivation, limited knowledge of clean code principles, and a general lack of awareness regarding the importance of code quality. Inappropriate code reuse practices, often fuelled by time pressures and influenced by the ethical climate within a development team @sojer_understanding_2014, further exacerbate the problem. To address this challenge, it’s crucial to encourage developers to prioritize clean code practices and reassess their professional values in relation to their craft.

=== Technical Debt

Technical debt (TD) is a metaphor that represents the compromise between maintaining clean, well structured code and rapid development @ampatzoglou_perception_2016. These relate to design choices, development decisions, and coding practices that prioritize immediate convenience over long-term sustainability @albuquerque_integrating_2023. Although technical debt can bring some of the so-called benefits—such as the reduction of time to market—in the longer term, it can damage overall software quality, whether through added bugs, increased complexity, or making future maintenance efforts more difficult @rios_causes_2019.

In managing technical debt, various strategies are considered for addressing prioritization, refactoring, and automation. The prioritization of the new features against repayment of the debt is made depending on the impacts to the software quality, business value, and risks @lenarduzzi_systematic_2021. Refactoring is restructuring the code without changing the external behavior, with the aim of making it readable, maintainable, and of good quality. Continuous refactoring keeps reducing technical debt and enhancing long term maintainability. Automated code analysis tools like SonarQube and Findbugs assist in identifying indicators of technical debt, such as code smells, duplication, and complexity, that are helpful for effective detection and resolution of debts.

== Review of Relevant Concepts

This section reviews relevant concepts that are essential for understanding the proposed intelligent code review tool. These concepts include Artificial Intelligence, Machine Learning, Convolutional Neural Networks, Natural Languge Processing, Parsing techniques and processes.

=== Artificial Intelligence

Artificial Intelligence can be termed as the study of intelligent agents that can act on stimulus or cues from their environment @russell_artificial_2016. It is based on machine learning algorithms and technologies, allowing machines to apply cognitive abilities and perform tasks autonomously or semi autonomously. According to Bartneck et al. (#cite(<bartneck_what_2021>, form: "year")), there are different aspects of artificial intelligence in which researchers focus on creating machines that think like humans, machines that act like humans, machines that act rationally, or machines that think rationally. There are many different types of AI systems utilized in the world today. Systems such as expert systems, neural networks, and genetic algorithms are all examples of AI systems that are used in various applications.

=== Machine Learning

This is a sub-field of AI focused on the creation of algorithms that enhance their performance on specific tasks by learning from experience and receiving feedback through performance measures @shaveta_review_2023. Typically, this sub-field is further sub-categorised into three types of learning. These types of learning include:

==== Supervised Learning

Supervised Learning is one of the forms of machine learning in which the AI model is trained on a labelled dataset, meaning that each training example is paired with an output label. The labelling process usually involves human effort to review each piece of data and assign appropriate labels to it @jiang_supervised_2020. According to Shaveta (#cite(<shaveta_review_2023>, form: "year")), supervised learning can be regarded as a pupil learning under a teacher’s supervision. There are many algorithms used in supervised learning, such as Linear Regression, Logistic Regression, Support Vector Machines (SVM), Naïve Bayes etc. The Naïve Bayes algorithm is a probabilistic classifier based on Bayes' Theorem. This theorem is represented in Equation 2.1 below.

$ bold(P(A/B) = (P(B/A)P(A))/P(B)) $

Where:
+ P(A/B): is the posterior probability of class A given the features B.
+ P(B/A): is the likelihood of features B given the class A.
+ P(A): is the prior probability of class A.
+ P(B): is the prior probability of features B.

==== Unsupervised Learning

This is the type of learning in which the machine learns without any human intervention or effort. It involves training the models on data that does not have labelled responses, focusing on the hidden structures or unidentified existing patterns within the data @alzubi_machine_2018. The figure below shows the steps involved in simple unsupervised learning.

#figure(
  image("images/unsup.png", width: 60%),
  caption: [Unsupervised Learning [Source: @alzubi_machine_2018]],
)

==== Reinforcement Learning

This is the third type of machine learning. This does not focus on the labelling of data, but rather the system receives reward points for each correct action, or a penalty point for each incorrect action. The algorithms explore and rule out various possibilities to get the correct output with the maximum reward. Reinforcement learning, can be described as a technique that can be used to tackle problems involving sequenced decisions and long-term objectives, such as game play or robot navigation @makkar_reinforcement_2024.  Common algorithms include Nash-Q Learning, Minimax-Q Learning and Fictitous Play algorithms.

#figure(
  image("images/reinforced.png", width: 75%),
  caption: [Structure of Reinforcement Learning  [Source: @makkar_reinforcement_2024]],
)

=== Convolutional Neural Networks (CNNs)

Convolutional Neural Networks (CNNs) is a specialized sub-discipline of artificial intelligence engineered to automatically and dynamically learn spatial hierarchies of attributes from input images through a succession of convolutional layers. The structure of CNNs was motivated by neurons in human and animal brains, akin to a standard neural network @alzubaidi_review_2021. These networks are particularly effective for tasks involving image and video recognition, classification, and segmentation.

#figure(
  image("images/cnn.png", width: 75%),
  caption: [An example of CNN architecture for image classification. [Source: @alzubaidi_review_2021]],
)

=== Natural Language Processing (NLP)

Natural Language Processing (NLP) is another sub-field of artificial intelligence that focuses on the interaction between computers and human language, enabling machines to understand, interpret, and generate human language in a meaningful way @russell_artificial_2016. Within NLP, large language models (LLMs) have emerged as powerful transformative technologies. LLMs, such as OpenAI's GPT-4 and Google's BERT, are trained on vast amounts of text data and leverage advanced neural network architectures, particularly transformers, to capture the nuances of language @xue_unlocking_2024. NLP can be further classified into 2 categories:

+ Natural Language Understanding (NLU):  NLU is a subset of natural language processing in which syntactic and semantic analysis of text and speech is done to make out meanings of sentences. It aids computers in comprehending human language by analyzing and interpreting basic message or speech components @ovchinnikova_natural_2012. It is trained with natural user utterances annotated with entities and expanded using synonyms.

+	Natural Language Generation (NLG): NLG is another subset of natural language processing. While natural language understanding focuses on computer reading comprehension, natural language generation enables computers to write. NLG is the process of producing a human language text response based on some data input @rivindu_recent_2017.

=== Syntax Analysis
// write about syntax analysis
Syntax analysis, also known as parsing, is a crucial phase in compiler and interpreter design that checks the correctness of source code structure @lee_syntax_1982. It involves lexical analysis (scanning) to convert character streams or the source code into tokens, simplifying the parser's job. The parser then generates a parse tree or abstract syntax tree (AST) to represent the code's structure. figure 2.5 shows the workings of a syntax analyzer in a compiler.

#figure(
  image("images/sca.png", width: 75%),
  caption: [Syntax Analysis in a Compiler [Source: @bhat_survey_2022]],
)

==== Tokenization: Lexical Analysis

Tokenization or Lexical Analysis is the intial stage of compilation which involves breaking down a stream of code into smaller, meaningful units called tokens @hippisley_lexical_1976 @far_exploration_2016. These tokens can be keywords (like if, for, or while), identifiers (user defined names like variable or function names), operators (such as +,  , or \*), or special symbols (like ;, (, or )). This process of tokenization is analogous to how we segment sentences into individual words. Just as spaces separate words in a sentence, specific delimiters in the code (like whitespace, punctuation, or operators) separate between tokens in the code stream. The importance of tokenization in static analysis stems from its role in transforming raw code into a structured representation, enabling the parser to understand the code’s structure and meaning. figure 2.7 shows an overview of the tokenization process.

#figure(
  image("images/token.png", width: 100%),
  caption: [Tokenization and parsing overview],
)

==== Parsing

Parsing is a fundamental concept in computer science, particularly in programming languages and natural language processing @dingel_parsing_2014. It refers to the process of examining a sequence of symbols (tokens) to ensure its structure and meaning adheres to the set rules of the grammar of a particular language. It can be described as taking a jumbled mix of words, a sentence, and rearranging the words to form a grammatically correct and comprehensible sentence. Parsing is sometimes called the syntax analysis stage of a compiler, as it involves analyzing the syntax of a language to determine its structure @bhat_survey_2022. figure 2.6 Shows an example of a set of production rules or the grammar of a language.

#code-figure(
  ```
  <alpha>  := 'a' | 'b' | 'c' | 'd' | 'e' | /* ... */ 'z'  
         |  'A' | 'B' | 'C' | 'D' | 'E' | /* ... */ 'Z'
<digit>  := 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
<Decl>   := 'var' <Idents> '\n'? ';'  
<Idents> := <Ident> ('\n'? ',' <Ident>)*  
<Ident>  := <alpha>+ (<alpha> | <digit> | '_')*
  ```, caption: "EBNF: An example of a grammar for a programming language"
)

The second phase of a compiler is the parsing phase, in which the source code that has been tokenized, is analyzed by the parser using the content of the production rules in the grammar of the language. The output of this stage is a parse tree or an Abstract Syntax Tree (AST). This AST serves as a tree like representation of the code’s structure, capturing the hierarchical relationships between different code elements. The AST essentially becomes a blueprint of the code, reflecting its organization and flow without including concrete details like variable names or specific values. An example of an AST is shown in the figure below.

#figure(
  image("images/ast.jpg", width: 75%),
  caption: [A simplified abstract syntax tree (AST)]
)

== Review of Relevant Systems

The review of relevant systems in this paper aims to explore various tools and approaches that have been developed to enhance code quality and improve the code review process, especially for beginners in programming. These systems include:

=== FrenchPress @blau_frenchpress_2015

Blau & Moss (#cite(<blau_frenchpress_2015>, form:"year")) proposed a simple IDE plug-in, that aims to provide automated feedback and explanations on flaws or violations found in Java programs, i.e. focusing on diagnosing silent flaws that do not trigger compile-time or runtime errors. This solution is specifically aimed at intermediate students learning their second or third Java course.

Once the plug-in is integrated with the Eclipse IDE, FrenchPress analyses the student’s Java code and identifies specific flaws built into the system. Some of these flaws include, field could have been a local variable, non-static method declared public and redundant Boolean expressions. After identifying these flaws, the plug-in generates explanations and is then shown to the user or student within the Eclipse IDE as shown in figure 2.10, allowing the user to see the feedback in the context of their code. The student can then review the feedback and accept the suggestions or reject them. In the study, the tool’s ability to motivate students to accept the changes varied with 36% to 64% of students choosing to modify their programs based on the feedback.

#figure(
  image("images/frenchpress.png", width: 80%),
  caption: [FrenchPress feedback [Source: @blau_frenchpress_2015]]
)

==== Limitations of FrenchPress and How the Proposed Tool Addresses Them

One of the limitations of the FrenchPress would be its narrow target audience. Based on the target audience, the FrenchPress is specifically designed for intermediate Java developers while the intelligent code-review tool offers personalized feedback suitable for a range of skill levels, from beginners to more experienced programmers, making it more inclusive.

Another limitation of FrenchPress is its fixed list of code issues. The plugin uses a limited predefined set of style issues and violations, in its code analysis scope. This inflexibility means that FrenchPress may not cover more range of coding standards and practices required for comprehensive code quality assessment. The proposed intelligent code-review tool overcomes this limitation by utilizing a larger set of code violations from standard guides.

Lastly, the proposed intelligent code review system uses a LLM for the feedback or explanation aspect of the system. An advantage over the plugin in which all the feedback is predefined and tailored to the violations. The table below is a comparison of the features of the proposed solution and the FrenchPress plugin.

#pagebreak(weak: true)

#table-figure(
  caption: "Comparison of features between FrenchPress and the proposed Intelligent Code Review Tool",
  table(
    columns: 3,
    table.header([Feature], [FrenchPress], [Proposed Intelligent Code Review Tool]),
    [*User Input Options*], 
    [Only supports local code in Eclipse.], 
    [Supports inputting code directly or linking codebases from code hosting sites.],
    
    [*Contextual Explanations*],
    [Provides explanations using student-appropriate vocabulary.],
    [Generates detailed, contextually relevant explanations and justifications based on code content.],

    [*Review Summary*],
    [Not Available],
    [Provides a comprehensive summary of the code review.],
  )
)

=== A Tutoring System to Learn Code Refactoring @keuning_tutoring_2021

This paper describes a tutoring system, Refactor Tutor, designed to address the looming problem in which tutoring systems and assessment tools have failed to provide solutions for. This problem introduced by the paper is the lack of code quality integration into these systems and tools for students or beginner programmers. Code quality is important for professional software development as bad code is hard to understand, maintain and test @keuning_tutoring_2021.

Refactor Tutor provides students with exercises that begin with functionally correct code but is poorly written. Students are tasked with improving this code by refactoring the code in a step by step manner. The system offers hints and feedback to guide students throughout this process. These hints are presented in a hierarchical structure, the default hint at the top, allowing students to click on explain more button to get a more detailed hint.

One of the biggest benefits of the system is that it was created for beginners in programming. It stresses the relevance of using simple words that are not vague and ambiguous. Again, there is a sequence to follow while learning using this system. This means that apart from just providing directions which get more detailed progressively, it guides students depending on their own demands. The system also focuses on issues that are commonly faced by novice programmers. These issues are identified through research and through the input of experienced teachers. The feedback and hints provided by the system are based on the suggestions from these teachers. The figure below is a screenshot of the web application for the tutoring system.

#figure(
  image("images/refacTut.png"), 
  caption: [Web application for the tutoring system. [Source: @keuning_tutoring_2021]] 
)

An evaluation of the system was conducted by comparing the system’s feedback with suggestions from teachers on how to improve student code. The results showed a strong correlation between the suggestions offered by the system and those provided by the teachers. Additionally, a preliminary study with students indicated that the system’s hints help solve refactoring exercises.

==== Limitations of Refactor Tutor and How the Proposed Tool Addresses Them

The tutoring system’s effectiveness relies on a predefined set of exercises and rules, which may not cover the large potential scenarios encountered in real world coding. Additionally, the system requires manual effort from teachers to create model solutions for generating new rules. 
Static analysis and LLMs have several advantages over the tutoring system. First, LLM based systems can learn and adapt from massive codebases, find more issues and keep up with changing coding practices. No need for a predefined set of exercises and manual rule creation by teachers in the tutoring system. LLMs can also analyse code for security issues, performance issues and even consider the code’s context for more precise feedback.

#pagebreak(weak: true)

#table-figure(
  caption: "Comparison of features between the Refactor Tutor and the Proposed Intelligent Code Review System",
  table(
    columns: 3,
    table.header([Feature], [Refactor Tutor], [Proposed Intelligent Code Review Tool]),

    [*Methodology*], 
    [Predefined set of exercises and pre defined rules.], 
    [Machine learning on vast code repositories provided by the pretrained LLM.],
    
    [*Adaptability*],
    [Limited, requires manual effort for expansion.],
    [Scalable, learns and adapts automatically.],

    [*Feedback Style*],
    [Step by step guidance for refactoring each coding violation exercise.],
    [Nuanced feedback based on code context.],

    [*Knowledge Base*],
    [Static set of teacher defined rules.],
    [Continuously learns from code repositories.],

    [*Efficiency*],
    [Requires teacher effort to create model code violation exercises.],
    [Does not require external effort to detect code violations.],
  )
)

=== Codacy

There are many SCA tools out there, but Codacy is a user friendly and all in one solution to make code review easier. One of Codacy’s biggest strengths is the ease of use. The platform has a user friendly interface that integrates with popular development workflows and version control systems. So, developers can just add SCA to their existing workflow and keep improving their code. Codacy also supports many programming languages, making it a great tool for teams working on many projects.

Although user-friendliness is a nice feature, Codacy has more to offer than the basics. The platform can find many code quality issues because it uses a powerful set of static analysis engines. This includes finding security holes, following coding standards, and finding ways to refactor existing code. Codacy also gives developers concise and useful feedback to fix issues and improve the quality of their code.

#figure(
  image("images/codacy.png"), 
  caption: [Overview of issues in recent commits on Codacy Dashboard]
)

==== Limitations of Codacy and How the Proposed Tool Addresses Them

Codacy offers a user friendly and comprehensive SCA solution, but it has limitations compared to the proposed intelligent code review tool. Codacy is a great tool for professional code quality management but as it does not offer a nuanced explanations or feedback based on the style issues found, it is not completely helpful to a beginner in any programming language trying to learn how to adhere to programming conventions or coding styles of that language. The intelligent code review tool, however, provides contextual explanations of the code violations found in the user submitted code. Ensuring the user understands and learns proper programming styles.

#table-figure(
  caption: "Comparison of features between the Refactor Tutor and the Proposed Intelligent Code Review System",
  table(
    columns: (0.7fr, 1fr, 1.3fr),
    table.header([Feature], [Codacy], [Proposed Intelligent Code Review Tool]),

    [*Methodology*], 
    [Predefined set of exercises and pre defined rules.], 
    [Machine learning on vast code repositories provided by the pretrained LLM.],
    
    [*Adaptability*],
    [Limited, based on rule updates.],
    [Scalable, learns and adapts automatically.],

    [*Feedback Style*],
    [Simple error and warning messages.],
    [Nuanced feedback based on code context.],

    [*Scope of Issues Detected*],
    [Defined set of coding.],
    [Broader range of issues and best practices],
  )
)

== Summary of Literature Review

This literature review looked at different methods and approaches to improving code quality. From Modern Code Review tools to automated Code Review tools, a code review system utilizing static analysis and LLMs (Large Language Models) emerged as a more promising solution LLM’s can learn continuously so can identify more code quality issues and adapt to changing coding practices. Additionally, an LLM can also analyse code for context specific nuances, introducing more comprehensive feedback than a static set of rules.

In general, LLM based code review is a more scalable, flexible, and efficient way to enhance code quality—especially when it comes to getting students ready for the demands of the software development industry. 


= Methodology or System Analysis and Design

== Preamble

This section details the analysis and design of the proposed system. It presents the requirements for the system, the techniques taken to achieve the system as well as diagrams to model the proposed system.

== The Proposed System

This proposed project is a web based application designed to streamline code review. Users can connect their codebases through repositories like GitHub or import their code directly into the application. Once the code is imported, the application conducts an extensive review, highlighting areas for improvement and offering recommendations. Additionally, the system provides explanations and justifications for these suggestions, utilizing intelligent responses from a language model.

== Requirement Analysis

In software development, requirement analysis includes the descriptions of the services that would be provided by the system, as well as its operational limits. It lays down the features that are required to suit the users’ requirements, these requirements are then further separated into functional requirements, non functional requirements and user experience requirements. 

=== Functional Requirements

Functional requirements of the system are specific functionalities or services that the system is expected to perform. They describe what the application should do and include operations, activities, computational tasks, data manipulation, user interface behaviour, and more. These requirements are as follows:

+	Users should be able to input their code or to link their respective codebases from code hosting sites. 
+	The system should analyse the code and provide feedback on areas that need improvement.
+	The system should generate appropriate and contextually relevant explanations and justifications based on the content of the code and the suggestions made.
+	The system should allow users to view the code and the suggestions side by side.
+	The system should allow users to accept or reject the suggestions made.
+	The system should provide a summary of the code review.
+	The system should allow users to download the reviewed code

=== Non-Functional requirements

Non functional requirements are not directly related to the system functionality but rather are defined in terms of system performance. They explain the system behaviour, features and overall attributes that can affect the user’s experience. The non functional requirements for the system in this study are as follows:

+	The system should be easy to use and navigate. 
+	The system should provide clear and concise feedback.
+	The system should provide explanations and justifications that are easy to understand. 
+ The system should provide a summary of the code review. 
+ The system should allow users to download the reviewed code.

=== User Experience Requirements

User experience requirements are the factors that specify the expected things the user should encounter while making use of the system and the outcome of their experience. In the case of this system, the user experience requirements include:

+	The system should be easy to use and navigate.
+ The system should provide clear and concise feedback.
+ The system should provide explanations and justifications that are easy to understand. 
+ The system should provide a summary of the code review.
+ The system should allow users to download the reviewed code.

== Physical Design

A physical design represents the physical elements of a software system and relates to the actual input/output operations of the system. The focus is on how data is entered into the system, validated, processed, and output. It has two major categories, the input design and the output design. For this system, the physical design is concerned with how the code is inputted into the system, how the system processes the code, and how the system outputs the results of the code review. These design considerations are essential to generate a working system that specifies all the features of a candidate system.

=== The Proposed System Architecture

The system architecture describes the structure of the system and the components that make up the system. It provides a high level overview of how the system will be designed and how the components will interact with each other. The system architecture for the proposed system is detailed in this section.

The proposed intelligent code review application is composed of several components designed to enhance the code review process. These components include the Code Importer or Fetcher mechanism (Github integration or manually importing code), a simple static analysis engine, a user friendly interface for users, a recommendations module or generator (CodeLlama Model), and a comprehensive reporting system. The functions of the components of the architecture are as follows:

==== Code Importer/Fetcher

This component allows users to import their code into the system either by linking their codebases from code hosting repositories like GitHub or by manually uploading their code. This component serves as the entry point for the code review process.

==== Static Analyzer

The system’s static analyzer plays a crucial role in examining user submitted code. It begins by tokenizing the code, parsing it, and constructing an abstract syntax tree (AST) to comprehend the code’s structure and semantics. Through this analysis, it identifies code quality concerns, adherence to coding conventions, and areas for enhancement. The static analyzer encompasses several key components:

+ Lexer: The lexer tokenizes raw source code into tokens, facilitating further analysis.
+ Parser: The parser constructs an Abstract Syntax Tree (AST) using a recursive descent parsing method, capturing code hierarchy systematically.
+ Semantic Analyzer: The semantic analyzer verifies the code’s semantic correctness, ensuring adherence to programming language rules and identifying logical errors.’
+ Code Rule Enforcement: This component checks code against coding standards, detecting stylistic issues and ensuring consistency.
+ Report Generation: Detailed reports are created, highlighting the identified issues, the AST, and code snippets. This report serves as a query that would be fed to the LLM for contextual recommendations or suggestions based on the violations found in the analysis. 

==== User Interface

The user interface component provides an intuitive and user friendly platform for users to interact with the system. It offers functionalities for code submission, viewing analysis results, accepting or rejecting suggestions, and downloading the reviewed code.

==== Recommendations Module

The recommendations module is powered by the CodeLlama 7B Instruct GGUF Model and it generates contextually relevant suggestions based on the code analysis results. The model’s deep learning capabilities allows the module to provide nuanced feedback, explanations, and justifications for the identified issues.

==== Reporting System

The reporting system compiles the analysis results, recommendations, and justifications into a comprehensive report. This report summarizes the code review process, highlighting the identified issues, suggested improvements, and contextual explanations. Users are allowed to accept the suggested changes from this report.


== Logical Design

The logical design of a system describes the functional requirements of the system and how these requirements are implemented. It refers to the conceptual and abstract representation of a system’s architecture, functionality, and components. For the proposed system, the goal of logical design is to define the system’s structure, data flow, interfaces, and interactions between various components in a way that is independent of any particular technology or platform. The logical design of the proposed system is detailed in this section.

=== Use Case Diagram

A use case diagram is a visual representation of the interactions between users and a system. It illustrates the various ways users can interact with the system and the system’s responses to these interactions. The use case diagram for the proposed system shows that a user can interact with the system by importing their code, analyzing the code, viewing the analysis results, accepting or rejecting suggestions, and downloading the reviewed code. The system, in turn, processes the code, generates recommendations, provides explanations, and compiles a summary report for the user. The use case diagram provides a high level overview of the system’s functionality and user interactions, outlining the key features and capabilities of the proposed system, the diagram is shown in the figure below. 

#figure(
  image("images/use_case.svg"),
  caption: [Use case diagram for the proposed system]
)

=== Sequence Diagram

A sequence diagram shows how objects interact in a particular scenario of a use 36 case. It illustrates the sequence of messages exchanged between objects, highlighting the order of interactions and the flow of control in a system. The sequence diagram of the system is shown in the figure below,

#figure(
  image("images/sequence.svg"), 
  caption: [Sequence diagram for the proposed system] 
)

== Conceptual Design

The conceptual design of the system outlines the high level structure and components of the system. This section shows the Entity Relationship Diagram (ERD) for the proposed system, detailing the entities and their relationships. The conceptual diagram is shown in the figure below.

#figure(
  image("images/erd.svg"),
  caption: [Entity relationship diagram for the proposed system]
)

#pagebreak(weak: true)

= System Implementation and Evaluation

== Preamble

This chapter of the report entails the actual implementation of the proposed intelligent code review system. It details the tools used for the implementation, the hardware and software requirements, the development methodology, and the evaluation of the system.

== System Requirements

System requirements are the specifications that define the functionalities and features of the system. They detail the hardware and software requirements necessary for the system to operate effectively. It includes the software and hardware requirements for the system.

=== Hardware Requirements

These are the requirements necessary for the hardware components to run the system. The hardware requirements for the proposed system are shown in the table below:


#table-figure(
  caption: "Hardware Requirements",
  table(
    columns: 3,
    table.header([S/N], [Requirement], [Hardware]),
    [1], 
    [Processor], 
    [Intel Core i7 / Apple M1 Chip or higher],
    
    [2],
    [Graphics Processing Unit (GPU)],
    [Nvidia GTX 1660 or 2060, AMD 5700 XT, or Nvidia RTX 3050 or 3060],

    [3],
    [Memory (RAM)],
    [16GB Ram or Higher],

    [4],
    [Architecture],
    [64 bit (x64) architecture / ARM x64],

    [5],
    [Secondary Storage],
    [32GB SSD or higher]
  )
)

=== Software Requirements

These are the requirements needed by the programs of the system to run successfully. They must be pre installed and set for the proposed system to run smoothly. The software requirements for the proposed system are shown in the table below.

#table-figure(
  caption: "Software Requirements",
  table(
    columns: 3,
    table.header([S/N], [Requirement], [Software]),
    [1], 
    [Operating System], 
    [Windows 10, macOS Big Sur or higher, Ubuntu 20.04 or higher.],
    
    [2],
    [Integrated Development Environment (IDE)],
    [Visual Studio Code, PyCharm, IntelliJ IDEA, or any other IDE.],

    [3],
    [Programming Language],
    [Python 3.8, Javascript (NodeJs), Rust.],

    [4],
    [Supported Browser],
    [Google Chrome, Safari, Mozilla Firefox],
  )
)

== System Implementation

The system implementation of the intelligent code review tool is detailed in this section.

=== Setup and Configuration

The setup of the development environment entails various installations and configurations for the frontend of the tool and backend of the tool:

==== Frontend and Backend Configuration

In the frontend of the tool, React was used in the development of the user interface. First, the React application is initialised using the Vite bundler, which provides a fast development environment for React projects. Other dependencies, such as Tailwind CSS for the styling or React Redux Toolkit and Query for state management and API consumption, were installed using the Node.js package manager for JavaScript.

The backend of the tool is implemented using Express.js for the server side, where all the API endpoints are created and served. Node.js is also used to install all the dependencies of the backend server such as jsonwebtoken that is used in the generation of JWT tokens for all GitHub API endpoints. For the integration with the LLM, python was used, the Flask python framework to run a special server for the LLM, Llama-cpp that is used to load and interact with the GGUF version of CodeLlama.

==== Integration and Testing Phase

During the development of the application, the integration phase involved several key modules and components to ensure it fulfilled all the functional requirements of the application. For the import module of the application, integration with GitHub was essential to enable users have access to their repositories if need be. GitHub has several criteria needed to integrate with external applications. The first was to create a GitHub App to get a client id and client secret which are both needed in installing the app on a GitHub users account. After the creation of the GitHub App, generating Access Tokens would be required to consume any of the GitHub API’s such as the get all users repo endpoint or get content from a specific repository’s endpoint. All API consumption on the backend was done using JavaScript’s Fetch function. 

Another aspect of the import module was the manual import, which allows a user to import a single JavaScript file from their local machine. The code is then sent to the backend using the RTK Query API slices created for that purpose. Before integration with the backend of the application, CodeLlama was tested using a small dataset of code snippets with their violations. This testing was done to determine the efficiency of the LLM in explaining code violations passed to it.
The editor module or component was integrated using a simple Syntax Highlighter Node package. This enabled all code snippets to be highlighted according to the JavaScript language. The code snippets and suggestions were passed from the backend after a user imports the code and a review on the code is done.

Finally, in testing all components of the application, each process of connecting a GitHub account to reviewing and downloading the reviewed code was tested several times. Each bug encountered was analysed and fixed to ensure that the application worked as intended.

==	Development Methodology

The software development methodology applied to implement the developed system is an agile approach. Agile methods are mainly iterative and incremental by nature and share key features of collaboration, flexibility, and adaptability. The agile approach always involves continuous feedback, a rapid development cycle, and responses to changing needs. The process is broken down into sprints, each orienting toward certain features or functionalities. The agile methodology allows the development team to offer a working product incrementally, thereby ensuring that the user requirements and expectations for the system are met.
The study involved initially following the waterfall model to define the system requirements, analyse the system, design the system, and implement the system. However, the development process was later shifted to an agile approach to accommodate changing requirements, incorporate feedback, and deliver a working system incrementally.

== Implementation Tools

These are the tools used to implement the system. They include the programming languages, libraries, and frameworks used to develop the system.

=== JavaScript 

JavaScript is a versatile programming language that is widely used for web development. It is essential for building interactive web applications and dynamic content on websites. In the proposed system, JavaScript was used for the front end development, utilising the React Framework with the vite bundler, and was also used in part of the backend development for serving endpoints and other API logic. 

=== Python 

Python is a high level programming language known for its simplicity and readability. It is widely used for various applications, including web development, data analysis, and artificial intelligence. In the proposed system, Python was used for the backend development, to load and prompt the CodeLlama model. Libraries such as the Torch, Transformers (from hugging face) and more was utilized in the preparation of the model for the software system. 

=== Rust 

Rust is a systems programming language known for its performance, reliability, and memory safety. It is often used for low level programming tasks and building high performance applications. In the proposed system, Rust was used for the static analysis engine, which tokenizes, parses, and analyses the user submitted code. The Rust programming language was chosen for its speed, safety features, and suitability for building efficient code analysis tools. 

=== Visual Studio Code 

Visual Studio Code is a popular code editor developed by Microsoft. It is widely used by developers for its versatility, extensibility, and rich feature set. In the proposed system, Visual Studio Code was used as the primary code editor for developing the system components.

== Program Modules and interfaces

This section details the sections of the user interface and modules of the intelligent code review system.

=== The Import Module
This is the screen where users choose where to import their code from. They can either import from GitHub or upload their code directly. These screens show the integration with Github to retrieve user repositories. In figure 4.2, it alerts the user to authorize the application before installing it on their GitHub account. One the authorize button is clicked it take the user to the GitHub portal where the application can then be installed. The import module screens are shown in figures 4.1 to 4.3.

#figure(
  image("images/import.png", width: 80%), 
  caption: [The import page] 
)


#figure(
  image("images/import2.png", width: 80%), 
  caption: [The authorization page for GitHub Authentication.] 
)


#figure(
  image("images/import3.png", width: 80%), 
  caption: [The import page for choosing a specific repository] 
)

=== The Code Review Module

This module is where the after the code has been reviewed, the suggestions are presented to the user in a simple read-only editor layout. In the figure below, it shows the error lines in a light orange colour to indicate to the user where the code violations were found. A user can then click on the error lines to view the suggestions from the code review. The suggestions can be expanded as show in figure 4.5, to provide more explanations and resources based on the rule violated. The screens are shown in the figures 4.4 to 4.5.

#figure(
  image("images/editor.png", width: 80%),
  caption: [The code review page]
)

#figure(
  image("images/sugg.png", width: 80%),
  caption: [The suggestions popup]
)

=== The Summary Module

After the code review process, the user can continue to the summary page where a simple breakdown of the review will be presented to the user. The user can then proceed to download the reviewed code. The module is show in figure 4.6 below.

#figure(
  image("images/summary.png", width: 90%),
  caption: [The summary screen]
)

== Evaluation of the System

The evaluation of the intelligent code review system was conducted using questionnares with users who interacted with the system. These questions were close-ended questions to gather qualitative and qualitative data on the system's performance, usability, and user satisfaction. 

=== Questionnaire Design

In the design of the questionnaire, the questions was composed of 16 questions in total, in which 14 questions were structured close-ended questions and two open-ended questions. These questions were categrorized under usability and user experience, accuracy and relevance, perfomance, motivation and comparison with other tools. The types of scales used in the questionnaire are:

==== Likert Scale

The Likert scale was used in asking users to rate their experience, interface intuitiveness, feedback helpfulness, and overall satisfaction on a 5-point scale (e.g., from "Very Poor" to "Very Good" or "Strongly Disagree" to "Strongly Agree"). The figure 4.7 shows an example of a Likert scale question from the questionnaire.

#figure(
  image("images/likert.png", width: 105%),
  caption: [An example of Likert Scale: A question from the questionnaire]
)

==== Nominal Scale

This scale was used in questions asking users to describe their experience in terms of specific attributes or select from predefined categories (e.g., "Yes/No"). The figure 4.8 shows an example of a nominal scale question from the questionnaire.

#figure(
  image("images/norminal.png", width: 80%),
  caption: [An example of Nominal Scale: A question from the questionnaire]
)

==== Ordinal Scale

The ordinal scale was also used in the questionnaire. It was used in questions asking users to rank their preferences or experiences in order of magnitude without a specific numeric value (e.g., ranking the system compared to other tools). The figure 4.9 shows an example of an ordinal scale question from the questionnaire.

#figure(
  image("images/ordinal.png", width: 100%),
  caption: [An example of Ordinal Scale: A question from the questionnaire]
)

=== Questionnaire Results

The results of the interviews are summarized below.

==== User Experience

+	Initial Experience Rating: Most users rated their initial experience with the code review system positively, with ratings predominantly falling between 2 and 4 on a 5-point scale.


+	Interface Intuitiveness Rating: Most users found the interface to be intuitive, with several describing it as "Intuitive" and some noting it as "Very Intuitive". This suggests that the design and layout of the user interface were well-received.

==== Helpness and Clarity of Feedback

+	Helpfulness of Feedback: The feedback from the system was generally considered helpful, with ratings mostly in the range of 1 to 4, indicating a varied but generally positive reception.
+ Clarity of Feedback: The clarity of the feedback was consistently rated as "Clear" or "Very Clear", demonstrating that the explanations and suggestions provided by the system were easily understood by the users.

==== Comparison to Human Reviewers and Other Tools

+ Feedback Comparison: Users compared the feedback from the system to that received from human reviewers. Responses varied, with some users indicating the system's feedback was "About the Same" as human feedback, while others found it "Better".
+ Comparison to Other Tools: When comparing the intelligent code review system to other code review tools, most users rated it as "Better" or "Much Better", suggesting that the system offers a competitive or superior alternative to existing tools.

==== Overall Satisfaction

+ Satisfaction Rating: Overall satisfaction with the system was moderate, with ratings primarily around 2 to 3 on a 5-point scale. This indicates room for improvement but a generally acceptable level of satisfaction among users.
+ Specific Likes and Dislikes: Users appreciated the user interface (UI) and the clarity of the feedback. Comments such as "the UI", "The way it is explained", and "The feedback was easy to understand" highlight these positive aspects. Common criticisms included system lag and occasional crashes, with users noting "The lags and occasional crashes" and "the system lag". Some users also mentioned the slowness of loading as a drawback. Figure 4.10 shows the results on the question: "What did you like most about the system?".

#figure(
  image("images/least.png", width: 100%),
  caption: [Some results on the question: "What did you like least about the system?"]
)

#pagebreak(weak: true)

=== Comparison of Current System to Reviewed Systems

Additionally to the questionnaires conducted, a comparison of the intelligent code review system to other reviewed systems was conducted. The comparison was based on the features, limitations, and advantages of the reviewed systems, including FrenchPress, Refactor Tutor, and Codacy and it highlighted the unique strengths of the intelligent code review system and how it addressed the limitations of the reviewed systems.

Both products, the intelligent code-review tool and FrenchPress, differ in their audience. While FrenchPress targets intermediate Java developers, the tool is aimed at providing personalized feedback to a wide range of programming skills, from beginners to experienced programmers. This way, a greater number of users can benefit from the capabilities of the tool, and this inclusive approach is fostered in a much more comprehensive learning environment. One reason behind such an adaptive nature of the intelligent code review tool is that it is suitable for varied educational contexts, increasing the overall utility compared to the more narrowly focused FrenchPress.

Another limitation that FrenchPress and Refactor Tutor has is the fixed list of code issues. The solutions depend on a predefined set of style issues and violations; this definitely limits its scope for comprehensive code quality assessment. On the contrary, the intelligent code-review tool depends on a wide range of coding standards. That means the tool is able to cover a wide scope of coding practices and standards; hence, code quality assessment will be more efficient. Since the intelligent code-review tool makes use of the dynamic set of violations, it goes one step further in comparison with these other solutions: it adapts when a particular convention or practice is in constant change.

Finally, the intelligent code rivew tool surpasses the other reviewed tools is through its use of a Language Model (LLM) for feedback and explanations. The intelligent code review provided by the tool is entirely different from that of FrenchPress and Codacy, which uses static feedback generated in advance according to pre-defined violations. It generates scalable and dynamic feedback. Thus, the system is capable of providing subtle and are contextually relevant explanations that would be useful to the user. This is particularly helpful for novices in learning programming conventions rather than just being told their code is wrong, i.e only pointing out the errors without contentual explanations, thus improving the learning experience. The LLM technology enables the feedback given by the intelligent code review tool to be relevant, detailed, and up to date with the current software development practices—something that gives it a clear edge over the static feedback system of FrenchPress.

=== Discussion

The evaluation of our intelligent code-review tool reveals several strengths and areas for improvement, providing a comprehensive view of its performance and user satisfaction.On the case of the intuitiveness of the interface, 85.7% of subjects thought that the interface was easy to be navigated, as would be fitting when the design makes it convenient for interaction. Apart from this, the feedback provided by the tool was generally perceived as clear and helpful, with 85.8% of users choosing a rating between 3 and 5, indicating an appreciation for the detailed and easy-to-understand explanations. However, some areas of the tool needs needs to be worked on, as the user reports—system lag and occasional crashes were quite common criticisms. The fixing of these factors would increase user satisfaction and the overall reliability of the system.

Comparatively, the intelligent code-review tool offers distinct advantages over the FrenchPress plugin and other reviewed systems. Unlike FrenchPress, which targets intermediate Java developers, the intelligent code review tool is designed to cater to a wide range of skill levels, from beginners to advanced programmers. In this way, the tool is flexible and valuable in a wide range of teaching or training environments.
Furthermore, the intelligent code-review tool's dynamic approach to identifying code violations, drawing from an extensive array of coding standards, makes the findings comprehensive. These will enable the tool to undergo changes with coding practices such that the user always receives the feedback relevant and current to practice. This is one major difference of the current reviewed systems as FrenchPress and Refactor Tutor.

Another significant advantage of the intelligent code-review tool is the application of the use of a Language Model (LLM) for producing feedback and explanations. It offers nuanced, contextually-relevant feedback, which is better compared to the static, predefined feedback of FrenchPress. Additionally, LLM is able to present very detailed justifications for any coding suggestions, further extending the grasp of users in terms of coding conventions and practices.

#pagebreak(weak: true)

= Conclusion and Recommendations

== Summary

An intelligent code review tool is a system that enables a user to receive dynamic suggestions to code violations found within the review process. This is tool is vital in the improvement of code quality and adherence to programming conventions in the software development industry. The use of this system in the early stages of learning to code can not only improve developers code quality but also improve a programmer’s code comprehension. A pretrained Large Language Model was used in this project to provide contextual explanations on the code violations fond during the review process. Static Analysis techniques were also utilised in the project to identify code violations in user submitted code.

During the evaluation, it was observed that the integration of the LLM and static analysis techniques offered a comprehensive approach to code review. The intelligent code review tool was tested in various scenarios, demonstrating its effectiveness in improving code quality and user understanding, with 71.5% of interview responses indicating the system’s suggestions quality better than human reviewers and 71.4% of user’s indication the clarity of the feedback from the system. The results highlighted that the system's dynamic feedback mechanism and extensive code violation coverage set it apart from traditional tools like the FrenchPress plugin. By addressing a broader range of coding issues and providing adaptive, contextually relevant feedback, the intelligent code review tool enhances the learning experience for programmers at all skill levels, ultimately contributing to better software development outcomes.

== Recommendations

The following are recommendations for the intelligent code review tool:
+ To address the varied reception of feedback clarity, the system will benefit from implementing fine-tuning the LLM for more personalized feedback.
+ The system’s performance can be improved by optimizing the backend process. Either by hosting the LLM on better infrastructure or by using a quantized version of the model. This may cause quality loss but can be considered as a trade-off for performance.
+ As a learning tool, introduction of features such as learning resources, or a collaborative environment can allow users to enhancing their learning process.

==	Conclusion

The development and implementation of the intelligent code review tool marks a significant advancement in enhancing code quality and adherence to programming conventions within the software development industry. Leveraging state of the art technologies such as a pretrained Large Language Model (LLM) and robust static analysis techniques, this project has demonstrated its capability to provide dynamic and contextual suggestions for code violations, thereby supporting developers at various skill levels in improving their coding practices. Throughout the project, extensive research and understanding of the LLM to deliver precise and informative feedback on code quality. By surpassing traditional approaches with its adaptive feedback mechanisms, the tool not only identifies a wide range of coding issues but also educates users on best practices, fostering a deeper understanding of programming standards.

Looking forward, the tool's practical applications have streamlined code review processes, enabling real-time analysis and actionable insights into codebases. The implementation of an intuitive user interface and responsive feedback system has garnered positive feedback from users, highlighting its effectiveness in enhancing developer productivity and code maintainability. As digital environments continue to evolve, the intelligent code review tool stands poised to drive further innovations in software development practices. By addressing current limitations and anticipating future challenges, this project paves the way for continued advancements in automated code analysis and education, contributing to a more efficient and quality-driven software development ecosystem. 

