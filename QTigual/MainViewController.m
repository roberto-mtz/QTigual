//
//  MainViewController.m
//  QTigual
//
//  Created by Roberto  on 5/11/13.
//  Copyright (c) 2013 Roberto . All rights reserved.
//
//  Vista para iniciar juego

#import "MainViewController.h"
#import "ImageViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Inicia cuando carga la vista, cambia color de navegacion y pone titulo
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor brownColor];
    self.navigationController.navigationBar.alpha = 0.7f;
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"Bienvenido";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

//Boton para iniciar imagen en imageviewcontroller
- (IBAction)pushButton:(id)sender
{
    ImageViewController *imageViewController = [[ImageViewController alloc] initWithNibName:@"ImageViewController" bundle:nil];
    [self.navigationController pushViewController:imageViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
