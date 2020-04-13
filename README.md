## PartnerHero Ruby on Rails Assessment


The application can be a single page and should start with a list of all vehicles and the relevant information about them. A user should be able to filter by mileage, color, size, and price.

[Demo Live here](https://car-sample.herokuapp.com/)

This application use ruby 2.5.3, rails 5.2.3


#### Commands

You can run the application with the

```bash
rails s
```
And You can test the application with the

```bash
rspec
```

#### Comments

My focus on this test was on to handle in a simple way different type of filters. For
that I implemented mode Filterable that enable the model to use filter on any combination

I also didnt implemented the size filter, because I dint have any idea what collumn represent it
