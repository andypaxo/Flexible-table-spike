//
//  Inspection.m
//  FlexibleTableSpike
//
//  Created by Andrew Palmowski on 12-03-11.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Inspection.h"
#import "Question.h"

@implementation Inspection

@synthesize questions;

- (id)init {
    questions = [NSArray arrayWithObjects:
                 [Question questionWithText:@"Who said that?"],
                 [Question questionWithText:@"When?"],
                 [Question questionWithText:@"Where's my sammich?"],
                 [Question questionWithText:@"Who's up there?"],
                 [Question questionWithText:@"Why snow?"],
                 [Question questionWithText:@"Why now?"],
                 [Question questionWithText:@"Is it?"],
                 [Question questionWithText:@"Was it?"],
                 [Question questionWithText:@"Has it?"],
                 [Question questionWithText:@"What's that smell?"],
                 [Question questionWithText:@"Do I care?"],
                 [Question questionWithText:@"Where is the Loch Ness monster?"],
                 [Question questionWithText:@"Is there any chance?"],
                 [Question questionWithText:@"Have you had your breakfast?"],
                 [Question questionWithText:@"Is this the way to San Jose?"],
                 [Question questionWithText:@"Who's line is it anyway?"],
                 [Question questionWithText:@"What was that for?"],
                 [Question questionWithText:@"What is the answer?"],
                 [Question questionWithText:@"Do buffalo buffalo buffalo?"],
                 [Question questionWithText:@"Why not?"],
                 nil];
    return [super init];
}

@end
