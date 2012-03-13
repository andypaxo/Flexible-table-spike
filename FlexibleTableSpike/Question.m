//
//  Question.m
//  FlexibleTableSpike
//
//  Created by Andrew Palmowski on 12-03-11.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize text, hasNotes, numberOfAttachments;

+ (Question *)questionWithText:(NSString *)questionText {
    Question* result = [Question new];
    result.text = questionText;
    return result;
}

@end
