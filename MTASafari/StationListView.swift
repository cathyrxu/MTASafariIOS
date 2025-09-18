import SwiftUI

protocol StationListViewDelegate: AnyObject {
    func stationListView(_ stationListView: StationListView, didSelectEvent event: Event)
}

struct StationListView: View {
    @State private var stations: [Station] = []
    @State private var searchText = ""
    weak var delegate: StationListViewDelegate?
    
    var filteredStations: [Station] {
        if searchText.isEmpty {
            return stations
        } else {
            return stations.filter { $0.Name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                List(filteredStations, id: \.Name) { station in
                    Button(action: {
                        onStationSelect(station: station)
                    }) {
                        Text(station.Name)
                    }
                }
            }
            .navigationTitle("Stations")
            .onAppear {
                stations = CSVLoader.loadStations(from: "stations")
            }
        }
    }
    
    func onStationSelect(station: Station) {
        print("Station selected: \(station.Name), \(station.EventType)")
        let event = EventUtility.createEventFromStation(station)
        delegate?.stationListView(self, didSelectEvent: event)
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search stations...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}
