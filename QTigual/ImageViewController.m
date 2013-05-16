//
//  ImageViewController.m
//  QTigual
//
//  Created by Roberto  on 5/11/13.
//  Copyright (c) 2013 Roberto . All rights reserved.
//
//  Muestra una imagen aleatoria cargada desde el servidor

#import "ImageViewController.h"
#import "CanvasViewController.h"
#import "AppDelegate.h"
#include <stdlib.h>

@interface ImageViewController ()
@end

@interface CanvasViewController ()
@end

@implementation ImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


// Al inciar vista, carga al atributo archivo creado en el delegate y lo muestra en pantalla
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Observa la imagen";
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.archivo = arc4random() % 10;
    
    
    NSLog(@"El archivo es: %i", appDelegate.archivo);
    NSMutableString* URL = [NSMutableString stringWithFormat:@"http://localhost/~roberto/img/%d.png", appDelegate.archivo];
    
    UIImage* targetImage = [UIImage imageWithData:
                        [NSData dataWithContentsOfURL:
                        [NSURL URLWithString: URL]]];
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [targetImage drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    [self performSelector:@selector(dissMissViewController) withObject:self afterDelay:2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Luego de un retraso de 2 segundos, nos muestra la siguiente vista, el canvas
- (void)dissMissViewController
{
    CanvasViewController *canvasViewController = [[CanvasViewController alloc] initWithNibName:@"CanvasViewController" bundle:nil];
    [self.navigationController pushViewController:canvasViewController animated:YES];
}

@end
