
  

> *Project status:* completed 
> *:busts_in_silhouette: Author:* Mário Augusto Carvalho Lara Leite
> *:email: Email:* tkyakow@gmail.com
> :date: *Year:* 2024

  
# Case:

Create a project to parse the Quake log file.
The log file was generated by a Quake 3 Arena server, including a great deal of information of every match.

  **The project should implement the following functionalities:**
  

 - Read the log file
 - Group the game data of each match
 - Collect kill data

**Additional notes:**
 - When <world> kill a player, that player loses -1 kill score.
 - Since <world> is not a player, it should not appear in the list of players or in the dictionary of kills.
 - The counter total_kills includes player and world deaths.

  
# Versions:

> ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [x86_64-darwin20]
> Rails 7.0.8.1

  
# Executing the app:

> Go to repository ([https://github.com/ofamosomario/attensi])(https://github.com/ofamosomario/attensi) and clone the project. 

> rails s to execute the rails.
> Default route do upload the file: http://localhost:3000/

  
# Swagger (end-points documentation)

> [http://localhost:3000/api-docs/index.html](http://localhost:3000/api-docs/index.html)

# Usage
I created two ways to use this importer, you can use the http://localhost:3000 to access the user interface (this is a nice one user interface if you are a Quake fan ), or you can use the swagger file to send the request for the API

# Docker

docker build
  
# Tests

> Run in terminal: rspec
  
# RuboCop

  

![RUBOCOP!](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvMSFQaCKg10EWCRxKz6sQWiTpHbiMdqjbGA&usqp=CAU)

  

> Run in terminal: rubocop

**Thank you!**