//
//  BLTextField.m
//  Hypnosister
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/27/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "BLTextField.h"

@implementation BLTextField 

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if ( self){
        [self setupTextField];
    }
    return self;
}
-(void)setupTextField{
    CGRect textFieldRect = CGRectMake(self.center.x-120, 100, 240, 30);
    
  self.textField = [[UITextField alloc]initWithFrame:textFieldRect];
    self.textField.clearButtonMode = 1;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.textField.placeholder = @"Hypnotize me";
    self.textField.returnKeyType = UIReturnKeyDone;
   self. textField.delegate = self;
    
}


@end
