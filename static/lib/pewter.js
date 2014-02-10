$(document).ready(function () {
    //stick in the fixed 100% height behind the navbar but don't wrap it
    $('#header-menu.navbar .container').append($('<div id="navbar-height-col"></div>'));

    // Enter your ids or classes
    var toggler = '.navbar-toggle';
    var pagewrapper = '#page-content';
    var navigationwrapper = '.navbar-header';
    var menuwidth = '100%'; // the menu inside the slide menu itself
    var slidewidth = '20%';
    var menuneg = '-100%';
    var slideneg = '-20%';


    $("#header-menu").on("click", toggler, function (e) {
        var selected = $(this).hasClass('slide-active');

        $('#slidemenu').stop().animate({
            left: selected ? menuneg : '0px'
        });

        $('#navbar-height-col').stop().animate({
            left: selected ? slideneg : '0px'
        });

        $(pagewrapper).stop().animate({
            left: selected ? '0px' : slidewidth
        });

        $(navigationwrapper).stop().animate({
            left: selected ? '0px' : slidewidth
        });


        $(this).toggleClass('slide-active', !selected);
        $('#slidemenu').toggleClass('slide-active');


        $('#page-content, .navbar, body, .navbar-header').toggleClass('slide-active');
    });


	$(document).bind('DOMNodeInserted', function(event) {
		// Unsure about performance of this, probably pretty bad. Need to bind to ajaxify.onchange or similar instead.
		if (event.target.className == 'row home') {


			$.get(RELATIVE_PATH + '/api/popular/views', {}, function(posts) {
				var recentReplies = $('.popular-topics ul');

				if(!posts || !posts.topics || !posts.topics.length) {
					recentReplies.html('No topics have been posted yet.');
					return;
				}

				posts = posts.topics.slice(0, 8);

				var replies = '';

				for (var i = 0, numPosts = posts.length; i < numPosts; ++i) {
					var lastPostIsoTime = utils.toISOString(posts[i].lastposttime);

					replies += '<li><a href="' + RELATIVE_PATH + '/topic/' + posts[i].slug + '#' + posts[i].teaser_pid + '"><span class="post-title">' + posts[i].title + '</span><span class="post-count">' + posts[i].viewcount + '</span></a></li>';
				}

				recentReplies.html(replies);
			});

			$.get(RELATIVE_PATH + '/api/recent', {}, function(posts) {
				var recentReplies = $('.topic-list');

				if(!posts || !posts.topics || !posts.topics.length) {
					recentReplies.html('No topics have been posted yet.');
					return;
				}

				var topic = posts.topics[Math.floor(Math.random() * posts.topics.length)];

				var html = '<strong>'+ topic.username +'</strong> '
					+ '<a href="' + RELATIVE_PATH + '/topic/' + topic.slug + '#' + topic.teaser_pid + '">'
					+ topic.title + '</a> <span class="timeago" title="' + utils.toISOString(topic.lastposttime) + '"></span>';

				$('.random-topic .panel-body').html(html);

				$('.random-topic span.timeago').timeago();

				posts = posts.topics.slice(0, 5);

				var replies = '';

				for (var i = 0, numPosts = posts.length; i < numPosts; ++i) {
					

					var time = Math.floor((new Date().getTime() - posts[i].lastposttime) / 1000);

					if (time < 3600) {
						time = Math.floor(time / 60) + 'm';
					} else if (time < 86400) {
						time = Math.floor(time / 60 / 24) + 'h';
					} 
					replies += '<li>'
							+ '<a href="' + RELATIVE_PATH + '/topic/' + posts[i].slug + '#' + posts[i].teaser_pid + '">'
							+ '<span class="icon"><i class="fa fa-user"></i></span><span class="name">' + posts[i].title + '</span><span class="author">' + posts[i].username + '</span></a><span class="time">' + time + '</span></li>';

				}

				recentReplies.html(replies);

			});
		}
	});

});