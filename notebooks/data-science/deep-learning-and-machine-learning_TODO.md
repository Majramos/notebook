# Deep Learning and Machine Learning

## Artificial Intelligence and Data Science

In data science, there are many terms that are used interchangeably.

**Big data** refers to data sets that are so massive, so quickly built, and so varied that they defy traditional analysis methods such as you might perform with a relational database.
The concurrent development of enormous compute power in distributed networks and new tools and techniques for data analysis means that organizations now have the power to analyze these vast data sets.
A new knowledge and insights are becoming available to everyone. Big data is often described in terms of five V's: velocity, volume, variety, veracity, and value. 

### Key AI concepts
**Data mining** is the process of automatically searching and analyzing data, discovering previously unrevealed patterns. It involves preprocessing the data to prepare it and transforming it into an appropriate format. Once this is done, insights and patterns are mined and extracted using various tools and techniques ranging from simple data visualization tools to machine learning and statistical models.

**Machine learning** is a subset of AI that uses computer algorithms to analyze data and make intelligent decisions based on what it is learned without being explicitly programmed.
Machine learning algorithms are trained with large sets of data and they learn from examples. **They do not follow rules-based algorithms**. Machine learning is what enables machines to solve problems on their own and make accurate predictions using the provided data. 

**Deep learning** is a specialized subset of machine learning that uses layered neural networks to simulate human decision-making. Deep learning algorithms can label and categorize information and identify patterns. It is what enables AI systems to continuously learn on the job and improve the quality and accuracy of results by determining whether decisions were correct.

**Artificial neural networks**, often referred to simply as neural networks, take inspiration from biological neural networks, although they work quite a bit differently. A neural network in AI is a collection of small computing units called neurons that take incoming data and learn to make decisions over time. Neural networks are often layer-deep and are the reason deep learning algorithms become more efficient as the data sets increase in volume, as opposed to other machine learning algorithms that may plateau as data increases.

Now that you have a broad understanding of the differences between some key AI concepts, there is one more differentiation that is important to understand that between Artificial Intelligence and Data Science. 

**Data Science** is the process and method for extracting knowledge and insights from large volumes of disparate data. It's an interdisciplinary field involving mathematics, statistical analysis, data visualization, machine learning, and more. It's what makes it possible for us to appropriate information, see patterns, find meaning from large volumes of data and use it to make decisions that drive business. Data Science can use many of the AI techniques to derive insight from data.
For example, it could use machine learning algorithms and even deep learning models to extract meaning and draw inferences from data. There is some interaction between AI and Data Science, but one is not a subset of the other. Rather, **Data Science is a broad term that encompasses the entire data processing methodology while AI includes everything that allows computers to learn how to solve problems and make intelligent decisions**. Both AI and Data Science can involve the use of big data. That is, significantly large volumes of data.

## Generative AI and Data Science

Describe generative AI and explain how data scientists use generative AI in data science.

**Generative AI** is a subset of artificial intelligence that focuses on producing new data rather than just analyzing existing data. It allows machines to create content, including images, music, language, computer code, and more, mimicking creations by people.

**How does generative AI operate**, though? Deep learning models like Generative Adversarial Networks (GANs) and Variational Autoencoders (VAEs) are at the foundation of this technique. These models create new instances that replicate the underlying distribution of the original data by learning patterns from enormous volumes of data. Generative AI has found diverse applications across various industries.

### Examples
Natural language processing like OpenAI’s GPT-3 can generate human-like text, revolutionizing content creation and chatbots.
In healthcare, Generative AI can synthesize medical images, aiding in the training of medical professionals.
Generative AI can create unique and visually stunning artworks, generating endless creative visual compositions.
Game developers use Generative AI to generate realistic environments, characters, and game levels. Generative AI assists in fashion by designing new styles and creating personalized shopping recommendations.

### How to use Generative AI
- Synthetic data
Training and testing a model takes lots of data. Sometimes, the data you want to study doesn’t have enough observations to build a model. Interest in **synthetic data** as a tool for analysis and model creation has increased due to recent developments in generative AI. Data scientists can **augment their data sets** using generative AI to create **synthetic data**. It creates this data with **similar properties** as the real data, such as its distribution, clustering, and many other factors the AI learned about the real data set. Data scientists can then use the synthetic data along with the real data for **model training and testing**.

