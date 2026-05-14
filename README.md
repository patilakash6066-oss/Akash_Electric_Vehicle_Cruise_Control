# Akash_Electric_Vehicle_Cruise_Control
Electric Vehicle Cruise Control System
Overview

This project implements an Electric Vehicle Cruise Control System using MATLAB and Simulink. The purpose of the system is to automatically maintain a constant vehicle speed even when external disturbances such as road slope changes or varying load conditions occur.

A PI/PID controller is designed to regulate the throttle input and minimize speed error, ensuring smooth and stable vehicle operation.

Project Description

Modern electric vehicles use cruise control systems to maintain a desired speed automatically without continuous driver input.

In real-world conditions, vehicle speed changes due to:

Road slope variations
External resistance
Wind disturbances
Load changes

To overcome these issues, a feedback control system is implemented.

The controller continuously compares:

Desired speed (reference input)
Actual vehicle speed (output)

and automatically adjusts the throttle to reduce the error.

Problem Statement

Design a cruise control system for an electric vehicle that:

Maintains constant speed
Reduces overshoot
Minimizes steady-state error
Provides smooth transient response
Maintains stability under disturbance conditions

The vehicle dynamics are represented by the transfer function:

G(s)=1/5s+1

Where:

Parameter	Description
Input	Throttle Control
Output	Vehicle Speed
Disturbance	Road Slope / Load Variation
Objectives

The main objectives of this project are:

Model the electric vehicle system
Design a PI/PID controller
Analyze open-loop and closed-loop response
Simulate the system in MATLAB/Simulink
Evaluate system performance under disturbance
Improve stability and speed regulation
Working Principle
The driver sets a desired vehicle speed.
The controller compares the desired speed with actual speed.
Error is generated based on the difference.
The PI/PID controller processes the error.
The controller adjusts throttle input automatically.
Vehicle speed reaches the desired value smoothly.
If disturbance occurs, the controller compensates and restores speed.

Control System Used
PI Controller

The project mainly uses a PI controller because:

It reduces steady-state error
Provides smooth response
Improves system stability
Simple and effective for first-order systems


