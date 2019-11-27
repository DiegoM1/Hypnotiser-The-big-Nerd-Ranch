//
//  ViewController.m
//  Hypnosister
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/20/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "ViewController.h"
#import "BLHypnosisView.h"
#import "BLHypnosisSegmentedControl.h"

@interface ViewController () <UIScrollViewDelegate, UITextFieldDelegate>
@property (nonatomic)UIScrollView *scrollView;
@property (nonatomic) UIView *wrapper;
@property (nonatomic) BLHypnosisSegmentedControl *segmentedControl;
@end

@implementation ViewController

//-(void)loadView{
//    BLHypnosisView *backgroundView = [[BLHypnosisView alloc]init];
//    self.view = backgroundView;


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
        self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [UIImage imageNamed:@"Hypno"];
        self.tabBarItem.image = i;
    }
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];

    
 

    NSArray *itemArray = [NSArray arrayWithObjects: @"Rojo ", @"Azul", @"Verde", nil];
    self.segmentedControl = [[BLHypnosisSegmentedControl alloc] initWithItems:itemArray];
    self.segmentedControl.frame = CGRectMake(self.view.center.x-125,35, 250, 50);


    self.segmentedControl.backgroundColor = [UIColor blackColor];
    self.segmentedControl.tintColor = [UIColor whiteColor];


    CGRect screenRect = self.view.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
//    bigRect.size.height *= 2.0;

   self.scrollView = [[UIScrollView alloc]initWithFrame:screenRect];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
    self.wrapper = [[UIView alloc]initWithFrame:bigRect];
    [self.scrollView addSubview:self.wrapper];
    ;CGRect textFieldRect = CGRectMake(self.view.center.x-120, 100, 240, 30);
    
    UITextField *textField = [[UITextField alloc]initWithFrame:textFieldRect];
    textField.clearButtonMode = 1;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    [self.view addSubview:textField];
    UIInterpolatingMotionEffect *motionEffect;
    motionEffect = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    motionEffect.minimumRelativeValue = @(-25);
    motionEffect.maximumRelativeValue = @(25);
    [textField addMotionEffect:motionEffect];
    motionEffect = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    motionEffect.minimumRelativeValue = @(-25);
     motionEffect.maximumRelativeValue = @(25);
    [textField addMotionEffect:motionEffect];
    
    
    
    
//    BLHypnosisView *hypnosisView = [[BLHypnosisView alloc] initWithFrame:bigRect];
    self.ui = [[BLHypnosisView alloc]initWithFrame:screenRect];
    [self.wrapper addSubview:self.ui];

    screenRect.origin.x += screenRect.size.width;
    self.ui2= [[BLHypnosisView alloc]initWithFrame:screenRect];
    [self.wrapper addSubview:self.ui2];
       [self.view addSubview:self.segmentedControl];
    self.scrollView.contentSize = self.wrapper.bounds.size;

    self.view.backgroundColor = [UIColor whiteColor];
    [self.scrollView setMaximumZoomScale:5.0f];
    [self.scrollView setClipsToBounds:YES];

    self.segmentedControl.ui = self.ui;
    self.segmentedControl.ui2 = self.ui2;


//    CGRect secondFrame = CGRectMake(20, 30, 50, 50);
//    BLHypnosisView *secondView = [[BLHypnosisView alloc]initWithFrame:secondFrame];
//    secondView.backgroundColor = [UIColor blueColor];
//    [firstView addSubview:secondView];

}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.wrapper;
}

-(void)drawHypnoticMessage:(NSString *)message{
    for(int i = 0;i < 20;i++){
        UILabel *messageLabel = [[UILabel alloc]init];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor blackColor];
        UIFont *helvFont = [UIFont fontWithName:@"HelveticaNeue" size:30.0];
        [messageLabel setFont:helvFont];
        messageLabel.text = message;
        [messageLabel sizeToFit];
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];
        
    }
}
-(bool)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    textField.text =@"";
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldClear:(UITextField *)textField{
   
    
    return YES;
}

@end
