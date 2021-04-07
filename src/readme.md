# Readme

The GradReflect project code builds an iOS app on either the simulator or a connected iOS mobile device. 

The structure of the code is as follows:

### Model
The model classes within SwiftUI are used as a data container that define a structure that will be written to and fetched from. 
This includes the SkillModel and RecordingModel.
The SkillModel defines the structure of the data that is contained for each skill on the app's skill cards.
The RecordingModel defines the structure of what is held for the recordings created by the app. This data is used to fetch and display recordings.

A model, NoteEntry, was also created to hold the note entries created by the user via Core Data, the permanent storage that organises the data in an entity-attribute relationship. It has a Core Data class file and a Core Data properties file. It allowed the manipulation of data within the fetch request in a single line of code, and tracked changes through the persistent storage. Core Data is saved using an NSManagedObject which uses optimised storage and retrieval methods with key-value coding and observing.

### Data
The Data folder contains one swift file called SkillData, this uses the SkillModel to strucutre and populate the data that is displayed on the skill cards.

### View
The view folder contains a file for each of the major UI components. The view is responsible for displaying the UI and animations. A secondary responsibility of the view is to receive any user interactions and pass these to a view model for interpretation. The view is made up of views and controls; each view represents a building block of user interface. The controls allow the user to interact with this interface. 
There is also a RootView that is involved in dictating which view is being shown at a given time by using the enum created in the PageHelper.

### App
The App folder has the files that control the views or data.
There is the GradReflect.xcdatamodel file that contains the creation of Core Data NoteEntry and its attributes. 
The GradReflectApp file is what opens upon running the app, it calls the RootView to decide what view is shown at a given time.
The ability to switch views is controlled by the Rooter and PageHelper files. The Rooter starts the application on the skill cards home page, the PageHelper file uses an enum that provides the different view options that are selected when the user presses the navaigation buttons to enter a different page view.
A persistence file controls the settings for Core Data.
The NotificationManager controls the notification that are launched when the users clicks the button to turn on notifications with the Settings page.
The RecordAudio file handles the functionality for recording an audio in the Recordings page.
The PlaybackAudio file handles the functionality for playing back an audio created by a user within the Recordings page.

### Assets 
The Assests.xcassets holds the images that are used throughout the app including the application logo and loading screen, as well as all the images for the skill cards.

### Info.plist
This holds the settings for the application.

### UI tests
Within the UI tests there are two tests.
The first test creates a new note and saves this.
The next test then checks the ability to delete a note by creating a note and then deleting it.
These tests need to be run in order and are run through clicking the play button next to the class declaration "class GradReflectUITests: XCTestCase".

## Build instructions

### Requirements

* XCode Version 12.4
* Swift 5
* SwiftUI 2
* Requires an Apple computer to run XCode, either Macbook or iMac
* macOS Catalina 10.15 or later must be used on the Apple computer for XCode 12.
* Compatible with iPhones only (not iPods or iPads):
    - iPhone 8
    - iPhone 8 Plus
    - iPhone 11
    - iPhone 11 Pro
    - iPhone 11 Pro Max
    - iPhone 12
    - iPhone 12 Pro
    - iPhone 12 Pro Max
    - iPhone 12 Mini

To build and install app on their own device:
* Apple Account to build the app on their own device.
* An iPhone of the above types

### Build steps

To build the app, the simulated iPhone can be used. To do this the large Play button on the toolbar at the top of XCode should be pressed after choosing the iOS device to build the app on. iPhone 11 Pro is recommended as this was the phone that was used during the majority of development. 
The app can then be interacted with as it will build onto the simulated device in the same way it would on a physical device. The app can be interacted with using the mouse and keyboard to type.

To build the app on a physical iPhone, the user must connect their iPhone to the Apple computer being used. 
They must then request their certificates by going to the preferences tab in XCode and then to Accounts. They must then fill in their Apple ID account information. They then need to click 'Manage certificates' and the '+' and add a Apple Development certificate.
Following this they can then select their device from the list of devices in the XCode top toolbar and click the Play button, this will download the app onto their device after they have clicked Trust on the alert asking if the user trusts this computer. 
Once the app is downloaded onto the physical device, the user can click on the app to use it. If when the app is clicked, an alert states "Untrusted developer" then the user will need to go to Settings > General > Device Management, click on their Apple ID and trust the developer/application. The app should then be usable. 
If the application still does not work, Apple developer forumns can help figure out the issue, or the user can resort back to using the simulated iPhone on XCode.


### Test steps

The application can be tested through the use of the previews that are provided next to the code for each of the views that can be run through the play button on the preview to use the functionality on a particular view.

The app can also be tested through running the application via the simulated iPhone device. To run this the Play button at the top toolbar of XCode must be pressed after selecting the type of iPhone that should be used. iPhone 11 Pro is recommended as this was the phone that was used during the majority of development.

There are also two UI tests that can be run by clicking the play button next to the class declaration "class GradReflectUITests: XCTestCase". These tests will open the simulated iPhone to run them and test that a notes can be created and deleted. While the tests are running the simulated phone should not be intereacted with as this will interrupt the tests and cause them to fail.
