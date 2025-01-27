#import <PassKit/PassKit.h>

%hook PKPass
- (BOOL)isRevoked {
    return NO;
}

- (id)initWithData:(NSData *)data error:(NSError **)error {
    id result = %orig(data, nil);
    return result;
}

- (BOOL)supportsSecureCoding {
    return YES;
}
%end


%hook WDCardFileManager

- (void)_deletePossibleInvalidCardWithUniqueID:(id)uniqueID {
    return;
}

- (id)validatePassURL:(id)url {
    return @YES; //tomfoolery
}

- (id)manifestHashFromPassURL:(id)url {
    return [NSData new]; // Return a dummy hash
}


%end

%hook WDNetworkTaskManager

- (void)invalidate {
    // Do nothing lul
}

%end

%hook PKLocalPass

- (id)validatePassURL:(id)url {
    id error = %orig(url);

    if (error) {
        return nil;
    }
    return error;
}

%end
