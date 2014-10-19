<html>
<%@ page import="org.codehaus.groovy.grails.plugins.PluginManagerHolder"%>

<sec:ifNotSwitched>
	<sec:ifAllGranted roles='ROLE_SWITCH_USER'>
		<g:if test='${user.username}'>
			<g:set var='canRunAs' value='${true}' />
		</g:if>
	</sec:ifAllGranted>
</sec:ifNotSwitched>

<head>
<%--<meta name='layout' content='springSecurityUI'/> --%>
<meta name="layout" content="main" />
<r:require module="application" />
<r:require modules="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'Prueba')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>
	<g:render template='../inicio/navegacion' />
	<div class="row-fluid">

		<g:link controller='usuario' action='userSearch' class ='btn'>Volver</g:link>
		<br>
		<h3>
			<g:message code="spring.security.ui.user.titulo"
				args="${[user.username]}" />
		</h3>

		<g:if test="${flash.message}">
			<div class="alert alert-success" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${user}">
			<ul class="alert alert-error" role="alert">
				<g:eachError bean="${user}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>

		<g:form action="update" name='userEditForm' class="button-style">
			<g:hiddenField name="id" value="${user?.id}" />
			<g:hiddenField name="version" value="${user?.version}" />

			<%
def tabData = []
tabData << [name: 'userinfo', icon: 'icon_user', messageCode: 'spring.security.ui.user.info']
tabData << [name: 'roles',    icon: 'icon_role', messageCode: 'spring.security.ui.user.roles']
boolean isOpenId = PluginManagerHolder.pluginManager.hasGrailsPlugin('springSecurityOpenid')
if (isOpenId) {
	tabData << [name: 'openIds', icon: 'icon_role', messageCode: 'spring.security.ui.user.openIds']
}
%>

			<s2ui:tabs elementId='tabs' height='375' data="${tabData}">
				<s2ui:tab name='userinfo' height='260'>
					<table>
						<tbody>
							<s2ui:textFieldRow name='username'
								labelCode='user.username.label' bean="${user}"
								labelCodeDefault='Username' value="${user?.username}" />
<%--
							<s2ui:passwordFieldRow name='password'
								labelCode='user.password.label' bean="${user}"
								labelCodeDefault='Password' value="${user?.password}" />
--%>
							<s2ui:checkboxRow name='enabled' labelCode='user.enabled.label'
								bean="${user}" labelCodeDefault='Enabled'
								value="${user?.enabled}" />

							<s2ui:checkboxRow name='accountExpired'
								labelCode='user.accountExpired.label' bean="${user}"
								labelCodeDefault='Account Expired'
								value="${user?.accountExpired}" />

							<s2ui:checkboxRow name='accountLocked'
								labelCode='user.accountLocked.label' bean="${user}"
								labelCodeDefault='Account Locked' value="${user?.accountLocked}" />

							<s2ui:checkboxRow name='passwordExpired'
								labelCode='user.passwordExpired.label' bean="${user}"
								labelCodeDefault='Password Expired'
								value="${user?.passwordExpired}" />
						</tbody>
					</table>
				</s2ui:tab>

				<s2ui:tab name='roles' height='260'>
					<g:each var="entry" in="${roleMap}">
						<div>
							<g:checkBox name="${entry.key.authority}" value="${entry.value}" />
							<%--<g:link controller='perfil' action='edit' id='${entry.key.id}'>${entry.key.authority.encodeAsHTML()}</g:link> --%>
							${entry.key.authority.encodeAsHTML()}
						</div>
					</g:each>
				</s2ui:tab>

				<g:if test='${isOpenId}'>
					<s2ui:tab name='openIds' height='275'>
						<g:if test='${user?.openIds}'>
							<ul>
								<g:each var="openId" in="${user.openIds}">
									<li>
										${openId.url}
									</li>
								</g:each>
							</ul>
						</g:if>
						<g:else>
	No OpenIDs registered
	</g:else>
					</s2ui:tab>
				</g:if>

			</s2ui:tabs>
			<fieldset class="buttons">
				<div style='float: left;'>
					<s2ui:submitButton class="save" elementId='update'
						form='userEditForm' messageCode='default.button.update.label' />
					<%--
		<g:if test='${user}'>
		<s2ui:deleteButton />
		</g:if>
		 --%>
					<g:if test='${canRunAs}'>
						<a id="runAsButton">
							${message(code:'spring.security.ui.runas.submit')}
						</a>
					</g:if>

				</div>
			</fieldset>
		</g:form>

		<g:if test='${user}'>
			<s2ui:deleteButtonForm instanceId='${user.id}' />
		</g:if>

		<g:if test='${canRunAs}'>
			<form name='runAsForm'
				action='${request.contextPath}/j_spring_security_switch_user'
				method='POST'>
				<g:hiddenField name='j_username' value="${user.username}" />
				<input type='submit' class='s2ui_hidden_button' />
			</form>
		</g:if>

	</div>

	<script>
		$(document).ready(function() {
			$('#username').focus();

			<s2ui:initCheckboxes/>

			$("#runAsButton").button();
			$('#runAsButton').bind('click', function() {
				document.forms.runAsForm.submit();
			});
		});
	</script>

</body>
</html>
