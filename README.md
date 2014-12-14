Airport1
====================

Control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.
Finally, every plane must have a status indicating whether it's flying or landed.

====================


###Class - Plane

Responsibilites             | Collaborators
----------------------------|------------------
Land                        | Plane, Airport
Take off                    | Plane, Airport
Status                      | Plane, Airport

### Class - Airport
Responsibilites     | Collaborators
--------------------|------------------------
Launch              |  Airport, Plane
Receive             |  Airport, Plane
