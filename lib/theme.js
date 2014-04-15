"use strict";

var Theme = {},
	app;

Theme.defineWidgetAreas = function(areas, callback) {
	areas = areas.concat([
		{
			'name': 'Homepage Sidebar',
			'template': 'home.tpl',
			'location': 'sidebar'
		}
	]);

	callback(null, areas);
};

Theme.renderPopularTopics = function(widget, callback) {
	app.render('pewter/popular', {});
};

Theme.defineWidgets = function(widgets, callback) {
	console.log('test', widgets);
	widgets = widgets.concat([
		{
			widget: "pewterPopularTopics",
			name: "Popular Topics",
			description: "Latest popular topics",
			content: 'test'
		}
	]);

	callback(null, widgets);
};

Theme.init = function(express, middleware, controllers) {
	app = express;
};

module.exports = Theme;