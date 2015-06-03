/**
 * Copyright (C) 2014 Gimbal, Inc. All rights reserved.
 *
 * This software is the confidential and proprietary information of Gimbal, Inc.
 *
 * The following sample code illustrates various aspects of the Gimbal SDK.
 *
 * The sample code herein is provided for your convenience, and has not been
 * tested or designed to work on any particular system configuration. It is
 * provided AS IS and your use of this sample code, whether as provided or 
 * with any modification, is at your own risk. Neither Gimbal, Inc. 
 * nor any affiliate takes any liability nor responsibility with respect
 * to the sample code, and disclaims all warranties, express and 
 * implied, including without limitation warranties on merchantability, 
 * fitness for a specified purpose, and against infringement.
 */

How to run the iOS sample application

1/ Pre-requisites

1.1/ iOS 5.1.1 SDK

Gimbal will not work on iOS releases prior to 6.0.

1.2/ Xcode

You must have Xcode installed - recommended version 6.1.1. Other versions may
work, but have not been tested.

1.3 Developer certificate

You must have obtained an iOS developer account from Apple.

1.4/ iOS device running at least iOS 6.0 and model iPhone4 or iPhone 4s

Gimbal requires an iPhone 4 - it will not work on an iPhone 3gs, etc.
You must have a provisioning profile that includes any devices that you wish to
test with.

2/ Running the iOS sample application

2.1/ Xcode setup

Xcode must have the iOS SDK (5.0 or greater - 5.1.1 recommended) installed.

2.2/ Import the sample app

2.2.1/ Basic Sample Application

Open the Xcode project file in the sample-apps/Basic Sample (Basic Sample..xcodeproj) with Xcode.

2.3/ Run the application

Connect a device via USB and run the application.

3/ Using Gimbal in your own project

3.1/ Add the Gimbal frameworks to your project

Simply drag the directories directly under the directory "Frameworks" into your
project.

The frameworks support both running on device as well as running in the
simulator.

More information is available in the SDK Documentation provided with this
package.