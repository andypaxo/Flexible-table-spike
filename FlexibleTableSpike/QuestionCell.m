//
//  QuestionCell.m
//  FlexibleTableSpike
//
//  Created by Andrew Palmowski on 12-03-11.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionCell.h"

#define LABEL_TAG 30
#define EXPANDED_LABEL_TAG 10
#define TEXT_BOX_TAG 20

@implementation QuestionCell

@synthesize isExpanded = _isExpanded;
@synthesize question = _question;

- (void) setQuestion:(Question *)question {
    self.isExpanded = question.hasNotes;
    _question = question;
    ((UILabel*)[self viewWithTag:LABEL_TAG]).text = question.text;
}

- (void)setIsExpanded:(BOOL)isExpanded {
    NSLog(@"Is expanded %d", isExpanded);
    _isExpanded = isExpanded;
    
    if (_question != nil) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.25];
    }
    
    [self viewWithTag:EXPANDED_LABEL_TAG].alpha = isExpanded;
    [self viewWithTag:TEXT_BOX_TAG].alpha = isExpanded;
    
    
    if (_question != nil) {
        [UIView commitAnimations];
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
