//
//  BLHypnosisSegmentedControl.m
//  Hypnosister
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/27/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "BLHypnosisSegmentedControl.h"

@implementation BLHypnosisSegmentedControl

-(instancetype)initWithItems:(NSArray *)items{
   self = [super initWithItems:items];
    if(self){
       [self addTarget:self action:@selector(segmentAction:) forControlEvents: UIControlEventValueChanged];
    }
    return self;
}



- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSInteger previousSelectedSegmentIndex = self.selectedSegmentIndex;
    [super touchesEnded:touches withEvent:event];
     NSLog(@"Touches ended");
    
        if (previousSelectedSegmentIndex == self.selectedSegmentIndex) {
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }
    }

- (void)segmentAction:(UISegmentedControl *)segment
{
    NSLog(@"SegMENTED ACTION");
    
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


@end
