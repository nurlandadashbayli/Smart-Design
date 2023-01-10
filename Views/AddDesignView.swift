import SwiftUI

struct AddDesignView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @Environment (\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var roomWidth: String = ""
    @State private var roomDepth: String = ""
    // @State private var screenDiagonal: String = ""
    
    
    var body: some View {
          Form {
              TextField("Design title:", text: $title)
                  
              VStack {
                  TextField("Room Width:", text: $roomWidth)
                  TextField("Room Depth:", text: $roomDepth, onCommit: addDesign) // add onCommit modifier to trigger the addDesign action when Enter is pressed
              }
              .padding()
                
                HStack {
                    Button("Cancel") { dismiss() }
                    Spacer()
                    Button("Add") {
                        DataController()
                            .addDesign(
                                title: title,
                                roomDepth: roomDepth,
                                roomWidth: roomWidth,
                                context: managedObjectContext)
                        dismiss()
                    }
                    .disabled(roomWidth.isEmpty)
                    .disabled(roomDepth.isEmpty)
                    .padding(.all)
            }
        }
        .padding(.all)
        .frame(width: 600, height: 400)
    }
    func addDesign() { // add this function to trigger the adding of a new design
        DataController()
            .addDesign(
                title: title,
                roomDepth: roomDepth,
                roomWidth: roomWidth,
                context: managedObjectContext)
        dismiss()
    }   
}

struct AddDesignView_Previews: PreviewProvider {
    static var previews: some View {
        AddDesignView()
    }
}
