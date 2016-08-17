//
//  JTYRenewalPopoView.m
//  JiaFeng
//
//  Created by nwk on 12-10-30.
//
//

#import "JTYRenewalPopoView.h"

@implementation JTYRenewalPopoView



- (id)initWithFrame:(CGRect)frame   withView:(id)theview_{
    

    
    if ((self = [super initWithFrame:frame withView:theview_ isSingleTap:NO])) {
        
        UIButton *close_button = [UIButton buttonWithType:UIButtonTypeCustom];
#define  CLOSE_WIDTH 67
        //[close_button setFrame:CGRectMake(836,12, CLOSE_WIDTH, 23)];
        
        [close_button setFrame:CGRectMake(990,0, 34, 30)];
        
//        close_button.titleLabel.font=[UIFont fontWithName:@"关闭" size:15.0];
        
       // [close_button setBackgroundImage:[UIImage imageNamed:@"JTYOButtonThree.png"] forState:UIControlStateNormal];
        
        [close_button addTarget:self action:@selector(button_close:) forControlEvents:UIControlEventTouchUpInside];
        
        
        //[close_button setTitle:@"关闭" forState:UIControlStateNormal];
        
        //[close_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self.contentContainer addSubview:close_button];
    }
    
    
    return self;
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch* touch = [touches anyObject];
    
    NSUInteger numTaps = [touch tapCount];
    
    if (numTaps == 1) {

        
    } else {
        
        
    }
    

}



@end
