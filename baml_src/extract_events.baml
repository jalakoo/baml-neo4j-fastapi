class Event{
    name string
    description string
    link string
    speaker Speaker
    datetime string
}

class Speaker{
    name string
    title string
    company Company?
}

class Company{
    name string
}

function ExtractEvents(raw_text: string) -> Event[] {
  client GPT4o
  prompt #"
    Parse the following content and extract the first 12 events.

    Content:
    ---
    {{raw_text}}
    ---

    {{ ctx.output_format }}
  "#
}

test stephen{
    functions [ExtractEvents]
    args {
        raw_text #"
            Graphs \n\n[ ![photo of Stephen\nChin](https://sessionize.com/image/bb41-400o400o1-EHvMKwbfP43RYxL9qJMwGv.jpg)\n02:00 am  \\-  02:10 am November 7  Welcome to NODES 2024 By Stephen Chin Vice\nPresident of Developer Relations, Neo4j\n](https://neo4j.com/nodes2024/agenda/welcome-to-nodes-2024/)
        "#
    }
}

test markdown{
    functions [ExtractEvents]
    args {
        raw_text #"
Chin](https://sessionize.com/image/bb41-400o400o1-EHvMKwbfP43RYxL9qJMwGv.jpg)
    02:00 am  \-  02:10 am November 7  Welcome to NODES 2024 By Stephen Chin Vice
    President of Developer Relations, Neo4j
    ](https://neo4j.com/nodes2024/agenda/welcome-to-nodes-2024/) [ ![photo of Ben
    Lorica](https://sessionize.com/image/4dd3-400o400o1-MDe6nCqjeo3V34UCLnpjtU.png)
    02:10 am  \-  02:55 am November 7  Keynote: Tracking the Pulse of Generative
    AI By Ben Lorica Host of the Data Exchange Podcast
    ](https://neo4j.com/nodes2024/agenda/keynote/) [ ![photo of Sudhir
    Hasbe](https://sessionize.com/image/34e2-400o400o1-XHCmDZtR4XGGaiyWu7HHTU.jpg)
    03:00 am  \-  03:30 am November 7  Neo4j Product Vision and Roadmap By Sudhir
    Hasbe Chief Product Officer, Neo4j
    ](https://neo4j.com/nodes2024/agenda/neo4j-product-vision-and-roadmap/) [
    ![photo of Andreas
    Kollegger](https://sessionize.com/image/9be1-400o400o1-3z1SkCUTLZX6NamTinAsif.png)
    ![photo of Ashleigh
    Faith](https://sessionize.com/image/33d7-400o400o1-LWRGtTrVo2iuFnU6xZ45yw.jpg)
    ![photo of Jeng Yang
    Chia](https://sessionize.com/image/2941-400o400o1-RHX7pnEb6Cf2iLqNssMcgy.jpg)
    ![photo of Lauren
    Sharman](https://sessionize.com/image/b7aa-400o400o1-BKLsiCYmP39SrJJH8VB5F1.jpg)
    03:30 am  \-  04:00 am November 7  Panel Discussion: Trends in Generative AI
    By Andreas Kollegger GenAI Lead, Neo4j, Ashleigh Faith Founder, IsA DataThing
    YouTube Channel, Jeng Yang Chia Co-Founder, WhyHow.AI, Lauren Sharman Head of
    Platform, One Peak ](https://neo4j.com/nodes2024/agenda/panel-discussion-
    trends-in-generative-ai/)
    
    [ ![photo of Clive
    Ntuli](https://sessionize.com/image/9ff6-400o400o1-TogNRMfK6ECdjZRR1mv5HH.jpg)
    04:00 am  \-  04:30 am November 7  GraphRAG for Increased Trust and Confidence
    in GenAI for Manufacturing Processes By Clive Ntuli Lead Data Scientist, GALLO
    ](https://neo4j.com/nodes2024/agenda/graphrag-for-increased-trust-and-
    confidence-in-genai-for-manufacturing-processes/) [ ![photo of Satej
    Sahu](https://sessionize.com/image/fdd7-400o400o1-Tvzi6itSQ8igdrSwetcx11.jpg)
    04:30 am  \-  05:00 am November 7  Enhancing RAG with Multi-Agent Integration:
    Leveraging Graph Data for Superior Data Validation By Satej Sahu Senior
    Software Data Architect, The Boeing Company
    ](https://neo4j.com/nodes2024/agenda/enhancing-rag-with-multi-agent-
    integration-leveraging-graph-data-for-superior-data-validation/) [ ![photo of
    Lois
    JI](https://sessionize.com/image/2122-400o400o1-GWmRHQTJWVcFB1xnW5ZX6C.jpg)
    05:00 am  \-  05:15 am November 7  Harness Graph Power With Agentic AI: An
    Insights Discovery Use Case By Lois JI Data Scientist, GovTech Singapore
    ](https://neo4j.com/nodes2024/agenda/harness-graph-power-with-agentic-ai-an-
    insights-discovery-use-case/) [ ![photo of Stephen Mc
    Gowan](https://sessionize.com/image/bb71-400o400o1-4xbEvfa87zg32eFWATkAx9.jpg)
    05:30 am  \-  06:00 am November 7  GraphRAG: Practical Experiences Using LLMs
    to Build and Interrogate a Regulatory Knowledge Graph By Stephen Mc Gowan CTO
    & Co-Founder, Realta Logic ](https://neo4j.com/nodes2024/agenda/graphrag-
    practical-experiences-using-llms-to-build-and-interrogate-a-regulatory-
    knowledge-graph/) [ ![photo of JiunYi
    Yang](https://sessionize.com/image/6473-400o400o1-KtARSVvKbokWawPVCsCXfS.jpg)
    06:00 am  \-  06:15 am November 7  Enhancing Chat-Based Customer
    Recommendations With GraphRAG and Hybrid Search By JiunYi Yang Staff AI
    Engineer, Hi5 Technology Inc. ](https://neo4j.com/nodes2024/agenda/enhancing-
    chat-based-customer-recommendations-with-graphrag-and-hybrid-search/) [
    ![photo of Karrtik
    Iyer](https://sessionize.com/image/1732-400o400o1-4Lu8qmiKaZHTMH8ePAY4fY.jpg)
    06:15 am  \-  06:45 am November 7  GNN-RAG: Bridging Graph Reasoning and
    Language Understanding for Enhanced Knowledge Retrieval By Karrtik Iyer Data
    Science Principal, Thoughtworks; Head of Data & AI Community, /tw India
    ](https://neo4j.com/nodes2024/agenda/gnn-rag-bridging-graph-reasoning-and-
    language-understanding-for-enhanced-knowledge-retrieval/) [ ![photo of Oleg
    Šelajev](https://sessionize.com/image/5ca7-400o400o1-nLuHACqrBji1V81wQdQsWE.jpg)
    07:00 am  \-  07:30 am November 7  Developer Productivity for GenAI Apps By
    Oleg Šelajev Developer Relations, Docker Inc.
    ](https://neo4j.com/nodes2024/agenda/developer-productivity-for-genai-apps/) [
    ![photo of Pontus
    Melke](https://sessionize.com/image/a669-400o400o1-U2QojFCDKizCwMgRNyGRck.jpg)
    07:30 am  \-  08:00 am November 7  Faster analytical queries with the Cypher
    Parallel Runtime By Pontus Melke Neo4j, senior staff engineer
    ](https://neo4j.com/nodes2024/agenda/faster-analytical-queries-with-the-
    cypher-parallel-runtime/) [ ![photo of Kais
    Zhioua](https://sessionize.com/image/e2b8-400o400o1-wNWyFVnoaAGP5Sowrbd1te.jpg)
    08:00 am  \-  08:15 am November 7  New Approach of Artificial Intelligence for
    Fertility Treatment Knowledge and Decision-Making By Kais Zhioua Founder &
    CEO, Tanit Healthcare Technologies ](https://neo4j.com/nodes2024/agenda/new-
    approach-of-artificial-intelligence-for-fertility-treatment-knowledge-and-
    decision-making/) [ ![photo of Michael
    Banf](https://sessionize.com/image/f1ac-400o400o1-Egn2X7ahz48yNqBbSUxqLq.png)
    08:15 am  \-  08:30 am November 7  More Patience for Patients:How LLMs and
    Graphs Enable Doctors to Focus on What They Signed Up For By Michael Banf
    Chief AI Scientist, Perelyn GmbH ](https://neo4j.com/nodes2024/agenda/more-
    patience-for-patientshow-llms-and-graphs-enable-doctors-to-focus-on-what-they-
    signed-up-for/) [ ![photo of Charles
    Borderie](https://sessionize.com/image/5b5b-400o400o1-XXt5PQE1AieGorg7gePnXd.jpg)
    08:30 am  \-  09:00 am November 7  Revolutionizing RAG for Financial Data With
    Knowledge Graphs By Charles Borderie CEO, Lettria
    ](https://neo4j.com/nodes2024/agenda/revolutionizing-rag-for-financial-data-
    with-knowledge-graphs/) [ ![photo of Andreas
    Kollegger](https://sessionize.com/image/9be1-400o400o1-3z1SkCUTLZX6NamTinAsif.png)
    ![photo of Emil
    Eifrem](https://sessionize.com/image/e5b8-400o400o1-SYU1xaqDKxpuzcZWiceUK1.jpg)
    09:00 am  \-  09:30 am November 7  Emil Eifrém and Andreas Kollegger Fireside
    Q&A By Andreas Kollegger GenAI Lead, Neo4j, Emil Eifrem Neo4j
    ](https://neo4j.com/nodes2024/agenda/emil-eifrem-and-andreas-kollegger-
    fireside-qa/)
    
    [ ![photo of Abhishek
    Das](https://sessionize.com/image/d388-400o400o1-QVmNiWYUFt4YgyDuLizoE7.jpeg)
    04:00 am  \-  04:30 am November 7  Neo4j and Next.js: A Full-Stack
    Relationship By Abhishek Das Building on NERD Stack
    ](https://neo4j.com/nodes2024/agenda/neo4j-and-next-js-a-full-stack-
    relationship/) [ ![photo of Adrien
    Sales](https://sessionize.com/image/b44b-400o400o1-3uPMcCpXj6Hu9asq9C2eC5.png)
    04:30 am  \-  05:00 am November 7  Cloud-Native Knowledge Graph Automation to
    Deliver AI Agents API By Adrien Sales Data Culture & Management Storyteller
    ](https://neo4j.com/nodes2024/agenda/cloud-native-knowledge-graph-automation-
    to-deliver-ai-agents-api/) [ ![photo of Parvez
    Alam](https://sessionize.com/image/4023-400o400o1-LRxc2b68Qn7Gwfkc6qbtBN.jpg)
    05:00 am  \-  05:15 am November 7  Demystifying Neo4j With APOC and Java By
    Parvez Alam Software Developer, Siemens, India
    ](https://neo4j.com/nodes2024/agenda/demystifying-neo4j-with-apoc-and-java/) [
    ![photo of Akash
    Chandra](https://sessionize.com/image/7439-400o400o1-4YGdwfM6crRrfBY34r5Lj5.png)
    05:30 am  \-  06:00 am November 7  Enhancing Financial Analytics With Event-
    Driven Architectures and Graph Neural Networks in Neo4j By Akash Chandra
    Founder and CEO, InsightAI ](https://neo4j.com/nodes2024/agenda/enhancing-
    financial-analytics-with-event-driven-architectures-and-graph-neural-networks-
    in-neo4j/) [ ![photo of Hiroyuki
    Koito](https://sessionize.com/image/23af-400o400o1-TVkcd9ksx3B7wayzLACoxF.jpg)
    06:00 am  \-  06:15 am November 7  Deciphering P&IDs: A Neo4j Approach to
    Design Automation By Hiroyuki Koito Design Innovation Unit Leader, JGC
    Corporation ](https://neo4j.com/nodes2024/agenda/deciphering-pids-a-
    neo4j-approach-to-design-automation/) [ ![photo of Chintan
    Desai](https://sessionize.com/image/82ac-400o400o1-aRs9AmXqj1he9eDfaLXg7r.jpg)
    06:15 am  \-  06:45 am November 7  Accelerate Go-to-Market: Leveraging Neo4j,
    Kubernetes, and Helm for Application Engineers By Chintan Desai Software
    Engineering Specialist, NICE ](https://neo4j.com/nodes2024/agenda/accelerate-
    go-to-market-leveraging-neo4j-kubernetes-and-helm-for-application-engineers/)
    [ ![photo of Grant
    Lodge](https://sessionize.com/image/c236-400o400o1-7cGG4HRQ8HHKAB7Gq2DTkF.jpg)
    ![photo of Rouven
    Bauer](https://sessionize.com/image/d413-400o400o1-d8046ad2-5dd9-4a58-b842-ed3d1fe74d4a.jpg)
    07:00 am  \-  07:15 am November 7  Rust Extension for the Python Driver By
    Grant Lodge Driver Engineer, Neo4j, Rouven Bauer Python Driver Author, Neo4j
    ](https://neo4j.com/nodes2024/agenda/rust-extension-for-the-python-driver/) [
    ![photo of Emre
    Hizal](https://sessionize.com/image/9855-400o400o1-UaMK47Fws36aZQhYTK2c5e.jpg)
    07:15 am  \-  07:30 am November 7  Configuring Kafka Connector to Process
    Typed Data and Handle Errors By Emre Hizal Software Engineer, Neo4j
    ](https://neo4j.com/nodes2024/agenda/configuring-kafka-connector-to-process-
    typed-data-and-handle-errors/) [ ![photo of Michal
    Štefaňák](https://sessionize.com/image/de7b-400o400o1-fj88dAdqbM639nv8ehEPVE.jpg)
    07:30 am  \-  08:00 am November 7  CypherGUI: User-Friendly Administration for
    Neo4j By Michal Štefaňák Software Developer, Technologies Specialist, and
    Problem Solver ](https://neo4j.com/nodes2024/agenda/cyphergui-user-friendly-
    administration-for-neo4j/) [ ![photo of Gem
    Lamont](https://sessionize.com/image/4999-400o400o1-TL2e5EsHMYzaDopgztz57C.jpg)
    08:00 am  \-  08:15 am November 7  Cypher Dynamism: A Step Towards Simpler and
    More Secure Queries By Gem Lamont Cypher Engineer, Neo4j
    ](https://neo4j.com/nodes2024/agenda/cypher-dynamism-a-step-towards-simpler-
    and-more-secure-queries/) [ ![photo of Salvatore
    Furnari](https://sessionize.com/image/9fb6-400o400o1-PPGB6YzUbBVUfXxMNYNHkz.jpg)
    08:15 am  \-  08:30 am November 7  Using Dynatrace and Kibana to Identify Bad
    Queries and Optimise Them According to Best Practices By Salvatore Furnari Big
    Data Engineer, Agile Lab ](https://neo4j.com/nodes2024/agenda/using-dynatrace-
    and-kibana-to-identify-bad-queries-and-optimise-them-according-to-best-
    practices/) [ ![photo of Mark
    Nelson](https://sessionize.com/image/90d0-400o400o1-w5t4Won1MHbkHJFU4ZcD4b.jpg)
    08:30 am  \-  09:00 am November 7  Modeling Enterprise Application
    Transformation in Neo4j By Mark Nelson Enterprise Architect
    ](https://neo4j.com/nodes2024/agenda/modeling-enterprise-application-
    transformation-in-neo4j/)
    
    [ ![photo of Sharmistha
    Chatterjee](https://sessionize.com/image/ab03-400o400o1-72hM1JJXJWJEscp9L5hDdC.jpg)
    04:00 am  \-  04:30 am November 7  Role of Knowledge Graphs in Mental Health
    Diagnosis and Cure By Sharmistha Chatterjee Author, Speaker, Google Developer
    Expert ](https://neo4j.com/nodes2024/agenda/role-of-knowledge-graphs-in-
    mental-health-diagnosis-and-cure/) [ ![photo of Divya
    Venkatraman](https://sessionize.com/image/9cd2-400o400o1-h9YJKAGbYXxFVGViyycZR6.jpg)
    ![photo of Vidyaraman
    Sankaranarayanan](https://sessionize.com/image/276c-400o400o1-pBDsUcyi7edSmGgdXctkw1.jpg)
    04:30 am  \-  05:00 am November 7  Compliance Map: Connecting Regulations and
    Frameworks for Smart Audits By Divya Venkatraman Data Science and AI
    Consultant and Educator, Vidyaraman Sankaranarayanan CPO, DeepDive Labs
    ](https://neo4j.com/nodes2024/agenda/compliance-map-connecting-regulations-
    and-frameworks-for-smart-audits/) [ ![photo of Siddhant
    Agarwal](https://sessionize.com/image/788d-400o400o1-HaZGK6NT4Hr84f4ovyp8H.jpg)
    05:00 am  \-  05:15 am November 7  From Ancient Epic to Modern Marvel:
    Demystifying the Mahabharata Chatbot with GraphRAG By Siddhant Agarwal
    Developer Relations Lead, Neo4j ](https://neo4j.com/nodes2024/agenda/from-
    ancient-epic-to-modern-marvel-demystifying-the-mahabharata-chatbot-with-
    graphrag/) [ ![photo of Aniruddha
    Chatterjee](https://sessionize.com/image/ab15-400o400o1-st8EvADhaZ6sde58tPdQ3Z.jpg)
    05:00 am  \-  05:15 am November 7  Using Graph Database As a Product Analysis
    Tool By Aniruddha Chatterjee Software Engineer, Sabre India
    ](https://neo4j.com/nodes2024/agenda/using-graph-database-as-a-product-
    analysis-tool/) [ ![photo of Sarah
    Toh](https://sessionize.com/image/2539-400o400o1-JuwdsScNMRuPTwRbjLoWKP.jpg)
    ![photo of Alejandro
    Seif](https://sessionize.com/image/68b0-400o400o1-95L5psUL85wFirhNkyYV9A.jpg)
    05:30 am  \-  06:00 am November 7  Empowering Lifelong Learning: Transforming
    Data into Insights With GraphRAG By Sarah Toh Data Scientist, GovTech
    Singapore and Skillsfuture Singapore, Alejandro Seif Data Scientist, GovTech
    Singapore ](https://neo4j.com/nodes2024/agenda/empowering-lifelong-learning-
    transforming-data-into-insights-with-graphrag/) [ ![photo of Pascal
    Sun](https://sessionize.com/image/e267-400o400o1-BKmajvb3MzQVSZj4vj7tYH.jpg)
    06:00 am  \-  06:15 am November 7  Talk With Your Documents Via Docs2KG By
    Pascal Sun PhD Candidate, University of Western Australia
    ](https://neo4j.com/nodes2024/agenda/talk-with-your-documents-via-docs2kg/) [
    ![photo of Amna
    Basharat](https://sessionize.com/image/cae6-400o400o1-ppDbxw9RqaQuAvVUF7C11D.png)
    06:15 am  \-  06:45 am November 7  Transforming Healthcare with Knowledge
    Graphs and AI: Integration, Analysis, and Visualization By Amna Basharat
    Assistant Professor, FAST National University of Computer & Emerging Sciences
    ](https://neo4j.com/nodes2024/agenda/transforming-healthcare-with-knowledge-
    graphs-and-ai-integration-analysis-and-visualization/) [ ![photo of Yogesh
    Kulkarni](https://sessionize.com/image/f93d-400o400o1-ba-
    fc9b-447d-a2cc-c71512873164.15ce0bd9-a113-410e-a65b-d963d8093e8b.JPG) 07:00 am
    \-  07:30 am November 7  Computing Midcurve of a Thin Polygon for Mechanical
    Engineering By Yogesh Kulkarni AI Advisor
    ](https://neo4j.com/nodes2024/agenda/computing-midcurve-of-a-thin-polygon-for-
    mechanical-engineering/) [ ![photo of Teoman Berkay
    Ayaz](https://sessionize.com/image/53c4-400o400o1-MLzHpJsZRhMZQtiHtmTYR5.jpg)
    07:30 am  \-  08:00 am November 7  Enhancing Business Process Anomaly
    Detection With Neo4j and Graph Neural Networks By Teoman Berkay Ayaz Data
    Scientist, Next4biz ](https://neo4j.com/nodes2024/agenda/enhancing-business-
    process-anomaly-detection-with-neo4j-and-graph-neural-networks/) [ ![photo of
    Clément
    Doumouro](https://sessionize.com/image/94ee-400o400o1-pdKYCdc8FEfVdpaCyo2rUS.jpg)
    08:00 am  \-  08:15 am November 7  Datashare and Neo4j: From Unstructured
    Documents to Knowledge Graphs for Investigative Journalism By Clément Doumouro
    Machine Learning Engineer, ICIJ
    ](https://neo4j.com/nodes2024/agenda/datashare-and-neo4j-from-unstructured-
    documents-to-knowledge-graphs-for-investigative-journalism/) [ ![photo of
    Siraj
    Munir](https://sessionize.com/image/30ca-400o400o1-1d81c89e-a0d9-4552-8e39-5dfe504a9479.jpg)
    ![photo of Rimsha
    Imran](https://sessionize.com/image/fb3c-400o400o1-VRtET4Jue8xzoXS6RFxNKP.jpg)
    08:15 am  \-  08:30 am November 7  Why Data Modeling Matters and Why It's
    Important to You By Siraj Munir Data Scientist and AI Researcher, Rimsha Imran
    Software Developer ](https://neo4j.com/nodes2024/agenda/why-data-modeling-
    matters-and-why-its-important-to-you/) [ ![photo of Jareth
    Reeves](https://sessionize.com/image/0233-400o400o1-MHn6N8PY6j2AakPkTCmcCQ.jpg)
    ![photo of Robert
    Butler](https://sessionize.com/image/44d9-400o400o1-pZ46Pxo14R7ZKtGoM4RJQ1.jpg)
    ![photo of Jake
    Williams](https://sessionize.com/image/d5ea-400o400o1-QkDi9kHULy2usMEqd1BXQs.jpg)
    08:30 am  \-  09:00 am November 7  Capital Project Risk Management With Neo4j:
    Visualising and Managing Complex Risk Portfolios By Jareth Reeves Director,
    Kaleido, Robert Butler Principal Project Consultant, Kaleido, Jake Williams
    Principal Project Consultant, Kaleido
    ](https://neo4j.com/nodes2024/agenda/capital-project-risk-management-with-
    neo4j-visualizing-and-managing-complex-risk-portfolios/)
    
    [ ![photo of Clemens
    Anzmann](https://sessionize.com/image/3f35-400o400o1-94eZgMJ7Z6v1ekMsaJEcxC.png)
    04:00 am  \-  04:30 am November 7  Creating Awesome Graph Visualization With
    the Neo4j Visualization Library NVL By Clemens Anzmann Software Engineer,
    Neo4j ](https://neo4j.com/nodes2024/agenda/creating-awesome-graph-
    visualization-with-the-neo4j-visualization-library-nvl/) [ ![photo of Qianhao
    Liu](https://sessionize.com/image/90b7-400o400o1-9mEaapRcYjKiz1oZXUTEoh.jpg)
    ![photo of Kim
    Robinson](https://sessionize.com/image/2490-400o400o1-4JP38CLYrJ2TmP7gWfqXzG.jpg)
    04:30 am  \-  05:00 am November 7  Knowledge Graph For Digital Twin By Qianhao
    Liu Developer, AiSpanner, Kim Robinson Developer, AiSpanner
    ](https://neo4j.com/nodes2024/agenda/knowledge-graph-for-digital-twin/) [
    ![photo of Pavan Kumar
    Narendra](https://sessionize.com/image/b465-400o400o1-p4kzfq9pUt1vYqdtBg2Vv2.jpg)
    05:00 am  \-  05:15 am November 7  Easy Metadata Management (Git for Data)
    Using Neo4j By Pavan Kumar Narendra Founder, Suketa Technology Solutions LLP
    ](https://neo4j.com/nodes2024/agenda/easy-metadata-management-git-for-data-
    using-neo4j/) [ ![photo of Koji
    Annoura](https://sessionize.com/image/f9de-400o400o1-D78g36ew5QtQNn1tnaatXY.jpg)
    05:30 am  \-  05:45 am November 7  Earthquake Knowledge Graph in Japan By Koji
    Annoura CTO, UTI, Inc. ](https://neo4j.com/nodes2024/agenda/earthquake-
    knowledge-graph-in-japan/) [ ![photo of Michela
    Ledwidge](https://sessionize.com/image/8ab2-400o400o1-N5L5s83QJnS448vpCcnGfV.jpg)
    05:45 am  \-  06:00 am November 7  Spatial Graph Visualisation and
    Storytelling with Grapho XR By Michela Ledwidge Creative & Technical Director,
    Mod ](https://neo4j.com/nodes2024/agenda/spatial-graph-visualisation-and-
    storytelling-with-grapho-xr/) [ ![photo of Muhammad Arif
    Wicaksana](https://sessionize.com/image/e902-400o400o1-3fUdyxyoqRCjjRwM1K8aRP.jpg)
    06:00 am  \-  06:15 am November 7  Constructing Knowledge Graphs from
    Sharepoint Site By Muhammad Arif Wicaksana Sales Engineer, Neo4j
    ](https://neo4j.com/nodes2024/agenda/constructing-knowledge-graphs-from-
    sharepoint-site/) [ ![photo of Ashok
    Vishwakarma](https://sessionize.com/image/a481-400o400o1-EfNBzwxkREavx7CXD4rrEZ.jpg)
    06:15 am  \-  06:45 am November 7  Building Knowledge Base for Real Estate
    Using Gemma and Neo4j By Ashok Vishwakarma CTO, Impulsive Web
    ](https://neo4j.com/nodes2024/agenda/building-knowledge-base-for-real-estate-
    using-gemma-and-neo4j/) [ ![photo of Cuneyt
    Tyler](https://sessionize.com/image/8096-400o400o1-Dtu7qkk6uJui1d2hzCKMfm.jpg)
    07:00 am  \-  07:30 am November 7  Using Dbpedia and Wikidata Knowledge Graphs
    With Neo4j to Enhance the Knowledge Browsing Experience By Cuneyt Tyler
    Founder, Semantic Space ](https://neo4j.com/nodes2024/agenda/using-dbpedia-
    and-wikidata-knowledge-graphs-with-neo4j-to-enhance-the-knowledge-browsing-
    experience/) [ ![photo of Antonio Javier Nakhal
    Akel](https://sessionize.com/image/b40e-400o400o1-S1UrbCDE5ipftWXJhd9FJb.jpg)
    ![photo of Riccardo
    Patriarca](https://sessionize.com/image/864a-400o400o1-wbpgGpXwregDYEaDjDyKyg.jpg)
    ![photo of Elena
    Stefana](https://sessionize.com/image/9c1a-400o400o1-MNxyYeXmfdXHLqZgQ77ARu.jpg)
    ![photo of Francesco
    Simone](https://sessionize.com/image/f6a5-400o400o1-PUYXDYh8n4rUrPPdpKP2Fj.jpg)
    07:30 am  \-  08:00 am November 7  How to Navigate the Complicated World of
    Modern Industrial Establishments By Antonio Javier Nakhal Akel Post Doctoral
    Researcher, Sapienza Università di Roma, Riccardo Patriarca Tenure-Track
    Assistant Professor, Sapienza Università di Roma, Elena Stefana Researcher,
    Sapienza Università di Roma, Francesco Simone PhD Student, Sapienza Università
    di Roma ](https://neo4j.com/nodes2024/agenda/how-to-navigate-the-complicated-
    world-of-modern-industrial-establishments/) [ ![photo of Pierre
    Halftermeyer](https://sessionize.com/image/512f-400o400o1-hfCGW2rvhvH9mu4QfwLtLE.png)
    08:00 am  \-  08:30 am November 7  Speed and Precision: Mastering Graph
    Traversal With Quantified Path Patterns By Pierre Halftermeyer Senior
    Solutions Engineer, Neo4J ](https://neo4j.com/nodes2024/agenda/speed-and-
    precision-mastering-graph-traversal-with-quantified-path-patterns/) [ ![photo
    of Dattaraj
    Rao](https://sessionize.com/image/fbbd-400o400o1-91bMm25MkC4UzearE8T6hY.JPG)
    ![photo of Venkateshwar
    Tyagi](https://sessionize.com/image/280a-400o400o1-LcoeCBH3vWn9mBfURdWwdd.png)
    ![photo of Sadashiv
    Borkar](https://sessionize.com/image/c1c4-400o400o1-fKs69ZdGizg5rmRmugZt4G.jpg)
    08:30 am  \-  09:00 am November 7  Cybersecurity Risk Assessment Using LLM
    Agents and Graph Data Science By Dattaraj Rao Chief Data Scientist,
    Persistent, Venkateshwar Tyagi Senior Manager, Persistent, Sadashiv Borkar
    Senior Data Scientist, Persistent
    ](https://neo4j.com/nodes2024/agenda/cybersecurity-risk-assessment-using-llm-
    agents-and-graph-data-science/)
    
    ## Europe
    
    Sessions by Track in Your Timezone
    
      * General Sessions 
      * AI 
      * Application...[log trimmed]...h-mongo2neo4j-and-semspect/) [ ![photo of Payam Fatehi
    Karjou](https://sessionize.com/image/50ef-400o400o1-K8BBi1gfwsDMMsRP63mVMH.jpg)
    ![photo of Carmine
    Petruzzelli](https://sessionize.com/image/a0bc-400o400o1-KnevyxBTWmGGBhQKKN9TcC.jpg)
    02:30 pm  \-  02:45 pm November 7  Integrating IoT, GPT Models, and Knowledge
    Graphs for Future Smart Districts By Payam Fatehi Karjou Research Associate,
    RWTH Aachen University, Carmine Petruzzelli Energy Engineering Student, RWTH
    Aachen University ](https://neo4j.com/nodes2024/agenda/integrating-iot-gpt-
    models-and-knowledge-graphs-for-future-smart-districts/) [ ![photo of Leonie
    Engemann](https://sessionize.com/image/a33d-400o400o1-siDsojLKCyJgrok5UcK9GL.jpg)
    02:45 pm  \-  03:00 pm November 7  Enhancing Supply Chain Resilience and
    Transparency Through Spatial Knowledge Graphs By Leonie Engemann Master's
    Student, University of Augsburg, esri Germany
    ](https://neo4j.com/nodes2024/agenda/enhancing-supply-chain-resilience-and-
    transparency-through-spatial-knowledge-graphs/) [ ![photo of Stu
    Moore](https://sessionize.com/image/4e4d-400o400o1-auZM5h898evWduwoKgtTr9.jpg)
    ![photo of Zach
    Blumenfeld](https://sessionize.com/image/8310-400o400o1-32d402f9-f463-4eb8-938c-8dbe1ce7d43d.jpg)
    03:00 pm  \-  03:30 pm November 7  Neo4j GDS for Snowflake By Stu Moore
    Product Manager, Neo4j, Zach Blumenfeld Graph Data Science & AI Specialist,
    Neo4j ](https://neo4j.com/nodes2024/agenda/neo4j-gds-for-snowflake/) [ ![photo
    of Ali
    Ismail](https://sessionize.com/image/da38-400o400o1-H3fboBLWF6re3NHAZBjWv1.jpg)
    03:30 pm  \-  03:45 pm November 7  Graph-Based Approach for Advanced Analysis
    of Building Design models By Ali Ismail BIM Expert, Dubai Municipality
    ](https://neo4j.com/nodes2024/agenda/graph-based-approach-for-advanced-
    analysis-of-building-design-models/) [ ![photo of Federica
    Ventruto](https://sessionize.com/image/dcff-400o400o1-seJ5xfGNfrV6bug6r6WRzc.jpg)
    04:00 pm  \-  04:30 pm November 7  Beyond the Silos: Achieving Data Harmony
    With Graph-Based ER By Federica Ventruto Data Scientist, GraphAware
    ](https://neo4j.com/nodes2024/agenda/beyond-the-silos-achieving-data-harmony-
    with-graph-based-er/) [ ![photo of Matthew
    Gerring](https://sessionize.com/image/c275-400o400o1-MaHUYck7QbAe6ieHSaU9cB.png)
    04:30 pm  \-  05:00 pm November 7  Update on Genetic Graph Using Massively-
    Extended Neo4j By Matthew Gerring Computational Scientist
    ](https://neo4j.com/nodes2024/agenda/update-on-genetic-graph-using-massively-
    extended-neo4j/)
    
    [ ![photo of Benjamin
    Niedermann](https://sessionize.com/image/0609-400o400o1-EBhXKTe1Qf8e8mUY15CWao.png)
    12:00 pm  \-  12:30 pm November 7  Advanced Graph Visualizations in Jupyter
    Notebooks By Benjamin Niedermann Algorithm Engineer, yWorks
    ](https://neo4j.com/nodes2024/agenda/advanced-graph-visualizations-in-jupyter-
    notebooks/) [ ![photo of Dr Alan
    Brown](https://sessionize.com/image/7034-400o400o1-DitRx6kuziFqYb2XrHBZJf.jpg)
    ![photo of Suzie
    Ogilvie](https://sessionize.com/image/4993-400o400o1-anaL2zefZmzCJKnFqvKKCN.jpg)
    12:30 pm  \-  01:00 pm November 7  Knowledge Graphs in Action: Identifying
    Sanctions Circumvention in a Complex Global Landscape By Dr Alan Brown CTO,
    Aptitude Global, Suzie Ogilvie Partner, Ogiro Risk
    ](https://neo4j.com/nodes2024/agenda/knowledge-graphs-in-action-identifying-
    sanctions-circumvention-in-a-complex-global-landscape/) [ ![photo of Drew
    McCornack](https://sessionize.com/image/acd2-400o400o1-rshPfVFvaCYAtFF5GJj9NT.jpg)
    01:00 pm  \-  01:15 pm November 7  Enhancing Knowledge Graphs with LLMs: A
    Novel Approach to Keyword Extraction and Synonym Merging By Drew McCornack
    Senior ML Engineer, EQT Partners
    ](https://neo4j.com/nodes2024/agenda/enhancing-knowledge-graphs-with-llms-a-
    novel-approach-to-keyword-extraction-and-synonym-merging/) [ ![photo of Jörg
    Baach](https://sessionize.com/image/3f34-400o400o1-YH7R7NhB3YyVZsXrfR8sX3.jpg)
    01:30 pm  \-  02:00 pm November 7  Leveraging Semantic Networks for Data
    Integration at Deutsche Bahn By Jörg Baach Graph Integration Expert, DB Systel
    ](https://neo4j.com/nodes2024/agenda/leveraging-semantic-networks-for-data-
    integration-at-deutsche-bahn/) [ ![photo of Phil
    Stott](https://sessionize.com/image/57f7-400o400o1-nKEmb21fh4b8EXrKj8E7Rv.jpg)
    ![photo of Will
    Woodward](https://sessionize.com/image/ba7f-400o400o1-RWxffSCYdbvBu7abj63v3C.png)
    02:00 pm  \-  02:30 pm November 7  Neo4j's Risk Register: Maximise Your Data
    Insights By Phil Stott Senior Manager, Support Operations, Neo4j, Will
    Woodward Risk Analyst Intern, Neo4j
    ](https://neo4j.com/nodes2024/agenda/neo4js-risk-register-maximise-your-data-
    insights/) [ ![photo of Syméon del
    Marmol](https://sessionize.com/image/bc6e-400o400o1-GYe7bGYfUoWufsz6TJt6NZ.jpg)
    ![photo of Laurent
    Chatelanat](https://sessionize.com/image/c3b1-400o400o1-EnMsftKxA981MwpSP6QCcc.jpg)
    02:30 pm  \-  03:00 pm November 7  Knowledge Graph of Your IT Landscape: Code
    Is Graph Data By Syméon del Marmol Head of Product Architecture, Olympe SA,
    Laurent Chatelanat Founder, Olympe SA
    ](https://neo4j.com/nodes2024/agenda/knowledge-graph-of-your-it-landscape-
    code-is-graph-data/) [ ![photo of Panos
    Alexopoulos](https://sessionize.com/image/03a1-400o400o1-BJggFmeUzAj8B1UtNfN4fj.jpg)
    03:00 pm  \-  03:30 pm November 7  From RDF to LPG and Back: Mastering
    Knowledge Graph Transformations Without Compromising Meaning By Panos
    Alexopoulos Data and AI Professional
    ](https://neo4j.com/nodes2024/agenda/from-rdf-to-lpg-and-back-mastering-
    knowledge-graph-transformations-without-compromising-meaning/) [ ![photo of
    Merry
    McCarron](https://sessionize.com/image/5843-400o400o1-9WNxWHNERXaJCTLasmYLVx.jpg)
    03:30 pm  \-  03:45 pm November 7  Combating Gun Trafficking and Gun Violence
    With Graph Analytics and Visualization By Merry McCarron Co-Founder and Head
    of Alternative Data Analytics, MK Analytics
    ](https://neo4j.com/nodes2024/agenda/combating-gun-trafficking-and-gun-
    violence-with-graph-analytics-and-visualization/) [ ![photo of Jean
    Villedieu](https://sessionize.com/image/4a53-400o400o1-7493a0ab-479f-49d2-967d-d5b989dfb4fc.jpg)
    04:00 pm  \-  04:30 pm November 7  Building an Entity-Resolved Knowledge
    Graph: Why and How By Jean Villedieu Head of Sales, Linkurious
    ](https://neo4j.com/nodes2024/agenda/building-an-entity-resolved-knowledge-
    graph-why-and-how/) [ ![photo of Kevin
    Gomez](https://sessionize.com/image/97ce-400o400o1-NTfQFjPLESfXCLKNAYEmpj.jpg)
    ![photo of Christopher
    Rost](https://sessionize.com/image/a00c-400o400o1-nT3VjtGxdNZL6b9iS1HgEo.jpg)
    04:30 pm  \-  05:00 pm November 7  CDC Analytics With Graph Stream Zoomer By
    Kevin Gomez Consulting Engineer, Neo4j, Christopher Rost Researcher, Leipzig
    University ](https://neo4j.com/nodes2024/agenda/cdc-analytics-with-graph-
    stream-zoomer/)
    
    ## Americas
    
    Sessions by Track in Your Timezone
    
      * General Sessions 
      * AI 
      * Applications 
      * Data Science 
      * Graphs 
    
    [ ![photo of Stephen
    Chin](https://sessionize.com/image/bb41-400o400o1-EHvMKwbfP43RYxL9qJMwGv.jpg)
    06:00 pm  \-  06:15 pm November 7  Welcome to NODES 2024 By Stephen Chin Vice
    President of Developer Relations, Neo4j
    ](https://neo4j.com/nodes2024/agenda/welcome-to-nodes-2024-3/) [ ![photo of
    Ben
    Lorica](https://sessionize.com/image/4dd3-400o400o1-MDe6nCqjeo3V34UCLnpjtU.png)
    06:15 pm  \-  07:00 pm November 7  Keynote: Tracking the Pulse of Generative
    AI By Ben Lorica Host of the Data Exchange Podcast
    ](https://neo4j.com/nodes2024/agenda/keynote-3/) [ ![photo of Sudhir
    Hasbe](https://sessionize.com/image/34e2-400o400o1-XHCmDZtR4XGGaiyWu7HHTU.jpg)
    07:00 pm  \-  07:30 pm November 7  Neo4j Product Vision and Roadmap By Sudhir
    Hasbe Chief Product Officer, Neo4j
    ](https://neo4j.com/nodes2024/agenda/neo4j-product-vision-and-roadmap-3/) [
    ![photo of Andreas
    Kollegger](https://sessionize.com/image/9be1-400o400o1-3z1SkCUTLZX6NamTinAsif.png)
    ![photo of Ashleigh
    Faith](https://sessionize.com/image/33d7-400o400o1-LWRGtTrVo2iuFnU6xZ45yw.jpg)
    ![photo of Jeng Yang
    Chia](https://sessionize.com/image/2941-400o400o1-RHX7pnEb6Cf2iLqNssMcgy.jpg)
    ![photo of Lauren
    Sharman](https://sessionize.com/image/b7aa-400o400o1-BKLsiCYmP39SrJJH8VB5F1.jpg)
    07:30 pm  \-  08:00 pm November 7  Panel Discussion: Trends in Generative AI
    By Andreas Kollegger GenAI Lead, Neo4j, Ashleigh Faith Founder, IsA DataThing
    YouTube Channel, Jeng Yang Chia Co-Founder, WhyHow.AI, Lauren Sharman Head of
    Platform, One Peak ](https://neo4j.com/nodes2024/agenda/panel-discussion-
    trends-in-generative-ai-3/)
    
    [ ![photo of Leann
    Chen](https://sessionize.com/image/c888-400o400o1-4KM3HkWDyq9eTNPrfm4yQx.jpg)
    08:00 pm  \-  08:30 pm November 7  Enhance LLM Applications' Trustworthiness
    and Explainability By Leann Chen Generative AI Developer Advocate, Diffbot
    ](https://neo4j.com/nodes2024/agenda/enhance-llm-applications-trustworthiness-
    and-explainability/) [ ![photo of Ashleigh
    Faith](https://sessionize.com/image/33d7-400o400o1-LWRGtTrVo2iuFnU6xZ45yw.jpg)
    08:30 pm  \-  09:00 pm November 7  How Trustworthy is Your Knowledge Graph? By
    Ashleigh Faith Founder, IsA DataThing YouTube Channel
    ](https://neo4j.com/nodes2024/agenda/how-trustworthy-is-your-knowledge-graph/)
    [ ![photo of Kim
    Adler](https://sessionize.com/image/62bc-400o400o1-MyFnnsjGWinnbqZpwEiUZ2.jpg)
    09:00 pm  \-  09:15 pm November 7  From Image to Graph: Leveraging Tesseract
    OCR Engine for Document Chunking and GraphRAG By Kim Adler Manager, Pfizer
    ](https://neo4j.com/nodes2024/agenda/from-image-to-graph-leveraging-tesseract-
    ocr-engine-for-document-chunking-and-graphrag/) [ ![photo of Michael
    Morgan](https://sessionize.com/image/8de4-400o400o1-7uBzoQfZdUkK82H1VeYWRT.PNG)
    09:30 pm  \-  09:45 pm November 7  The Virtuous Graph: Open Graph Development
    Initiative By Michael Morgan Virtuous Graph Evangelist
    ](https://neo4j.com/nodes2024/agenda/the-virtuous-graph-open-graph-
    development-initiative/) [ ![photo of Vidya
    S](https://sessionize.com/image/3684-400o400o1-7BemwMEsnXPEfN7xCswgah.jpg)
    09:30 pm  \-  09:45 pm November 7  Unified Learning Approach using KG-RAG-
    Chatbot (Ukit) By Vidya S Data Scientist, amii
    ](https://neo4j.com/nodes2024/agenda/unified-learning-approach-using-kg-rag-
    chatbot-ukit/) [ ![photo of Akhil
    Hemanth](https://sessionize.com/image/8084-400o400o1-PywBJQUzv7vr3AzpboboxA.jpg)
    09:45 pm  \-  10:00 pm November 7  Graph-Driven Knowledge Retrieval: Neo4j for
    Healthcare Building Codes By Akhil Hemanth Design Professional, HKS, Inc.
    ](https://neo4j.com/nodes2024/agenda/graph-driven-knowledge-retrieval-
    neo4j-for-healthcare-building-codes/) [ ![photo of Joseph
    Naccarato](https://sessionize.com/image/27b7-400o400o1-PyVXC291zktFBouepo7ZSW.jpg)
    ![photo of Jevonia
    Harris](https://sessionize.com/image/af00-400o400o1-3ptUD2HsaJqn6WjVC4M6ZC.jpg)
    10:00 pm  \-  10:30 pm November 7  Generating Faculty-Specific Course
    Materials With Neo4j and Claude By Joseph Naccarato Educational Software
    Developer, University of Delaware, Jevonia Harris Educational Software
    Engineer, University of Delaware
    ](https://neo4j.com/nodes2024/agenda/generating-faculty-specific-course-
    materials-with-neo4j-and-claude/) [ ![photo of Daniel
    Marian](https://sessionize.com/image/e5b2-400o400o1-JEkU2pBpXb8JPHtgpZrBqM.jpg)
    ![photo of Radu
    Marian](https://sessionize.com/image/4c21-400o400o1-p47RUH8EjwMCGv9mMeWXcm.jpg)
    10:30 pm  \-  10:45 pm November 7  TrainSim: A GenAI Restaurant Server
    Training and Customer Simulation ChatBot By Daniel Marian True Knowledge is
    Knowing What You Don't Know, Radu Marian Enterprise Without a KG is like
    Country Without a Map. ](https://neo4j.com/nodes2024/agenda/trainsim-a-genai-
    restaurant-server-training-and-customer-simulation-chatbot/) [ ![photo of
    Antonio
    Zaballos](https://sessionize.com/image/44c4-400o400o1-sb4cLcw9zZVPQzsvhnmyow.jpg)
    10:45 pm  \-  11:00 pm November 7  RAG with Azure Open AI and Contextualised
    Neo4J Chatbot for Document Digitization By Antonio Zaballos AI Engineer,
    Aptitude Global ](https://neo4j.com/nodes2024/agenda/rag-with-azure-open-ai-
    and-contextualised-neo4j-chatbot-for-document-digitization/) [ ![photo of Phil
    Meredith](https://sessionize.com/image/3009-400o400o1-XRKEXFWXTmUKzWjsfWSWH3.png)
    ![photo of Cristian
    Stelea](https://sessionize.com/image/86a1-400o400o1-WAK9zxzCagWL7eLQiTWiR8.jpg)
    11:00 pm  \-  11:30 pm November 7  Building the Perfect Supply Chain Chatbot
    By Phil Meredith CEO, Process Tempo Inc., Cristian Stelea Managing Director,
    Stelytics LLC ](https://neo4j.com/nodes2024/agenda/building-the-perfect-
    supply-chain-chatbot/) [ ![photo of Otávio Calaça
    Xavier](https://sessionize.com/image/1e9f-400o400o1-wcFzfCgtFoUhe2uLkLBFyK.jpg)
    11:30 pm  \-  11:45 pm November 7  Optimizing Real-Time Job Matching:
    Integrating Neo4j With RAG By Otávio Calaça Xavier Senior Software Architect
    and Deep Learning Researcher ](https://neo4j.com/nodes2024/agenda/optimizing-
    real-time-job-matching-integrating-neo4j-with-rag/) [ ![photo of Rachel
    Roumeliotis](https://sessionize.com/image/b717-400o400o1-wnUrbwrMq9jZ3WJqUiBREb.jpg)
    ![photo of Arun
    Gupta](https://sessionize.com/image/b25f-400o400o1-d5cd9cbb-784b-4f01-bc30-336bd68dce7b.jpg)
    12:00 am  \-  12:30 am November 8  Composable RAG Pipelines With OPEA
    Highlighting GraphRAG By Rachel Roumeliotis Director, Open Source Strategy,
    Intel, Arun Gupta Vice President, Intel
    ](https://neo4j.com/nodes2024/agenda/composable-rag-pipelines-with-opea-
    highlighting-graphrag/) [ ![photo of Julian
    Saks](https://sessionize.com/image/db22-400o400o1-4iYLKpbRHDoshr34u1sgqm.jpg)
    12:30 am  \-  01:00 am November 8  Using Graphs to Fine-Tune Agents By Julian
    Saks CEO, Finetune ](https://neo4j.com/nodes2024/agenda/using-graphs-to-fine-
    tune-agents/) [ ![photo of Andreas
    Kollegger](https://sessionize.com/image/9be1-400o400o1-3z1SkCUTLZX6NamTinAsif.png)
    ![photo of Emil
    Eifrem](https://sessionize.com/image/e5b8-400o400o1-SYU1xaqDKxpuzcZWiceUK1.jpg)
    01:00 am  \-  01:30 am November 8  Emil Eifrém and Andreas Kollegger Fireside
    Q&A By Andreas Kollegger GenAI Lead, Neo4j, Emil Eifrem Neo4j
    ](https://neo4j.com/nodes2024/agenda/emil-eifrem-and-andreas-kollegger-
    fireside-qa-3/)
    
    [ ![photo of Jennifer
    Reif](https://sessionize.com/image/2ce9-400o400o1-a7JqAGha3DXKu1waMx64kN.jpg)
    ![photo of Mark
    Heckler](https://sessionize.com/image/e7cd-400o400o1-4d-a57f-4e08-978d-8043d43db097.be36bb9a-fec3-4e72-a83e-0482a0f35d70.jpg)
    08:00 pm  \-  08:30 pm November 7  Java’s GenAI Era: Getting Spring AI and
    Neo4j Applications to Production By Jennifer Reif Developer Advocate, Neo4j,
    Mark Heckler Principal Cloud Developer Advocate for Java/JVM Languages,
    Microsoft ](https://neo4j.com/nodes2024/agenda/javas-genai-era-getting-spring-
    ai-and-neo4j-applications-to-production/) [ ![photo of Alex
    Babeanu](https://sessionize.com/image/034d-400o400o1-TCSLrBNKBrwZYu6MUL9Typ.jpg)
    08:30 pm  \-  09:00 pm November 7  Graph-Based Authorization: How to Secure
    Your API With Your Own Graph By Alex Babeanu CTO, 3Edges
    ](https://neo4j.com/nodes2024/agenda/graph-based-authorization-how-to-secure-
    your-api-with-your-own-graph/) [ ![photo of Bill
    Reynolds](https://sessionize.com/image/5ebd-400o400o1-hdMaLpQQLENnk45btJrpe7.jpg)
    09:00 pm  \-  09:15 pm November 7  Leveraging Neo4j Graph Data and AI Across
    the Application Development and Deployment Lifecycle By Bill Reynolds Chief
    Technical Officer, Qarbine ](https://neo4j.com/nodes2024/agenda/leveraging-
    neo4j-graph-data-and-ai-across-the-application-development-and-deployment-
    lifecycle/) [ ![photo of Nathan
    Smith](https://sessionize.com/image/773c-400o400o1-KaQ7Vgc19njybqJByf6ndj.jpg)
    09:30 pm  \-  10:00 pm November 7  A Graph Entity Resolution Playbook By
    Nathan Smith Senior Data Scientist, Neo4j
    ](https://neo4j.com/nodes2024/agenda/a-graph-entity-resolution-playbook/) [
    ![photo of Kent
    Stroker](https://sessionize.com/image/419e-400o400o1-XTna6YkTRNqus3AbBPqo6p.jpg)
    09:30 pm  \-  10:00 pm November 7  Living the Kubernetes Lifestyle By Kent
    Stroker Database Engineer, Dahlia Labs
    ](https://neo4j.com/nodes2024/agenda/living-the-kubernetes-lifestyle/) [
    ![photo of Pete
    Tunkis](https://sessionize.com/image/c94c-400o400o1-LH4zAZSDvWJSiV9ycKLRhL.jpg)
    ![photo of Andrew Garber-
    Browne](https://sessionize.com/image/b53f-400o400o1-Sz61g8pi4D77393kdjtzh1.jpg)
    10:00 pm  \-  10:30 pm November 7  The ResearchOps Toolbox + Graph:
    Discovering the Right Tools for UX Research and Design Teams By Pete Tunkis
    Lead Data Scientist, Arcurve, Andrew Garber-Browne Design Operations Program
    Manager, JPMorgan Chase ](https://neo4j.com/nodes2024/agenda/the-researchops-
    toolbox-graph-discovering-the-right-tools-for-ux-research-and-design-teams/) [
    ![photo of Emilie
    Ma](https://sessionize.com/image/890d-400o400o1-Df769DYTWgcsPLUA13Sjba.jpg)
    10:30 pm  \-  11:00 pm November 7  The GitHub Graph: Open-Source Collaboration
    Patterns and Neo4j By Emilie Ma Intern, Stripe; Honours CS Student, University
    of British Columbia ](https://neo4j.com/nodes2024/agenda/the-github-graph-
    open-source-collaboration-patterns-and-neo4j/) [ ![photo of Zach
    Probst](https://sessionize.com/image/0f50-400o400o1-WbVqjJDKvEkpkYxuG6cd6U.jpg)
    11:00 pm  \-  11:30 pm November 7  Use Nodestream to Build and Progressively
    Evolve Your Database By Zach Probst Staff Software Engineer, Intuit
    ](https://neo4j.com/nodes2024/agenda/use-nodestream-to-build-and-
    progressively-evolve-your-database/) [ ![photo of Jose
    Domínguez](https://sessionize.com/image/74fc-400o400o1-BKkkRhFRtM6vZK9zrzJcpp.png)
    ![photo of Benjamin
    Errazuriz](https://sessionize.com/image/c451-400o400o1-s5ehbVmx2UhFuPZwyHuw7K.png)
    11:30 pm  \-  11:45 pm November 7  Graph Traversal Agent for Code Debugging By
    Jose Domínguez Co-Founder & Vice President, Blar, Benjamin Errazuriz CTO, Blar
    ](https://neo4j.com/nodes2024/agenda/graph-traversal-agent-for-code-
    debugging/) [ ![photo of Patrick
    Kennel](https://sessionize.com/image/414e-400o400o1-KtNBBzjUppM39fzHVtN6xN.png)
    ![photo of Chris
    Robertson](https://sessionize.com/image/63dd-400o400o1-KThvaEFj5t77jPaFGECBnk.png)
    12:00 am  \-  12:30 am November 8  Introducing Astrolabe: Open-Source Cloud
    Infrastructure Mapping By Patrick Kennel Founding Hacker, MagellanCloud.ai,
    Chris Robertson Founder, MagellanCloud.ai
    ](https://neo4j.com/nodes2024/agenda/introducing-astrolabe-open-source-cloud-
    infrastructure-mapping/) [ ![photo of Darryl
    Salas](https://sessionize.com/image/842d-400o400o1-Ws3CmYXAS15MmV5JpZu83t.jpg)
    ![photo of Fabio
    Buso](https://sessionize.com/image/d08a-400o400o1-4d43d085-6d3b-4aa8-8c95-5a11a8cf1683.jpg)
    12:30 am  \-  01:00 am November 8  Medical Copilot and Product Lifecycle
    Copilot Powered by Hopsworks & Neo4j By Darryl Salas Head of Americas,
    Hopsworks, Fabio Buso Vice President of Engineering, Hopsworks
    ](https://neo4j.com/nodes2024/agenda/physician-researcher-copilot-and-agile-
    copilot-applications-using-hopsworks-and-neo4j/)
    
    [ ![photo of Jonathan Looi](https://sessionize.com/image/7d83-400o400o1-pHgCKYiZqdoCbeMBazbqzB.jpg) 08:00 pm  \-  08:30 pm November 7  Detecting Malicious Activity in the Cloud with Neo4j and Graph Data Science By Jonathan Looi Security Engineer, Google ](https://neo4j.com/nodes2024/agenda/detecting-malicious-activity-in-the-cloud-with-neo4j-and-graph-data-science/) [ ![photo of Otávio Calaça Xavier](https://sessionize.com/image/1e9f-400o400o1-wcFzfCgtFoUhe2uLkLBFyK.jpg) 08:30 pm  \-  09:00 pm November 7  Enhancing Job Matching With Knowledge Graphs and RAG By Otávio Calaça Xavier Senior Software Architect and Deep Learning Researcher ](https://neo4j.com/nodes2024/agenda/enhancing-job-matching-with-knowledge-graphs-and-rag/) [ ![photo of Greg Woods](https://sessionize.com/image/f843-400o400o1-QLp5NE7Ry2yVfSVw3Xr2sN.jpg) 09:00 pm  \-  09:15 pm November 7  Query API: A Tale Of Types and HTTP By Greg Woods Software Engineer, Driver's Team, Neo4j ](https://neo4j.com/nodes2024/agenda/query-api-a-tale-of-types-and-http/) [ ![photo of Makbule Gulcin Ozsoy](https://sessionize.com/image/ca04-400o400o1-wRnj1NhTvRbzNSbFv8P9XS.jpg) 09:30 pm  \-  10:00 pm November 7  Building a Text2cypher Model By Makbule Gulcin Ozsoy Software Developer and Machine Learning Engineer, Neo4j ](https://neo4j.com/nodes2024/agenda/building-a-text2cypher-model/) [ ![photo of Mauricio Genta](https://sessionize.com/image/6644-400o400o1-s3xmicAhVAm8hYYMWwmmdz.jpg) ![photo of Bruno Matonte](https://sessionize.com/image/3940-400o400o1-EkLVwEKetNyMJhsfs1vdgZ.jpg) 09:30 pm  \-  09:45 pm November 7  Name Similarity 2.0: Reviewing Sorensen-Dice By Mauricio Genta Data Scientist, LATAM Airlines, Bruno Matonte Data Scientist, LATAM Airlines ](https://neo4j.com/nodes2024/agenda/name-similarity-2-0-reviewing-sorensen-dice/) [ ![photo of Christopher Li](https://sessionize.com/image/1744-400o400o1-LjfhxFqZWPg8q7FMB4nMTX.png) ![photo of Hamza Farooq](https://sessionize.com/image/d659-400o400o1-XPPiDtmb7rXMDpW7S9fycj.jpg) 09:45 pm  \-  10:00 pm November 7  Ontology-Backed GraphRAG: Injecting Biomedical Logic in LLMs for Drug Discovery By Christopher Li CEO & Co-Founder, BioBox Analytics, Hamza Farooq CTO, BioBox Analytics ](https://neo4j.com/nodes2024/agenda/ontology-backed-graphrag-injecting-biomedical-logic-in-llms-for-drug-discovery/) [ ![photo of Tushar Nitave](https://sessionize.com/image/d1b6-400o400o1-hmLif2tAMwvxTycky2WseX.png) 10:00 pm  \-  10:30 pm November 7  Enhancing Medical Data Processing With Neo4j By Tushar Nitave Staff Software Engineer, Vivpro Corp. ](https://neo4j.com/nodes2024/agenda/enhancing-medical-data-processing-with-neo4j/) [ ![photo of Alicia Powers](https://sessionize.com/image/765f-400o400o1-W57M9PLR1imnRtSAXqFeNR.jpg) 10:30 pm  \-  11:00 pm November 7  Just Add an LLM: Creating a New Food Recommendation Engine From an Old Cypher-Query Based One By Alicia Powers Principal Data Scientist, CoreHarmonic ](https://neo4j.com/nodes2024/agenda/just-add-an-llm-creating-a-new-food-recommendation-engine-from-an-old-cypher-query-based-one/) [ ![photo of Mark Maslyn](https://sessionize.com/image/324f-400o400o1-Y3VQK23BSQK9zGr7JswaLn.jpg) 11:00 pm  \-  11:30 pm November 7  Using a Graph Database Tree and Data Analytics to Model an Ancient River System By Mark Maslyn Consultant & Graph Database and Data Analytics Architect ](https://neo4j.com/nodes2024/agenda/using-a-graph-database-tree-and-data-analytics-to-model-an-ancient-river-system/) [ ![photo of Artem Kushner](https://sessionize.com/image/ab2d-400o400o1-9gGwPxUzqnqUJw1p24rFcx.jpg) 11:30 pm  \-  11:45 pm November 7  Structures of the Ribosome and Other Large Molecules On the Graph By Artem Kushner KDD Group | UBC ](https://neo4j.com/nodes2024/agenda/structures-of-the-ribosome-and-other-large-molecules-on-the-graph/) [ ![photo of Brendon Wong](https://sessionize.com/image/6cc9-400o400o1-Ubk84gLfZwsS528DASu7AK.jpg) 12:00 am  \-  12:30 am November 8  Leading Solutions to Automatically Generate Knowledge Graphs From Text By Brendon Wong Founder & CEO, Unize ](https://neo4j.com/nodes2024/agenda/leading-solutions-to-automatically-generate-knowledge-graphs-from-text/) [ ![photo of Jim Thornton](https://sessionize.com/image/035f-400o400o1-Xd38LWCabusVwnADyAeDNE.jpg) ![photo of Luis Medina](https://sessionize.com/image/80d7-400o400o1-h76fzy5vqweZYjAFa4FaZT.jpg) 12:30 am  \-  01:00 am November 8  Making Virtuous Cycles: Lessons From the Frontier of LLM-Knowledge Graph Interaction By Jim Thornton Website Content Strategist, Inbound Found, Luis Medina Software Developer, InboundFound ](https://neo4j.com/nodes2024/agenda/making-virtuous-cycles-lessons-from-the-frontier-of-llm-knowledge-graph-interaction/)
    
    [ ![photo of Burak
    Serdar](https://sessionize.com/image/43a2-400o400o1-UnANmHYWD11jvzWMdRHkBw.png)
    08:00 pm  \-  08:30 pm November 7  Harmonization of Disparate Health Data
    Using Graph Database By Burak Serdar CoFounder and Lead Architect, Cloud
    Privacy Labs ](https://neo4j.com/nodes2024/agenda/harmonization-of-disparate-
    health-data-using-graph-database/) [ ![photo of Cayley
    Hauser](https://sessionize.com/image/b55a-400o400o1-fGSm1PRhC5GphXwAhYiYTJ.jpg)
    08:00 pm  \-  08:30 pm November 7  What Is the Most Important Part of Your
    Graph? Understanding Centrality and Graph Data Science By Cayley Hauser Neo4j
    Consulting Engineer ](https://neo4j.com/nodes2024/agenda/what-is-the-most-
    important-part-of-your-graph-understanding-centrality-and-graph-data-science/)
    [ ![photo of Mike
    Morley](https://sessionize.com/image/3fec-400o400o1-BU6EQzfzoXW2gFrdpUP2eZ.jpg)
    08:30 pm  \-  09:00 pm November 7  The Personal Knowledge Vault By Mike Morley
    Director of Machine Learning and Artificial Intelligence Technology, Arcurve
    Inc. ](https://neo4j.com/nodes2024/agenda/the-personal-knowledge-vault/) [
    ![photo of Harsingh
    Sekhon](https://sessionize.com/image/3902-400o400o1-UmnK7NxtybamasZCSYBcZm.jpg)
    09:00 pm  \-  09:15 pm November 7  From Lost to Local in the Heart of Calgary:
    Mastering the Plus 15 Maze By Harsingh Sekhon Student of Software Development,
    SAIT ](https://neo4j.com/nodes2024/agenda/from-lost-to-local-in-the-heart-of-
    calgary-mastering-the-plus-15-maze/) [ ![photo of Paco
    Nathan](https://sessionize.com/image/d97a-400o400o1-3b-6ea3-4776-b00b-a59389a875d6.2f6e20f0-2763-45e1-b2c4-d149618c9ba6.png)
    09:30 pm  \-  10:00 pm November 7  Entity-Resolved Knowledge Graphs By Paco
    Nathan Principal DevRel Engineer, Senzing.com
    ](https://neo4j.com/nodes2024/agenda/entity-resolved-knowledge-graphs/) [
    ![photo of Lam
    Ho](https://sessionize.com/image/2486-400o400o1-JUKdrfoTBCXw5sinKWZFGQ.jpg)
    10:00 pm  \-  10:15 pm November 7  Connecting Users Via Knowledge Graph By Lam
    Ho Graph Data Engineer & Data Scientist, Hewlett Packard Enterprise
    ](https://neo4j.com/nodes2024/agenda/connecting-users-via-knowledge-graph/) [
    ![photo of Alex
    Gilmore](https://sessionize.com/image/43f9-400o400o1-aJixYwg71g7ZZbGmZzd3xT.jpg)
    10:15 pm  \-  10:30 pm November 7  LLM-Assisted Data Exploration With the
    Neo4j Runway Python Library By Alex Gilmore Consulting Engineer, Neo4j
    ](https://neo4j.com/nodes2024/agenda/llm-assisted-data-exploration-with-the-
    neo4j-runway-python-library/) [ ![photo of Weidong
    Yang](https://sessionize.com/image/8fe6-400o400o1-MpTMcA4ikPjtfgYT2Fpnp6.jpg)
    10:30 pm  \-  11:00 pm November 7  Abstraction for Human Understanding:
    Practical Lessons From Graph Schema, Visualization & Analytics By Weidong Yang
    Founder & CEO, Kineviz ](https://neo4j.com/nodes2024/agenda/abstraction-for-
    human-understanding-practical-lessons-from-graph-schema-visualization-
    analytics/) [ ![photo of Tim
    Eastridge](https://sessionize.com/image/019e-400o400o1-JoM2EDkNMvi77yTeaKvwxd.jpg)
    11:00 pm  \-  11:30 pm November 7  Building Knowledge Graphs with LLMs from
    USPTO Patent Data By Tim Eastridge Founder, Eastridge Analytics
    ](https://neo4j.com/nodes2024/agenda/the-pentagon-papers-genai-neo4j-take-on-
    history/) [ ![photo of Alejandro
    Puerto](https://sessionize.com/image/2708-400o400o1-GB7ZszcwbfJJdfTGiVxhFa.jpg)
    11:30 pm  \-  11:45 pm November 7  Applying Neo4j to Multilevel Marketing
    Companies By Alejandro Puerto Data Engineer, Rich it
    ](https://neo4j.com/nodes2024/agenda/applying-neo4j-to-multilevel-marketing-
    companies/) [ ![photo of Arthur Namias de
    Crasto](https://sessionize.com/image/9b79-400o400o1-sMQxPzXpWmvy26TqHd9Jnw.jpg)
    12:00 am  \-  12:30 am November 8  Climate and Compliance: The NGFS Climate
    Scenarios By Arthur Namias de Crasto Compliance Officer
    ](https://neo4j.com/nodes2024/agenda/climate-and-compliance-the-ngfs-climate-
    scenarios/) [ ![photo of Charles
    Angione](https://sessionize.com/image/0bac-400o400o1-Sg3g12fFy2qU5FWV8nEZPQ.png)
    12:30 am  \-  01:00 am November 8  Navigating Corporate Language: Developing a
    Graph-Based Glossary By Charles Angione CTO, GPSL
    ](https://neo4j.com/nodes2024/agenda/navigating-corporate-language-developing-
    a-graph-based-glossary/)
    
    ![](https://dist.neo4j.com/wp-content/uploads/20230921083327/homepage-viz_ART-
    left.svg) ![](https://dist.neo4j.com/wp-
    content/uploads/20230921083329/homepage-viz_ART-right.svg)
    ![](https://dist.neo4j.com/wp-content/uploads/20230921082858/homepage-
    viz_left-side-art_375.svg) ![](https://dist.neo4j.com/wp-
    content/uploads/20230921082910/homepage-viz_right-side-art_375.svg)
    
    ## Build Smarter Apps Faster
    
    Learn how to work with connected data using a graph database with no JOINs.
    
    [Find Out More](/product/auradb/)
    
    Products
    
      * [Neo4j Graph Database](/product/neo4j-graph-database/)
      * [Neo4j AuraDB](/product/auradb/)
      * [Neo4j Graph Data Science](/product/graph-data-science/)
      * [Deployment Center](/deployment-center/)
      * [Professional Services](/professional-services/)
      * [Pricing](/pricing/)
    
    Graph Tools
    
      * [Neo4j Developer Tools](/product/developer-tools/)
      * [Neo4j Workspace](/product/workspace/)
      * [Neo4j Bloom](/product/bloom/)
      * [Neo4j GraphQL Library](/product/graphql-library/)
      * [Neo4j Data Connectors](/product/connectors/)
      * [Cypher Query Language](/product/cypher-graph-query-language/)
    
    Use Cases
    
      * [Generative AI](/generativeai/)
      * [Knowledge Graphs](/use-cases/knowledge-graph/)
      * [Industries & Use Cases](/use-cases/)
      * [Case Studies](/case-studies/)
      * [Customers](/customers/)
    
    Developers
    
      * [Developer Home](/developer/)
      * [Documentation](/docs/)
      * [Deployment Center](/deployment-center/)
      * [Developer Blog](/developer-blog/)
      * [Community](https://community.neo4j.com/)
      * [Virtual Events](/events/?_event_type=virtual)
      * [GraphAcademy](https://graphacademy.neo4j.com/)
      * [Release Notes](/release-notes/)
    
    Data Scientists
    
      * [Graph Data Science Home](/product/graph-data-science/)
      * [Data Science Documentation](/docs/graph-data-science/current/)
      * [Get Started with Graph Data Science](/graph-data-science-software/)
      * [Data Science Community](https://community.neo4j.com/c/neo4j-graph-platform/graph-algorithms/73)
      * [GraphAcademy for Data Science](https://graphacademy.neo4j.com/categories/data-scientist/)
    
    Learn
    
      * [Resource Library](/resources/)
      * [Neo4j Blog](/blog/)
      * [GraphAcademy](https://graphacademy.neo4j.com/)
      * [Research Center](/research/)
      * [Case Studies](/case-studies/)
      * [Executive Insights](/graph-database-executive-insights/)
      * [Events Calendar](/events/)
      * [GraphSummit](/graphsummit/)
      * [Connections](/connections/)
      * [Webinars](/webinars/)
    
    Partners
    
      * [Find a Partner](/partners/directory/)
      * [Become a Partner](/partners/neo4j-partner-program/)
      * [Solution Partners](/partners/solution-partners/)
      * [OEM Partners](/partners/oem-partners/)
      * [Technology Partners](/partners/technology-partners/)
      * [Partner Portal Login](https://neo4j.my.site.com/Neo4jPartnerCommunity)
    
    Company
    
      * [About Us](/company/)
      * [Newsroom](/news/)
      * [Awards and Honors](/awards/)
      * [Graphs4Good](/graphs4good/)
      * [Careers](/careers/)
      * [Culture](/culture/)
      * [Diversity](/diversity-and-inclusion/)
      * [Leadership](/leadership/)
      * [Support](https://support.neo4j.com)
      * [Trust Center](https://trust.neo4j.com/)
    
    [Contact Us →](/contact-us/?ref=footer)
    
      * US: [1-855-636-4532](tel:1-855-636-4532)
      * Sweden: [+46 171 480 113](tel:+46 171 480 113)
      * UK: [+44 20 3868 3223](tel:+44 20 3868 3223)
      * France: [+33 (0) 1 88 46 13 20](tel:+33 \(0\) 1 88 46 13 20)
    
    Social Networks
    
    [ __ ](https://www.linkedin.com/company/neo4j) [ __
    ](https://twitter.com/neo4j) [ __ ](https://youtube.com/neo4j) [ __
    ](https://www.facebook.com/neo4j.graph.database) [ __
    ](https://community.neo4j.com) [ __ ](https://github.com/neo4j)
    
    (C) 2024 Neo4j, Inc.
    
    [Terms](/terms/) | [Privacy Policy](/privacy-policy/) | [Sitemap](/sitemap/)   
    [Anti-Corruption
    Policy](https://assets.neo4j.com/Neo4j_Anti_Corruption_Policy_Final.pdf)
    
    Neo4j®, Neo Technology®, Cypher®, Neo4j® Bloom™, Neo4j® AuraDS™ and Neo4j®
    AuraDB™ are registered trademarks of Neo4j, Inc. All other marks are owned by
    their respective companies.
    
    [![](https://dist.neo4j.com/wp-content/uploads/20210608133508/icon-tooltip-
    info.svg) Contact Us](/contact-us/)
        "#
    }
}