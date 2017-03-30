//
//  UIViewExtensionInitialization.swift
//  Visuality
//
//  Created by Igor Matyushkin on 21.09.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    // MARK: Public class methods
    
    /**
    Loads view from nib with specified name which is located in specified bundle.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
    
        - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib with specified name which is located in specified bundle.
    */
    public class func vt_view(fromNibWithName nibName: String, locatedInBundle bundle: Bundle?) -> Self {
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundle ?? Bundle.main
        
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundleToUse.vt_contains(nibWithName: nibName)
        
        
        // Obtain result view
        
        var resultView = nibExists ? bundleToUse.vt_load(viewOfType: self, fromNibWithName: nibName) : nil
        
        if resultView == nil {
            resultView = self.init()
        }
        
        
        // Return result
        
        return resultView!
    }
    
    /**
    Loads view from nib with specified name which is located in bundle with specified identifier.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
        
        - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib with specified name which is located in bundle with specified identifier.
    */
    public class func vt_view(fromNibWithName nibName: String, locatedInBundleWithIdentifier bundleIdentifier: String?) -> Self {
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
        
        
        // Obtain result view
        
        let resultView = vt_view(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultView
    }
    
    /**
    Loads view from nib with specified name which is located in main bundle.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
    
    - returns: View from nib with specified name which is located in main bundle.
    */
    public class func vt_view(fromNibLocatedInMainBundleWithNibName nibName: String) -> Self {
        // Obtain bundle
        
        let bundleToUse = Bundle.main
        
        
        // Obtain result view
        
        let resultView = vt_view(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultView
    }
    
    /**
    Loads view from nib which name is equal to view's class name and which is located in specified bundle.
    
    - Parameters:
        - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib which name is equal to view's class name and which is located in specified bundle.
    */
    public class func vt_view(fromNibWithClassNameLocatedInBundle bundle: Bundle?) -> Self {
        // Obtain nib name
        
        let nibName = vt_classNameWithoutNamespace()
        
        
        // Obtain result view
        
        let resultView = vt_view(fromNibWithName: nibName, locatedInBundle: bundle)
        
        
        // Return result
        
        return resultView
    }
    
    /**
    Loads view from nib which name is equal to view's class name and which is located in bundle with specified identifier.
    
    - Parameters:
        - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View from nib which name is equal to view's class name and which is located in bundle with specified identifier.
    */
    public class func vt_view(fromNibWithClassNameLocatedInBundleWithIdentifier bundleIdentifier: String?) -> Self {
        // Obtain nib name
        
        let nibName = vt_classNameWithoutNamespace()
        
        
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
        
        
        // Obtain result view
        
        let resultView = vt_view(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultView
    }
    
    /**
    Loads view from nib which name is equal to view's class name and which is located in main bundle.
    
    - returns: View from nib which name is equal to view's class name and which is located in main bundle.
    */
    public class func vt_viewFromNibWithClassNameLocatedInMainBundle() -> Self {
        // Obtain nib name
        
        let nibName = vt_classNameWithoutNamespace()
        
        
        // Obtain bundle
        
        let bundleToUse = Bundle.main
        
        
        // Obtain result view
        
        let resultView = vt_view(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultView
    }
    
    
    // MARK: Private class methods
    
    
    // MARK: Public object methods
    
    
    // MARK: Private object methods
    
}
