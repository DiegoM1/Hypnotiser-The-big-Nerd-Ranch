//
//  BLHypnosisSegmentedControl.h
//  Hypnosister
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/27/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLHypnosisView.h"
NS_ASSUME_NONNULL_BEGIN

@interface BLHypnosisSegmentedControl : UISegmentedControl
@property  BLHypnosisView *ui;
@property  BLHypnosisView *ui2;
//-(void)initWithHypnosisView:(BLHypnosisView*) hypnosisView1: (BLHypnosisView*) hypnosisView2;
@end

NS_ASSUME_NONNULL_END
