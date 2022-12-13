//
//  SearchSErvice.swift
//  PetSittingApp
//
//  Created by Francesco Bernaudo on 10/12/22.
//

import Foundation
import SwiftUI
import MapKit

class SearchService: NSObject, ObservableObject {
    @Published var results = [MKLocalSearchCompletion]()
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()  //inizializzazione di nsobject
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
        
    }
    
    
}

extension SearchService: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = searchCompleter.results
    }
    
}


