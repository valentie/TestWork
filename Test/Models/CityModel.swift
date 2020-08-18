import Foundation

public typealias CitiesModel = [CityModel]

public struct CityModel: Codable {
    public let country, name: String
    public let _id: Int
    public let coord: Coord
    
    enum CodingKeys: String, CodingKey {
        case country, name
        case _id
        case coord
    }
    
    public init(country: String, name: String, _id: Int, coord: Coord) {
        self.country = country
        self.name = name
        self._id = _id
        self.coord = coord
    }
}

public struct Coord: Codable {
    public let lon, lat: Double
    
    public init(lon: Double, lat: Double) {
        self.lon = lon
        self.lat = lat
    }
}
