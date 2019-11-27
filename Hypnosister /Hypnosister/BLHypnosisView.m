//
//  BLHypnosisView.m
//  Hypnosister
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/20/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "BLHypnosisView.h"

@interface BLHypnosisView()



@end
@implementation BLHypnosisView

   
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

*/

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    //Obtengo el contexto
    
    

    CGRect bounds = self.bounds;//Creo un objecto gráfico , bounds desde el punto 0.0
    CGPoint center; //declaro un punto llamado center
    center.x = bounds.origin.x + bounds.size.width /2.0;//la cordenada de x de center
    center.y = bounds.origin.y + bounds.size.height /2.0;// la cordenada y de center
    
//    [logo drawInRect:frame1];
    
  UIBezierPath *path = [[UIBezierPath alloc]init];//instancio un bezierpath para crear un gráfico.
    float maxRadius = hypot(bounds.size.width, bounds.size.height) /2.0;
  //Hypotenusa para hallar el maximo radio
    
    
    for ( float currentRadius = maxRadius; currentRadius > 0;currentRadius -= 20){//reducira 20 del radio màximo
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];//mueve el punto hacia la linea para que no se vea
        [path addArcWithCenter:center radius:currentRadius startAngle: 0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }//crea el arco desde el centro según el currentRadius del loop
    
    
    path.lineWidth = 10;//ancho de las lineas
    
    [self.circleColor setStroke];// el color de los arcos que se crearon
    [path stroke];//Para colorear el path
    CGContextRef currentContext = UIGraphicsGetCurrentContext() ;
   
    
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0,1.0,0.0,1.0,
        .0,1.0,0.0,1.0
        };
    CGPoint startPoint = CGPointMake(center.x*1.5, center.y*1.5);//3 puntos para crear eltriangulo
    CGPoint endPoint2 = CGPointMake(center.x*0.5, center.y*1.5);
    CGPoint endPoint = CGPointMake(center.x, center.y/2);
    

    //Creating triangle
    UIBezierPath *path2 = [[UIBezierPath alloc ] init];//inializar
    [path2 moveToPoint:startPoint];//creaciòn de los triangulos
    [path2 addLineToPoint:endPoint];
    [path2 addLineToPoint:endPoint2];
    [path2 closePath];//cerrar el path
    CGContextSaveGState(currentContext);
    [path2 addClip];
    //image
    
    


   //coloca las sombras con sus caracteristicas
//    UIImageView *imagen = [[UIImageView alloc]init];//inializo la vista de la imagen
//    [imagen setImage:[UIImage imageNamed:@"logo"]];// le coloco la imagen
//    [imagen setFrame:CGRectMake(center.x-150, center.y-150,300 , 300)];// los atributos de la imagen
    
//    UIBezierPath *shadowPath =[UIBezierPath bezierPathWithRect:imagen.bounds];
//    imagen.layer.rasterizationScale = [UIScreen mainScreen].scale;
//    imagen.layer.masksToBounds = NO;
//
//    imagen.layer.shadowColor = [UIColor blackColor].CGColor;
//    imagen.layer.shadowOffset = CGSizeMake(0,0);
//    imagen.layer.shadowOpacity= 0.5f;
//    imagen.layer.shadowPath = shadowPath.CGPath;
//
//    [self addSubview:imagen];//subvista para la imagen
   
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);//las caracteristicas que tendra el gradient
CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), gradient, startPoint, endPoint, 0);//desde donde se realizara el
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
   
    CGContextRestoreGState(currentContext);
    CGContextSaveGState(currentContext);
    CGContextSetShadow(UIGraphicsGetCurrentContext(), CGSizeMake(4, 7),3);
    CGRect frame1 = CGRectMake(center.x-150, center.y-150,300 , 300);
    UIImage *logo = [UIImage imageNamed:@"logo"];
    
    [logo drawInRect:frame1];
    CGContextRestoreGState(currentContext);
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog( @"%@ was touched",self);
    float red = (arc4random() % 100)/100.0;
    float blue = (arc4random() % 100)/100.0;
    float green = (arc4random() % 100)/100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
    
}
-(void)setCircleColor:(UIColor *)circleColor{
    
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

@end
