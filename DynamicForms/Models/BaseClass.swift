//
//  BaseClass.swift
//
//  Created by Softcell on 10/11/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class BaseClass: NSObject, Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kBaseClassTagKey: String = "tag"
	internal let kBaseClassAttributesKey: String = "attributes"
	internal let kBaseClassTypeKey: String = "type"


    // MARK: Properties
	public var tag: String?
	public var attributes: Attributes?
	public var type: String?


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
		tag = json[kBaseClassTagKey].string
		attributes = Attributes(json: json[kBaseClassAttributesKey])
		type = json[kBaseClassTypeKey].string

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
		tag <- map[kBaseClassTagKey]
		attributes <- map[kBaseClassAttributesKey]
		type <- map[kBaseClassTypeKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if tag != nil {
			dictionary.updateValue(tag! as AnyObject, forKey: kBaseClassTagKey)
		}
		if attributes != nil {
			dictionary.updateValue(attributes!.dictionaryRepresentation() as AnyObject, forKey: kBaseClassAttributesKey)
		}
		if type != nil {
			dictionary.updateValue(type! as AnyObject, forKey: kBaseClassTypeKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.tag = aDecoder.decodeObject(forKey: kBaseClassTagKey) as? String
		self.attributes = aDecoder.decodeObject(forKey: kBaseClassAttributesKey) as? Attributes
		self.type = aDecoder.decodeObject(forKey: kBaseClassTypeKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encode(tag, forKey: kBaseClassTagKey)
		aCoder.encode(attributes, forKey: kBaseClassAttributesKey)
		aCoder.encode(type, forKey: kBaseClassTypeKey)

    }

}
