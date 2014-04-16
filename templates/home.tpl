
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
	<div class="sidebar" widget-area="sidebar"></div>
</div>