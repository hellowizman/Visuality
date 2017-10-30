//
//  ViewControllerInitializer.swift
//  Visuality
//
//  Created by Igor Matyushkin on 30.10.2017.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

internal class ViewControllerInitializer<ViewController: UIViewController> {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(viewControllerClass: ViewController.Type) {
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    public func viewController(fromLocation location: Location?) -> ViewController {
        // Check whether location is not nil
        
        guard let location = location else {
            return ViewController.init()
        }
        
        // Handle location
        
        switch location {
        case let .nibByNameLocatedInBundle(nibName, bundle):
            // Obtain bundle which is appropriate for usage
            
            let bundleOrMain = bundle ?? Bundle.main
            
            // Check whether nib exists in specified bundle
            
            let nibExists = bundleOrMain.vt_contains(nibWithName: nibName)
            
            // Obtain result view controller
            
            let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundleOrMain) : ViewController.init()
            
            // Return result
            
            return resultViewController
        case let .nibByNameLocatedInBundleByIdentifier(nibName, bundleIdentifier):
            // Obtain bundle which is appropriate for usage
            
            let bundle = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
                ?? Bundle.main
            
            // Check whether nib exists in specified bundle
            
            let nibExists = bundle.vt_contains(nibWithName: nibName)
            
            // Obtain result view controller
            
            let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundle) : ViewController.init()
            
            // Return result
            
            return resultViewController
        case let .nibByNameLocatedInMainBundle(nibName):
            // Obtain bundle
            
            let bundle = Bundle.main
            
            // Check whether nib exists in specified bundle
            
            let nibExists = bundle.vt_contains(nibWithName: nibName)
            
            // Obtain result view controller
            
            let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundle) : ViewController.init()
            
            // Return result
            
            return resultViewController
        case let .nibWithClassNameLocatedInBundle(bundle):
            // Obtain nib name
            
            let nibName = ViewController.vt_classNameWithoutNamespace()
            
            // Obtain bundle which is appropriate for usage
            
            let bundleOrMain = bundle ?? Bundle.main
            
            // Check whether nib exists in specified bundle
            
            let nibExists = bundleOrMain.vt_contains(nibWithName: nibName)
            
            // Obtain result view controller
            
            let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundleOrMain) : ViewController.init()
            
            // Return result
            
            return resultViewController
        case let .nibWithClassNameLocatedInBundleByIdentifier(bundleIdentifier):
            // Obtain nib name
            
            let nibName = ViewController.vt_classNameWithoutNamespace()
            
            // Obtain bundle which is appropriate for usage
            
            let bundle = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
                ?? Bundle.main
            
            // Check whether nib exists in specified bundle
            
            let nibExists = bundle.vt_contains(nibWithName: nibName)
            
            // Obtain result view controller
            
            let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundle) : ViewController.init()
            
            // Return result
            
            return resultViewController
        case .nibWithClassNameLocatedInMainBundle:
            // Obtain nib name
            
            let nibName = ViewController.vt_classNameWithoutNamespace()
            
            // Obtain bundle
            
            let bundle = Bundle.main
            
            // Check whether nib exists in specified bundle
            
            let nibExists = bundle.vt_contains(nibWithName: nibName)
            
            // Obtain result view controller
            
            let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundle) : ViewController.init()
            
            // Return result
            
            return resultViewController
        }
    }

    /**
    Loads view controller from nib with specified name which is located in specified bundle.
    
    - Parameters:
    - nibName: Name of nib file to load view from.
    
    - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
    
    - returns: View controller from nib with specified name which is located in specified bundle.
    */
    public func viewController(fromNibWithName nibName: String, locatedInBundle bundle: Bundle?) -> ViewController {
        // Obtain bundle which is appropriate for usage
        
        let bundleOrMain = bundle ?? Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundleOrMain.vt_contains(nibWithName: nibName)
        
        // Obtain result view controller
        
        let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundleOrMain) : ViewController.init()
        
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
    public func viewController(fromNibWithName nibName: String, locatedInBundleWithIdentifier bundleIdentifier: String?) -> ViewController {
        // Obtain bundle which is appropriate for usage
        
        let bundle = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
            ?? Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundle.vt_contains(nibWithName: nibName)
        
        // Obtain result view controller
        
        let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundle) : ViewController.init()
        
        // Return result
        
        return resultViewController
    }
    
    /**
    Loads view controller from nib with specified name which is located in main bundle.
    
    - Parameters:
        - nibName: Name of nib file to load view from.
     
    - returns: View controller from nib with specified name which is located in main bundle.
    */
    public func viewController(fromNibLocatedInMainBundleWithNibName nibName: String) -> ViewController {
        // Obtain bundle
        
        let bundle = Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundle.vt_contains(nibWithName: nibName)
        
        // Obtain result view controller
        
        let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundle) : ViewController.init()
        
        // Return result
        
        return resultViewController
    }
    
    /**
    Loads view controller from nib which name is equal to view's class name and which is located in specified bundle.
    
    - Parameters:
        - bundle: Bundle which contains specified nib file. If nil, main bundle will be used.
     
    - returns: View controller from nib which name is equal to view's class name and which is located in specified bundle.
    */
    public func viewController(fromNibWithClassNameLocatedInBundle bundle: Bundle?) -> ViewController {
        // Obtain nib name
        
        let nibName = ViewController.vt_classNameWithoutNamespace()
        
        // Obtain bundle which is appropriate for usage
        
        let bundleOrMain = bundle ?? Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundleOrMain.vt_contains(nibWithName: nibName)
        
        // Obtain result view controller
        
        let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundleOrMain) : ViewController.init()
        
        // Return result
        
        return resultViewController
    }
    
    /**
    Loads view controller from nib which name is equal to view's class name and which is located in bundle with specified identifier.
    
    - Parameters:
        - bundleIdentifier: Identifier of bundle which contains specified nib file. If nil, main bundle will be used.
     
    - returns: View controller from nib which name is equal to view's class name and which is located in bundle with specified identifier.
    */
    public func viewController(fromNibWithClassNameLocatedInBundleWithIdentifier bundleIdentifier: String?) -> ViewController {
        // Obtain nib name
        
        let nibName = ViewController.vt_classNameWithoutNamespace()
        
        // Obtain bundle which is appropriate for usage
        
        let bundle = bundleIdentifier == nil ? Bundle.main : Bundle(identifier: bundleIdentifier!)
            ?? Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundle.vt_contains(nibWithName: nibName)
        
        // Obtain result view controller
        
        let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundle) : ViewController.init()
        
        // Return result
        
        return resultViewController
    }
    
    /**
    Loads view controller from nib which name is equal to view's class name and which is located in main bundle.
    
    - returns: View controller from nib which name is equal to view's class name and which is located in main bundle.
    */
    public func viewControllerFromNibWithClassNameLocatedInMainBundle() -> ViewController {
        // Obtain nib name
        
        let nibName = ViewController.vt_classNameWithoutNamespace()
        
        // Obtain bundle
        
        let bundle = Bundle.main
        
        // Check whether nib exists in specified bundle
        
        let nibExists = bundle.vt_contains(nibWithName: nibName)
        
        // Obtain result view controller
        
        let resultViewController = nibExists ? ViewController.init(nibName: nibName, bundle: bundle) : ViewController.init()
        
        // Return result
        
        return resultViewController
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}