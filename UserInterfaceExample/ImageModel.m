//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Ghaida Atoum on 9/14/24.
//

#import "ImageModel.h"

@interface ImageModel()

@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSMutableDictionary* imagesDict;

@end

@implementation ImageModel
@synthesize imageNames = _imageNames;

+(ImageModel*) sharedInstance {
    static ImageModel* _sharedInstance = nil;
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    
    return _sharedInstance;
}

// Override the getter
-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[@"cat_1", @"cat_2", @"cat_3", @"cat_4", @"cat_5", @"cat_6"];
    return _imageNames;
}

-(UIImage*) getImageWithName:(NSString*)name{
    return self.imagesDict[name];
}

-(UIImage*) getImageWithIndex:(NSInteger)index {
    return [self getImageWithName:[self getImageNameForIndex: index]];
}

-(NSInteger) numberOfImages{
    return (NSInteger) self.imageNames.count;
}

-(NSString*) getImageNameForIndex:(NSInteger)index{
    return self.imageNames[index];
}

-(NSDictionary*) imagesDict{
    if(!_imagesDict)
        _imagesDict = [[NSMutableDictionary alloc] init];
        for(NSString* imageName in self.imageNames){
            [_imagesDict setValue:[UIImage imageNamed:imageName] forKey:imageName];
        }
    return _imagesDict;
}

@end
