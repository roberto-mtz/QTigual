//
//  CanvasViewController.m
//  QTigual
//
//  Created by Roberto  on 5/11/13.
//  Copyright (c) 2013 Roberto . All rights reserved.
//

#import "CanvasViewController.h"
#import "ImageViewController.h"
#import "AppDelegate.h"


@interface CanvasViewController ()
@end

@interface ImageViewController ()
@end

@implementation CanvasViewController
int file;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Cargar vista
- (void)viewDidLoad
{
    //Se crea un objeto con los requerimientos por defecto del sistema
    NSUserDefaults *defecto = [NSUserDefaults standardUserDefaults];
    
    //Se inicializa el objeto de la imagen con clave y se carga en el frame
	canvas.image = [defecto objectForKey:@"imagen"];
	canvas = [[UIImageView alloc] initWithImage:nil];
	canvas.frame = self.view.frame;
    
	[self.view addSubview:canvas];
    [super viewDidLoad];

    //Luego de 15 segundos, se manda a servidor
    [self performSelector:@selector(sendImage) withObject:self afterDelay:15];
}

//Nos dice cuando recive los toques en el evento
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *toque = [[event allTouches] anyObject];
    ultimoT = [toque locationInView:self.view];
    ultimoT.y -= 0;
	[super touchesBegan: touches withEvent: event];
	
}


//Nos da el movimiento
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {	
	UITouch *toque = [touches anyObject];
	actualT = [toque locationInView:self.view];
    UIGraphicsBeginImageContext(CGSizeMake(320, 568));
    [canvas.image drawInRect:CGRectMake(0, 0, 320, 568)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0, 0, 0, 1);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), ultimoT.x, ultimoT.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), actualT.x, actualT.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    [canvas setFrame:CGRectMake(0, 0, 320, 568)];
    canvas.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    ultimoT = actualT;
	[self.view addSubview:canvas];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//Mandar al server la imagen hecha en el canvas
- (void)sendImage
{    
    UIGraphicsBeginImageContextWithOptions(canvas.bounds.size, NO,0.0);
    [canvas.image drawInRect:CGRectMake(0, 0, canvas.frame.size.width, canvas.frame.size.height)];
    UIGraphicsEndImageContext();
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //NSLog(@"El archivo es: %i", appDelegate.archivo);
    
    NSData *imagen = UIImageJPEGRepresentation(canvas.image, 1.0);
    NSString *URL = @"http://localhost/~roberto/img.php";    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:URL]];
    [request setHTTPMethod:@"POST"];
    
    NSString *limite = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",limite];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",limite] dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *titulo = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%i.jpg\"\r\n", appDelegate.archivo];
    [body appendData:[titulo dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imagen]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",limite] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    NSData *respuesta = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *mensaje = [[NSString alloc] initWithData:respuesta encoding:NSUTF8StringEncoding];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"¡Muy bien!" message:mensaje  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"¿Otra vez?", nil];
    [alert show];
}

@end
