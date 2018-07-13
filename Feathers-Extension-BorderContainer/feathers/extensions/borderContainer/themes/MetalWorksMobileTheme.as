/*
Copyright 2017 pol2095. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.extensions.borderContainer.themes
{
	import feathers.extensions.borderContainer.BorderContainer;
	import feathers.themes.MetalWorksDesktopTheme;
	import starling.display.Image;
 
	public class MetalWorksMobileTheme extends feathers.themes.MetalWorksMobileTheme
	{
		public function MetalWorksMobileTheme()
		{
			super();
		}
		
		/**
		 * @private 
		 */
		override protected function initializeStyleProviders():void
		{
			super.initializeStyleProviders();
			this.getStyleProviderForClass(BorderContainer).defaultStyleFunction = this.setBorderContainerStyles;
		}
		
		protected function setBorderContainerStyles(borderContainer:BorderContainer):void
		{
			this.setScrollerStyles(borderContainer);

			var backgroundSkin:Image = new Image(this.backgroundLightBorderSkinTexture);
			backgroundSkin.scale9Grid = SMALL_BACKGROUND_SCALE9_GRID;
			borderContainer.backgroundSkin = backgroundSkin;
			borderContainer.padding = this.smallGutterSize;
			borderContainer.outerPadding = this.borderSize;
		}
	}
}