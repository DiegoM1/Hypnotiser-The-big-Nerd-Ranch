//
//  QuizViewController.m
//  Quiz
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/19/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "QuizViewController.h"



@implementation QuizViewController

-(UIButton *)quizButton1:(id)sender{
    return 0;
}
-(UIButton *)quizButton2:(id)sender{
    return 0;	
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.questions = @[@"From what is cognac made?",
                           @"what is  7+7",
                           @"What is the capital of Perú"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Lima"];
            
            self.tabBarItem.title = @"Quiz";
            UIImage *i = [UIImage imageNamed:@"quiz"];
            self.tabBarItem.image = i;
        }
        return self;
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showQuestion:(id)sender {
    self.currenQuestionIndex++;
    if(self.currenQuestionIndex == [self.questions count])
    {
        self.currenQuestionIndex = 0 ;
    }
    NSString *question = self.questions[self.currenQuestionIndex];
    self.questLabel.text = question;
    self.answerLabel.text = @"???";
}


- (IBAction)showAnswer:(id)sender {
    NSString *answer = self.answers[self.currenQuestionIndex];
    self.answerLabel.text = answer ;
}


@end
