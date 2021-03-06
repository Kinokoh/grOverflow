<g:applyLayout name="page">
    <head>
        <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <r:require modules="bootstrapInput, typeahead"/>
        <ckeditor:resources />
    </head>

    <content tag="gocontent">
        <div id="create-question" class="content scaffold-create panel panel-default" role="main">
            <div class="panel-heading">
                <g:message code="default.create.label" args="[entityName]" />
            </div>
            <div class="panel-content">
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${questionInstance}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${questionInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <g:form url="[resource: question, action:'save']" >
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save btn btn-default btn-lg" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </fieldset>
                </g:form>
            </div>
        </div>
    </content>
</g:applyLayout>
