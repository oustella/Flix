# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [x] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF
<img src="https://github.com/oustella/Flix/blob/master/demo_week2.gif" width=250><br>

### Notes
Because the trailer API endpoint returns several videos, I made sure the video played is a trailer, not a video clip of the movie, by parsing through a for loop and breaking at the first trailer unless there's only one video returned.

Being able to implement bonus features is tremendously satisfying. At first I wasn't sure if the detailVC can be shared by mutiple upstream VC but decided to give it a try before creating a new cocoa touch class since the cost of doing so is low. It worked amazingly. It seems the detailed VC gets recycled as soon as you leave that screen so new content can be populated contrary to my initial concern.

The second bonus feature, trailer view, took a little bit of trial and error since the instruction is not as detailed. After reading the CodePath iOS cliffnotes on the gesture recognizer and trying some code, I still wasn't clear how to prompt the segue. Some Stack Overflow browsing later, I was able to connect the dots with what was discussed in class last week. So all that's needed to create the tap gesture prompted segue is to link a Tap Gesture Recognizer to the poster image, and the gesture to the trailer view. Similarly, I got a hang of the web view VC by reading the docs on Apple's website about the WKWebView, which replaced the UIWebView class. Third, it seems that the url request has to be put in the viewDidLoad() function to work properly, as putting the same code in the seque prepare() function does not return the data dictionary. 

Last but not least, to implement the required features, this time I gave myself a new challenge - instead of following along the tutorial video, I decided that I would execute the necessary steps _after_ watching the video. This quickly proved to be challenging as I stumbled along the way, realzing what seemed intuitive is no longer so when I did it on my own. At one point I couldn't debug what was causing crashes related to references when all the code is identifcal to the tutorial (so it must have been related to tinkering the class references of the different objects on the story board.) I had to delete an entire VC and created it from scratch to get over the hurdle. Ultimately, I believe trying to implement the features after watching the tutorials could help me internalizing the iOS development process (code + Storyboard) more quickly.

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
