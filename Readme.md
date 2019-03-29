# Notes
DB = SQL on Linux? (compatable with future Dockerization?)  
[API](./API/Readme.md) = Flask?  
UI = Vue?

# Handling images?
I was thinking of storing images as blobs in the DB but that felt dirty, plus how would I get the state data to be portable? Would a better option be to use a CMS (Django)?
Have the images downloaded to Django based on envar per each DB entry, when DB entry is accessed--and have the API return the image? It's possible to tell the client to grab the image at render but that's basically bandwidth stealing from other people who are hosting those images.

# Build and run
```docker-compose build && docker-compose up```