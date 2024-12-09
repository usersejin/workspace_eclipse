<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>detail.jsp</title>
</head>
<body>
    <div class="container">
        <table class="table">
            <tr>
                <th>작성자</th>
                <td>${vo.writer}</td>
                <th>조회수</th>
                <td>${vo.hits}</td>
                <th>작성일시</th>
                <td>${vo.regdate}</td>
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="5">${vo.title}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="5">${vo.contents}</td>
            </tr>
            <tr>
                <td colspan="6" >
                    <a href="board.do?cmd=list" class="btn btn-outline-primary">목록</a>
                    <a href="board.do?cmd=modify&bno=${vo.bno}" class="btn btn-outline-warning">수정</a>
                    <a href="board.do?cmd=delete&bno=${vo.bno}" class="btn btn-outline-danger">삭제</a>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
