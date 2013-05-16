//
//  CanvasViewController.h
//  QTigual
//
//  Created by Roberto  on 5/11/13.
//  Copyright (c) 2013 Roberto . All rights reserved.
//
//  Variables necesarias de toque para pintar canvas

#import <UIKit/UIKit.h>
#import "ImageViewController.h"

@interface CanvasViewController : UIViewController {
    CGPoint ultimoT;
	CGPoint actualT;
    UIImageView *canvas;
    ImageViewController *imageViewController;
}
@end
