(function() {
	AUI().ready(
		function(A) {
			var animateNodes = A.all('.animate');

			animateNodes.each(
				function(node) {
					node.getDOMNode().addEventListener('animationend', animationEnd);
				}
			);

			var sidenavToggle = [
				$('#b2bSiteNavigation [data-toggle="sidenav"]'),
				$('.b2b-site-navigation-toggle [data-toggle="sidenav"]')
			];

			for (i = 0; i < sidenavToggle.length; i++) {
				sidenavToggle[i].sideNavigation();
			}

			Liferay.once(
				'screenLoad',
				function() {
					for (i = 0; i < sidenavToggle.length; i++) {
						var sideNavigation = sidenavToggle[i].data('lexicon.sidenav');

						if (sideNavigation) {
							sideNavigation.destroy();
						}
					}
				}
			);

			Liferay.after(
				'commerce:productAddedToCart',
				function(event) {
					var cartIcon = A.one('#b2b-mini-cart > a');

					if (cartIcon) {
						cartIcon.addClass('animBounce');

						var cartIconCount = A.one('#b2b-mini-cart-items-count');

						if (cartIconCount) {
							var orderItemCount = event.commerceOrderItemsQuantity;

							cartIconCount.html(orderItemCount);
						}
					}
				}
			);

			// Login Page Image Resizer

			var body = $('body');
			var win = $(window);

			var b2bLoginImage = $('.b2b-login-bg-image');
			var b2bResizeEvent = body.data('b2bResizeEvent');

			if (b2bLoginImage.length) {
				var aspectRatio = (b2bLoginImage.innerWidth() / b2bLoginImage.innerHeight()) - 0.2;
				var ratio = window.innerWidth / window.innerHeight;

				body.data('b2bResizeEvent', true);

				if (ratio >= aspectRatio) {
					b2bLoginImage.addClass('w-100').removeClass('h-100');
				}
				else {
					b2bLoginImage.addClass('h-100').removeClass('w-100');
				}

				win.on('resize.b2bLogin', function(event) {
					ratio = window.innerWidth / window.innerHeight;

					if (ratio >= aspectRatio) {
						b2bLoginImage.addClass('w-100').removeClass('h-100');
					}
					else {
						b2bLoginImage.addClass('h-100').removeClass('w-100');
					}
				});
			}

			if (!b2bLoginImage.length && b2bResizeEvent) {
				win.off('resize.b2bLogin');
				body.data('b2bResizeEvent', false);
			}

			function animationEnd(event) {
				A.one(event.target).removeClass('animBounce');
			}
		}
	);
})();