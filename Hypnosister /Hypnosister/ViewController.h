//
//  ViewController.h
//  Hypnosister
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/20/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLHypnosisView.h"
@interface ViewController : UIViewController

@property  BLHypnosisView *ui;
@property  BLHypnosisView *ui2;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;
@end

