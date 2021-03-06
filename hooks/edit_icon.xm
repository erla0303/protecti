%hook SBIconController

// Disable uninstall
- (BOOL)allowsUninstall {
    BOOL r = %orig;
    if (global_Enable && !EnableEditIcons_IsEnabled) {
        return NO;
    } else {
        return r;
    }
}

%end


%hook SBIconView

// Disable editing icon
- (void)setIsEditing:(BOOL)arg1 animated:(BOOL)arg2 {
    if (global_Enable && !EnableEditIcons_IsEnabled && arg1) {
        return;
    } else {
        return %orig;
    }
}

// Disable move icon
- (void)touchesMoved:(NSArray *)touches withEvent:(UIEvent *)event {
    if (global_Enable && !EnableEditIcons_IsEnabled) {
        return;
    } else {
        %orig;
    }
}

%end
