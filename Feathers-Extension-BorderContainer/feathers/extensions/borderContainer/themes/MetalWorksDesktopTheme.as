/*
Copyright 2018 pol2095. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.extensions.borderContainer.themes
{
	import feathers.extensions.borderContainer.BorderContainer;
	import feathers.themes.MetalWorksDesktopTheme;
	import starling.display.Image;
 
	public class MetalWorksDesktopTheme extends feathers.themes.MetalWorksDesktopTheme
	{
		public function MetalWorksDesktopTheme()
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

			var backgroundSkin:Image = new Image(this.backgroundPopUpSkinTexture);
			backgroundSkin.scale9Grid = SIMPLE_SCALE9_GRID;
			borderContainer.backgroundSkin = backgroundSkin;

			borderContainer.padding = this.gutterSize;
			borderContainer.outerPadding = this.borderSize;
		}
	}
}