<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
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
    <%
        // 1. 파라미터 값 가져오기
        String n = request.getParameter("bno");
        if (n == null || n.isEmpty()) {
    %>
        <script>
            alert('잘못된 접근입니다.');
            location.href = 'list.jsp';
        </script>
    <%
            return;
        }
        int bno = Integer.parseInt(n);

        // 2. DAO 객체 생성
        BoardDAO dao = new BoardDAO();

        // 3. 상세 정보 조회
        BoardVO vo = dao.selectOne(bno);
        
        // 조회수 올리기
        dao.raiseHits(bno);
        
        if (vo == null) {
    %>
        <script>
            alert('해당 게시물이 존재하지 않습니다.');
            location.href = 'list.jsp';
        </script>
    <%
            return;
        }
    %>
    <div class="container">
        <table class="table">
            <tr>
                <th>작성자</th>
                <td><%= vo.getWriter() %></td>
                <th>조회수</th>
                <td><%= vo.getHits() %></td>
                <th>작성일시</th>
                <td><%= vo.getRegdate() %></td>
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="5"><%= vo.getTitle() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="5"><%= vo.getContents() %></td>
            </tr>
            <tr>
                <td colspan="6" class="text-center">
                    <a href="list.jsp" class="btn btn-outline-primary">목록</a>
                    <a href="modifyForm.jsp?bno=<%= vo.getBno() %>" class="btn btn-outline-warning">수정</a>
                    <a href="deleteOk.jsp?bno=<%= vo.getBno() %>" class="btn btn-outline-danger">삭제</a>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
