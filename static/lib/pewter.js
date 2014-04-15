"use strict";
/*global RELATIVE_PATH, app, utils*/

$(document).ready(function () {
    // modified from http://stackoverflow.com/questions/20863288/bootstrap-3-slide-in-menu-navbar-on-mobile
    $('#header-menu.navbar .container').append($('<div id="navbar-height-col"></div>'));

    var toggler = '.navbar-toggle',
		pagewrapper = '#page-content',
		navigationwrapper = '.navbar-header',
		slidewidth = '20%',
		menuneg = '-100%',
		slideneg = '-20%';


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


    $(window).on('action:connected', function() {
		$.get(RELATIVE_PATH + '/api/recent', {}, function(posts) {

			var topicList = $('.topic-list');

			if(!posts || !posts.topics || !posts.topics.length) {
				topicList.html('No topics have been posted yet.');
				return;
			}

			posts = posts.topics.slice(0, 5);

			var replies = '';

			for (var i = 0, numPosts = posts.length; i < numPosts; ++i) {
				var time = Math.floor((new Date().getTime() - posts[i].lastposttime) / 1000);

				if (time < 3600) {
					time = Math.floor(time / 60) + 'm';
				} else if (time < 86400) {
					time = Math.floor(time / 60 / 60) + 'h';
				}  else if (time >= 86400) {
					time = Math.floor(time / 60/ 60 / 24) + 'd';
				}

				replies += '<li>' + 
						'<a href="' + RELATIVE_PATH + '/topic/' + posts[i].slug + '#' + posts[i].teaser.pid + '">' +
						'<span class="icon"><i class="fa fa-user"></i></span><span class="name">' + posts[i].title + '</span><span class="author">' + posts[i].user.username + '</span><span class="time">' + time + '</span></a></li>';
			}

			topicList.html(replies);

		});

		if (app.username) {
			$.get(RELATIVE_PATH + '/api/user/' + app.username, {}, function(userData) {
				$('.forum-header .welcome').html('<p>Welcome, <strong>' + app.username + '</strong>.</p><p>You have <a href="/unread" class="unread">0</a> unread posts.</p>');
				//'<p>Reputation: ' + userData.reputation + '<br />Post Count: ' + userData.postcount + '<br />Followers: ' + userData.followerCount
				$('.forum-header .btn-primary').hide();
				$('.forum-header .avatar img').attr('src', userData.picture);
				$.get(RELATIVE_PATH + '/api/unread/', {}, function(unread) {
					$('.forum-header .unread').html(unread.topics.length);
				});
			});
		}
	});


	$(window).on('action:ajaxify.end', function(ev, data) {
		var url = data.url;

		if (url === '') {
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

					replies += '<li><a href="' + RELATIVE_PATH + '/topic/' + posts[i].slug + '#' + posts[i].teaser.pid + '"><span class="post-title">' + posts[i].title + '</span><span class="post-count">' + posts[i].viewcount + '</span></a></li>';
				}

				recentReplies.html(replies);
			});
		}
	});

});