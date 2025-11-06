#####################################################
# Synthetic Control in R
# JS Eloriaga (Modified from tidysynth template)
####################################################

# Install tidysynth and tidyverse
# install.packages('tidyverse')
# install.packages('tidysynth')

# Loading the required libraries
library(tidyverse)
library(tidysynth)

# Let us load the Dataset of Abadie et al. (2010). In here, we want to evaluate the impact of Proposition 99 on cigarette consumption in California 

data("smoking")
head(smoking)

# The method aims to generate a synthetic California using information from a subset of control states (the "donor pool") where a similar law 
# has not been implemented yet. The donor pool is the subset of case comparisons from which information is borrowed to generate a synthetic version
# of the treated unit (i.e. "California")

smoking_out <-

    smoking %>%

    # We first initialize the synthetic control object 

    synthetic_control(outcome = cigsale, # This is our outcome (i.e. dependent) variable under consideration
                      unit = state, # Unit index in the panel data
                      time = year, # Unit index in the panel data 
                      i_unit = "California", # Unit where the intervention occured 
                      i_time = 1988, # Time Period when the intervention occured 
                      generate_placebos = T # Generate placebo synthetic controls (for inference)
                     ) %>%

    # Then, we generate the aggregate predictors used to fit the weights 

    # We use the average log income, retail price of cigrattes, and the proportion of the population between 15 and 24 years of age from 1980 to 1988

    generate_predictor(time_window = 1980:1988,
                       ln_income = mean(lnincome, na.rm = T),
                       ret_price = mean(retprice, na.rm = T),
                       youth = mean(age15to24, na.rm = T)) %>%

    # Then, we generate another predictor, something correlated with cigarette consumption but only have data from 1984 - 1988, like beer sales 

    generate_predictor(time_window = 1984:1988,
                       beer_sales = mean(beer,na.rm = T)) %>% 

    # Then, of course, the obvious predictor is cigarette sales itself. We use lagged cigarette sales 

    generate_predictor(time_window = 1975, 
                       cigsale_1975 = cigsale) %>%
    generate_predictor(time_window = 1980, 
                       cigsale_1980 = cigsale) %>%
    generate_predictor(time_window = 1988, 
                       cigsale_1988 = cigsale) %>%
    
    # Generate the fitted weights for the synthetic control 

    generate_weights(optimization_window = 1970:1988, # Time to use in the optimization task 
                     margin_ipop = .02, sigf_ipop = 7, bound_ipop = 6 #Optimization options 
                    ) %>%

    # Generate the synthetic control 

    generate_control()


# Now that we have generated the synthetic control, we can easily assess the fit by comparing the trends of the synthetic and observed time series. The idea is that the trends in the pre-intervention period would map closely to one another

smoking_out %>% plot_trends()

# To capture the causal quantity (i.e. difference between the observed and the counterfactual), one can plot the differences using plot_differences()

smoking_out %>% plot_differences()

# In addition, one can easily examine the weighting of the units in the fit. This allows one to see which cases were used, in part, to generate the synthetic control

smoking_out %>% plot_weights()

# Another useful way of evaluating the synthetic control is to look at how comparable the synthetic control is to the observed covariates of the treated unit 

smoking_out %>% grab_balance_table()

# Now we need to do some inference. The way we do inference in synthetic control relies on repeating the method for every donor in the donor pool exactly as 
# was done for the treated unit - i.e. generating placebo synthetic controls. By setting generate_placebos  = TRUE when initializing the synth pipeline with 
# synthetic control(), placebo cases are automatically generaed when constructing the synthetic control of interest. This makes it easy to explore how unique 
# differences between the observed and the synthetic unit is when compared to the placebos 

smoking_out %>% plot_placebos()

# Finally, Abadie outlines a way of constructing Fisher's Exact P values by dividing the post-intervention MSPE by the pre-intervention MSPE and then ranking all the cases in descending order. A
# p-value is then constructed by taking the rank/total. The idea is that if the synthetic control fits the observed time series well (low MSPE in the pre-period) and diverges in the post-period 
# (high MSPE in the post-period), then there is a meaningful effect due to the intervention. If the intervention had no effect, then the post-period and pre-period should continue to map 
# onto one another fairly well, yielding a ratio close to 1. If the placebo units fit the data similarly, then we can't regect the null hypothesis that there is no effect brought about by the intervention

smoking_out %>% plot_mspe_ratio()
