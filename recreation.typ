#import "./cis.typ": *

#show: content => bach(
  title: "[YOUR TOPIC - in caps]",
  names: "[First-Name] [Middle-Name]",
  surname: "[Surname]",
  matric: "[Matric-number]",
  supervisor: "Dr. Aderonke A. Oni",
  reference-path: "./references.yml",
  date: datetime(year: 2024, month: 7, day: 1),
  programme: "Computer Science",
  abstract: [
    Computationally intensive tasks, such as large combinatorial optimisation problems, have been addressed over the years using advanced search techniques, with genetic algorithms among the most prominent. Genetic algorithms are evolutionary techniques that simulate natural selection to generate high-quality solutions for challenging combinatorial optimisation problems (COPs).

    \[Use the *Text-Narrow* style for the Abstract; it should not be more than one page\]
  ],
  dedication: [
    The dedication section is a brief and personal acknowledgement. It typically includes gratitude to family members for their unwavering support, friends for their understanding, and academic advisors or professors for their guidance and expertise. It might also mention anyone who inspired or motivated the student throughout their academic journey.
  ],
  acknowledgements: [
    The acknowledgements section of the project is where you express your gratitude to those who have helped and supported you throughout your project.
  ],
  abbreviations: (
    "ACO: Ant Colony Optimisation",
    "API: Application Programming Interface",
    "BERT: Bidirectional Encoder Representations from Transformers",
    "CNN: Convolutional Neural Network",
    "EA: Evolutionary Algorithm",
    "GA: Genetic Algorithm",
    "LSTM: Long Short-Term Memory",
    "NLP: Natural Language Processing",
    "RL: Reinforcement Learning",
    "SIFT: Scale-Invariant Feature Transform",
    "YOLO: You Only Look Once",
    "RCWYA: Replace Contents With Your Abbreviations",
  ),
  appendices: (
    "Best Sequences Evolved by Our Scheme": [
      Only divide the appendix into sub-sections if there are multiple themes. Use Heading 3 for the sub-sections since Heading 2 is used for the "Appendices" text. However, if there is only one theme, then "Appendices" is changed to "Appendix", and there is no need for multiple sub-sections like Appendix A and Appendix B.

      #figure(
        caption: "The nine best sequences evolved during one of the best runs of our scheme on SAT3. Objective function value of the best run: 0.0. Dominant sub-schemes: hType-ILS + MC (3, 1) and hType-ILS + APW (3, 0)",
        image("images/fig1.png"),
      )

      #figure(
        caption: "The ten best sequences evolved during one of the best runs of our scheme on SAT5. Objective function value of the best run: 1.0. Dominant sub-schemes: hType-P + APW (4, 0) and hType-P + TA (4, 3)",
        image("images/fig2.png"),
      )
    ],
    "A C++ Implementation of the sorting algorithm for random keys": [
      ```cpp
      void sortKeys(int start) {
        fit_fn_tsp(start); // compute the fitness values of the
      //chromosomes/keys

          /* sort the fitness values of the (biased-)keys using a map insertion
           * mechanism
           * Create a map of the key-value pair
           * where 'key' is a pair of double (the fitness value itself), int
           * (the position it occupies in the array), and 'value' is the
           * original
           * position of the fitness value in the array
          */
          map<pair<double, int>, short> temp;
          int iter = 0;
          for (short int i = 0; i < n; i++) {
              double val = fitness[i];
              pair<double, int> p;
              p.first = val;
              p.second = i;
              temp.insert({ p, i });
          }

          ranks = new int[n];
          iter = 0;
          temp_fit_elite.clear();
          for (auto i = temp.begin(); i != temp.end(); i++) {
              ranks[iter] = i->second;
              if (iter < p_e)
                  temp_fit_elite.push_back(fitness[i->second]);
              iter++;
          }
      }

      ```
    ],
  ),
  content,
)

= Introduction

== Fundamentals

This template has been carefully designed to protect students from submitting their reports with diverse formatting styles. The student should follow the style instructions strictly to avoid messing up the formatting tasks.

To use a formatting style. It is recommended that the student follow either of the three steps below:

+ Copy and paste the text into Notepad, then copy and paste from the Notepad into the text section with the already applied formatting style.
+ Copy the text from the source document and then avoid pasting the text directly; instead, right-click on the area the student wants to paste his/her text intro and paste with the "Keep Text Only" option.
+ The third option applies when the student uses the template to write his/her report from scratch. Type the text, highlight the text and select the formatting styles the students desire to apply from the Styles ribbon on the Home tab.

There are three main headings (*Heading 2 - 2.3*, *Heading 3 - 2.3.3*, and *Heading 4 - A*). Avoid going past Heading Four to reference sections within the report easily. Heading 2 was applied to the text above (1.1. Background Information). \
*The Heading 1 style*: This is applied only to the Chapter headings (Chapter One, Chapter Two, ... Chapter Five). Since the report is in five chapters, do not edit the styles; only change the text of the chapter's title (if necessary). Read and follow the instructions in the remaining part of the template to see other report format instructions concerning other aspects of report writing. \
*The Text Style*: Most of the text in the report should use this style. This text is based on this style. Its main features are Times New Roman, 12 pt, and 1.5 line spacing. \
*The Item Style*: It is a Roman numeral style for itemisation that comes in handy for the aim and objectives section and any other part of the report that requires students to itemise contents.

== Applying a Paragraph/Object Reference

