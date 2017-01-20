//
//  AppDelegate.mm
//
//  Created by Vladimir E. Koltunov on 1/20/17.
//  Copyright © 2017 Vladimir E. Koltunov. All rights reserved.
//

#import "AppDelegate.h"

#include <boost/shared_ptr.hpp>
#include <boost/thread.hpp>

@interface AppDelegate ()
{
    volatile int stop;
    boost::thread th;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    stop = 1;
    th.join();
    NSLog(@"THREAD: joined.");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    stop = 0;
    
    th = boost::thread([self](){
        
        while (!self->stop)
        {
            
            boost::this_thread::sleep_for(boost::chrono::milliseconds(1000));
            
            NSLog(@"HEARTBEAT: 1000...");
        }
        
        NSLog(@"HEARTBEAT: latest...");
    });
}



@end
