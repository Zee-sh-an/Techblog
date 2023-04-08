<%@page import="com.tech.blog.entities.Like"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<div class="row">
	<%
	User user = (User) session.getAttribute("currentUser");
	%>
	<%
	Thread.sleep(1000);
	PostDao postDao = new PostDao(ConnectionProvider.getConnection());

	int cid = Integer.parseInt(request.getParameter("cid"));
	List<post> posts = null;
	if (cid == 0) {
		posts = postDao.getAllPosts();
	} else {
		posts = postDao.getAllPostsbycatId(cid);
	}
	if (posts.size() == 0) {
		out.println("<h3 class='display-3 text-center'>No post in this category.....</h3>");
	}
	for (post o : posts) {
	%>

	<div class="col-md-6">
		<div class="card mt-2">
			<img class="card-img-top" alt="Card image cap"
				src="blog_pics/<%=o.getpPic()%>">
			<div class="card-body">
				<b><%=o.getpTitle()%></b>
				<p><%=o.getpContent()%></p>
				<!-- code always in pre tag -->
				<pre><%=o.getpCode()%></pre>
			</div>
			<%
			LikeDao lDao=new LikeDao(ConnectionProvider.getConnection());
			int l=lDao.countLikeOnPost(o.getPid());
			%>
			<div class="card-footer text-center primary-background ">
				<a href="#" onclick="dolike(<%=o.getPid()%>,<%=user.getId()%>)"
					class="btn btn-outline-light  btn-sm"><i
					class="fa fa-thumbs-o-up"></i><span><%=l %></span></a> <a href="#"
					class="btn btn-outline-light btn-sm"><i
					class="fa fa-commenting-o"></i><span>20</span></a> <a
					href="show_blog_page.jsp?post_id=<%=o.getPid()%>"
					class="btn btn-outline-light btn-sm">Read more</a>
			</div>
		</div>
	</div>

	<%
	}
	%>
</div>
<script type="text/javascript" src="js/me.js"></script>
