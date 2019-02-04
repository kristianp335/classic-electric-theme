<div class="b2b-login-container">
	<header class="autofit-row b2b-login-header">
		<div class="autofit-col b2b-login-header-logo">
			<div class="b2b-logo">
				<img alt="Beryl Logo" class="b2b-logo-image" src="${site_logo}">
			</div>
		</div>

		<div class="autofit-col autofit-col-expand b2b-login-header-title">
			<div class="autofit-section" >
				<button class="btn btn-primary" id="fakeLoginButton" onclick="$('#loginCardArea').css('visibility', 'visible'); $('#fakeLoginButton').hide();">Login</button>
			</div>
		</div>
	</header>

	<div class="b2b-login-body">
		<div class="b2b-login-bg">
			<div class="b2b-login-overlay b2b-overlay-scanline" style="background-image: url('${images_folder}/car_login.jpg')"></div>
		</div>

		<div class="b2b-login-card card" id="loginCardArea" style="visibility: hidden;">
			<#if is_signed_in && !validator.isNotNull(currentOrganization)>
				<@commerce_search_organization default_preferences=freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
			<#else>
				<#assign preferences = freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />

				<@liferay_portlet["runtime"]
					defaultPreferences=preferences
					portletName="com_liferay_login_web_portlet_LoginPortlet"
				/>
			</#if>
		</div>
	</div>
</div>
<script>
	if($('#portlet_com_liferay_commerce_organization_web_internal_portlet_CommerceOrganizationSearchPortlet').length)
	{
		$('#loginCardArea').css('visibility', 'visible'); $('#fakeLoginButton').hide();
	}
</script>
