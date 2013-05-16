//
//  AppDelegate.h
//  QTigual
//
//  Created by Roberto on 5/11/13.
//  Copyright (c) 2013 Roberto . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    int *archivo;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, readwrite) int *archivo;
@end
