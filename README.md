# EDF-Reader-Lib
Requirements
iOS 14.0 or later Xcode 13 or later Swift 5 or later

Installing Dependencies
Now we're going to integrate our libraries into the Xcode project.

Steps to integrate :

1. Add EDF Reader Lib to your Xcode project 
2. Call function :

if let path = Bundle.main.path(forResource: "File_Name", ofType: "edf") {
    if let edfFile = EDFReader.init(url: URL(fileURLWithPath: path)) {
        print("edfFile:- ",edfFile)
        
    }
}


Follow this instruction and henceforth, use the workspace instead of your project.

## Getting Involved

### Submitting a Bug Report


### Submitting a Feature Request


<!-- Copyright (c) 2022-2023 Apple Inc and the Swift Project authors. All Rights Reserved. -->
