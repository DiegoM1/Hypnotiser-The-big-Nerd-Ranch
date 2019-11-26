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
    // Do any additional setup after loading the view.
    
//    self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
//    CGRect firstFrame = CGRectMake(160, 240, 100, 150);

   
    
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

//    BLHypnosisView *hypnosisView = [[BLHypnosisView alloc] initWithFrame:bigRect];
    BLHypnosisView *hypsnosisView = [[BLHypnosisView alloc]initWithFrame:screenRect];
    [self.wrapper addSubview:hypsnosisView];
    
    screenRect.origin.x += screenRect.size.width;
    BLHypnosisView *anotherView = [[BLHypnosisView alloc]initWithFrame:screenRect];
    [self.wrapper addSubview:anotherView];
    
    self.scrollView.contentSize = self.wrapper.bounds.size;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.scrollView setMaximumZoomScale:5.0f];
    [self.scrollView setClipsToBounds:YES];
    
    
   
    
//    CGRect secondFrame = CGRectMake(20, 30, 50, 50);
//    BLHypnosisView *secondView = [[BLHypnosisView alloc]initWithFrame:secondFrame];
//    secondView.backgroundColor = [UIColor blueColor];
//    [firstView addSubview:secondView];
  
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.wrapper;
}


@end
