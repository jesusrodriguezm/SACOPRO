<div class="span12">
	<div class="buttons nav affix">
		<span class=""> <g:actionSubmit class="btn btn-block"
				value="${applyText}" action="${action}" />
		</span> <br> <br> <span class=""> <input type="button"
			class="btn btn-block" value="${clearText}"
			onclick="return grailsFilterPane.clearFilterPane('${formName}');" />
		</span> <br> <br> <span class=""> <input type="button"
			class="btn btn-block" value="${cancelText}"
			onclick="return grailsFilterPane.hideElement('${containerId}');" />
		</span>
	</div>
</div>