//
//  CGFloat.swift
//  PigeonApp
//
//  Created by david-swift on 13.03.23.
//
//  swiftlint:disable no_magic_numbers

import Foundation

extension CGFloat {

    /// The padding of a ``PigeonLink``.
    static var pigeonLinkPadding: Self { 5 }
    /// The corner radius of the background of a ``PigeonLink``.
    static var pigeonLinkBackgroundCornerRadius: Self { 5 }
    /// The side length of the app icon in the about general settings subtab.
    static var appIconSideLength: Self { 200 }
    /// The padding of a title in the settings overview.
    static var titlePadding: Self { 5 }
    /// The side length of a profile picture in the contributors list.
    static var profilePictureSideLength: Self { 30 }
    /// The side length of the ``GeneralSettingsView``.
    static var generalSettingsViewSideLength: Self { 500 }
    /// The point at which the scrolling is disabled in the ``GeneralSettingsView``.
    static var scrollDisabledHeight: Self { 80 }
    /// The divisor for the side length of the ``String.packageResourceImage``.
    static var packageResourceImageDivisionFactor: Self { 4 }
    /// The padding left to the icon picker button in the templates settings tab.
    static var iconTitlePickerPadding: Self { 10 }
    /// The width of the template popover in the templates settings tab.
    static var templatePopoverWidth: Self { 300 }
    /// The width of the icon popover in the templates settings tab.
    static var iconPopoverWidth: Self { 300 }
    /// The height of the icon popover in the templates settings tab.
    static var iconPopoverHeight: Self { 400 }
    /// The shadow of the newest version's banner.
    static var newestVersionShadowRadius: Self { 30 }
    /// The font size of a feature icon in the ``WhatsNewView``.
    static var featureIconFontSize: Self { 25 }
    /// The width of a feature icon in the ``WhatsNewView``.
    static var featureIconWidth: Self { 20 }
    /// The width of the completion badge in the synchronization settings tab.
    static var completionBadgeWidth: Self { 200 }
    /// The radius of the completion badge's shadow.
    static var completionBadgeShadowRadius: CGFloat { 30 }
    /// The font size of the completion badge's shadow.
    static var completionBadgeFontSize: CGFloat { 100 }

}

//  swiftlint:enable no_magic_numbers
