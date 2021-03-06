<g:applyLayout name="questions">
    <head>
        <title><g:message code="general.welcome" default="Welcome to GameOverFlow" /></title>
    </head>

    <content tag="index-questions">
        <div id="index-questions-title" class="panel-heading">
            <g:message code="questions.recent" default="Recent questions" />
        </div>

        <div id="index-questions-content">
            <ul>
                <g:each in="${listRecentQuestions}" var="currentQuestion">
                    <li>
                        <g:render template="/question/questionShort" collection="${currentQuestion}" var="question" />
                    </li>
                </g:each>
            </ul>
        </div>
    </content>
</g:applyLayout>