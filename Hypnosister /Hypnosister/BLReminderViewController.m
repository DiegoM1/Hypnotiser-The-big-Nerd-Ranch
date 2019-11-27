//
//  BLReminderViewController.m
//  Hypnosister
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/25/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "BLReminderViewController.h"
#import <UserNotifications/UserNotifications.h>
@interface BLReminderViewController ()
@property (nonatomic,strong) IBOutlet UIDatePicker *datePicker;
@end

@implementation BLReminderViewController
-(void)viewDidLoad{
     [super viewDidLoad];
    NSLog(@"ReminderViewController loaded its view.");
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        UITabBarItem *tbi = self.tabBarItem;
        tbi.title = @"Reminder";
        UIImage *i = [UIImage imageNamed:@"Time"];
        self.tabBarItem.image = i;
    }return self;
}
-(void)addReminder:(id)sender{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert)
                          completionHandler:^(BOOL granted, NSError * _Nullable error) {
                              if (!error) {
                                  NSLog(@"request authorization succeeded!");
                              }
                          }];
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"Hypnosis";
    content.body = @"Hypnosis The best app";
    content.badge = [NSNumber numberWithInteger:([UIApplication sharedApplication].applicationIconBadgeNumber + 1)];
    // Deliver the notification in five seconds.
    
   
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:date];
    
  
    
    
    UNCalendarNotificationTrigger *trigger =  [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:  true];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond" content:content
trigger:trigger];
    
    UNUserNotificationCenter *center2 = [UNUserNotificationCenter currentNotificationCenter];
    [center2 addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (!error) {
            NSLog(@"add NotificationRequest succeeded!");
        }
    }];
        }
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
     
}
    


    // Do any additional setup after loading the view from its nib.


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