A paragraph is a distinct section of writing that focuses on a single idea or theme. It typically consists of several sentences that develop and support the main point. This section has four paragraphs: this current one and another three to demonstrate what it should look like. Applying a paragraph in this format is simple; in the last line of the previous paragraph, instead of pressing the "Enter" key unnecessarily, set the "After" spacing of the paragraph to 6pt (a depiction of this can be seen in Figure @fig:style) in the paragraph settings of the paragraph section of perhaps, the Home tab. Every table and figure in the report should be referenced before they appear. The student should notice that this principle was applied to Figure @fig:style.

#figure(image("images/style.png", height: 8.28cm), caption: "Paragraphing style adjustment") <style>

Evolutionary techniques like genetic algorithms have significantly impacted various fields because they can find optimal solutions in complex problem spaces. These techniques are widely used in engineering for problems like design optimisation, scheduling, and resource allocation. For instance, genetic algorithms can optimise the design of aerodynamic structures, enhancing performance and efficiency by evolving designs through iterative selection, crossover, and mutation processes *_[End of paragraph 2]_*.

Evolutionary techniques have been applied to personalised medicine and drug discovery in healthcare. By simulating the natural evolution process, these algorithms help identify optimal treatment plans tailored to individual patients' genetic profiles, improving the effectiveness of therapies. In drug discovery, genetic algorithms assist in identifying potential compounds by exploring vast chemical spaces, accelerating the development of new medications *_[End of paragraph 3]_*.

The financial sector also benefits from evolutionary techniques, particularly algorithmic trading and portfolio optimisation. Genetic algorithms help develop trading strategies that adapt to changing market conditions, maximising returns and minimising risks. They also assist in optimising investment portfolios by selecting the best combination of assets to achieve desired financial goals, considering various constraints and market dynamics _*[End of paragraph 4]*_.

== Figure and Table Captions

Right-click on the table/figure and select the option to add a caption to the object. A sample for each object (table or figure) is depicted in Figure @fig:cups and Table 1.1. Notice that the caption for a figure appears below the object while the caption for a table appears above it.

#figure(
  image("images/cups.jpg", height: 8.33cm),
  caption: "A depiction of the two containers used for our experiment",
) <cups>

The caption automatically updates to 1.2 since this chapter has an existing figure (Figure @fig:style) when the caption was added. Students only need to select the suitable object (make sure you select "Figure" in the label option instead of "Table") when captioning a figure, and the numbering is automatically set. If the chapter prefix (The "1" in Figure 1.2) was not added, clear the previous caption and repeat the captioning process to apply the setting similar to the depiction in Figure 1.3. In the caption dialogue box, click on numbering and adjust the setting to ensure it looks like the left part of Figure @fig:dialog for the prefix effect.

#figure(
  image("images/dialog.png", height: 5.56cm),
  caption: "Setting the figure caption to carry the chapter prefix (1, 2, ...)",
) <dialog>

The header should be in the "Table Header" style, while the contents should be in the "Table-Text" style. A sample table is in Table @tbl:algos.

#table-figure(
  caption: "A non-exhaustive list of Key Algorithms in Computer Science: Pioneering Creations and their Visionary Architects",
  lab: "algos",
  table(
    columns: (40%, 45%, 15%),
    align: (left, left, left),
    table.header([Algorithm], [Author(s)], [Year Published]),
    [Dijkstra's Algorithm], [Edsger W. Dijkstra], [1959],
    [Quicksort], [Tony Hoare], [1960],
    [A\* Search Algorithm], [Peter Hart, Nils Nilsson, Bertram Raphael], [1968],
    [Knuth-Morris-Pratt Algorithm], [Donald Knuth, Vaughan Pratt, James H. Morris], [1977],
    [RSA Algorithm], [Ron Rivest, Adi Shamir, Leonard Adleman], [1978],
    [SHA (Secure Hash Algorithm)], [National Security Agency (NSA)], [1993],
    [PageRank Algorithm], [Larry Page, Sergey Brin], [1998],
    [Generative Adversarial Network (GAN)], [Ian Goodfellow et al.], [2014],
    [ResNet (Residual Neural Network)], [Kaiming He, Xiangyu Zhang, Shaoqing Ren, Jian Sun], [2015],
    [YOLO (You Only Look Once)], [Joseph Redmon, Ali Farhadi], [2016],
    [AlphaGo], [DeepMind Technologies], [2016],
    [Transformer], [Vaswani et al.], [2017],
    [BERT Algorithm], [Jacob Devlin, Ming-Wei Chang, Kenton Lee, Kristina Toutanova], [2018],
  ),
)

== The use of Roman numerals for itemisation
Roman numerals are preferred for content that requires itemisation. The *_Item_* Style has been provided for this purpose. The following text shows how the student should (for example) present the Aim (*Text* style) and Objectives (*Item* style) of your study.

The aim of this study is to develop and evaluate deep learning models for predictive maintenance in industrial systems, aiming to improve equipment reliability, reduce downtime, and optimise maintenance schedules. The objectives are as follows:

+ To conduct a comprehensive review of existing literature on predictive maintenance techniques, with a focus on deep learning approaches.
+ To collect and preprocess historical maintenance data, sensor readings, and equipment logs from industrial systems.
+ To extract relevant features from the collected data indicative of equipment health and failure patterns.
+ To develop and implement deep learning models, such as recurrent neural networks (RNNs), convolutional neural networks (CNNs), or their variants, for predictive maintenance tasks.
+ To experiment with different architectures, hyperparameters, and optimisation techniques to enhance model accuracy and robustness.
+ To evaluate the performance of the developed models using appropriate metrics such as accuracy, precision, recall, and F1-score.
+ To deploy the trained models in a real-world industrial environment, ensuring compatibility with existing systems and workflows.

