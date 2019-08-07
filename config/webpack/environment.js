const { environment, config } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

const HtmlWebpackPlugin = require('html-webpack-plugin')
const HtmlWebpackHarddiskPlugin = require('html-webpack-harddisk-plugin')
const { resolve } = require('path')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

environment.plugins.append('html',
    new HtmlWebpackPlugin({
        inject: 'body',
        alwaysWriteToDisk: true,
        filename: 'index.html',
        template: resolve('public', 'index.html')
    }))

environment.plugins.append('hardisk', new HtmlWebpackHarddiskPlugin())

module.exports = environment
