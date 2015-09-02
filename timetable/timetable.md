# Course timetable:

8.45-9.00	**Arrival, coffee and settling down time**

9.00-9.30	**Tutorial: **Introduction to SDM

* Geographic vs. environmental space
* The niche as a function
* Modelling ‘probability of presence’
* Diversity of methods

9.30-10.30	**Practical:** Fitting an SDM

* Fit a simple presence/absence SDM in a ZOON workflow
* Make prediction maps
* Switch between covariate datasets
* Switch between models

10.30-11.00	**Tea/Coffee break**

11.00-11.30	**Tutorial:** Presence/absence vs presence-only data

* Presence/absence model assumptions 
* Different models for presence-only data

11.30-12.30	**Practical: **Fitting different presence-only models

* The ‘naive’ approach - presence/absence models with pseudo-absence points  [reference: Elith?, Ward]
* MaxEnt  [reference: Phillips et al. x2]
* Poisson GLMs  [reference: Warton & Renner]

12.30-13.30	**Lunch & Tutorial:** principles of reproducibility

* Writing self-contained scripts
* Portability
* Readibility

13.30-14.00	**Tutorial:** Observation bias in presence-only data

* Different sources of presence only data
* Different forms of spatial bias in these data
* What happens if you don’t account for it

14.00 - 15.00	**Practical:** Accounting for observation bias

* The reference group approach [reference: Phillips et al. (2009)]
* Comparing these approaches on a fake dataset

15.00-15.30	**Tea/Coffee break**

15.30 - 16.00	**Tutorial:** Model validation

* in-sample vs. out-of-sample validation
* overfitting
* properties of different validation metrics [reference: Lawson et al. (2014) MEE; Wengler & Olden (2012) MEE]

16.00 - 17.00	**Practical: **Comparing different validation datasets

* Loop through multiple analyses to compute in-sample and out-of-sample validation statistics
* Compare performance of different models on random and geographically stratified hold-out data

N.B. fiddling with code and bugging the helpers during breaks is actively encouraged!

Users must bring their own laptop computers as none will be provided. Before arriving, please make sure you have a working version of R (**version?**) installed and have installed the [zoon R package](https://github.com/zoonproject/zoon) (installation details here: [https://github.com/zoonproject/zoon](https://github.com/zoonproject/zoon), note this may take a little longer for Windows users, as you’ll need to install RTools first (see here: [http://cran.r-project.org/bin/windows/Rtools/](http://cran.r-project.org/bin/windows/Rtools/) then here: [https://zoonproject.wordpress.com/2014/09/16/61/](https://zoonproject.wordpress.com/2014/09/16/61/)).

Template R scripts for each practical can be downloaded from here: **xxx** and slides for the tutorials can be downloaded from here: **xxx**

###Literature

Wenger SJ, Olden JD (2012) Assessing transferability of ecological models: an underappreciated aspect of statistical validation. Methods Ecol Evol 3: 260–267. doi: [10.1111/j.2041-210x.2011.00170.x](http://onlinelibrary.wiley.com/doi/10.1111/j.2041-210X.2011.00170.x/abstract)

