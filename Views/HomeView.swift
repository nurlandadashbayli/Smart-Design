import SwiftUI
/**
*  struct HomeView
*
*  This struct is a SwiftUI View that displays a split view containing a list of designs stored in Core Data and a 3D view of the selected design. It allows for adding, deleting, and selecting designs.
*
*  @Environment(\.managedObjectContext) var managedObjectContext - The managed object context used to fetch the designs from Core Data.
*  @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var design: FetchedResults<Design> - A fetched results object containing the designs fetched from Core Data.
*  @State private var selectedDesign: Design.ID? - The ID of the currently selected design.
*  @State private var columnVisibility = NavigationSplitViewVisibility.all - The visibility of the split view's columns.
*  @State private var showingAddView = false - A state variable that controls the visibility of the "Add Design" sheet.
*  var body: some View - The body of the struct that contains the elements that are displayed on the screen.
*
*  @return Void
*/
struct HomeView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var design: FetchedResults<Design>
    
    @State private var selectedDesign: Design.ID?
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @State private var showingAddView = false
    
    var body: some View {
           NavigationSplitView(columnVisibility: $columnVisibility) {
               List(design, selection: $selectedDesign) { design in
                   Text(design.title!)
               }
               
               .toolbar {
                   ToolbarItem(placement: .primaryAction) {
                       Button(action: { showingAddView.toggle() }, label: {
                           Label("Add", systemImage: "plus.circle")
                       })
                   }
               }
               .sheet(isPresented: $showingAddView) {
                   AddDesignView()
               }
           }
        
           content: {
               if let designId = selectedDesign {
                   let selectedDesign = design.first(where: { $0.id == designId })
                   if !design.isEmpty {
                       EditDesignView(design: selectedDesign ?? design[0])
                   } else {
                       Text("No designs to view")
                   }

               } else {
                   Text("Select a design")
               }
           }
        

           detail: {
               if let designId = selectedDesign {
                   let selectedDesign = design.first(where: { $0.id == designId })
                   if !design.isEmpty {
                       ThreeDView(design: selectedDesign ?? design[0])
                   } else {
                       Text("No designs to view")
                   }

               } else {
                   Text("Select a design")
               }

           }

           .toolbar {
               ToolbarItem(placement: .primaryAction) {
                   Button(action: deleteDesign, label: {
                       Label("Delete", systemImage: "trash")
                   })
                   .disabled(selectedDesign == nil)
               }
           }
    }
    
    func deleteDesign() {
        if let designId = selectedDesign {
            let selectedDesign = design.first(where: { $0.id == designId })
            managedObjectContext.delete(selectedDesign ?? design[0])
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
}
