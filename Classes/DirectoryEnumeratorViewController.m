//
//  DirectoryEnumeratorViewController.m
//  DirectoryEnumerator
//
//  Created by Wesley Moore on 7/09/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "DirectoryEnumeratorViewController.h"

@implementation DirectoryEnumeratorViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

- (void)enumerateResources {
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	NSDirectoryEnumerator *enumerator  = [fileManager enumeratorAtURL:[[NSBundle mainBundle] resourceURL] 
										   includingPropertiesForKeys:NULL 
															  options:NSDirectoryEnumerationSkipsSubdirectoryDescendants
														 errorHandler:nil];
	NSAssert(enumerator != nil, @"enumerator is nil");

	id pathname;
	for(pathname in enumerator) {
		NSLog(@"%@", pathname);
	}
	
	[fileManager release];
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[self enumerateResources];
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
