//
//  File.swift
//  SentiaCodeChallenge
//
//  Created by Clayton on 5/5/21.
//
//   let welcome = try? newJSONDecoder().decode(Properties.self, from: jsonData)

import Foundation

// MARK: - Welcome
class Properties: Codable {
    var data: [Property]?

    enum CodingKeys: String, CodingKey {
        case data
    }

    init(data: [Property]?) {
        self.data = data
    }
}

// MARK: - Datum
class Property: Codable {
    var id: String?
    var auctionDate: Date?
    var availableFrom: Date?
    var bedrooms: Int?
    var bathrooms: Int?
    var carspaces: Int?
    var dateFirstListed: Date?
    var dateUpdated: Date?
    var description: String?
    var displayPrice: String?
    var currency: String?
    var location: Location?
    var owner: Agent?
    var propertyImages: [PropertyImage]?
    var agent: Agent?
    var propertyType: String?
    var saleType: String?

    enum CodingKeys: String, CodingKey {
        case id
        case auctionDate = "auction_date"
        case availableFrom = "available_from"
        case bedrooms
        case bathrooms
        case carspaces
        case dateFirstListed = "date_first_listed"
        case dateUpdated = "date_updated"
        case description
        case displayPrice = "display_price"
        case currency
        case location
        case owner
        case propertyImages = "property_images"
        case agent
        case propertyType = "property_type"
        case saleType = "sale_type"
    }

    init(id: String?, auctionDate: Date?, availableFrom: Date?, bedrooms: Int?, bathrooms: Int?, carspaces: Int?, dateFirstListed: Date?, dateUpdated: Date?, description: String?, displayPrice: String?, currency: String?, location: Location?, owner: Agent?, propertyImages: [PropertyImage]?, agent: Agent?, propertyType: String?, saleType: String?) {
        self.id = id
        self.auctionDate = auctionDate
        self.availableFrom = availableFrom
        self.bedrooms = bedrooms
        self.bathrooms = bathrooms
        self.carspaces = carspaces
        self.dateFirstListed = dateFirstListed
        self.dateUpdated = dateUpdated
        self.description = description
        self.displayPrice = displayPrice
        self.currency = currency
        self.location = location
        self.owner = owner
        self.propertyImages = propertyImages
        self.agent = agent
        self.propertyType = propertyType
        self.saleType = saleType
    }
}

// MARK: - Agent
class Agent: Codable {
    var firstName: String?
    var lastName: String?
    var companyName: String?
    var avatar: Avatar?
    var dob: Date?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case companyName = "company_name"
        case avatar
        case dob
    }

    init(firstName: String?, lastName: String?, companyName: String?, avatar: Avatar?, dob: Date?) {
        self.firstName = firstName
        self.lastName = lastName
        self.companyName = companyName
        self.avatar = avatar
        self.dob = dob
    }
}

// MARK: - Avatar
class Avatar: Codable {
    var small: Large?
    var medium: Large?
    var large: Large?

    enum CodingKeys: String, CodingKey {
        case small
        case medium
        case large
    }

    init(small: Large?, medium: Large?, large: Large?) {
        self.small = small
        self.medium = medium
        self.large = large
    }
}

// MARK: - Large
class Large: Codable {
    var url: String?

    enum CodingKeys: String, CodingKey {
        case url
    }

    init(url: String?) {
        self.url = url
    }
}

// MARK: - Location
class Location: Codable {
    var address: String?
    var state: String?
    var suburb: String?
    var postcode: String?
    var latitude: Double?
    var longitude: Double?

    enum CodingKeys: String, CodingKey {
        case address
        case state
        case suburb
        case postcode
        case latitude
        case longitude
    }

    init(address: String?, state: String?, suburb: String?, postcode: String?, latitude: Double?, longitude: Double?) {
        self.address = address
        self.state = state
        self.suburb = suburb
        self.postcode = postcode
        self.latitude = latitude
        self.longitude = longitude
    }
}

// MARK: - PropertyImage
class PropertyImage: Codable {
    var id: Int?
    var attachment: Attachment?

    enum CodingKeys: String, CodingKey {
        case id
        case attachment
    }

    init(id: Int?, attachment: Attachment?) {
        self.id = id
        self.attachment = attachment
    }
}

// MARK: - Attachment
class Attachment: Codable {
    var url: String?
    var thumb: Large?
    var medium: Large?
    var large: Large?

    enum CodingKeys: String, CodingKey {
        case url
        case thumb
        case medium
        case large
    }

    init(url: String?, thumb: Large?, medium: Large?, large: Large?) {
        self.url = url
        self.thumb = thumb
        self.medium = medium
        self.large = large
    }
}
