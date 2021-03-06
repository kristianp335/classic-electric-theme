<#assign sign_out_url = htmlUtil.escape(theme_display.getURLSignOut())/>

<nav class="b2b-main-navbar navbar navbar-expand-md">
	<h1 class="navbar-brand">
		<#if show_site_name>
			<span class="text-truncate-inline">
				<span class="text-truncate">
					${site_name}
				</span>
			</span>
		<#else>
			<img alt="Beryl Logo" class="b2b-logo-image" src="${site_logo}">
		</#if>
	</h1>

	<div class="b2b-search portlet-controls-d-none portlet-flush">
		<@liferay.search default_preferences=freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
	</div>

	<ul class="navbar-nav navbar-nav-end">
		<li class="b2b-user nav-item">
			<a style="color: #ffffff;"  href="${sign_out_url}"><span style="padding: 10px" aria-hidden="true" class="icon-signout"></span></a>
		</li>
		<li class="b2b-user nav-item">
			<div class="nav-link">
				<@liferay_commerce["user-management-bar"]
					href=userManagementUrl
					showNotifications=true
				/>
			</div>
		</li>
		<li class="b2b-account dropdown dropdown-wide nav-item">
			<a aria-expanded="false" aria-haspopup="true" class="dropdown-toggle nav-link" data-toggle="dropdown" href="/" role="button">
				<span class="navbar-breakpoint-d-none"><svg aria-hidden="true" class="lexicon-icon lexicon-icon-user" focusable="false"><use xlink:href="${images_folder}/lexicon/icons.svg#user" /></svg></span>

				<span class="navbar-breakpoint-down-d-none"><span class="text-truncate-inline"><span class="text-truncate">${currentOrganization.getName()}</span></span></span><span class="inline-item inline-item-after navbar-breakpoint-down-d-none"><svg aria-hidden="true" class="lexicon-icon lexicon-icon-angle-down" focusable="false"><use xlink:href="${images_folder}/lexicon/icons.svg#angle-down" /></svg></span>
			</a>

			<div class="dropdown-menu dropdown-menu-right portlet-flush">
				<@commerce_search_organization default_preferences=freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
			</div>
		</li>
		<li class="b2b-cart dropdown dropdown-wide nav-item" id="b2b-mini-cart">
			<a aria-expanded="false" aria-haspopup="true" class="animate dropdown-toggle nav-link" data-toggle="dropdown" href="/" role="button">
				<span class="b2b-cart-notification sticker">
					<svg aria-hidden="true" class="lexicon-icon lexicon-icon-archive" focusable="false"><use xlink:href="${images_folder}/lexicon/icons.svg#archive" /></svg>

					<span class="rounded-circle sticker sticker-light sticker-outside sticker-sm sticker-top-right" id="b2b-mini-cart-items-count">
						${orderItemsQuantity}
					</span>
				</span><span class="inline-item-after navbar-breakpoint-down-d-none"><span class="text-truncate-inline"><span class="text-truncate">${orderNumber}</span></span></span>
				<span class="inline-item inline-item-after navbar-breakpoint-down-d-none"><svg aria-hidden="true" class="lexicon-icon lexicon-icon-angle-down" focusable="false"><use xlink:href="${images_folder}/lexicon/icons.svg#angle-down" /></svg></span>
			</a>

			<div class="dropdown-menu dropdown-menu-right portlet-flush">
				<#include "${full_templates_path}/cart.ftl" />
			</div>
		</li>
		<li class="b2b-site-navigation-toggle nav-item navbar-breakpoint-d-none">
			<a class="b2b-site-navigation-open nav-link" data-content=".b2b-wrapper" data-open-class="b2b-site-navigation-open" data-target="#b2bSiteNavigation" data-toggle="sidenav" href="/">
				<svg aria-hidden="true" class="lexicon-icon lexicon-icon-bars" focusable="false"><use xlink:href="${images_folder}/lexicon/icons.svg#bars" /></svg>
			</a>
		</li>
	</ul>
</nav>