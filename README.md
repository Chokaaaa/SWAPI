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

![Simulator Screenshot - iPhone 14 Pro - 2023-09-05 at 16 39 48](https://github.com/Chokaaaa/SWAPI/assets/52541467/68a7e6dd-9c13-4e71-943e-ec2e24cd876a)   ![Simulator Screenshot - iPhone 14 Pro - 2023-09-05 at 16 43 38](https://github.com/Chokaaaa/SWAPI/assets/52541467/f8db1746-a2e5-442f-aca7-9293202fde70)



&#8226; Bottom bar (TabView)

![Simulator Screenshot - iPhone 14 Pro - 2023-09-05 at 16 19 19](https://github.com/Chokaaaa/SWAPI/assets/52541467/1aa6b08a-d162-449f-8301-4f7b5ad0c933) 

&#8226; Picker with .segmented modifier

![Simulator Screenshot - iPhone 14 Pro - 2023-09-05 at 16 41 55](https://github.com/Chokaaaa/SWAPI/assets/52541467/91bcab65-b4e4-42cd-972b-de945f7ded6f)


&#8226; NSURLSession request with a JSONDecoder response
```
   func getCharacterSearchResults(searchText : String = "", completion: @escaping (_ characters: [Character]) -> Void)  {
        guard let url = URL(string: "https://swapi.dev/api/people/?search=\(searchText)") else {
            
            print("Invalid URL")
            completion([Character]())
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error is \(error.localizedDescription)")
                completion([Character]())
                return
            }
            
            guard let data = data else {
                print("invalid DATA")
                return
            }
            
            guard let charactersResults = try? JSONDecoder().decode(CharacterResults.self, from: data) else {
                completion([Character]())
                return
            }
            print("Character results \(charactersResults)")
            completion(charactersResults.results)
        }
        .resume()

```

CRUD functionality with Realm for favorites tab



# Requirements
&#8226; Minimum Deployment version IOS 16.4

&#8226; Supported XCode version 14.3

