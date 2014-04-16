<input type="hidden" template-variable="expose_tools" value="{expose_tools}" />
<input type="hidden" template-variable="topic_id" value="{tid}" />
<input type="hidden" template-variable="currentPage" value="{currentPage}" />
<input type="hidden" template-variable="pageCount" value="{pageCount}" />
<input type="hidden" template-variable="locked" value="{locked}" />
<input type="hidden" template-variable="deleted" value="{deleted}" />
<input type="hidden" template-variable="pinned" value="{pinned}" />
<input type="hidden" template-variable="topic_name" value="{title}" />
<input type="hidden" template-variable="postcount" value="{postcount}" />
<input type="hidden" template-variable="viewcount" value="{viewcount}" />


<div class="topic">
	<ol class="breadcrumb">
		<li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
			<a href="{relative_path}/" itemprop="url"><span itemprop="title">[[global:home]]</span></a>
		</li>
		<li itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
			<a href="{relative_path}/category/{category_slug}" itemprop="url"><span itemprop="title">{category_name}</span></a>
		</li>
		<li class="active" itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb">
			<span itemprop="title">{title} </span>
		</li>
	</ol>

	<ul id="post-container" class="posts" data-tid="{tid}">
		<!-- BEGIN posts -->
			<li class="post-row<!-- IF posts.deleted --> deleted<!-- ENDIF posts.deleted -->" data-pid="{posts.pid}" data-uid="{posts.uid}" data-username="{posts.user.username}" data-userslug="{posts.user.userslug}" data-index="{posts.index}" itemscope itemtype="http://schema.org/Comment">

				<a id="post_anchor_{posts.pid}" name="{posts.pid}"></a>

				<meta itemprop="datePublished" content="{posts.relativeTime}">
				<meta itemprop="dateModified" content="{posts.relativeEditTime}">

				<div class="topic-item">
					<div class="topic-body">
						<div class="row">
							<div class="col-md-12">
								<div class="topic-profile-pic">
									<a href="{relative_path}/user/{posts.userslug}">
										<img src="{posts.user.picture}" alt="{posts.user.username}" class="profile-image user-img" title="{posts.user.username}">
										<!-- IF posts.user.banned -->
										<span class="label label-danger">[[topic:banned]]</span>
										<!-- ENDIF posts.user.banned -->
									</a>
								</div>
								<div class="topic-text">
									<div id="content_{posts.pid}" class="post-content" itemprop="text">{posts.content}</div>
									<!-- IF posts.user.signature -->
									<div class="post-signature">{posts.user.signature}</div>
									<!-- ENDIF posts.user.signature -->
								</div>
							</div>
						</div>
					</div>
					<div class="topic-footer">
						<div class="row">
							<div class="">
								<div class="dropdown">
									<a href="#" class="dropdown-toggle postMenu favourite-tooltip" id="postMenu_{posts.pid}" data-toggle="dropdown">
										<i class="fa fa-heart"></i>
									</a>
									<ul class="dropdown-menu" role="menu" aria-labelledby="postMenu_{posts.pid}">
										<li role="presentation">
											<a role="menuitem" tabindex="-1" data-favourited="{posts.favourited}" class="favourite">
												<span class="favourite-text">[[topic:favourite]]</span>
												<span class="favouriteCount" data-favourites="{posts.reputation}">{posts.reputation}</span>&nbsp;
											</a>
										</li>
										<!-- IF !config.disableSocialButtons -->
										<li role="presentation" class="divider"></li>
										<li role="presentation" class="dropdown-header">Share this Post</li>
										<li role="presentation">
											<a role="menuitem" class="facebook-share" tabindex="-1" href="#"><span class="menu-icon"><i class="fa fa-facebook"></i></span> Facebook</a>
										</li>
										<li role="presentation">
											<a role="menuitem" class="twitter-share" tabindex="-1" href="#"><span class="menu-icon"><i class="fa fa-twitter"></i></span> Twitter</a>
										</li>
										<li role="presentation">
											<a role="menuitem" class="google-share" tabindex="-1" href="#"><span class="menu-icon"><i class="fa fa-google-plus"></i></span> Google+</a>
										</li>
										<!-- ENDIF !config.disableSocialButtons -->
									</ul>
								</div>
								&bull;
								<a href="#" class="upvote <!-- IF posts.upvoted --> upvoted btn-primary <!-- ENDIF posts.upvoted -->">
									<i class="fa fa-plus"></i>
								</a>
								<span class="votes" data-votes="{posts.votes}">{posts.votes}</span>
								<a href="#" class="downvote <!-- IF posts.downvoted --> downvoted btn-primary <!-- ENDIF posts.downvoted -->">
									<i class="fa fa-minus"></i>
								</a>
								<!-- IF custom_profile_info -->
									<!-- BEGIN custom_profile_info -->
									&bull; {posts.custom_profile_info.content}
									<!-- END custom_profile_info -->
								<!-- ENDIF custom_profile_info -->

								<span class="post-tools">
									<button class="btn btn-sm btn-link chat" type="button" title="[[topic:chat]]"><i class="fa fa-comment"></i><span class="hidden-xs-inline"> [[topic:chat]]</span></button>
									<button class="btn btn-sm btn-link quote" type="button" title="[[topic:quote]]"><i class="fa fa-quote-left"></i><span class="hidden-xs-inline"> [[topic:quote]]</span></button>
									<button class="btn btn-sm btn-link post_reply" type="button"><i class="fa fa-reply"></i><span class="hidden-xs-inline"> [[topic:reply]]</span></button>
									<button class="btn btn-sm btn-link flag" type="button" title="[[topic:flag_title]]"><i class="fa fa-flag-o"></i><span class="hidden-xs-inline"> [[topic:flag]]</span></button>
									<!-- IF posts.display_moderator_tools -->
										<button class="btn btn-sm btn-link edit" type="button" title="[[topic:edit]]"><i class="fa fa-pencil"></i><span class="hidden-xs-inline"> [[topic:edit]]</span></button>
										<button class="btn btn-sm btn-link delete" type="button" title="[[topic:delete]]"><i class="fa fa-trash-o"></i><span class="hidden-xs-inline"> [[topic:delete]]</span></button>
										<!-- IF posts.display_move_tools -->
											<button class="btn btn-sm btn-link move" type="button" title="[[topic:move]]"><i class="fa fa-arrows"></i><span class="hidden-xs-inline"> [[topic:move]]</span></button>
										<!-- ENDIF posts.display_move_tools -->
									<!-- ENDIF posts.display_moderator_tools -->
								</span>

								<small class="pull-right">
								<span>
									<i class="fa fa-circle status-offline"></i>
									<span class="username-field">
										<a href="{relative_path}/user/{posts.userslug}" itemprop="author">{posts.user.username}</a>
										[[category:posted]] <span class="relativeTimeAgo timeago" title="{posts.relativeTime}"></span>
									</span>
								</span>

								<!-- IF posts.editor.username -->
								<span>, [[category:last_edited_by]] <strong><a href="{relative_path}/user/{posts.editor.userslug}">{posts.editorname}</a></strong></span>
								<span class="timeago" title="{posts.relativeEditTime}"></span>
								<!-- ENDIF posts.editor.username -->
								</small>
							</div>
						</div>
					</div>
				</div>
			</li>

		<!-- END posts -->
	</ul>

	<div class="well col-xs-12 pull-right post-bar bottom-post-bar hide">
		<div class="topic-main-buttons pull-right inline-block">
			<div class="loading-indicator" done="0" style="display:none;">
				<span class="hidden-xs-inline">[[topic:loading_more_posts]]</span> <i class="fa fa-refresh fa-spin"></i>
			</div>
			<!-- IF privileges.write -->
			<button class="btn btn-primary post_reply" type="button">[[topic:reply]]</button>
			<!-- ENDIF privileges.write -->
			<div class="btn-group thread-tools hide dropup">
				<button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button">[[topic:thread_tools.title]] <span class="caret"></span></button>
				<ul class="dropdown-menu pull-right">
					<li><a href="#" class="markAsUnreadForAll"><i class="fa fa-fw fa-inbox"></i> [[topic:thread_tools.markAsUnreadForAll]]</a></li>
					<li><a href="#" class="pin_thread"><i class="fa fa-fw fa-thumb-tack"></i> [[topic:thread_tools.pin]]</a></li>
					<li><a href="#" class="lock_thread"><i class="fa fa-fw fa-lock"></i> [[topic:thread_tools.lock]]</a></li>
					<li class="divider"></li>
					<li><a href="#" class="move_thread"><i class="fa fa-fw fa-arrows"></i> [[topic:thread_tools.move]]</a></li>
					<li><a href="#" class="fork_thread"><i class="fa fa-fw fa-code-fork"></i> [[topic:thread_tools.fork]]</a></li>
					<li class="divider"></li>
					<li><a href="#" class="delete_thread"><span class="text-error"><i class="fa fa-fw fa-trash-o"></i> [[topic:thread_tools.delete]]</span></a></li>
					<!-- BEGIN thread_tools -->
					<li>
						<a href="#" class="{thread_tools.class}"><i class="fa fa-fw {thread_tools.icon}"></i> {thread_tools.title}</a>
					</li>
					<!-- END thread_tools -->
				</ul>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>


</div>

<!-- IMPORT partials/noscript/paginator.tpl -->