<%@ page import="gameoverflow.Vote; gameoverflow.Question" %>
<%@ page import="gameoverflow.Answer" %>

<g:applyLayout name="page">
    <head>
        <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />

        <title>${question?.title}</title>

        <r:require modules="bootstrapInput"/>
        <ckeditor:resources />
    </head>

    <content tag="gocontent"><g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
        <div id="show-question" role="main">
            <div class="boxed">
                <div id="show-question-title">
                    <div class="shadow"></div>
                    <div class="ribbon">
                        <span>${question?.title}</span>
                    </div>
                </div>
                <div id="show-question-tags">
                    <div>
                        <g:each in="${tags}" status="i" var="currentTag">
                            <g:render template="/tag/tag" collection="${currentTag}" var="tag" />
                        </g:each>
                    </div>
                </div>
                <div id="show-question-content">
                    <div style="position:relative" class="clearfix">
                        <div style="clear:both"></div>
                        <div class="col-xs-9">
                            <g:voteForm idMessage="${question.id}" idQuestion="${question.id}" typeMessage="question">
                                ${question?.score}
                            </g:voteForm>
                            <div class="well col-xs-offset-1">
                                <!-- TODO SECURITY !! , sanitizer ?  -->
                                ${raw(question?.content)}
                            </div>
                        </div>

                        <div class="col-xs-3">
                            <g:render template="/user/userThumbnail" collection="${question?.author}" />
                        </div>
                    </div>
                    <div class="actions">
                        <g:form url="[resource:question, action:'delete']" method="DELETE" class="form-inline">
                            <g:set var="editLabel" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                            <g:link class="edit" action="edit" resource="${question}">
                                <input type="button" class="btn btn-default" value="${editLabel}" />
                            </g:link>
                            <g:actionSubmit class="delete btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </g:form>
                    </div>

                </div>
            </div>

            <div id="show-question-answers">
                <div class="clearfix">
                    <div class="title">
                        <strong>${question?.answers?.size()}</strong> <g:message code="answers.label" />
                    </div>
                </div>
                <div id="answers-list">
                    <ol>
                        <g:each in="${answers}" status="i" var="currentAnswer">

                            <g:render template="/answer/answerBloc" collection="${currentAnswer}" var="answer" />

                            <div class="hidden" id="show-question-commentform-${currentAnswer.id}">
                                <g:form url="[resource: comment, controller:'comment', action:'save']" >
                                    <fieldset class="form">
                                        <g:render template="/comment/form" />
                                    </fieldset>

                                    <g:hiddenField name="messageId" value="${currentAnswer.id}" />
                                    <g:hiddenField name="questionId" value="${question.id}" />
                                </g:form>
                            </div>

                            <g:each in="${currentAnswer.comments}"  var="currentComment">
                                <g:render template="/comment/commentBloc" collection="${currentComment}" var="comment" />
                            </g:each>
                        </g:each>
                    </ol>
                </div>
                <div>
                    <div><g:message code="answer.label" /> :</div>
                    <g:form url="[resource: answer, controller:'answer', action:'save']" >
                        <fieldset class="form">
                            <g:render template="/answer/form" />
                        </fieldset>
                        <fieldset class="buttons">
                            <g:submitButton name="create"  class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </fieldset>

                        <g:hiddenField name="questionId" value="${question.id}" />
                    </g:form>

                </div>

            </div>
        </div>
    </content>
</g:applyLayout>

