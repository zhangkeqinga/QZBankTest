//
//  UAPopTitledPanel.m
//  JiaFeng
//
//  Created by n22 on 12-8-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UAPopTitledPanel.h"

@implementation UAPopTitledPanel


@synthesize theview;

-(void)dealloc{

    theview =nil;
    
    [super dealloc];
    
}

- (id)initWithFrame:(CGRect)frame   {
    
    
    if ((self = [super initWithFrame:frame])) {
        //start init clear all info       
        // Initialization code
        

        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(singleTapAction:)];
        
        singleTap.numberOfTapsRequired = 1;
        singleTap.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:singleTap];
        
        [singleTap release];
        
        
        self.borderWidth =0;
        
        self.borderColor =[UIColor clearColor];
        
        
        [self setTitleBarHeight: 10.0f];
        
        
        [[self titleBar] setBackgroundColor:[UIColor clearColor]];
        
        [[self titleBar] setNoiseOpacity:0.0];
        
        [self titleBar].hidden =YES;
        
        
        [[self headerLabel] setBackgroundColor:[UIColor clearColor]];
        
        [self headerLabel].font = [UIFont boldSystemFontOfSize:floor(self.titleBarHeight / 2.0)];
        
        self.contentColor = [UIColor clearColor];
        
        
        //add close (close) button code 
        
        
//        UIButton *close_button = [UIButton buttonWithType:UIButtonTypeCustom];
//#define  CLOSE_WIDTH 60
//        [close_button setFrame:CGRectMake(1024-CLOSE_WIDTH-20,10, CLOSE_WIDTH, 30)];
//        
//        [close_button setTitle:@"关闭" forState:UIControlStateNormal];
//        
//        [close_button setBackgroundImage:[UIImage imageNamed:@"PCustomerListNavi_button_Normal.png"] forState:UIControlStateNormal];
//        
//        [close_button addTarget:self action:@selector(button_close:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self.contentContainer addSubview:close_button];

        

        

        
	}	
	return self;
}



- (id)initWithFrame:(CGRect)frame   withView:(id)theview_ isSingleTap:(BOOL)isSingleTap_{
    
    
    if ((self = [super initWithFrame:frame])) {
        //start init clear all info
        // Initialization code
        
        if(isSingleTap_){
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(singleTapAction:)];
        
            singleTap.numberOfTapsRequired = 1;
            singleTap.numberOfTouchesRequired = 1;
        
            [self addGestureRecognizer:singleTap];
        
            [singleTap release];
        }
        
        self.borderWidth =0;
        
        self.borderColor =[UIColor clearColor];
        
        
        [self setTitleBarHeight: 10.0f];
        
        
        [[self titleBar] setBackgroundColor:[UIColor clearColor]];
        
        [[self titleBar] setNoiseOpacity:0.0];
        
        [self titleBar].hidden =YES;
        
        
        [[self headerLabel] setBackgroundColor:[UIColor clearColor]];
        
        [self headerLabel].font = [UIFont boldSystemFontOfSize:floor(self.titleBarHeight / 2.0)];
        
        self.contentColor = [UIColor clearColor];
        
        
        //add close (close) button code
        
        
        //        UIButton *close_button = [UIButton buttonWithType:UIButtonTypeCustom];
        //#define  CLOSE_WIDTH 60
        //        [close_button setFrame:CGRectMake(1024-CLOSE_WIDTH-20,10, CLOSE_WIDTH, 30)];
        //
        //        [close_button setTitle:@"关闭" forState:UIControlStateNormal];
        //
        //        [close_button setBackgroundImage:[UIImage imageNamed:@"PCustomerListNavi_button_Normal.png"] forState:UIControlStateNormal];
        //
        //        [close_button addTarget:self action:@selector(button_close:) forControlEvents:UIControlEventTouchUpInside];
        //
        //        [self.contentContainer addSubview:close_button];
        
        theview=theview_;
        
        [self.contentContainer addSubview:theview];

        
        
        
	}	
	return self;
}


-(IBAction)button_close:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kGFColseButtonDonePressed" object:sender];
    
    // Maybe the delegate wants something to do with it...
    //	if ([delegate respondsToSelector:@selector(superAwesomeButtonPressed:)]) {
    //		[delegate performSelector:@selector(superAwesomeButtonPressed:) withObject:sender];
    //        
    //        // Or perhaps someone is listening for notifications 
    //	} else {
    //		
    //	}
    
	NSLog(@"Super Awesome Button pressed!");
    //    [self.benifitViewCellDelegate modifyBenifitItem:sender];
}

-(IBAction)singleTapAction:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kGFColseButtonDonePressed" object:sender];
    
    // Maybe the delegate wants something to do with it...
    //	if ([delegate respondsToSelector:@selector(superAwesomeButtonPressed:)]) {
    //		[delegate performSelector:@selector(superAwesomeButtonPressed:) withObject:sender];
    //
    //        // Or perhaps someone is listening for notifications
    //	} else {
    //
    //	}
    
	NSLog(@"Super Awesome Button pressed!");
    //    [self.benifitViewCellDelegate modifyBenifitItem:sender];
}

@end
