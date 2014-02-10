
<div class="row home">
	<div class="category-list" itemscope itemtype="http://www.schema.org/ItemList">
		<!-- BEGIN categories -->
			<!-- IF categories.link -->
			<a class="category-item" href="{categories.link}" itemprop="url" target="_blank" style="background: {categories.background}">
			<!-- ELSE -->
			<a class="category-item" href="category/{categories.slug}" itemprop="url" style="background: {categories.background}">
			<!-- ENDIF categories.link-->
				<div class="category-footer">
					<i class="fa {categories.icon}"></i> {categories.name}
					<div class="topic-count">
						{categories.topic_count}
						<div class="arrow"></div>
					</div>
				</div>
			</a>
		<!-- END categories -->
	</div>
	<div class="sidebar">
		<div class="motd">
			{motd}
		</div>

		<div class="panel panel-default random-topic">
			<div class="panel panel-header">Random Topic</div>
			<div class="panel-body"></div>
		</div>

		<div class="panel panel-default">
			<div class="panel panel-header">Popular Topics</div>
			<div class="panel-body popular-topics">
				<ul>
					<li>
						<span class="post-title"></span>
						<span class="post-count"></span>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>