- Coding automation
Data scientists, researchers, and analysts frequently find themselves **confined by time** when examining data patterns and insights. Due to this restriction, they can only conceive, develop, and evaluate a small number of hypotheses, leaving many other possibilities untested. With generative AI, data scientists can leverage generative AI to **generate and test software code for constructing analytical models**. Coding automation has the potential to revolutionize the field of analytics, allowing the data scientist to **focus on higher-level tasks** such as identifying and clarifying the problem the models intend to solve and evaluating hypotheses from a wider range of **data sources**.

- Uncover insights
Generative AI can generate accurate **business insights and comprehensive reports**, making it possible to **update** these insights as the data evolves. Furthermore, it can autonomously explore data to uncover hidden patterns and insights that might go unnoticed during manual analysis and **enhance decision-making**. For instance, IBM’s Cognos Analytics, which provides AI-powered automation, enables you to unlock the full potential of your data with the help of its natural language AI assistant. You describe the question you are looking to answer or the hypothesis you want to test, and it helps generate insights you need. 

### Summary
Generative AI, a subset of artificial intelligence, focuses on **producing new data** rather than analyzing existing data. Generative AI augments data science efforts, enabling deeper insights, addressing data limitations, and improving the overall quality of data-driven outcomes.

## Neural Networks and Deep Learning (Norman White)
It's computer Sciences attempt to **mimic** real, the neurons, in **how our brain actually functions**. So 20-23 years ago, a neural network would have some inputs that would come in. They would be fed into different processing nodes that would then do some transformation on them and aggregate them or something, and then maybe go to another level of nodes. And finally there would some output would come out, and I can remember training a neural network to recognize digits, handwritten digits and stuff.

So a **neural network** is trying to use computer, a computer program that will mimic how neurons, how our brains use neurons to process thing, neurons and synapses and building these complex networks that can be trained. So this neural network starts out with some inputs and some outputs, and you keep feeding these inputs in to try to see what kinds of transformations will get to these outputs. And you keep doing this over, and over, and over again in a way that this network should converge. So these input, **the transformations will eventually get these outputs**. Problem with neural networks was that even though the theory was there and they did work on small problems like recognizing handwritten digits and things like that. **They were computationally very intensive** and so they went out of favor and I stopped teaching them probably 15 years ago.

And then all of a sudden we started hearing about **deep learning**, heard the term deep learning. This is another term, when did you first hear it? Four years ago, five years ago? And so, I finally said, what the hell is deep learning? It's really doing all this great stuff, what is it? And I Google, I was like, this is **neural networks on steroids**. What they did was they just had **multiple layers of neural networks**, and they use lots, and lots, and lots of **computing power** to solve them. Just before this interview, I had a young faculty member in the marketing department whose research is partially based on deep learning. And so she needs a computer that has a **Graphics Processing Unit** in it, because it takes enormous amount of **matrix and linear algebra calculations** to actually do all of the mathematics that you need in neural networks. But they've been they are now quite capable. We now have neural networks and deep learning that can **recognize speech, can recognize people**, you got there, getting your face recognized. I guarantee that NSA has a lot of work going on in neural networks. The university right now, as director of research computing, I have some small set of machines down at our south data center, and I went in there last week and there were just piles, and piles, and piles of cardboard boxes all from Dell with a GPU on the side. Well, the GPU is a Graphics Processing Unit. There's only one application in this University that needs two hundred servers each with Graphics Processing Units in it, and each Graphics Processing Unit, it has like the equivalent of 600 cores of processing. So this is tens of thousands of processing cores that is for deep learning, I guarantee.

Some of the first ones are **speech recognition**, who teaches the deep learning class at NYU, and is also the head data scientist at Facebook comes into class with a notebook, and it's a pretty thick notebook. It looks a little odd, because it's like this and it's that thick because it has a couple of Graphics Processing Units in it, and then he will ask the class to start to speak to this thing. And it will train while he's in class, he will train a neural network to recognize speech. So recognizing speech, recognizing people, images, classifying images, almost all of the the traditional tasks that neural nets used to work on in little tiny things. Now, they can do really, really, really large things. It will **learn on its own**, the difference between a cat and a dog, and different kinds of objects, **it doesn't have to be taught**. It doesn't, it just learns that's why they call it deep learning, and if you hear, he plays this, if you hear how it recognizes speech and generate speech. It sounds like a baby who learning to talk. You can just, you're like really do about all of a sudden this stupid machine is talking to you and learned how to talk. 

