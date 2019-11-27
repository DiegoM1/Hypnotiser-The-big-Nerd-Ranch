//
//  BLTextField.h
//  Hypnosister
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/27/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BLTextField : UIView  <UITextFieldDelegate>
@property(nonatomic) UITextField *textField;
-(void)drawHypnoticMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