== Inserting Equations

One of the best ways to insert an equation is to use the Equation Editor tool of Microsoft Word to make the equation look very presentable. The equations should be numbered and must be referenced before they appear, similar to how figures and tables are numbered and referenced. The Equation Editor can be found under the Insert tab of the Microsoft Office environment, or press "*Alt* + =" on your keyboard to initiate an equation. To insert an equation number, follow the following steps:

+ Click inside the equation where the equation number should appear (at the end of the equation, within the equation text bubble)
+ Go to the "References" tab on the Ribbon.
+ Click on the "Insert Caption" button.
+ In the Caption dialogue box, select "Equation" from the "Label" dropdown menu.
+ Replicate what was done in Figure @fig:dialog for the figure caption, only if the prefix does not appear in the equation number [This step is optional].
+ Check the box that says "Exclude label from caption" to remove the word "Equation" from the caption.
+ Click "OK" to insert the equation number.
+ Place the cursor on the equation and apply the Eqn-Caption style to the equation.
+ Space/adjust the equation and the numbering to make sure the numbering is at the edge of the page and the equation stays at the centre as much as possible.

Examples of sample blocks of text to reference equations and the equations themselves are provided in the following paragraphs.

K-Means is an unsupervised learning algorithm used for clustering. Equation 1.1 represents the objective function, which aims to minimise the variance within each cluster.

$ bold(J = sum^k_(i=1)sum^n_(j=1)||x_j^((i))-mu_j||) $

Equation 1.2 is a key component of the Transformer model introduced by Vaswani et al. in 2017. It computes the attention scores used to weigh the importance of different words in a sequence for tasks like machine translation and text summarisation. In the equation, $S^m$ represents the *softmax* function.

$ bold(italic("Attention")(Q, K, V) = S^m ((Q K^T) / root(, d_k))V) $

#pagebreak(weak: true)

= Literature Review

== Preamble - A sample Heading 2 and Citations

