# GalaxyPedia (Star Wars IOS app)
GalaxyPedia it's an app that allows you to search for a star wars characters, spaceships or planets.

# Description
Application that allows you to search for a starwars characters, spaceships and planets when according picker is selected. This application allows you to save and store favorite characters localy on your device and showcase it in your favorites tab. 

# Architecture
This application has been created with MVVM architecture (ModelView-View-Model) which is the most popular architecture pattern for a small projects like that, but will still give you enough room if functionality will grow.

&#8226; Model has all necessary data or business logic needed to be used within the app
&#8226; View folder is responsible to store all of the views or reusable elements within the app.
&#8226; ModelView is responsible for a business logic between Model and the view trough the NSURLSession.

# Features
&#8226; Search Textfield created by .searchable modifier

&#8226; Bottom bar (TabView)
![Simulator Screenshot - iPhone 14 Pro - 2023-09-05 at 16 19 19](https://github.com/Chokaaaa/SWAPI/assets/52541467/3211f528-d515-4709-8949-ce964a9553c1)

&#8226; Picker with .segmented modifier


&#8226; NSURLSession request with a JSONDecoder response
&#8226; CRUD functionality with Realm
&#8226; EnvironmentObject applied so realm objects when they are saved can be accessed all over the app

# Requirements
&#8226; Minimum Deployment version IOS 16.4
&#8226; Supported XCode version 14.3

