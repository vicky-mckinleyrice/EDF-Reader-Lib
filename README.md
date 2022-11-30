# EDF-Reader-Lib
Library to read EDF Data

Steps to integrate :

1. Add EDF Reader Lib to your Xcode project 
2. Call function :

if let path = Bundle.main.path(forResource: "File_Name", ofType: "edf") {
    if let edfFile = EDFReader.init(url: URL(fileURLWithPath: path)) {
        print("edfFile:- ",edfFile)
        
    }
}
