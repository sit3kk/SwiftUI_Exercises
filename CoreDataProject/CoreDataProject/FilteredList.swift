//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Konrad Sitek on 13/01/2024.
//

import SwiftUI
import CoreData



struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }
    
    @Environment(\.managedObjectContext) var moc
    
    let content: (T) -> Content
    
    var body: some View {
        List {
        ForEach(fetchRequest.wrappedValue, id: \.self) {
            singer in
            self.content(singer)
            }.onDelete(perform: removeSinger(at:))
            
    }
    }
    
    init(filterKey: String, filterValue: String, sortDescriptors: [NSSortDescriptor], filteringType: FilterType, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(filteringType.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
    
        func removeSinger(at offsets: IndexSet) {
            for index in offsets {
                let singer = singers[index]
                moc.delete(singer)
                do {
                    try moc.save()
                } catch {
                    print("Error save after delete")
                }
                
            }
        }
    
    
}
