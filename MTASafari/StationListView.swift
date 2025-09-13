import SwiftUI

protocol StationListViewDelegate: AnyObject {
    func stationListView(_ stationListView: StationListView, didSelectEvent event: Event)
}

struct StationListView: View {
    @State private var stations: [Station] = []
    weak var delegate: StationListViewDelegate?

    var body: some View {
        NavigationView {
            List(stations, id: \.Name) { station in
                Button(action: {
                    onStationSelect(station: station)
                }) {
                    Text(station.Name)
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