Since the first paper @hyperheuristics-sales that coined the word "hyper-heuristics" to mean creating methods at a higher level than heuristics and metaheuristics to solve a wide range of optimisation problems was published, several advances have been made in the research field till date. *[You can see that there is a citation in the first sentence of this section. In-text citations require only the authors' last names; #text(fill: red)[initials and other names are not permitted]]*. Over the years, numerous amounts of research engaging hyper-heuristics have been done, cutting across several problem domains like Timetabling @high-school-timetabling, Bin Packing @champ, Traveling Salesman Problem @iterative-genetic, Boolean Satisfiability; also known as SAT @thompson, Permutation Flowshop Scheduling @assembly, Knapsack Problem @modified-choice, Multi-objective optimisation @bandit@aircraft@guava@epsilon@perturbation@manufacturing and recently to Bioinformatics @psp. This section extensively shows multiple versions of in-text citations.

== Other citation styles

*Narrative citations*: When the student mentions the author's name in the text, s/he should place only the year of publication in parentheses immediately after the author's name. Sometimes, in-text citations require only the year to be placed in brackets, especially in this situation called narrative citations. See some examples in the paragraphs that follow.

#cite(<vnd>, form: "prose") embedded a VND hyper-heuristic (VND-HH) into an Iterated Local Search (ILS) metaheuristic. The VND-HH constitutes the local search phase of the ILS framework. Each neighbourhood in the VND-HH is ranked, and this rank is updated during the search phase.

#cite(<graph-coloring>, form: "prose") proposed a grouping hyper-heuristic framework to tackle two optimisation problems that can be reduced to a grouping problem: graph colouring and 8 examination timetabling problems. Three sets of heuristics (LLHs) were presented: merge, divide, and change.

A sequence-based heuristic selection strategy (SSHH) was presented in the work of #cite(<markov>, form: "prose") and applied to the domain of high school timetabling. The study used move acceptance methods: Only Improving (OI), Simulated Annealing, Great Deluge, Record-to-Record Travel and Late Acceptance (LA). The proposed method is a perturbative selection hyper-heuristic method that was used to improve the quality of the initial solution. *[You would notice in this example that the full "and" is used in the narrative style rather than the use of the symbol "&"]*.

#cite(<aco>, form: "prose") addressed a scheduling problem with an ACO hyper-heuristic. They adopted ACO as the high-level strategy based on its effectiveness as a constructive population-based approach. In the ACO-based hyper-heuristic, the term "dynamic decision blocks" was adopted to enable the proposed approach to generate appropriate heuristic rules for the decision blocks.

=== A Heading 3 style

This style is below Heading 2.2, and it can be seen that the first section number is 2.2.1, signifying the first sub-section of section 2.2.

=== Another Heading 3 style

This is another Heading 3 style.

== Automated software engineering

*[This section demonstrates full use of Item, Text, Headings 2, 3, 4 styles]* using logically related content.

Automated software engineering techniques span various methodologies and tools to improve the software development lifecycle. These techniques can be categorised under various sub-sections, each addressing different aspects of software engineering. Here is an overview:

=== Automated Code Generation

One aspect is Model-Driven Development (MDD), which uses models as the primary artefacts of the development process. Examples include UML (Unified Modeling Language) and Domain-Specific Languages (DSLs) - Specialised languages tailored to specific problem domains, such as SQL for database querying or HTML for web content. Another aspect is the use of Template-Based Code Generators.

=== Automated Testing -- This has two Heading 4 sections

Automated testing is a method used in software development where automation tools are employed to control the execution of tests and the comparison of actual outcomes with predicted outcomes. This technique allows test scripts to be executed more quickly and frequently, improving accuracy and efficiency in the testing process. It is beneficial for repetitive tasks and regression tests, helping to ensure that changes to the code do not break existing functionality.

==== Unit Testing

Unit testing is a software testing method where individual units or software components are tested independently to ensure that each part functions correctly. A unit typically refers to the smallest testable part of an application, like functions, methods, or classes. Developers usually automate and write unit tests as they work on the code to ensure that any changes or additions do not break existing functionality. Some example tools include JUnit for Java, NUnit for .NET, and PyTest for Python.

==== Test Automation Frameworks

Test automation frameworks are sets of guidelines, tools, and practices designed to help in the creation and execution of automated test scripts. They aim to simplify the testing process and make it more efficient by providing a structured environment with reusable components. Some popular test automation frameworks include:

+ Selenium: Primarily used for web applications.
+ JUnit: Used for unit testing in Java.
+ TestNG: Similar to JUnit but with more features.
+ Cypress: For end-to-end testing of web applications.
+ Appium: For mobile application testing across platforms.

These frameworks help streamline the writing, maintenance, and execution of test scripts, making automated testing more accessible and manageable.

=== Artificial Intelligence in Software Engineering -- This has three Heading 4 sections

Artificial Intelligence (AI) is increasingly integrated into software engineering to enhance various development processes. AI's role in software engineering is growing, offering new tools and methods to improve efficiency, accuracy, and innovation.

==== AI-Driven Code Completion

AI-driven code completion tools use advanced machine learning models, often based on deep learning architectures like transformers, to predict and suggest code snippets or completions as developers type. These tools are trained on large code datasets from various sources, learning syntax, common patterns, libraries, and best practices. Some examples include:

+ *GitHub Copilot*: Developed by GitHub in collaboration with OpenAI, Copilot uses the Codex model to suggest entire lines or blocks of code based on the context of the current file.
+ *TabNine*: An AI-powered code completion tool that integrates with various editors and IDEs, providing context-aware suggestions.
+ *Kite*: A tool that offers code completions and documentation lookups powered by AI, supporting multiple programming languages.

==== Machine Learning for Bug Prediction

Machine learning for bug prediction involves training models on historical data of code commits, bug reports, and version control history to identify patterns and features indicative of buggy code. These models analyse metrics like code complexity, changes in code, developer activity, and historical bug fixes to predict potential bugs in new code. Examples include:

+ *Bugspots*: A lightweight tool that uses simple algorithms to identify hot spots in a codebase likely to contain bugs based on commit history.
+ *CodeGuru*: An Amazon Web Services (AWS) tool that uses machine learning to identify bugs and recommend fixes in Java applications.
+ *Predictive models in static analysis tools*: Advanced static analysis tools incorporate machine learning models to predict bug-prone areas in the code.

==== AI for Software Design
AI for software design leverages machine learning and artificial intelligence techniques to automate or assist in creating software design artefacts. These tools analyse requirements, existing codebases, and design patterns to generate design diagrams, architecture models, or code scaffolding. Some examples include:
+ *Archium*: A tool that assists in software architecture recovery and evolution by analysing source code and creating architecture diagrams.
+ *Design Automation with IBM Rational Rhapsody*: Uses AI to automate parts of the design process, generating UML diagrams and other design artefacts from requirements.
+ *Generative Design Models*: These AI-driven generative models create initial design proposals based on input requirements and constraints, which human designers can refine.

== Summary
In this chapter, we presented the various Heading styles and how they are applied. The various forms of in-text citations were also demonstrated, especially the narrative version of in-text citations where only the year of the reference is in parentheses.

#pagebreak(weak: true)

= Methodology/System Analysis and Design

== Presenting Algorithms
This section demonstrates how an algorithm should be presented in a project report. The presentation format is a table with a single column and multiple rows; one row corresponds to a line of the algorithm. Like tables and figures, an algorithm should be referenced before appearing in the report. The Iteration Limited Threshold Accepting (ILTA) method (presented in Algorithm @alg:ilta) accepts a proposed solution if it is equal to or better than the current solution based on the objective function value. Additionally, it can accept worsening moves if no better solution is generated over several iterations ($k$).

#algorithm-figure(name: "ILTA", lab: "ilta")[
  + *Input:* $k >= 0, T in (1.0, infinity), italic("bool") <- italic("false")$
  + *if* $e_italic("temp") < e_italic("cur")$
    + $italic("bool") <- italic("true")$
    + $w_italic("iter") <- 0$
  + *else if* $e_italic("temp") = e_italic("cur")$
    + $italic("bool") <- italic("true")$
  + *else*
    + $w_italic("iter") <- w_italic("iter") + 1$
    + *if* $w_italic("iter") >= k and e_italic("temp") < e_italic("best") * T$
      + $italic("bool") <- italic("true")$
      + $w_italic("iter") <- 0$
    + *end if*
  + *end if*
  + *return* $italic("bool")$
]

Algorithm @alg:ilta is the preferred format for the project report. However, the same algorithm has been presented with the table borders shown in Algorithm 3.2. This version is to provide evidence that the algorithm presentation is just a table with 1 column and many rows. To transform Algorithm @alg:ilta to Algorithm @fig:badILTA, Click /Select the table object and do the following to the table:

