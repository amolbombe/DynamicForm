//
//  ValidationData.swift
//
//  Created by Softcell on 10/11/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class ValidationData: NSObject, Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kValidationDataMessageKey: String = "message"
	internal let kValidationDataRegxKey: String = "regx"


    // MARK: Properties
	public var message: String?
	public var regx: String?


    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    public init(json: JSON) {
		message = json[kValidationDataMessageKey].string
		regx = json[kValidationDataRegxKey].string

    }

    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		message <- map[kValidationDataMessageKey]
		regx <- map[kValidationDataRegxKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if message != nil {
			dictionary.updateValue(message! as AnyObject, forKey: kValidationDataMessageKey)
		}
		if regx != nil {
			dictionary.updateValue(regx! as AnyObject, forKey: kValidationDataRegxKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.message = aDecoder.decodeObject(forKey: kValidationDataMessageKey) as? String
		self.regx = aDecoder.decodeObject(forKey: kValidationDataRegxKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encode(message, forKey: kValidationDataMessageKey)
		aCoder.encode(regx, forKey: kValidationDataRegxKey)

    }

}
