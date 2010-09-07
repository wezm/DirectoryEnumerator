//
//  DirectoryEnumeratorAppDelegate.h
//  DirectoryEnumerator
//
//  Created by Wesley Moore on 7/09/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DirectoryEnumeratorViewController;

@interface DirectoryEnumeratorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DirectoryEnumeratorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DirectoryEnumeratorViewController *viewController;

@end

