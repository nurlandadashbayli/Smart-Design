//
//  ListView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 25.11.22.
//

import SwiftUI

struct ListView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var design: FetchedResults<Design>
    
    var body: some View {
        List {
            ForEach(design) { design in
                NavigationLink(destination: Text("editdesignview")) //EditDesignView(design: design))
                {
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(design.title!)
                                .bold()
                            Text("\(Int(design.screenDiagonal))") +
                            Text (" inches")
                            Text("\(Int(design.people))") +
                            Text (" people")
                            Text("\(Int(design.roomWidth))") +
                            Text (" m")
                            Text("\(Int(design.roomDepth))") +
                            Text (" m")
                            Text("\(Double(design.area))") +
                            Text (" m2")
                            Spacer()
                        }
                    }
                }
            }
           // .onDelete(perform: deleteDesign)
        }
    }
    
    func deleteDesign(offsets: IndexSet) {
        withAnimation {
            offsets.map { design[$0] }.forEach(managedObjectContext.delete)
            DataController().save(context: managedObjectContext)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