+ Remove the left border.
+ Remove the right border.
+ Remove the inside horizontal border.
+ Restore the bottom border of the first row (you have to place the cursor on that row first).

// this should not be used!
// it looks the same because there's no way to
// make it look "wrong"

#figure(
  kind: "algorithm",
  supplement: [Algorithm],
  align(left)[
    #lovelace.pseudocode-list(
      line-numbering: none,
      stroke: none,
      booktabs: true,
      title: box(width: 80%)[*Algorithm 3.2*: ILTA in Unaccepted Table Format],
    )[
      + *Input*: $k >= 0, T in (1.0, infinity), italic("bool") <- italic("false")$
      + *if* $e_italic("temp") < e_italic("cur")$
        + $italic("bool") <- italic("true")$
        + $w_italic("iter") <- 0$
      + *else if* $e_italic("temp") = e_italic("cur")$
        + $italic("bool") <- italic("true")$
      + *else*
        + $w_italic("iter") <- w_italic("iter") + 1$
        + *if* $w_italic("iter") >= k and e_italic("temp") < e_italic("best") * T$
          + $italic("bool") <- italic("true")$
          + $w_italic("iter") <- 0$
        + *end if*
      + *end if*
      + *return* $italic("bool")$
    ]
    #box(width: 1fr)
  ],
) <badILTA>
#v(-1.5em)

== More Equations

This section demonstrates more equations, further reinforcing what equation numbers look like based on the chapters in which they appear. Although equations are already present in the template, the first two equations in this chapter are numbered 3.1 and 3.2, similar to the numbering convention for figures and tables.

=== Routing Problem I: Travelling Salesman Problem

Given a set $C$ of cities and their distances from one another, the goal is to find a sequence where each city is visited only once, the route ends with the starting city, and the total distance covered is at a minimum. If the distance between two cities $i$ and $j$ is $d_italic("ij")$ and $x_italic("ij")$ captures whether a solution recommends the travelling salesman passes through the path $i,j$ (but not the reverse case), then the objective function of the problem can be expressed as:

$
  bold(f_italic("TSP") &= sum_(i = 1)^(|C|) sum_(j != i, j in C)^(|C|) d_"ij" * x_"ij"\, space space space space i\, j in {1, 2, ..., |C|}) \
  x_"ij" &= cases(1\, space italic("if there is a path from i to j"), 0\, space italic("otherwise"))
$

=== Routing Problem Domain II: Vehicle Routing
The variant of VRP implemented in HyFlex is the vehicle routing problem with time windows (VRP-TW); in this case, a customer must be served within a time frame before the constructed solution is considered valid @hyflex. All vehicles begin at a central location (the depot), which must be the first and last point visited for a given vehicle route. A unified objective function that encompasses two objectives of VRP-TW (minimising the number of vehicles and minimising the total distance travelled) is defined as follows:

$ bold(f_italic("VRP") = c * |V| + sum_(i = 1)^(|V|)d_i) $

where $V$ is the set of vehicles (fleet), $c$ is a constant set to 1000 and $d_i$ is the distance covered by a vehicle $i in V$ in its route. The value of $c$ is set to a high value to give a higher priority to solutions that use fewer vehicles. Therefore, a solution that uses two vehicles may likely be better (has a lower objective function value) than a solution that uses three vehicles even if more distance is covered by the two vehicles.

== Evaluation Schemes
This section is divided into two parts: the first demonstrates another Heading 3 style, while the second demonstrates another table.

=== Testing New Schemes
A time limit $t$ to run on each instance on a machine is set for the scheme, and the value (*in secs*) is determined by a benchmark program after sampling the speed of the machine. This procedure creates a level playing field amongst tested schemes, even if tested on different machines.

=== Evaluation Procedures
The first two evaluation procedures (before the last one) discussed in this sub-section have been used in previous studies to evaluate schemes comparatively. The first one (formula one) that is discussed is the most widely used procedure (Adriaensen, Brys & Nowé, 2014; Alanazi, 2016; Choong, Wong & Lim, 2018; Kheiri & Keedwell, 2015; Sabar, Ayob, Kendall & Qu, 2015; Sabar & Kendall, 2015) and it was introduced during the CHeSC 2011 competition.

==== Formula One
The Formula One evaluation procedure has its roots in the Formula One racing competition, where competing drivers are awarded points based on their finishing positions after a race. In our context, obtaining the best median objective function value on an instance is like winning a race for a competing method. An illustration of the formula one scoring and ranking on a sample instance of an arbitrary domain is depicted in Table @tbl:hyper *[You can see a table reference here]*. Regardless of the number of competing hyper-heuristics, only the top eight are awarded points on an instance in the following order: *10, 8, 6, 5, 4, 3, 2, 1*; that is, the method that got the best median objective function value (*ofv*) on a given instance gets *10* points, and the eight best gets *1* point.

#table-figure(
  caption: "Ranking the top ten hyper-heuristics on an arbitrary instance",
  lab: "hyper",
  table(
    columns: 5,
    align: center,
    table.header([Rank], [Hyper-heuristic], [Median ofv], [Formula 1 score], [Points used]),
    [1], [A], [1.0], [9.0], [10, 8],
    [2], [B], [1.0], [9.0], [10, 8],
    [3], [C], [3.0], [5.0], [6, 5, 4],
    [4], [D], [3.0], [5.0], [6, 5, 4],
    [5], [E], [3.0], [5.0], [6, 5, 4],
    [6], [F], [4.0], [2.5], [3, 2],
    [7], [G], [4.0], [2.5], [3, 2],
    [8], [H], [5.0], [0.5], [1],
    [9], [I], [5.0], [0.5], [1],
    [10], [J], [6.0], [0.0], [0],
  ),
)

