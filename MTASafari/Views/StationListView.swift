import SwiftUI

struct StationListView: View {
    @State private var stations: [Station] = []
    var onStationSelect: (Station) -> Void

    var body: some View {
        NavigationView {
            List(stations, id: \.Name) { station in
                Button(action: {
                    onStationSelect(station)
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
}