I need to learn some linear algebra, a lot of this a lot of this stuff is based on **matrix and linear algebra**. So you need to know how to do use linear algebra do transformations. Now, on the other hand, there's now lots of packages out there that will do deep learning and they'll do all the linear algebra for you, but you should have some idea of what is happening underneath. Deep learning, particularly needs really **high-powered computational power**. So it's not something that you're going to go out and do on your notebook for it. You could play with it. But if you really want to do it, seriously, you have to have some special computational resources

## Applications of Machine Learning (Norman White)

Everybody now deals with machine learning. But **recommender systems** are certainly one of the major applications. **Classifications, cluster analysis**, trying to find some of the marketing questions from 20 years ago, **market basket analysis**, what goods tend to be bought together. That was computationally a very difficult problem, I mean we're now doing that all the time with machine learning. 

So **predictive analytics** is another area of machine learning. We're using new techniques to predict things that statisticians don't particularly like. **Decision trees, Bayesian Analysis, naive Bayes**, lots of different techniques. The nice thing about them is that in packages like R now, you really **have to understand how these techniques can be used and you don't have to know exactly how to do them** but you have to understand what their meanings are. **Precision versus recall** and the problems of **over sampling and over fitting** so you can, someone who knows a little about data science can apply these techniques but they really need to know, maybe not the details of the technique as much as how, **what the trade-offs are**.

Some applications of machine learning in fintech are probably the - couple of different things I could talk about there. One of them is **recommendations**. Right, so, when you use Netflix, or you use Facebook, or a lot of different software services, the recommendations are served to you. Meaning, "Hey, you're a user, you've watched this show, so maybe you'd like to see this other show." Right, or, you follow this person, so maybe you should follow this other person. It's actually kind of the same thing in fintech, right. Because you've looked at - if you're an investment professional, right, and because you've looked at this investment idea, it might be really cool for you to look at this other investment idea, which is kind of similar. Right, it's a similar kind of asset, it's a similar kind of company. Or it's a similar kind of technique for doing the investment. So, We can **apply recommendations using machine learning throughout a lot of different parts of fintech**. Another one that people talk about, and is important especially on retail, in the retail aspects of banking and finance is **fraud detection**. Trying to determine whether a charge that comes a credit card is fraudulent or not, in real time, is a machine learning problem. Right, you have to learn from all of the transactions that have happened previously and build a model, and when the charge comes through you have to compute all this stuff and say, "Yeah we think that's ok," or "hmm, that's not so good. Let's route it to, you know, our fraud peope to check."

## Regression

### Chapter 7. Why Tall Parents Don't Have Even Taller Children
You might have noticed that taller parents often have tall children who are not necessarily taller than their parents and that's a good thing. This is not to suggest that children born to tall parents are not necessarily taller than the rest. That may be the case, but they are not necessarily taller than their own "tall" parents. Why I think this to be a good thing requires a simple mental simulation. Imagine if every successive generation born to tall parents were taller than their parents, in a matter of a couple of millennia, human beings would become uncomfortably tall for their own good, requiring even bigger furniture, cars, and planes.

**Sir Frances Galton in 1886** studied the same question and landed upon a statistical technique we today know as **regression models**. This chapter explores the workings of regression models, which have become the workhorse of statistical analysis. In almost all empirical pursuits of research, either in the academic or professional fields, the use of regression models, or their variants, is ubiquitous. In **medical science**, regression models are being used to develop more effective medicines, improve the methods for operations, and optimize resources for small and large hospitals. In the **business world**, regression models are at the forefront of analyzing consumer behavior, firm productivity, and competitiveness of public and private sector entities.

I would like to introduce regression models by narrating a story about my Master's thesis. I believe that this story can help explain the utility of regression models.

### The Department of Obvious Conclusions
In 1999, I finished my Masters' research on developing hedonic price models for residential real estate properties. It took me three years to complete the project involving 500,000 real estate transactions. As I was getting ready for the defense, my wife generously offered to drive me to the university. While we were on our way, she asked, "Tell me, what have you found in your research?". I was delighted to be finally asked to explain what I have been up to for the past three years. "Well, I have been studying the **determinants of housing prices**. I have found that larger homes sell for more than smaller homes," I told my wife with a triumphant look on my face as I held the draft of the thesis in my hands.

