module.exports = {
  content: [
    './public/*.html', 
    './app/helpers/**/*.rb', 
    './app/javascript/**/*.js', 
    './app/views/**/*.{erb,haml,html,slim}', 
    './app/assets/stylesheets/**/*.{css}', 
    './config/**/*.rb', 
  ],
  theme: {
    extend: {},  
  },
  plugins: [],
  corePlugins: {
    preflight: false, 
  },
}