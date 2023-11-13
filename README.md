# Weather App

Want to know about weather's forecast? Weather App is the answer! You could see the weather's 
forecast for 5 days / 3 hours. Sign In or Register to enjoy our weather's forecast app

# Well-to-known

## Tech Stack & Architecture

### State Management

This project is using BLoC as a state management ([BLoC Pub Dev](https://pub.dev/packages/flutter_bloc)).
Separate UI logic code & UI code, will increase the code performance.

![Mechanism](https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_architecture.png)

UI listen to the state & request event to trigger the state, and then BLoC give them the data & manage 
the UI state.

## Clean Architecture

We separate *data*, *domain*, and *presentation* layer so that development and testing
progress is more effective.

![Scheme](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?w=556&ssl=1)

## Pre-requisites
(Assumed that you have already install Text Editor (Android Studio or VSCode) & Flutter itself)
