<ul class="popular-topics">
	<li>
		<span class="post-title"></span>
		<span class="post-count"></span>
	</li>
</ul>

<script type="text/javascript">
(function() {
	$.get(RELATIVE_PATH + '/api/popular/views', {}, function(posts) {
		var recentReplies = $('.popular-topics');

		if(!posts || !posts.topics || !posts.topics.length) {
			recentReplies.html('No topics have been posted yet.');
			return;
		}

		posts = posts.topics.slice(0, 8);

		var replies = '';

		for (var i = 0, numPosts = posts.length; i < numPosts; ++i) {
			var lastPostIsoTime = utils.toISOString(posts[i].lastposttime);

			replies += '<li><a href="' + RELATIVE_PATH + '/topic/' + posts[i].slug + '#' + posts[i].teaser.pid + '"><span class="post-title">' + posts[i].title + '</span><span class="post-count">' + posts[i].viewcount + '</span></a></li>';
		}

		recentReplies.html(replies);
	});
}());
</script>