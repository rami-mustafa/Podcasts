# Podcasts swift

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
-  I used `UserDefaults` for downloads
-  I did the recording and uninstalling of events using the `Core Data` structure
-  Design Pattern: MVVM
-  %100 Programmatic
-  UIKit
-  Auto Layout

  ## Screens
  
<img src="https://github.com/rami-mustafa/Podcasts/assets/62889691/baa1720a-362c-499c-91fc-ed16c039b51c" width="250">
<img src="https://github.com/rami-mustafa/Podcasts/assets/62889691/bf6393fa-7b8b-44f9-8065-024cd96bb512" width="250">
<img src="https://github.com/rami-mustafa/Podcasts/assets/62889691/ffbd3219-6764-4a77-8757-a99d41597c27" width="250">
<img src="https://github.com/rami-mustafa/Podcasts/assets/62889691/0b0f5331-68e0-4b0f-93db-82f09769b2f1" width="250">
<img src="https://github.com/rami-mustafa/Podcasts/assets/62889691/69b30041-3230-468d-b6e8-d39bc783e12f" width="250">
<img src="https://github.com/rami-mustafa/Podcasts/assets/62889691/dbe38ac3-0b73-47cb-a531-df4065a5b74e" width="250">
<img src="https://github.com/rami-mustafa/Podcasts/assets/62889691/e8bdc4f7-e4bd-4e3d-9924-d27c85c49fcc" width="250">

  ## Installation and Use
1. Clone this project from GitHub or download it as a ZIP.
2. Open Xcode and open the project by selecting the .xcodeproj file in the project folder.
3. Select the required target device from the project settings or use an iOS simulator.
4. Compile and run the project and experience the simulation.

