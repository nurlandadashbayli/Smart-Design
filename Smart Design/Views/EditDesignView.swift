////
////  EditDesignView.swift
////  Smart Design
////
////  Created by Nurlan Dadashbayli on 18.11.22.
////
//
//import SwiftUI
//
//struct EditDesignView: View {
//
//    @Environment (\.managedObjectContext) var managedObjectContext
//    @Environment (\.dismiss) var dismiss
//
//    var design: FetchedResults<Design>.Element
//
//    @State private var title = ""
//    @State private var area: Double = 0
//    @State private var people: Double = 0
//    @State private var roomWidth: Double = 0
//    @State private var roomDepth: Double = 0
//
//    var body: some View {
//
//        Form {
//            Section {
//                TextField("\(design.title!)", text: $title)
//                // to show the current values
//                    .onAppear {
//                        title = design.title!
//                        area = design.area
//                    }
//
//                VStack {
//                    VStack {
//                        Text("Room Depth: \(Int(roomDepth))")
//                        Slider(value: $roomDepth, in: 0...1000)
//
//                        Text("Room Width: \(Int(roomWidth))")
//                        Slider(value: $roomWidth, in: 0...1000)
//                    }
//                }
//                .padding()
//
//                HStack {
//                    Spacer()
//                    Button("Submit") {
//                        DataController().editDesign(design: design, title: title,
//                                                    roomDepth: roomDepth,
//                                                    roomWidth: roomWidth,
//                                                    area: area,
//                                                    people: people,
//                                                    context: managedObjectContext)
//                                                dismiss()
//                       // dismiss()
//                    }
//                    .padding(.all)
//                }
//            }
//        }
//    }
//}
