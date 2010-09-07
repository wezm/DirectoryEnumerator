I'm attempting to use an NSDirectoryEnumerator created via [NSFileManager's enumeratorAtURL][enum] method. The enumerator returned fails to enumerate any paths and crashes the app when it is released. I've reduced the code the following:

    - (void)enumerateResources {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSDirectoryEnumerator *enumerator  = [fileManager enumeratorAtURL:[[NSBundle mainBundle] resourceURL] 
                                               includingPropertiesForKeys:NULL 
                                                                  options:NSDirectoryEnumerationSkipsSubdirectoryDescendants
                                                             errorHandler:nil];
        NSAssert(enumerator != nil, @"enumerator is nil");

        id pathname;
        for(pathname in enumerator) {
            NSLog(@"%@", pathname);
        }
    }

When that method is run I get the following backtrace and the message, "GDB: Interrupted":

    #0  0x022a3b00 in CFRelease ()
    #1  0x000aef94 in -[NSURLDirectoryEnumerator dealloc] ()
    #2  0x022a3acc in CFRelease ()
    #3  0x022c8bcd in _CFAutoreleasePoolPop ()
    #4  0x0000a99f in -[NSAutoreleasePool release] ()
    #5  0x002baf84 in _UIApplicationHandleEvent ()
    #6  0x02bf2afa in PurpleEventCallback ()
    #7  0x0236ddc4 in __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ ()
    #8  0x022ce737 in __CFRunLoopDoSource1 ()
    #9  0x022cb9c3 in __CFRunLoopRun ()
    #10 0x022cb280 in CFRunLoopRunSpecific ()
    #11 0x022cb1a1 in CFRunLoopRunInMode ()
    #12 0x002b3226 in -[UIApplication _run] ()
    #13 0x002beb58 in UIApplicationMain ()
    #14 0x00001fb4 in main (argc=1, argv=0xbfffef98) at /Users/wmoore/Source/DirectoryEnumerator/main.m:14

This project reproduces the problem.

If anyone has any suggestions they would be most welcome, otherwise I will submit a ticket to (open)radar. Its worth noting that using enumeratorAtPath works fine.

[enum]: http://developer.apple.com/iphone/library/documentation/cocoa/reference/foundation/Classes/NSFileManager_Class/Reference/Reference.html#//apple_ref/occ/instm/NSFileManager/enumeratorAtURL:includingPropertiesForKeys:options:errorHandler: