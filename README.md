# Reproducible SDM Training Workshop

#### Materials for the Training Workshop on Reproducible Species Distribution Modelling run by the [BES](http://www.britishecologicalsociety.org/)'s [Quantitative Ecology](http://www.britishecologicalsociety.org/getting-involved/special-interest-groups/quantitative-ecology) and [Macroecology](http://www.britishecologicalsociety.org/getting-involved/special-interest-groups/macroecology) Special Interest Groups and the [ZOӦN project](https://zoonproject.wordpress.com) of [2020 Science](http://www.2020science.net)

This training workshop aims to provide a brief introduction to SDM analyses, highlighting common pitfalls and some solutions to them and helping attendees to carry out these analyses in repreoducible way, so that they can re-use them in the future and share them with others.
The practical sessions are all intended to be completed in R, using the [zoon R package](https://github.com/zoonproject/zoon) which aims to make SDM analyses easier to carry out and to share with others.


#### Workshop timetable

There is a rough timetable for the workshop [here](https://github.com/goldingn/repro_sdm_wkshp/blob/master/timetable/timetable.md) but note that it is subject to change!

#### Getting started

Note that attendees must bring their own laptop computers as none will be provided.
Before arriving, please make sure you have a recent version of R - **version 3.2.0 or higher** - installed.
It would be helpful if you could also install the most recent version of zoon before arriving.
zoon isn't on the CRAN repositories yet, so installation may be a bit fiddly, instructions can be found [here](https://github.com/zoonproject/zoon#to-install-the-stableish-version-directly-from-r).

If you don't manage to install zoon before the workshop, don't worry - we'll give you a hand on the day.

#### Seminars


[Here are some of Greg McInerny's slides](https://github.com/goldingn/repro_sdm_wkshp/blob/master/slides/Greg_McInernys_zoon_slides.pdf) on the zoon project and why we need it

Here are Bob's slides [introducing SDM](https://rawgit.com/goldingn/repro_sdm_wkshp/master/slides/SDMsSep1Tut1.html) and covering [presence/absence vs presence-only](https://rawgit.com/goldingn/repro_sdm_wkshp/master/slides/SDMsSep1Tut2.html) SDM

And here are Emiel's slides on [selection bias in SDM](https://rawgit.com/goldingn/repro_sdm_wkshp/master/slides/sdm_selection_bias.html) and [SDM validation](https://rawgit.com/goldingn/repro_sdm_wkshp/master/slides/sdm_validation.html).
Emiel's last slide deck will be uploaded soon, and we'll improve the literature section below too.

#### Practicals

Incomplete R scripts for each of the workshop practical sessions can be downloaded via the links below (right-click and *save link as*):

* [01 - Introduction](https://raw.githubusercontent.com/goldingn/repro_sdm_wkshp/master/practicals/01_introduction.R)
* [02 - Presence-only](https://raw.githubusercontent.com/goldingn/repro_sdm_wkshp/master/practicals/02_presence_only.R)
* [03 - Observation bias](https://raw.githubusercontent.com/goldingn/repro_sdm_wkshp/master/practicals/03_observation_bias.R)
* [04 - Validation](https://raw.githubusercontent.com/goldingn/repro_sdm_wkshp/master/practicals/04_validation.R)

The idea is for attendees to save a copy of each of these R scripts and to add to them throughout the workshop.
At the end of the workshop, everyone should have a library of reproducible scripts for running a range of SDMs to take home and re-use.

At the top of each script is the command `rm(list = ls())`  which clears all objects from the workspace.
The reason for this is so that you can run the entire script from beginning to end and make sure everything works and all the code needed is in there.
This ensures that the script will work again for you later.


Also, [here's the ad-hoc stacked SDM example](https://raw.githubusercontent.com/goldingn/repro_sdm_wkshp/master/practicals/stacked_sdms_with_zoon.R) showed at the end of the day.



#### Literature

The following papers will probably be referenced during the course - they're good reads about common SDM issues and solutions:

> Wenger SJ, Olden JD (2012) Assessing transferability of ecological models: an underappreciated aspect of statistical validation. *Methods Ecol Evol* **3**: 260–267. doi: [10.1111/j.2041-210x.2011.00170.x](http://onlinelibrary.wiley.com/doi/10.1111/j.2041-210X.2011.00170.x/abstract)


#### Notes

Everything here is made freely available under the MIT open source licence.

Here's a short URL to this page: **[goo.gl/aFP3Tv](https://goo.gl/aFP3Tv)**.

