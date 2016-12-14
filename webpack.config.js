var path = require('path')

module.exports = {
	entry: './src/app.js',
	output: {
		path: path.resolve(__dirname, 'dist'),
		filename: 'app.js'
	},
	module: {
		rules: [
			{
				test: /\.(js|jsx)$/, use: 'babel-loader'
			},
			{
				test: /\.vue$/, use: 'vue/dist/vue.js'
			}
		]
	}
}