//
//  TableView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 28.11.22.
//

import SwiftUI

struct ScreenWallView: View {
    
    @Binding var screenWall: String
      var body: some View {
          VStack {
              Text("Choose the wall where the screen will be placed")
                  .font(.title)
                  .padding()
              Picker(selection: $screenWall, label: Text("Choose the wall")) {
                  Text("Left").tag("Left")
                  Text("Right").tag("Right")
                  Text("Front").tag("Front")
                  Text("Back").tag("Back")
              }
              .pickerStyle(SegmentedPickerStyle())
              .padding()
          }
      }
    }

struct ScreenWallView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenWallView(screenWall: .constant(""))
    }
}
