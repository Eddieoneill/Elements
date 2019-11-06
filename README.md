# Unit 3 Final - Elements

## Setup
- Clone this repo to your laptop.
- Create a branch for your project.
- Work on the assessment as described below.
- Commit your work.
- Push it to your branch.
- Create a pull request.
- Submit your project to Canvas
- Helper classes we wrote
- Network Helper - wrapper for URLSession
- AppError - handles error throughout the app

## Objective
​
Build a table view that loads and displays a list of the Elements, one per cell/row. Use a custom UITableViewCell subclass. It should have 2 labels and one image. The image should be pinned to the left of cell from the small images endpoint below. The labels should be configured as below:
​
- Name
- Symbol(Number) Atomic Weight
- e.g.
- Sodium
- Na(11) 22.989769282
​
Load a thumbnail image on each row as described below under Endpoints > Images. For full credit, use a custom tableViewCell to make the image more readable.
​
​
Tapping a cell segues to a detail view that:
​
- set the navigation bar title to the name of the element
- shows the larger image and the following data:
- symbol
- number
- weight
- melting point
- boiling point
- discovery by
​
has a button that, when pressed, selects this element as your favorite. This should be implemented by a POST to the favorites endpoint. You will not need to update the UI for your favorite.
Try to format the detail view as much like an individual element on a traditional periodic table as you can. You cannot use the thumbnail image inside the detail view controller, you need to format it yourself.
​
- Sample element: https://sciencenotes.org/wp-content/uploads/2015/04/06-Carbon-Tile.png
- Endpoints
- Elements
- GET https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements
- This is a public read-only GET endpoint so no authentication is necessary.
- Images
- Thumbnail (for table view): http://www.theodoregray.com/periodictable/Tiles/{ElementIDWithThreeDigits}/s7.JPG
- Example: http://www.theodoregray.com/periodictable/Tiles/018/s7.JPG
- Full-size: (for detail view): http://images-of-elements.com/{lowercasedElementName}.jpg
- Example: http://images-of-elements.com/argon.jpg
​
Use the file naming convention illustrated here to generate urls for images.
These are both http urls, so you will need change your info.plist to allow arbitrary loads.
No full size images are available for atomic numbers 90 and up. You can use a placeholder image
​
- Favorites
- POST https://5d83bc5ebaffda001476aa88.mockapi.io/api/v1/favorites
​
This endpoint expects JSON with the following keys: "favoritedBy", "elementName" and "elementSymbol". Values should be your own name, and the symbol and name of the element currently displayed by the detail page, respectively.
​
​
Using Postman and the endpoint below verify that you have favorited an element.
​
​
Note that the domain name for this endpoint is different than the one above.
​
- GET https://5d83bc5ebaffda001476aa88.mockapi.io/api/v1/favorites
JSON Info
Elements looks like this:
```swift
    {
        "name": "Hydrogen",
        "appearance": "colorless gas",
        "atomic_mass": 1.008,
        "boil": 20.271,
        "category": "diatomic nonmetal",
        "color": null,
        "density": 0.08988,
        "discovered_by": "Henry Cavendish",
        "melt": 13.99,
        "molar_heat": 28.836,
        "named_by": "Antoine Lavoisier",
        "number": 1,
        "period": 1,
        "phase": "Gas",
        "source": "https://en.wikipedia.org/wiki/Hydrogen",
        "spectral_img": "https://en.wikipedia.org/wiki/File:Hydrogen_Spectra.jpg",
        "summary": "Hydrogen is a chemical element with chemical symbol H and atomic number 1. With an atomic weight of 1.00794 u, hydrogen is the lightest element on the periodic table. Its monatomic form (H) is the most abundant chemical substance in the Universe, constituting roughly 75% of all baryonic mass.",
        "symbol": "H",
        "xpos": 1,
        "ypos": 1,
        "shells": [
            1
        ]
    },
    {
        "name": "Helium",
        "appearance": "colorless gas, exhibiting a red-orange glow when placed in a high-voltage electric field",
        "atomic_mass": 4.0026022,
        "boil": 4.222,
        "category": "noble gas",
        "color": null,
        "density": 0.1786,
        "discovered_by": "Pierre Janssen",
        "melt": 0.95,
        "molar_heat": null,
        "named_by": null,
        "number": 2,
        "period": 1,
        "phase": "Gas",
        "source": "https://en.wikipedia.org/wiki/Helium",
        "spectral_img": "https://en.wikipedia.org/wiki/File:Helium_spectrum.jpg",
        "summary": "Helium is a chemical element with symbol He and atomic number 2. It is a colorless, odorless, tasteless, non-toxic, inert, monatomic gas that heads the noble gas group in the periodic table. Its boiling and melting points are the lowest among all the elements.",
        "symbol": "He",
        "xpos": 18,
        "ypos": 1,
        "shells": [
            2
        ]
    }
```