==== #sym.mu\-norm and #sym.mu\-rank
In this section, we define/introduce a new style called Numbered-Item. This style may be used with the Item style (based on Roman numerals). The Numbered-Item should be higher than the Item style, using Hindu-Arabic numerals (1, 2, …) instead of Roman numerals. The two main metrics are discussed alongside two others as alternative evaluation methods besides the Formula One scoring system. These four metrics form parts of a whole evaluation method, i.e. they are typically used together (Almutairi, Özcan, Kheiri & Jackson, 2016).

// here we demonstrate overriding the default (i) numbering
#[
  #set enum(numbering: (it => numbering("1.", it)))

  + *μ-norm*: Given a problem domain, let $h$ represent a scheme, $i$ represent a single instance, $I$ represent a set of instances of the given problem domain, and $R$ represent the total number of runs made on each domain instance. The normalised ofv of a given run $r in R$ in the range [0, 1] by $h$ on an instance $i$, denoted as $italic("norm")_(i,r)^h$ is computed as follows:

    $ bold(italic("norm")_(i,r)^h = (O_(i,r)^h - O^w_i)/(O^b_i - O^w_i)) $

    The following variables $O_(i,r)^h$, $O_i^b$, $O_i^w$ represent the ofv of a given run r by the hyper-heuristic h, the ofv of the best run (the least ofv) by any given hyper-heuristic (including h) and the ofv of the worst run (the highest ofv) by any given hyper-heuristic (including h) on the given instance i respectively. The resulting metric for h on the problem domain is computed as follows:

    $ bold(mu_(italic("norm")^h) = (Sigma_(i=1)italic("norm")_(i,r)^h)/(|l| * r)) $

  + *μ-rank*: Given $n$ competing hyper-heuristics on an instance $i$ (as defined earlier), the best scheme based on its obtained median ofv gets a rank of *1*, and the worst hyper-heuristic on $i$ gets a rank of $n$. The rank of a scheme $h$ is denoted as $r_i^h$ , therefore the resulting metric for $h$ across all the instances is:

    $ bold(mu_(italic("rank")^h) = (Sigma_(i=1)r_i^h)/(|l|)) $
]

==== Inserting Figures Revisited
In this section, we demonstrate what adding a figure from another study/source looks like to the report. Firstly, the figure has to be referenced before it appears in the report, as per the usual rule. In the figure caption, the source of the figure has to be referenced, too. We provide two examples of this in the following paragraphs.

In this section, we present what evaluating a scheme with Box-plot visualisations looks like in Figure @fig:box.

#figure(
  caption: [A sample box-plot visualisation on two domains [Source: #cite(<markov>, form: "prose")]],
  image("images/bars.png"),
) <box>

The webpage for Internet connectivity login within the Covenant University community is presented in Figure @fig:login

#figure(
  caption: [Internet Connectivity login page within Covenant University [Source: internetlogin.cu.edu.ng]],
  image("images/logn.png"),
) <login>

== Summary of Styles used in this template
In this section, we describe all the styles relevant to this template to make students aware of them and use them appropriately.

=== Heading 1
This style is used for the chapter numberings - Chapter 1/One, Chapter 2/Two, Chapter 3/Three. The student should not apply it (bar any mistaken altering of the numbering) since the template already contains contents from Chapter One to Chapter Five. However, the student can edit the text behind each Chapter numbering if the title of the chapter is different based on the peculiarity of the work. For example, Chapter 3 might be named "METHODOLOGY" or "SYSTEM ANALYSIS AND DESIGN".

=== Heading 2
This style is used for the main sections of a chapter. Sections 2.1, 2.2, 2.3, 3.4, 4.2, ... should use the Heading 2 style.

=== Heading 3
This style is used for the sub-sections of Heading 2 (2.1, 2.2, 2.3, 3.4, 4.2) sections. For example, this section (3.4.3) uses Heading 3.

=== Heading 4
Heading 4 has an alphabetic numbering. It is the third-level section within a chapter of a student's project report.

=== Heading 5
Remember, there was an instruction not to create sections with Heading 5. That instruction is still valid. However, the style can only used for numbering algorithms, and it provides the automatic numbering functionality for algorithms if they appear in the project report. In the table header of the algorithm, type a text and apply the heading style, and the algorithm will be automatically labelled. Note that the contents of the rows of the algorithm presentation should use the Table-Text style since the presentation uses a table.

#algorithm-figure(name: "GCD Algorithm", lab: "gcd")[
  + *Input:* Two integers $a$ and $b$
  + *while* $b != 0$
    + $r = a space % space b$
    + $a = b$
    + $b = r$
  + *end while*
  + *return* $a$
]

=== Numbered-Item & Item
The two styles are for itemisation, but the Numbered-Item style is higher in the hierarchy than the Item style. However, if just one level of numbering is done, use only the Roman numeral style (Item). Let us see an example of how they can be used together:
Rendering algorithms in Computer Science can be categorised based on the rendering they perform. Here are some mentions of the main categories of rendering algorithms:

// we use the set rules to switch between using 1 and i
// because enums don't have levels

