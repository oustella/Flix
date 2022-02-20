# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

📝 `NOTE - PASTE PART 2 SNIPPET HERE:` Paste the README template for part 2 of this assignment here at the top. This will show a history of your development process, which users stories you completed and how your app looked and functioned at each step.

---

## Flix Part 1

#### REQUIRED (10pts)
- [X] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [X] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [X] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [X] (2pt) User can view the app on various device sizes and orientations.
- [X] (1pt) Run your app on a real device.

### App Walkthrough GIF
<img src="https://github.com/oustella/Flix/blob/master/demo.gif" width=600><br>

### Notes
I also added components to reflect the average rating and vote count for each movie, which involves three labels, formatting the rating score to one decimal place and three-tiered conditional coloring (red: <5.0, organge: >5.0 & <8.0, green: >8.0). 

I spent a couple hours experimenting with adding an animated circular progress bar to provide visual for the rating. I was able to add it to each movie cell, but stuck at how to clear out the previous animation in recycled cells. 
