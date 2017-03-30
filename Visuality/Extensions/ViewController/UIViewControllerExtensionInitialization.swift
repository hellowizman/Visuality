//
//  UIViewControllerExtensionInitialization.swift
//  Visuality
//
//  Created by Igor Matyushkin on 23.10.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    // MARK: Public class methods
    
    /**
    Loads view controller from nib with specified name which is located in specified bundle.
    
    - Parameters:
    - nibName: Name of nib file to load view from.
    
    - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View controller from nib with specified name which is located in specified bundle.
    */
    public class func vt_viewController(fromNibWithName nibName: String, locatedInBundle bundle: Bundle?) -> Self {
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundle ?? Bundle.main
        
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundleToUse.vt_contains(nibWithName: nibName)
        
        
        // Obtain result view controller
        
        let resultViewController = nibExists ? self.init(nibName: nibName, bundle: bundleToUse) : self.init()
        
        
        // Return result
        
        return resultViewController
    }
    
    /**
     Loads view controller from nib with specified name which is located in bundle with specified identifier.
     
     - Parameters:
     - nibName: Name of nib file to load view from.
     
     - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
     
     - returns: View controller from nib with specified name which is located in bundle with specified identifier.
     */
    public class func vt_viewController(fromNibWithName nibName: String, locatedInBundleWithIdentifier bundleIdentifier: String?) -> Self {
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
        
        
        // Obtain result view controller
        
        let resultViewController = vt_viewController(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultViewController
    }
    
    /**
     Loads view controller from nib with specified name which is located in main bundle.
     
     - Parameters:
     - nibName: Name of nib file to load view from.
     
     - returns: View controller from nib with specified name which is located in main bundle.
     */
    public class func vt_viewController(fromNibLocatedInMainBundleWithNibName nibName: String) -> Self {
        // Obtain bundle
        
        let bundleToUse = Bundle.main
        
        
        // Obtain result view controller
        
        let resultViewController = vt_viewController(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultViewController
    }
    
    /**
     Loads view controller from nib which name is equal to view's class name and which is located in specified bundle.
     
     - Parameters:
     - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
     
     - returns: View controller from nib which name is equal to view's class name and which is located in specified bundle.
     */
    public class func vt_viewController(fromNibWithClassNameLocatedInBundle bundle: Bundle?) -> Self {
        // Obtain nib name
        
        let nibName = vt_classNameWithoutNamespace()
        
        
        // Obtain result view controller
        
        let resultViewController = vt_viewController(fromNibWithName: nibName, locatedInBundle: bundle)
        
        
        // Return result
        
        return resultViewController
    }
    
    /**
     Loads view controller from nib which name is equal to view's class name and which is located in bundle with specified identifier.
     
     - Parameters:
     - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
     
     - returns: View controller from nib which name is equal to view's class name and which is located in bundle with specified identifier.
     */
    public class func vt_viewController(fromNibWithClassNameLocatedInBundleWithIdentifier bundleIdentifier: String?) -> Self {
        // Obtain nib name
        
        let nibName = vt_classNameWithoutNamespace()
        
        
        // Obtain bundle which is appropriate for usage
        
        let bundleToUse = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
        
        
        // Obtain result view controller
        
        let resultViewController = vt_viewController(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultViewController
    }
    
    /**
     Loads view controller from nib which name is equal to view's class name and which is located in main bundle.
     
     - returns: View controller from nib which name is equal to view's class name and which is located in main bundle.
     */
    public class func vt_viewControllerFromNibWithClassNameLocatedInMainBundle() -> Self {
        // Obtain nib name
        
        let nibName = vt_classNameWithoutNamespace()
        
        
        // Obtain bundle
        
        let bundleToUse = Bundle.main
        
        
        // Obtain result view controller
        
        let resultViewController = vt_viewController(fromNibWithName: nibName, locatedInBundle: bundleToUse)
        
        
        // Return result
        
        return resultViewController
    }
    
    
    // MARK: Private class methods
    
    
    // MARK: Public object methods
    
    
    // MARK: Private object methods
    
}
