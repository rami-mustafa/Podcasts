# Podcast-swift

- searching for available Podcasts on iTunes
- bookmarking your favorite stations
- audio playback
- offline playback
- Control playback when App is in background : in the Command Center and Lock Screen (including proper Cover Art and Pause, Play, Previous, and Next track action buttons)

## Features
-  Searching for podcasts using iTunes API.
-  Saving info about favorite podcasts on disk, so a user can see them offline.
-  Can add to favourites, delete from favourites.
-  Downloading episodes for listening to without an Internet connection.

## Technologies
-  Third Party Library: ([Alamofire](https://github.com/Alamofire/Alamofire)). (The communication between the Network service and the app was established using Alamofire.) 
-  XML parsing podcasts' meta information ([FeedKit](https://github.com/nmdias/FeedKit)).
-  JSON parsing using `Codable`.
-  I used UserDefaults for downloads
-  I did the recording and uninstalling of events using the `Core Data` structure
-  Design Pattern: MVVM
-  %100 Programmatic
-  UIKit
-  Auto Layout


  ## Installation and Use
1. Clone this project from GitHub or download it as a ZIP.
2. Open Xcode and open the project by selecting the .xcodeproj file in the project folder.
3. Select the required target device from the project settings or use an iOS simulator.
4. Compile and run the project and experience the simulation.

