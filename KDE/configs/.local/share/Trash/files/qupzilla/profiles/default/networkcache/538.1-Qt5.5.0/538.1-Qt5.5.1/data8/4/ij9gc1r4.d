   �         8http://tweakimg.net/x/responsive/frontpage.js?1435054221     %�P ?9�      %~m.��         
     O K           �      Server   Apache   X-Tweakers-Server   sphinx   Last-Modified   Tue, 23 Jun 2015 10:10:21 GMT   Vary   Accept-Encoding   Content-Encoding   gzip   Cache-Control   max-age=25920000   Expires   Sun, 16 Oct 2016 11:31:36 GMT   Content-Type   application/javascript   Accept-Ranges   bytes   Date   Tue, 22 Dec 2015 23:09:45 GMT   	X-Varnish   1801371065 1761245352   Age   128289   Via   1.1 varnish window.Responsive && Responsive.addBehaviour((function()
{
	// Add customScroll to FPA ankeilers
	var createScrollableAnkeilers = function()
	{
		Selector('.fpaItemsWrapper').forEach(
			function(ankeiler)
			{
				var leftScrollButton = Selector('.scrollButtonLeft', ankeiler)[0],
				rightScrollButton = Selector('.scrollButtonRight', ankeiler)[0],
				scrollBar;

				// Remove scrollButtons for higher grades
				if (Responsive.getCurrentDeviceGrade() == 'A')
				{
					if (leftScrollButton)
					{
						ankeiler.removeChild(leftScrollButton);
					}

					if (rightScrollButton)
					{
						ankeiler.removeChild(rightScrollButton);
					}

					Scrollable.destroy(ankeiler);

					return;
				}

				if ( ! leftScrollButton)
				{
					leftScrollButton = document.createElement('div');
					leftScrollButton.className = 'scrollButtonLeft';
					leftScrollButton.style.display = 'none'; // we start at x:0, so hide it

					addEvent(
						leftScrollButton,
						'click',
						function()
						{
							scrollBar.scrollTo(scrollBar.scrollX - document.body.clientWidth);
						}
					);
				}

				if ( ! rightScrollButton)
				{
					rightScrollButton = document.createElement('div');
					rightScrollButton.className = 'scrollButtonRight';

					addEvent(
						rightScrollButton,
						'click',
						function()
						{
							scrollBar.scrollTo(scrollBar.scrollX + document.body.clientWidth);
						}
					);
				}

				scrollBar = Scrollable.create(
					ankeiler,
					{
						onScroll: function(sb)
						{
							// Hide the scroll icon when no further scrolling is possible
							leftScrollButton.style.display = sb.scrollX == 0 ? 'none' : '';
							rightScrollButton.style.display = sb.scrollX == sb.getMaxX() ? 'none' : '';
						}
					},
					{
						novertical: 1
					}
				);

				// Do this after creating the scrollable div so it does not get included therein
				ankeiler.appendChild(leftScrollButton);
				ankeiler.appendChild(rightScrollButton);
			}
		);
	};

	return {
		/**
		 * Triggered when setting up the page
		 */
		init: function()
		{
			var currentDeviceGrade = Responsive.getCurrentDeviceGrade();

			// perform updates
			this.update({from: 'A', to: currentDeviceGrade});

			// initialize ankeilers, update on resize
			createScrollableAnkeilers();
			addEvent(window, 'resize', createScrollableAnkeilers);
		},

		/**
		 * Triggered on device grade change
		 */
		update: function(e)
		{
			// Nothing yet :)
		}
	}
}()));
