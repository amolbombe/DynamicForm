//
//  Attributes.swift
//
//  Created by Softcell on 10/11/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class Attributes: NSObject, Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kAttributesValuesKey: String = "values"
	internal let kAttributesPlaceHolderKey: String = "placeHolder"
	internal let kAttributesValidationDataKey: String = "validationData"
	internal let kAttributesTextKey: String = "text"
	internal let kAttributesLabelKey: String = "label"
	internal let kAttributesTextColorKey: String = "textColor"
	internal let kAttributesBackgroundColorKey: String = "backgroundColor"


    // MARK: Properties
	public var values: [String]?
	public var placeHolder: String?
	public var validationData: [ValidationData]?
	public var text: String?
	public var label: String?
	public var textColor: String?
	public var backgroundColor: String?


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
		values = []
		if let items = json[kAttributesValuesKey].array {
			for item in items {
				if let tempValue = item.string {
				values?.append(tempValue)
				}
			}
		} else {
			values = nil
		}
		placeHolder = json[kAttributesPlaceHolderKey].string
		validationData = []
		if let items = json[kAttributesValidationDataKey].array {
			for item in items {
				validationData?.append(ValidationData(json: item))
			}
		} else {
			validationData = nil
		}
		text = json[kAttributesTextKey].string
		label = json[kAttributesLabelKey].string
		textColor = json[kAttributesTextColorKey].string
		backgroundColor = json[kAttributesBackgroundColorKey].string

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
		values <- map[kAttributesValuesKey]
		placeHolder <- map[kAttributesPlaceHolderKey]
		validationData <- map[kAttributesValidationDataKey]
		text <- map[kAttributesTextKey]
		label <- map[kAttributesLabelKey]
		textColor <- map[kAttributesTextColorKey]
		backgroundColor <- map[kAttributesBackgroundColorKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if (values?.count)! > 0 {
			dictionary.updateValue(values! as AnyObject, forKey: kAttributesValuesKey)
		}
		if placeHolder != nil {
			dictionary.updateValue(placeHolder! as AnyObject, forKey: kAttributesPlaceHolderKey)
		}
		if (validationData?.count)! > 0 {
			var temp: [AnyObject] = []
			for item in validationData! {
				temp.append(item.dictionaryRepresentation() as AnyObject)
			}
			dictionary.updateValue(temp as AnyObject, forKey: kAttributesValidationDataKey)
		}
		if text != nil {
			dictionary.updateValue(text! as AnyObject, forKey: kAttributesTextKey)
		}
		if label != nil {
			dictionary.updateValue(label! as AnyObject, forKey: kAttributesLabelKey)
		}
		if textColor != nil {
			dictionary.updateValue(textColor! as AnyObject, forKey: kAttributesTextColorKey)
		}
		if backgroundColor != nil {
			dictionary.updateValue(backgroundColor! as AnyObject, forKey: kAttributesBackgroundColorKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.values = aDecoder.decodeObject(forKey: kAttributesValuesKey) as? [String]
		self.placeHolder = aDecoder.decodeObject(forKey: kAttributesPlaceHolderKey) as? String
		self.validationData = aDecoder.decodeObject(forKey: kAttributesValidationDataKey) as? [ValidationData]
		self.text = aDecoder.decodeObject(forKey: kAttributesTextKey) as? String
		self.label = aDecoder.decodeObject(forKey: kAttributesLabelKey) as? String
		self.textColor = aDecoder.decodeObject(forKey: kAttributesTextColorKey) as? String
		self.backgroundColor = aDecoder.decodeObject(forKey: kAttributesBackgroundColorKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encode(values, forKey: kAttributesValuesKey)
		aCoder.encode(placeHolder, forKey: kAttributesPlaceHolderKey)
		aCoder.encode(validationData, forKey: kAttributesValidationDataKey)
		aCoder.encode(text, forKey: kAttributesTextKey)
		aCoder.encode(label, forKey: kAttributesLabelKey)
		aCoder.encode(textColor, forKey: kAttributesTextColorKey)
		aCoder.encode(backgroundColor, forKey: kAttributesBackgroundColorKey)

    }

}
