
# Flutter Shows Maze Tv project 

Jobsity challenge project

Proposal: Make a microapps architecture with abstracted technologies. Ideal for large teams and for projects with a long life cycle.

####  * FLutter version 2.10.5|    


## Architecture 

- Architecture of `micro apps` and `packages`.
- `home microapp` contains the list of series and search page logic
-`show_details microapp` contains the show details logic
- Created `Instance manager` to manage instances between micro apps.
- Created `MicroAppDependencies`for communication between microapps.
- Created logic in instance manager to open and close instances according to navigation routes.
- Created `State manager` package.
    - Used abstraction with MOBX and with RXNotifier.
- Created `Packages` to centralize libraries between microapps. (All use the same versions)
- Created beginning of a design system with atomic model.
- Created makefile.
- Used `clean architecture` 
- Created `entities` library to reuse entities and models between microapps


## Tests

- Tested on dataSource with mockWebServer to test exceptions, mapper and client configurations.
- Made tests on the controls to test view logic
- Made widget testing to test page logic



*Tests were only done in home microapp. \
**Tag, string management and logger microapps was not made for a matter of time.

