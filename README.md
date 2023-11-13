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

### Clean Architecture

We separate *data*, *domain*, and *presentation* layer so that development and testing
progress is more effective.

### Unit Test
We do a unit test, such as domain layer like :

1. data layer
   - data source
   - repository
   - models (body & response)
2. domain layer
   - use case

![Scheme](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?w=556&ssl=1)

### Pre-requisites
(Assumed that you have already install Text Editor (Android Studio or VSCode) & Flutter itself)

1. Clone this project using your favorite terminal ([The repo](https://github.com/akbarraihanm/weather_app.git))
2. After it cloned, run `flutter pub get` in you favorite terminal
3. Prepare your real device or use Emulator / Simulator
4. Then run `flutter run -t lib/launcher/main.dart` to run your project into your real device / Emulator / Simulator

## Apk Link
Here is the ([apk link](https://drive.google.com/file/d/13JISt84Lhcfo9eBZO_935Rj-xh3OJVwe/view?usp=sharing))