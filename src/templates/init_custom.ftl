<#assign
	company_display_name = getterUtil.getString(themeDisplay.getThemeSetting("company-name"))
	company_email = getterUtil.getString(themeDisplay.getThemeSetting("company-email"))
	copyright = getterUtil.getString(themeDisplay.getThemeSetting("copyright"))
	orderItemsQuantity = commerceOrderHttpHelper.getCommerceOrderItemsQuantity(request)
	cartUrl = commerceOrderHttpHelper.getCommerceCartPortletURL(request)!""
	currentOrganization = (commerceOrganizationHelper.getCurrentOrganization(request))!""
	demo_mode = getterUtil.getBoolean(themeDisplay.getThemeSetting("demo-mode"))
	userManagementUrl = commerceOrganizationHelper.getCommerceUserPortletURL(request)
	wishListItemsCount = commerceWishListHttpHelper.getCurrentCommerceWishListItemsCount(request, themeDisplay.getResponse())
	wishlistUrl = commerceWishListHttpHelper.getCommerceWishListPortletURL(request)
	orderNumber = ""
/>

<#assign permission_checker = themeDisplay.getPermissionChecker() />

<#assign is_group_admin = permission_checker.isGroupAdmin(group_id) />
<#assign is_omniadmin = permission_checker.isOmniadmin() />

<#assign show_dockbar = is_group_admin || is_omniadmin />

<#if show_dockbar>
    <#assign wrapper_class_name = "" />
<#else>
    <#assign wrapper_class_name = "hide-dockbar" />
</#if>

<#if commerceOrderHttpHelper.getCurrentCommerceOrder(request)??>
	<#assign
		currentOrder = commerceOrderHttpHelper.getCurrentCommerceOrder(request)
		orderNumber =  currentOrder.getCommerceOrderId()
	/>
</#if>

<#macro commerce_category_navigation_menu default_preferences = "">
	<@liferay_portlet["runtime"]
		defaultPreferences=default_preferences
		instanceId="cpAssetCategoriesNavigationPortlet_navigation_menu"
		portletName="com_liferay_commerce_product_asset_categories_navigation_web_internal_portlet_CPAssetCategoriesNavigationPortlet"
	/>
</#macro>

<#macro commerce_cart_mini default_preferences = "">
	<@liferay_portlet["runtime"]
		defaultPreferences=default_preferences
		instanceId="commerceCartContentMiniPortlet_0"
		portletName="com_liferay_commerce_cart_content_web_internal_portlet_CommerceCartContentMiniPortlet"
		queryString="type=0"
	/>
</#macro>

<#macro commerce_wish_list_mini default_preferences = "">
	<@liferay_portlet["runtime"]
		defaultPreferences=default_preferences
		instanceId="commerceCartContentMiniPortlet_1"
		portletName="com_liferay_commerce_cart_content_web_internal_portlet_CommerceCartContentMiniPortlet"
		queryString="type=1"
	/>
</#macro>

<#macro commerce_search_organization default_preferences = "">
	<@liferay_portlet["runtime"]
		defaultPreferences=default_preferences
		portletName="com_liferay_commerce_organization_web_internal_portlet_CommerceOrganizationSearchPortlet"
	/>
</#macro>