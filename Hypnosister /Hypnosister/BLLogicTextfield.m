//
//  BLLogicTextfield.m
//  Hypnosister
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/27/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "BLLogicTextfield.h"

@implementation BLLogicTextfield




+(UILabel *)createLabelforView:(UIView*)view withMessage:(NSString*) message{
        UILabel *messageLabel = [[UILabel alloc]init];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor blackColor];
        UIFont *helvFont = [UIFont fontWithName:@"HelveticaNeue" size:30.0];
        [messageLabel setFont:helvFont];
        messageLabel.text = message;
        [messageLabel sizeToFit];
        int width = (int)(view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        int height = (int)(view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
     messageLabel.frame = frame;
    return messageLabel ;
//        [self.view addSubview:messageLabel];
        
    }

@end
