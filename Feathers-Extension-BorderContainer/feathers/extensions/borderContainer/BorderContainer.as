/*
Copyright 2017 pol2095. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.extensions.borderContainer
{
	import feathers.controls.AutoSizeMode;
	import feathers.controls.ScrollContainer;
	import feathers.core.IFocusExtras;
	import feathers.core.IMeasureDisplayObject;
	import feathers.core.IValidating;
	import feathers.skins.IStyleProvider;
	import feathers.utils.skins.resetFluidChildDimensionsForMeasurement;

	import starling.display.DisplayObject;

	/**
	 * Quickly sets all outer padding properties to the same value. The
	 * <code>outerPadding</code> getter always returns the value of
	 * <code>outerPaddingTop</code>, but the other padding values may be
	 * different.
	 *
	 * <p>In the following example, the outer padding is set to 20 pixels:</p>
	 *
	 * <listing version="3.0">
	 * borderContainer.outerPadding = 20;</listing>
	 *
	 * @default 0
	 *
	 * @see #style:outerPaddingTop
	 * @see #style:outerPaddingRight
	 * @see #style:outerPaddingBottom
	 * @see #style:outerPaddingLeft
	 * @see feathers.controls.Scroller#style:padding
	 */
	[Style(name="outerPadding",type="Number")]

	/**
	 * <p><code>outerPaddingTop</code> and <code>paddingTop</code>
	 * may be used simultaneously to define padding around the outer edges
	 * of the borderContainer and additional padding around its middle content.</p>
	 *
	 * <p>In the following example, the top padding is set to 20 pixels:</p>
	 *
	 * <listing version="3.0">
	 * borderContainer.outerPaddingTop = 20;</listing>
	 *
	 * @default 0
	 *
	 * @see #style:outerPadding
	 * @see feathers.controls.Scroller#style:paddingTop
	 */
	[Style(name="outerPaddingTop",type="Number")]

	/**
	 * <p><code>outerPaddingRight</code> and
	 * <code>paddingRight</code> may be used simultaneously to define
	 * padding around the outer edges of the borderContainer plus additional padding
	 * around its middle content.</p>
	 *
	 * <p>In the following example, the right outer padding is set to 20 pixels:</p>
	 *
	 * <listing version="3.0">
	 * borderContainer.outerPaddingRight = 20;</listing>
	 *
	 * @default 0
	 *
	 * @see #style:outerPadding
	 * @see feathers.controls.Scroller#style:paddingRight
	 */
	[Style(name="outerPaddingRight",type="Number")]

	/**
	 * <p><code>outerPaddingBottom</code> and <code>paddingBottom</code>
	 * may be used simultaneously to define padding around the outer edges
	 * of the borderContainer and additional padding around its middle content.</p>
	 *
	 * <p>In the following example, the bottom outer padding is set to 20 pixels:</p>
	 *
	 * <listing version="3.0">
	 * borderContainer.outerPaddingBottom = 20;</listing>
	 *
	 * @default 0
	 *
	 * @see #style:outerPadding
	 * @see feathers.controls.Scroller#style:paddingBottom
	 */
	[Style(name="outerPaddingBottom",type="Number")]

	/**
	 * <p><code>outerPaddingLeft</code> and
	 * <code>paddingLeft</code> may be used simultaneously to define padding
	 * around the outer edges of the borderContainer and additional padding around its
	 * middle content.</p>
	 *
	 * <p>In the following example, the left outer padding is set to 20 pixels:</p>
	 *
	 * <listing version="3.0">
	 * scroller.outerPaddingLeft = 20;</listing>
	 *
	 * @default 0
	 *
	 * @see #style:outerPadding
	 * @see feathers.controls.Scroller#style:paddingLeft
	 */
	[Style(name="outerPaddingLeft",type="Number")]

	/**
	 * The BorderContainer class control the appearance of the border and background
	 *  fill of the container.
	 *
	 * <p>The following example creates a borderContainer with a horizontal layout and
	 * adds two buttons to it:</p>
	 *
	 * <listing version="3.0">
	 * var borderContainer:BorderContainer = new BorderContainer();
	 * borderContainer.title = "Is it time to party?";
	 * 
	 * var layout:HorizontalLayout = new HorizontalLayout();
	 * layout.gap = 20;
	 * layout.padding = 20;
	 * borderContainer.layout = layout;
	 * 
	 * this.addChild( borderContainer );
	 * 
	 * var yesButton:Button = new Button();
	 * yesButton.label = "Yes";
	 * borderContainer.addChild( yesButton );
	 * 
	 * var noButton:Button = new Button();
	 * noButton.label = "No";
	 * borderContainer.addChild( noButton );</listing>
	 */
	public class BorderContainer extends ScrollContainer implements IFocusExtras
	{
		[Deprecated(replacement="feathers.controls.ScrollPolicy.AUTO",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollPolicy.AUTO</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_POLICY_AUTO:String = "auto";

		[Deprecated(replacement="feathers.controls.ScrollPolicy.ON",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollPolicy.ON</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_POLICY_ON:String = "on";

		[Deprecated(replacement="feathers.controls.ScrollPolicy.OFF",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollPolicy.OFF</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_POLICY_OFF:String = "off";

		[Deprecated(replacement="feathers.controls.ScrollBarDisplayMode.FLOAT",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollBarDisplayMode.FLOAT</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_BAR_DISPLAY_MODE_FLOAT:String = "float";

		[Deprecated(replacement="feathers.controls.ScrollBarDisplayMode.FIXED",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollBarDisplayMode.FIXED</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_BAR_DISPLAY_MODE_FIXED:String = "fixed";

		[Deprecated(replacement="feathers.controls.ScrollBarDisplayMode.NONE",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollBarDisplayMode.NONE</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const SCROLL_BAR_DISPLAY_MODE_NONE:String = "none";

		[Deprecated(replacement="feathers.layout.RelativePosition.RIGHT",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.layout.RelativePosition.RIGHT</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const VERTICAL_SCROLL_BAR_POSITION_RIGHT:String = "right";

		[Deprecated(replacement="feathers.layout.RelativePosition.LEFT",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.layout.RelativePosition.LEFT</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const VERTICAL_SCROLL_BAR_POSITION_LEFT:String = "left";

		[Deprecated(replacement="feathers.controls.ScrollInteractionMode.TOUCH",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollInteractionMode.TOUCH</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const INTERACTION_MODE_TOUCH:String = "touch";

		[Deprecated(replacement="feathers.controls.ScrollInteractionMode.MOUSE",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollInteractionMode.MOUSE</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const INTERACTION_MODE_MOUSE:String = "mouse";

		[Deprecated(replacement="feathers.controls.ScrollInteractionMode.TOUCH_AND_SCROLL_BARS",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.ScrollInteractionMode.TOUCH_AND_SCROLL_BARS</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const INTERACTION_MODE_TOUCH_AND_SCROLL_BARS:String = "touchAndScrollBars";

		[Deprecated(replacement="feathers.layout.Direction.VERTICAL",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.layout.Direction.VERTICAL</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const MOUSE_WHEEL_SCROLL_DIRECTION_VERTICAL:String = "vertical";

		[Deprecated(replacement="feathers.layout.Direction.HORIZONTAL",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.layout.Direction.HORIZONTAL</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const MOUSE_WHEEL_SCROLL_DIRECTION_HORIZONTAL:String = "horizontal";

		[Deprecated(replacement="feathers.controls.DecelerationRate.NORMAL",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.DecelerationRate.NORMAL</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const DECELERATION_RATE_NORMAL:Number = 0.998;

		[Deprecated(replacement="feathers.controls.DecelerationRate.FAST",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.DecelerationRate.FAST</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const DECELERATION_RATE_FAST:Number = 0.99;

		[Deprecated(replacement="feathers.controls.AutoSizeMode.STAGE",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.AutoSizeMode.STAGE</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const AUTO_SIZE_MODE_STAGE:String = "stage";

		[Deprecated(replacement="feathers.controls.AutoSizeMode.CONTENT",since="3.0.0")]
		/**
		 * @private
		 * DEPRECATED: Replaced by <code>feathers.controls.AutoSizeMode.CONTENT</code>.
		 *
		 * <p><strong>DEPRECATION WARNING:</strong> This constant is deprecated
		 * starting with Feathers 3.0. It will be removed in a future version of
		 * Feathers according to the standard
		 * <a target="_top" href="../../../help/deprecation-policy.html">Feathers deprecation policy</a>.</p>
		 */
		public static const AUTO_SIZE_MODE_CONTENT:String = "content";

		/**
		 * The default <code>IStyleProvider</code> for all <code>BorderContainer</code>
		 * components.
		 *
		 * @default null
		 * @see feathers.core.FeathersControl#styleProvider
		 */
		public static var globalStyleProvider:IStyleProvider;

		/**
		 * Constructor.
		 */
		public function BorderContainer()
		{
			super();
		}

		/**
		 * @private
		 */
		override protected function get defaultStyleProvider():IStyleProvider
		{
			return BorderContainer.globalStyleProvider;
		}

		/**
		 * @private
		 */
		private var _focusExtrasBefore:Vector.<DisplayObject> = new <DisplayObject>[];

		/**
		 * @inheritDoc
		 */
		public function get focusExtrasBefore():Vector.<DisplayObject>
		{
			return this._focusExtrasBefore;
		}

		/**
		 * @private
		 */
		private var _focusExtrasAfter:Vector.<DisplayObject> = new <DisplayObject>[];

		/**
		 * @inheritDoc
		 */
		public function get focusExtrasAfter():Vector.<DisplayObject>
		{
			return this._focusExtrasAfter;
		}

		/**
		 * @private
		 */
		public function get outerPadding():Number
		{
			return this._outerPaddingTop;
		}

		/**
		 * @private
		 */
		public function set outerPadding(value:Number):void
		{
			this.outerPaddingTop = value;
			this.outerPaddingRight = value;
			this.outerPaddingBottom = value;
			this.outerPaddingLeft = value;
		}

		/**
		 * @private
		 */
		protected var _outerPaddingTop:Number = 0;

		/**
		 * @private
		 */
		public function get outerPaddingTop():Number
		{
			return this._outerPaddingTop;
		}

		/**
		 * @private
		 */
		public function set outerPaddingTop(value:Number):void
		{
			if(this.processStyleRestriction(arguments.callee))
			{
				return;
			}
			if(this._outerPaddingTop == value)
			{
				return;
			}
			this._outerPaddingTop = value;
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}

		/**
		 * @private
		 */
		protected var _outerPaddingRight:Number = 0;

		/**
		 * @private
		 */
		public function get outerPaddingRight():Number
		{
			return this._outerPaddingRight;
		}

		/**
		 * @private
		 */
		public function set outerPaddingRight(value:Number):void
		{
			if(this.processStyleRestriction(arguments.callee))
			{
				return;
			}
			if(this._outerPaddingRight == value)
			{
				return;
			}
			this._outerPaddingRight = value;
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}

		/**
		 * @private
		 */
		protected var _outerPaddingBottom:Number = 0;

		/**
		 * @private
		 */
		public function get outerPaddingBottom():Number
		{
			return this._outerPaddingBottom;
		}

		/**
		 * @private
		 */
		public function set outerPaddingBottom(value:Number):void
		{
			if(this.processStyleRestriction(arguments.callee))
			{
				return;
			}
			if(this._outerPaddingBottom == value)
			{
				return;
			}
			this._outerPaddingBottom = value;
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}

		/**
		 * @private
		 */
		protected var _outerPaddingLeft:Number = 0;

		/**
		 * @private
		 */
		public function get outerPaddingLeft():Number
		{
			return this._outerPaddingLeft;
		}

		/**
		 * @private
		 */
		public function set outerPaddingLeft(value:Number):void
		{
			if(this.processStyleRestriction(arguments.callee))
			{
				return;
			}
			if(this._outerPaddingLeft == value)
			{
				return;
			}
			this._outerPaddingLeft = value;
			this.invalidate(INVALIDATION_FLAG_STYLES);
		}

		/**
		 * @private
		 */
		override protected function draw():void
		{
			var stylesInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_STYLES);

			super.draw();
		}

		/**
		 * @inheritDoc
		 */
		override protected function autoSizeIfNeeded():Boolean
		{
			if(this._autoSizeMode === AutoSizeMode.STAGE)
			{
				//the implementation in ScrollContainer can handle this
				return super.autoSizeIfNeeded();
			}
			
			var needsWidth:Boolean = this._explicitWidth !== this._explicitWidth; //isNaN
			var needsHeight:Boolean = this._explicitHeight !== this._explicitHeight; //isNaN
			var needsMinWidth:Boolean = this._explicitMinWidth !== this._explicitMinWidth; //isNaN
			var needsMinHeight:Boolean = this._explicitMinHeight !== this._explicitMinHeight; //isNaN
			if(!needsWidth && !needsHeight && !needsMinWidth && !needsMinHeight)
			{
				return false;
			}

			resetFluidChildDimensionsForMeasurement(this.currentBackgroundSkin,
				this._explicitWidth, this._explicitHeight,
				this._explicitMinWidth, this._explicitMinHeight,
				this._explicitMaxWidth, this._explicitMaxHeight,
				this._explicitBackgroundWidth, this._explicitBackgroundHeight,
				this._explicitBackgroundMinWidth, this._explicitBackgroundMinHeight,
				this._explicitBackgroundMaxWidth, this._explicitBackgroundMaxHeight);
			var measureBackground:IMeasureDisplayObject = this.currentBackgroundSkin as IMeasureDisplayObject;
			if(this.currentBackgroundSkin is IValidating)
			{
				IValidating(this.currentBackgroundSkin).validate();
			}
			
			var newWidth:Number = this._explicitWidth;
			var newHeight:Number = this._explicitHeight;
			var newMinWidth:Number = this._explicitMinWidth;
			var newMinHeight:Number = this._explicitMinHeight;
			if(needsWidth)
			{
				if(this._measureViewPort)
				{
					newWidth = this._viewPort.visibleWidth;
				}
				else
				{
					newWidth = 0;
				}
				//we don't need to account for the icon and gap because it is
				//already included in the left offset
				newWidth += this._rightViewPortOffset + this._leftViewPortOffset;
				if(this.currentBackgroundSkin !== null &&
					this.currentBackgroundSkin.width > newWidth)
				{
					newWidth = this.currentBackgroundSkin.width;
				}
			}
			if(needsHeight)
			{
				if(this._measureViewPort)
				{
					newHeight = this._viewPort.visibleHeight;
				}
				else
				{
					newHeight = 0;
				}
				newHeight += this._bottomViewPortOffset + this._topViewPortOffset;
				if(this.currentBackgroundSkin !== null &&
					this.currentBackgroundSkin.height > newHeight)
				{
					newHeight = this.currentBackgroundSkin.height;
				}
			}
			if(needsMinWidth)
			{
				if(this._measureViewPort)
				{
					newMinWidth = this._viewPort.minVisibleWidth;
				}
				else
				{
					newMinWidth = 0;
				}
				//we don't need to account for the icon and gap because it is
				//already included in the left offset
				newMinWidth += this._rightViewPortOffset + this._leftViewPortOffset;
				if(this.currentBackgroundSkin !== null)
				{
					if(measureBackground !== null)
					{
						if(measureBackground.minWidth > newMinWidth)
						{
							newMinWidth = measureBackground.minWidth;
						}
					}
					else if(this._explicitBackgroundMinWidth > newMinWidth)
					{
						newMinWidth = this._explicitBackgroundMinWidth;
					}
				}
			}
			if(needsMinHeight)
			{
				if(this._measureViewPort)
				{
					newMinHeight = this._viewPort.minVisibleHeight;
				}
				else
				{
					newMinHeight = 0;
				}
				newMinHeight += this._bottomViewPortOffset + this._topViewPortOffset;
				if(this.currentBackgroundSkin !== null)
				{
					if(measureBackground !== null)
					{
						if(measureBackground.minHeight > newMinHeight)
						{
							newMinHeight = measureBackground.minHeight;
						}
					}
					else if(this._explicitBackgroundMinHeight > newMinHeight)
					{
						newMinHeight = this._explicitBackgroundMinHeight;
					}
				}
			}

			return this.saveMeasurements(newWidth, newHeight, newMinWidth, newMinHeight);
		}

		/**
		 * @private
		 */
		override protected function calculateViewPortOffsets(forceScrollBars:Boolean = false, useActualBounds:Boolean = false):void
		{
			super.calculateViewPortOffsets(forceScrollBars);

			this._leftViewPortOffset += this._outerPaddingLeft;
			this._rightViewPortOffset += this._outerPaddingRight;

			this._topViewPortOffset += this._outerPaddingTop;

			this._bottomViewPortOffset += this._outerPaddingBottom;
		}
	}
}
