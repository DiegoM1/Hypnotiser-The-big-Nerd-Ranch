//
//  QuizViewController.h
//  Quiz
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/19/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuizViewController : UIViewController
- (IBAction)showAnswer:(id)sender;
- (IBAction)showQuestion:(id)sender;
@property (nonatomic) int currenQuestionIndex;
@property (nonatomic,copy) NSArray *questions;
@property (nonatomic,copy) NSArray *answers;
@property (weak, nonatomic) IBOutlet UILabel *questLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@property (weak, nonatomic) IBOutlet UIButton *quizButton1;
@property (weak, nonatomic) IBOutlet UIButton *quizButton2;

@end



NS_ASSUME_NONNULL_END