#[
  #set enum(numbering: (it => numbering("1.", it)))

  + *Rasterisation algorithms*: Rasterisation algorithms are computational methods used in computer graphics to convert vector graphics (defined by geometric shapes such as lines, triangles, and polygons) into raster images (composed of pixels or dots). Some of them include:
    #[
      #set enum(numbering: (it => strong[#numbering("(i)", it)]))
      + Scanline Rendering: Processes one scan at a time, filling in pixels between endpoints of each line segment.
      + Z-Buffer Algorithm: Determines visible surfaces by comparing the depths of objects against each other.
    ]

  + *Ray Tracing Algorithms*: Ray tracing algorithms are a set of computational methods used in computer graphics to generate highly realistic images by simulating how light interacts with objects in a virtual environment. Unlike rasterisation, which converts geometric shapes into pixels, ray tracing traces the path of light rays as they travel through the scene, allowing for accurate rendering of shadows, reflections, refractions, and other optical effects. Here are some sample algorithms under this category:
    #[
      #set enum(numbering: (it => strong[#numbering("(i)", it)]))
      + *Whitted-Style Ray Tracing*: This classic ray tracing algorithm introduced recursive ray tracing for reflections and refractions. It generates primary rays from the camera, and for each intersection, it generates secondary rays for shadows, reflections, and refractions.
      + *Path Tracing*: A more advanced form of ray tracing that simulates global illumination by tracing multiple paths per pixel and averaging the results. This algorithm handles complex lighting interactions such as indirect lighting, caustics, and colour bleeding.
      + *Metropolis Light Transport (MLT)*: This advanced ray tracing algorithm uses a Monte Carlo method to explore light paths. It focuses on the most significant paths to improve efficiency and reduce noise.
    ]

  + *Global Illumination Algorithm*: Global illumination (GI) algorithms are a class of algorithms in computer graphics that aim to simulate the complex interactions of light in a scene, including direct illumination from light sources and indirect illumination resulting from light bouncing off surfaces. These algorithms produce highly realistic images by accounting for all possible light paths, which include reflections, refractions, and scattering. Here are three prominent global illumination algorithms:
    #[
      #set enum(numbering: (it => strong[#numbering("(i)", it)]))
      + *Radiosity*: Radiosity is a global illumination algorithm that calculates the diffuse interreflection of light between surfaces. It is particularly well-suited for scenes where most surfaces are diffuse (i.e., they scatter light uniformly in all directions).
      + *Photon Mapping*: Photon mapping is a two-pass algorithm that efficiently simulates global illumination, including caustics, diffuse interreflection, and participating media.
      + *Bidirectional Path Tracing*: Bidirectional path tracing combines ideas from both path tracing and light tracing to improve convergence rates, especially in scenes with challenging lighting conditions. It traces rays from both the camera and the light sources, connecting them to form light transport paths.
    ]
]

=== Caption
This style is applied when the student adds a caption to a figure.

=== Table-Caption
The style is applied when the student adds a caption to a table.

=== Eqn-Caption
This style is applied when numbering is added to an equation.

=== Text
This particular statement is in text style.

=== Text-Narrow
Apply to the text in the abstract section.

=== Table Header & Table-Text
Table columns use the Table Header style, while the contents of a table use the Table-Text style.

#pagebreak(weak: true)

= System Implementation and Evaluation

== Preamble
This chapter provides instructions on what to do with each section before the first page of Chapter One

== Certification Page
In the prescribed order, fill in the relevant details, including the author's surname, first name, and last name. For the supervisor and the HoD details category, edit the contents if necessary. However, use the prescribed order for the names too: [Title in short form], then [First Name], then [Initial for the Middle Name], and then the [Surname]. The name "Dr. Aderonke A. Oni" fits the name format described earlier.

== Dedication Page
There is little to do here except fill in the dedication statement.

== Acknowledgements Page
The instructions here are similar to the instructions in section 4.3.

== Table of Contents Page
On this page, ensure the cursor is on the area where the actual contents are placed (it should be shaded when the cursor points there). Follow the steps below:

+ Right-click on that area and select "Update Field" to replace the existing table of contents with the contents of your report.
+ Highlight the parts of the table of contents before the line where "CHAPTER ONE" appears (the one with page 12 in Figure 4.1) and apply the *bold font* to these texts.
+ The contents before the main content (Chapter One) are all made bold, and the section is set.

#figure(caption: "Table of Contents when the cursor is on the active area", image("images/toc.png"))

== List of Figures Page
This section is a critical part of using this template, as it does not directly rely on the automatic placement feature provided by Microsoft Word. A demonstration will be done in this section to enable easy understanding of the task. Firstly, it is recommended that a copy of the project report be made to place the Automatic List of Figures in the report directly, or the Automatic List of Figures should be placed at the end of the report (and removed later). The Automatic List of Figures based on the contents of this template is presented as follows, although the figures in the Appendix section have been deliberately left out (this is not right, though):

// todo, add this

== List of Tables Page
See Section 4.6.

== Abbreviations
Replace the contents with the abbreviations of terms in the student's report.

== Abstract
Replace the content with the one-page Abstract of the project. The style to be applied is Text-Narrow.

= Conclusion and Recommendations

This chapter concludes by presenting the expected outline for each chapter.

== Chapter One
The contents of Chapter One are as follows:

+ Background Information
+ Statement of the Problem
+ Aim and Objectives of the Study
+ Methodology
+ Significance of the Study
+ Limitations of the Study
+ Project Outline

