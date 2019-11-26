//
//  ViewController.m
//  Hypnosister
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/20/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "ViewController.h"
#import "BLHypnosisView.h"

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic)UIScrollView *scrollView;
@property (nonatomic) UIView *wrapper;

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
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(self.view.center.x-125,35, 250, 50);
    
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.backgroundColor = [UIColor blackColor];
    segmentedControl.tintColor = [UIColor whiteColor];
 
    
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
;
//    BLHypnosisView *hypnosisView = [[BLHypnosisView alloc] initWithFrame:bigRect];
    self.ui = [[BLHypnosisView alloc]initWithFrame:screenRect];
    [self.wrapper addSubview:self.ui];
    
    screenRect.origin.x += screenRect.size.width;
    self.ui2= [[BLHypnosisView alloc]initWithFrame:screenRect];
    [self.wrapper addSubview:self.ui2];
       [self.view addSubview:segmentedControl];
    self.scrollView.contentSize = self.wrapper.bounds.size;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.scrollView setMaximumZoomScale:5.0f];
    [self.scrollView setClipsToBounds:YES];
    
    
   
    
//    CGRect secondFrame = CGRectMake(20, 30, 50, 50);
//    BLHypnosisView *secondView = [[BLHypnosisView alloc]initWithFrame:secondFrame];
//    secondView.backgroundColor = [UIColor blueColor];
//    [firstView addSubview:secondView];
  
}
- (void)segmentAction:(UISegmentedControl *)segment
{
    
    switch (segment.selectedSegmentIndex) {
        case 0:{
            // Red
             float red = (arc4random() % 100)/100.0;
             UIColor *randomColor = [UIColor colorWithRed:red green:0 blue:0 alpha:1.0];
            self.ui.circleColor = randomColor;
            self.ui2.circleColor = randomColor;
            break;}
        case 1:{
            float blue = (arc4random() % 100)/100.0;
            UIColor *randomColor = [UIColor colorWithRed:0 green:0 blue:blue alpha:1.0];
            self.ui.circleColor = randomColor;
            self.ui2.circleColor = randomColor;
            
            break;}
        case 2:{
            float green = (arc4random() % 100)/100.0;
            UIColor *randomColor = [UIColor colorWithRed:0 green:green blue:0 alpha:1.0];
            self.ui.circleColor = randomColor;
            self.ui2.circleColor = randomColor;
            break;}
        default:
            break;
    }
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.wrapper;
}


@end
