<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title></title>
</head>
<body>
    에러가 발생했어요!<br>
    Request that failed: ${pageContext.errorData.requestURI}<br>
    Status code: ${pageContext.errorData.statusCode}<br>
    Exception: ${pageContext.errorData.throwable}<br>

</body>
</html>