
# Flutter Shows Maze Tv project 

Jobsity challenge project

Proposal: Make a microapps architecture with abstracted technologies. Ideal for large teams and for projects with a long life cycle.

I only did the mandatory features

####  * use flutter version 2.10.5    

## Instructions
type make get to run flutter pub get\
type make clean to run flutter clean\
lauch.json:
```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Hml",
            "program": "./shows/lib/main.dart",
            "request": "launch",
            "type": "dart",
            "args": []
        },
    ]
}
```

## Architecture 

- Architecture of `micro apps` and `packages`.
- `home` is a microapp that contains the list of series and search pages and logic
-`show_details` is a microapp that contains the show details pages and logic
- `instance_manager` is a package to manage instances between micro apps.
    - Created logic in instance manager to open and close instances according to navigation routes.
- `micro_app_dependencies` is class used for communication between microapps.
- `state_manager` is a package to do state manager.
    - Used abstraction with MOBX and with RXNotifier.
- `packages` is a package to centralize libraries between microapps. (ensure that all microapps use the same versions)
- `micro_app` is a package to define microapp contracts
- `design_system` is a package to manage the widgets.
    - Uses atomic model.
- Used `clean architecture` 
- Created `entities` package to reuse entities and models between microapps.


## Tests

- Tested on dataSource with mockWebServer to test exceptions, mapper and client configurations.
- Made tests on the controls to test business logic
- Made widget testing to test view logic



*Tests were only done in home microapp. \
**Tag, string management and logger microapps was not made for a matter of time.

