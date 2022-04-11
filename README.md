# GrazerTestCode

This is a mini project for showcasing some Swift coding for my consideration for a software engineer position at Grazer.

### Background

I didn't have any experience with Swift before this, so the first thing I did was reading up on some articles about the basics of the language and how to get started quickly. Then I started messing around with it, trying to do some basic stuff like calling the Grazer API and parsing the response.

When I got to that point, I wanted to display it nicely and decided this would be a good time to start watching some tutorials on YouTube to learn some Swift basics. Then I came across some other videos that helped me understand better what I had done previously and how I could improve that code. I wanted to start a new project just for the experience so I started from scratch, splitting the code into two separate view controllers, one for the login screen and one for the user list, each controller responsible for each of the API calls. That worked out pretty well until I started coding the UI, which seemed to be pretty tedious work using the table view and cells and all that. So I turned to YouTube again and watched some SwiftUI vids for beginners.

Of course at this point I wanted to change everything because the SwiftUI looked amazingly simple and nice, so I did. This repo is the result from that but you can also view the other two if you're interested in my thought process as a Swift beginner, the initial mess around is [here](https://github.com/atlisg/grazer-test-code) and the slightly improved version is [here](https://github.com/atlisg/VeganDatingApp).

### The code

The final version of the code is split up into the following files:

#### ContentView.swift

The UI code lives here, I thought about splitting the Views into separate files but because the code is so simple and minimal, I decided this was cleaner. Of course, it would have been nice to display the profile images and the age of each user but as the images were just placeholders and the date_of_birth was 10 years from now, it didn't make sense to spend time on that for now.

#### Data.swift

Here are the functions that call the Grazer API and parse the data. I like how easy it is to make subsequent API calls using data from the first response in the second call. So far, I like this Swift thing very much.

#### Models.swift

Again, I thought about splitting these up into seperate files for each model but decided against it in this case because it's such a neat little project that it was just too tempting to fit all the code in these 3 files.

### Improvements

Some potential improvements could include incorporating pagination for more pages of data, better error handling in the API calls and some error pages in the UI to display those errors. Displaying the placeholders and negative ages is debatable if it would be an improvement ;) Of course, as I'm still just taking my first Swift steps, there are presumably many code improvements that could be made that I have yet to learn about.
