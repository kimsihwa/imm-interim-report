# myrepo3
Repository for IMM interim report


## TM's tips and tricks: 

#### Misc guidance. 

- use a memorable and informative name for the project folder / repo. This repo is called `myrepo3`, but in future, you should use a name that will remind you of the repo's contents and purpose, even if it's ephemeral / temporary. Here, you could use something like `imm-interim-report`
- right now the `clean_data` function prints a bunch of dataframes to the console, which can't be necessary. 
- I appreciate the creativity in the way you're playing with the outputs of the logistic regression, but we should definitely talk it through!
  + The scale range setup used for the other plots doesn't work with the logistic coefficients because they're not actually bounded by 0 and 1. The predictive approach you hint at toward the end makes more sense in this context. 
  + All of the effect estimates for binary outcomes are outputs from logistic regressions, so they're all on the log-odds scale. 
  + I don't think you need the external code for going from logit to probability. The `predict(model, newdata, type = "response")` function, with the type set to 'response' performs the translation on its own, and returns the predicted probability of the outcome being 1. Moreover, the formula is straightforward enough: where, in this case $\hat{logit_{emp}} = \alpha + \beta_{trt} * trt$,  $\hat{P(emp)} = \frac{e^{logit}}{1 + e^{logit}}$), or, in R, `p_emp = exp(logit) / (1 + exp(logit))`. 
  + you can use the `predict` function to add standard errors to its outputs, and then use those to visualize the uncertainty in the estimates. 
- !!! it seems I misunderstood the results, which were actually from a linear regression. This makes things easier, and the code from the earlier section should work fine, with the one difference being that you don't need to normalize the coefficients by the scale range because they are already on the same scale.  

#### use the `usethis` package to create an R project, and to initialize it as a git repository

Before you have anything at all, open RStudio and use the Terminal (should be git bash) to navigate to the folder on your computer where you want to create the project
```bash
cd /path/to/projects
```

Then switch to the R Console and use the `usethis` package to create a new R project, and initialize it as a git repository
```r
usethis::create_project("imm-interim-report")
```

If you're using RStudio, this should cause it to open a new window with the project loaded as the current project. 
If that doesn't happen, just open the project as you normally would (File > Open Project > navigate to the folder where you created the project, and select the `.Rproj` file). 
Then, in the R Console again, use `usethis` to initialize the project as a git repository, and connect it to a new GitHub repository. 

```r
usethis::use_git()
usethis::use_github()
```

The benefit is that it takes care of some key boilerplate, like creating a `.gitignore` file, which stops you from accidentally committing files that you don't want to commit (e.g. data files, or files that contain sensitive information).
It also creates the github repo for you and connects the two together. 

