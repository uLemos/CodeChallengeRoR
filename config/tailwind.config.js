module.exports = {
  content: [
    './app/views/**/*.{erb,html,haml,slim}',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/assets/stylesheets/**/*.{css}',
    './config/**/*.rb',
    './public/**/*.html', 
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Poppins', 'sans-serif'],
      }
    },  
  },
  plugins: [],
  corePlugins: {
    preflight: false, 
  },
}