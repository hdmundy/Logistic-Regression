# table 10.2 in textbook

bank.df <- UniversalBank
bank.df <- bank.df[ ,-c(1,5)] # Drop ID and zip code columns

# treating education as categorical

bank.df$Education <- factor(bank.df$Education, levels = c(1,2,3),
                            labels = c("Undergrad","Graduate","Avdvanced/Professional"))
# Editing name for "Personal Loan"
bank.df$PL <- bank.df$`Personal Loan`

# partition data
set.seed(2)
train.index <- sample(c(1:dim(bank.df)[1]), dim(bank.df)[1]*0.6)
train.df <- bank.df[train.index,]
valid.df <- bank.df[-train.index,]

# running logistic regression
# glm, family = "binomial"

logit.reg <- glm(PL ~ ., data = train.df, family = "binomial")
options(scipen = 999)
summary(logit.reg)
  
  