== Chapter Two
The Literature Review chapter is a critical component that provides context and background for the research/project. It demonstrates the student's understanding of the topic's existing research, identifies literature gaps, and positions the study within the broader academic conversation. It contains (not strictly) the following:

+ *Preamble*: It overviews and briefly introduces the literature review's main topic and purpose. Also, the *structure of the chapter* can be presented.
+ *Theoretical Framework*: Discuss the *major theories and models* relevant to the research topic. Define key terms and concepts that will be used in the study.
+ *Review of Key Studies*: Identify and discuss the foundational or seminal studies in the field/research topic. Review the most recent studies related to the topic. Highlight the methodologies used in previous research and discuss their relevance to the study. Summarise the main findings and contributions of the key studies.
+ *Themes and Trends*: Highlight any *emerging trends (technologies)* or new research areas in the field. *Discuss any controversies*, debates, or areas of disagreement among researchers.
+ *Gaps in the Literature*: Point out gaps or shortcomings in the existing literature/projects/software. Explain how the research/project will address these gaps and contribute to the field/the university community.
+ *Conclusion*: Summarise the key points discussed in the literature review. Reiterate how the literature review has informed the research questions or hypotheses or the plan for the project. Provide a transition to the project's next chapter, the methodology chapter.

== Chapter Three
This chapter provides a detailed account of the research methods or system development processes used in the study. Depending on the most suitable topic for the project (either "Methodology" or "System Analysis and Design"), It contains (not strictly) the following:

+ *Preamble*: Briefly introduce the *purpose of the chapter*. State the *objectives of the chapter*, whether it is to describe the research methodology or to detail the system analysis and design process.
+ *Research Design*: Describe the *approach*, whether the study is qualitative, quantitative, or mixed-methods. Specify the *type of study* (e.g., experimental, correlational, case study).
+ *System Analysis*: Clearly *define the problem* the system intends to solve. Identify and describe the needs of the users (*user requirements*). Outline the *functional and non-functional requirements* of the system. *Analyse existing systems* that will be replaced or integrated by the new system. Conduct a *feasibility study* covering technical, economic, legal, operational, and schedule feasibility.
+ *Research Methods*: For the *data collection methods*, describe the methods used for collecting *primary data* (e.g., surveys, interviews, experiments) and explain how *secondary data* was gathered and utilised. Describe the *participants or subjects* involved in the study, including selection criteria and sample size. Detail the *tools and instruments* used for data collection, such as *questionnaires*, *interview guides*, or *software tools*.
+ *System Design*: Describe the system's overall architecture, including high-level design components. Provide *Entity-Relationship* diagrams to represent data models. Describe the *database schema*, including tables, fields, and relationships. Design the *user interface*, including mockups or wireframes. Use *flowcharts* to represent system processes and workflows. Detail any *specific algorithms* used in the system.
+ *Data Analysis Plan*: Describe how the collected data will be *processed and prepared* for analysis. Detail the data analysis methods (e.g., statistical analysis, thematic analysis). Specify any *software or tools* used for data analysis (e.g., SPSS, MATLAB).
+ *Implementation Plan*: Describe the *hardware and software* environment used for system development. Discuss any *coding standards* or practices followed during development. Describe the testing procedure, such as the *unit testing* process and *tools*. Detail how different components were tested together (*integration testing*). Explain how the *complete system* was *tested*.
+ *Ethical Considerations*: Consent, Confidentiality, and Ethical Approval issues.
+ *Conclusion*: *Summarise* the key points covered in the chapter. Provide a *transition* to the next chapter.

== Chapter Four
By detailing the development process, testing, deployment, and evaluation, this chapter demonstrates the practical application of the project and assesses its effectiveness, providing valuable insights and recommendations for future work. It contains (not strictly) the following:

+ *Preamble*: Briefly *introduce* the *purpose* of the chapter. State the *main objectives of the chapter*, focusing on the implementation process and evaluation methods.
+ *System Implementation*: The implementation phases begin with the *setup and configuration* of the development environment. Describe the *coding and development phase*. Next is the *integration phase*, where different modules and components are integrated to address any challenges encountered. The *testing phase* should be carried out and described. Finally, the *deployment*, detailing the deployment steps and conducting post-deployment activities such as monitoring and maintenance.
+ *Evaluation*: Evaluate whether the system meets the *functional and non-functional requirements* specified in the design phase. Describe how *user feedback* was collected (e.g., surveys, interviews). Detail the *performance testing* methods and results, including response time and throughput metrics. Explain the *usability testing process and results*, including user satisfaction and ease of use. *Summarise the results* of the evaluation, highlighting key findings. Provide a *detailed analysis of the results*, discussing how well the system meets the specified requirements. Identify the *strengths and weaknesses of the system* based on the evaluation results.
+ *Discussion*: *Interpret the evaluation results*, explaining their significance and implications. *Compare* the developed system with existing systems or solutions. Discuss *any limitations* identified during the implementation and evaluation phases. *Provide recommendations* for improving the system based on the evaluation results and identified limitations.
+ *Conclusion*: *Summarise* the key points discussed in the chapter, including the implementation process and evaluation results. Suggest potential areas for *future work* or further development of the system. Provide a *transition to the next chapter*, which may cover the conclusions and recommendations of the study.

== Chapter Five
The contents of Chapter Five are as follows:
+ Summary
+ Conclusion
+ Recommendations

== References
The references section contains a list of all the cited works in APA style. The sample references used in this template appear in the list of references on the next page. Apply the *Bibliography* style to the references in the list added to the project report.