We were approaching the on-ramp for a highway. As soon as I finished the sentence, my wife suddenly turned the car to the shoulder and applied brakes. As the car stopped, she turned to me and said: "I can't believe that they are giving you a Master's degree for finding just that. I could have told you that larger homes sell for more than smaller homes."

At that very moment, I felt like a professor who taught at the department of obvious conclusions. How can I blame her for being shocked that what is commonly known about housing prices will earn me a Master's degree from a university of high repute?

I requested my wife to resume driving so that I could take the next ten minutes to explain to her the intricacies of my research. She gave me five minutes instead, thinking this may not require even that. I settled for five and spent the next minute collecting my thoughts. I explained to her that my research has not just found the correlation between housing prices and the size of housing units, but I have also discovered the **magnitude of those relationships**. For instance, I found that all else being equal, a term that I explain later in this chapter, an additional washroom adds more to the housing price than an additional bedroom. Stated otherwise, the marginal increase in the price of a house is higher for an additional washroom than for an additional bedroom. I found later that the real estate brokers in Toronto indeed appreciated this finding.

I also explained to my wife that proximity to transport infrastructure, such as subways, resulted in higher housing prices. For instance, houses situated closer to subways sold for more than did those situated farther away. However, houses near freeways or highways sold for less than others did. Similarly, I also discovered that proximity to large shopping centers had a nonlinear impact on housing prices. Houses located very close (less than 2.5 km) to the shopping centers sold for less than the rest. However, houses located closer (less than 5 km, but more than 2.5 km) to the shopping center sold for more than did those located farther away. I also found that the housing values in Toronto declined with distance from downtown.

As I explained my contributions to the study of housing markets, I noticed that my wife was mildly impressed. The likely reason for her lukewarm reception was that my findings confirmed what we already knew from our everyday experience. However, the real value added by the research rested in **quantifying the magnitude of those relationships**.

### Why Regress?
A whole host of questions could be put to regression analysis. Some examples of questions that **regression (hedonic) models** could address include:
- How much more can a house sell for an additional bedroom?
- What is the impact of lot size on housing price?
- Do homes with brick exteriors sell for less than homes with stone exteriors?
- How much does a finished basement contribute to the price of a housing unit?
- Do houses located near high-voltage power lines sell for more or less than the rest?

## Lesson Summary

We will recap: Many of the terms commonly used in artificial intelligence and how to differentiate them, How data scientists use Artificial intelligence OR AI, The relationship between machine learning and data science, AND The regression model used to show relationships between things. Artificial intelligence (AI) has boomed and become accessible to almost everyone. Data scientists use AI regularly when analyzing data. Let’s discuss some of the terms used in this lesson related to AI, such as machine learning, deep learning, neural networks, and generative AI. 

- **AI** 
The branch of computer science that includes the development of systems that can mimic many of the tasks associated with human intelligence. 

- **Machine learning**
Subset of AI that uses computer algorithms to learn about data and make predictions with it without needing to explicitly program the analysis methods into the system.

- **Deep learning** 
Subset of machine learning that uses layered neural networks to simulate human decision-making. **Neural network** is a collection of small computing units, called neurons, that take incoming data and learn to make decisions over time, such as the difference between a dog and a cat. Deep learning algorithms become more **efficient as the amount of data increases in volume**, unlike other machine learning algorithms, which tend to plateau. 

- **Generative AI**
Another subset of AI, focuses on producing new data rather than just analyzing existing data. It allows machines to **create content**, including images, music, languages, and computer code, mimicking human creations. Generative AI also can make data sets with similar traits to a raw data set. Sometimes, data scientists, when they do not have enough data, can create synthetic data and use it to train and test their models.

- **Machine learning algorithms**
As a data scientist, you will use machine learning algorithms to **derive insights from data**. You will frequently apply machine learning algorithms for **predictive analytics or make recommendations**. For example, you may also use these algorithms for fraud detection to identify fraudulent credit card purchases based on previous purchasing habits. Machine learning algorithms rely heavily on statistical technique called regression.

- **Regression** 
Identifies the strength and amount of the correlation between one or more inputs and an output. For instance, how much does the price of a house increase based on its square footage and number of bedrooms, and how confident can you be of this relationship? 

In summary, Generative AI produces new data like a raw data set. deep learning is a subset of machine learning, and machine learning is a subset of artificial intelligence. Deep learning utilizes neural networks to teach itself patterns in inputs and outputs. Using big data, data scientists use all of these areas of AI to make predictions.
