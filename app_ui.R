page_one <- tabPanel(
  "Introduction",
  titlePanel("Introduction"),
  sidebarLayout(
    sidebarPanel(
      h4("Who Cares"),
      p("The stakeholders within this situation are the people
who food prices are relevant to - those who have their
quality of life or even survival fluctuate with food
prices. The opposite stakeholders would be industries
that affect those prices. Their values and quality of
life over profitability may be in direct contrast with
each other. It is the policymakers task to determine
whether limiting industries or risking peoples livelihood
are the beneficial choices for their constituency.")
    ),
    mainPanel(
      h3("Ask Yourself..."),
      h4("Is the price of food in major cities affected
            by global temperatures?"),
      h4("Will climate change be a factor in raising food prices?"),
      h3("The Issue"),
      p("There are varying levels of doubt about
            the effects or even existence of climate
            change. A typical counterpoint against
            climate change legislation is the fact that
            it limits industry, and by extension, the many
            affected by industry growth. However, these same
            people could suffer effects far outweighing those
            of industry limitation in the near future, yet
            the legitimacy of these effects is still struggling
            to be recognized in legislation."),
      h3("Hypothesis:"),
      p("As temperature rises, foods that thrive in hotter
              temperatures will become cheaper because of the increased
              supply. In contrast, foods that struggle to grow in heat
              will become more expense, because the harvest will be small
              and there will be little supply.")
      
    )
  )
)

page_two <- tabPanel(
  "Problem Situation",
  sidebarLayout(
    sidebarPanel(
      selectInput("pg2_food", "Choose a Food:",
                  choices = c("Oil", "Rice", "Wheat", "Sugar",
                              "Lentils", "Maize")),
      h3("Growing Conditions"),
      p("To better interpret the data and the effect the change
                    in temperature has on the harvest size, please refer
                    to the growing conditions below"),
      h4("Oil"),
      p("The basis of many oils, such as vegetable or sunflower,
                    grow best in warmer environments"),
      h4("Rice"),
      p("Rice needs warmer temperatures to grow that cannot fall
                    below 15* C"),
      h4("Wheat"),
      p("Wheat grows best between 21*C to 24*C, but cannot survive
                    in climates too hot or cold"),
      h4("Sugar"),
      p("Sugar requires very warm and tropical environments to grow"),
      h4("Lentils"),
      p("Lentils grow best in cool weather, typically under 18*C"),
      h4("Maize"),
      p("Maize needs temperatures from 21*C to 27*C, but cannot
                    tolerate much outside that zone")
    ),
    mainPanel(
      h3("The Problem"),
      p("If the scope of climate change extends to food prices,
                    then many countries will find themselves at an extreme
                    disadvantage in the global market, and citizens of
                    those countries that depend on their natural resources
                    for food could go hungry, heavily increasing the need
                    for a solution to world hunger. While it is already
                    prevalent in the United States that a discrepancy
                    exists between reasonably priced food and its quality,
                    this change would create yet another opportunity for
                    companies to wedge a gap between the upper class and
                    the middle and lower class, creating more divide than
                    our nation already faces."),
      plotlyOutput("food_plot")
      
    )
  )
)
page_three <- tabPanel(
  "Data Critique",
  sidebarLayout(
    sidebarPanel(
      h4("Data Summary"),
      p(paste0("Number of observations in Market Prices data set: ",
               nrow(food_prices))),
      p(paste0("Number of observations in Global Temperature data set: ",
               nrow(global_temp))),
      p("Cities in both data sets:"),
      p(toString(cities_list)),
      p("These cities are significant because they are a part of the
                  major cities where global temperatures were collected and a
                  part of the cities where local market place prices were
                  recorded. These cities are the ones that we are able to
                  conduct our analysis onas they have all of the data we are
                  looking for.")
    ),
    mainPanel(
      plotOutput("temp_chart"),
      h3("Dataset Strengths"),
      p("A strength is that both data sets are
                    comprehensive,
                    with very little missing values.
                    The columns they do have are very consistent
                    in their values."),
                    
      h3("Dataset Weaknesses"),
                    p("A weakness is that
                    cities are the only locations
                    considered, showcasing the impact
                    of this global phenomenon for only
                    a certain group of people. 
                    In addition, climate change is a
                    slow process, and our specific
                    data set for food prices spans
                    many locations but
                    only dates about a decade back."),
      h3("Inter-Dataset Challenges"),
  
      p(" The cities included in
                    these data sets also must
                    overlap, otherwise no trend between
                    temperature and price can be
                    made. It is difficult to show such a
                  slow process over so few years.
                  To prove that there is data that
                  the average temperature is generally
                  rising over the last 200 years, we
                  have included this graph as evidence.
                  After reviewing several data from several major cities
                  of the same month each year,
                  an upward trend of temperature is
                  evident, as shown above.")
    )
  )
)

page_four <- tabPanel(
  "Temp vs. Price",
  sidebarLayout(
    sidebarPanel(#Commentary on visualization
      selectInput("city_select", "Choose a City:",
                  choices = c("Aleppo", "Delhi")),
      selectInput("food", "Choose a Food:",
                  choices = c("Rice", "Sugar", "Lentils")),
      h3("City Information"),
      h4("Aleppo"),
      p("This city is the capital of Syria, located in the
                    northwestern corner of the country and dates back to
                    Mesopotamian times due to its key central location for
                    trading. Typical crops grown in Syria include olives, wheat,
                    barley, lentils, and chickpeas."),
      h4("Delhi"),
      p("This is a city and territory that hosts India's capital.
                    Like Aleppo, it dates back to the 6th century BCE. Located
                    in the northern region of India, it is home to some of
                    India's wealiest residents, making it the second wealiest
                    city in the entire nation. It is common to see wheat
                    and mustard crops in the outskirts of the city.")
    ),
    mainPanel(
      plotlyOutput("city_plot"),
      h3("Data Comparison"),
      p("By comparing temperature and price on the same chart, one can quickly
                      and easily compare the fluctuations of the two. Rice, sugar, and lentils
                      are commonly grown in the two selected cities, making them the
                      best and most reliable data points.")
    )
  )
)

page_five <- tabPanel(
  "About",
  sidebarLayout(
    sidebarPanel(
      h3("Working Through the Data"),
      p("While working on this project, each group
                    member was responsible for different parts
                    of the report. They are as follows:"),
      p("Natalie: My contributions were primarily parsing
                      through and cleaning the data. From there, I created
                      the interactive visualizations and helped add them to
                      the app."),
      p("Sierra: I worked on creating the page format
                    and in-page formatting, connecting the
                      server to the user interface, and inputting
                      visualizations into the UI."),
      p("Ethan: I worked on implementing the Techichal
                      Report and Project proposal, along with the hosting
                      of the Shiny App. I also had a role in troubleshooting
                      GitHub branches, analysis files and functions."),
      
      p("Tyler: I initially evaluated the data sets, and 
                    contributed to the brainstorming and creation of 
                    the visualizations"),
      h3("Data Sets:"),
      h5(uiOutput("tab")),
      h5(uiOutput("tab2"))
    ),
    mainPanel(
      h3("Challenges"),
      p("In this project, we found ourselves wanting to
                      compare many different types of crops in order
                      to get a better picture of the effects of
                      climate change, however, were unable to do
                      so because of time constraints. In addition,
                      comparing different times of the year, as
                      opposed to solely June 1st of each year, would
                      have also provided us with more credibility."),
      h3("Usage"),
      p(" At the same time, we believe that our
                      consistency among variables such as time
                      of year and crop are what makes the project
                      reliable and appeals to the ease of
                      readability for the user, and can be increased
                      to even account for extraneous factors such as
                      inflation or political instability
                      if data for further years and cities are added."),
      h3("Learning Opportunities"),
      p("From this,
                      we learned how to apply Shiny to real-world
                      scenarios and get results. From here, one
                      may want to pursue using a different data
                      set for food prices that goes back further
                      in time and provide more cities in Europe
                      and North America in order to see a more
                      accurate trend."),
      h3("Affiliation"),
      p("INFO-201A: Technical Foundations of Informatics",
        br(),
        "The Information School",
        br(),
        "University of Washington",
        br(),
        "Autumn 2019")
    )
  )
)

ui <- navbarPage(
  theme = shinytheme("united"),
  "The Effect of Climate Change on Food Prices",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five
)