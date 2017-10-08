Toy Robot
======

Overview
--------

The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units. The robot is free to roam around the surface of the table and prevented from falling to destruction

Usage
--------

To run the application, you just to enter this command `bin/toy_robot` on your terminal and it will let you start playing.

Instructions
------------

Following are commands used for moving the robot

```
Options:

    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT

```

Description
------------

`PLACE` will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
The origin (0,0) can be considered to be the SOUTH WEST most corner.  
The first valid command to the robot is a `PLACE` command, after that, any sequence of commands may be issued, in any order, including another `PLACE` command. The application should discard all commands in the sequence until a valid `PLACE` command has been executed.  
`MOVE` will move the toy robot one unit forward in the direction it is currently facing.  
`LEFT` and `RIGHT` will rotate the robot 90 degrees in the specified direction without changing the position of the robot. 
`REPORT` will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.  

A robot that is not on the table can choose to ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.  


Constraints
-----------

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot. Any move that would cause the robot to fall must be ignored.  


Sample
-------

You can find the sample files in `test_data` folder


Author
------

AtharNoor :: atharnoor2@gmail.com
