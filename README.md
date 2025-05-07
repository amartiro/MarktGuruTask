# MarktGuruTask: 


An iOS application that displays a list of products loaded form predefined API with full product detail view and user settings support, including favoriting and dark mode toggling.

In Application is used MVVM architecture pattern. 
For UI was choosen SwiftUI. My experience in UIKit are huge in comparisation to SwiftUI.  
Was used URLSession for loading products from predefined API. As API was not stabile there is filtering logic for appending new products to existing ones. If API will work normally we can remove that logic. 
Tried to follow best practices like SOLID principe. Created small view with their mocked previews  as much as possible.

As a improvents I would like to add some UI tests for testing SwiftUI views. More mock can be added to project. 

Each day I spent approchimetly 3 hours, so total spent hours are 10.
AI is used  just for text generations like to see good ReamMe file template.
All applciation was developed without using any external third party libraries.



----

## Features

###  Products Tab

- **Product List Screen**
  - Scrollable list of products (name, price, description, image)
  - Pagination support via infinite scroll or "Load More" button
  - Custom cell layout for each product
  - Tap any product in list view to view full details in details screen

- **Product Details Screen**
  - Shows name, description, price, and full-size image
  - Includes a **Favorite** button
    - Users can favorite/unfavorite products
    - Favorite state updates in both detail and list views


### Settings Tab

- **Settings Screen**
  - Toggle for **Dark Mode** (light/dark appearance) which is reflected overall the applciations screen
  - Settings persist across sessions using `UserDefaults`


## Requirements

- Xcode 16 or newer
- Swift 5.5+
- iOS 17+

## 🚀 Getting Started

Clone the repo and open project:

git clone https://github.com/amartiro/MarktGuruTask.git
cd MarktGuruTask
open MarktGuruTask.xcodeproj
