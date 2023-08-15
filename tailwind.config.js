// /** @type {import('tailwindcss').Config} */
// module.exports = {
//   content: [ './app/views/**/*.html.erb',
//   './app/javascript/**/*.js', ],
//   theme: {
//     extend: {},
//   },
//   plugins: [],
// }

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./app/helpers/**/*.rb',
  './app/javascript/**/*.js',
  './app/views/**/*',],
  theme: {
    extend: {
      colors: {
        primary: {
          light: "#ffffff",
          dark: "#000000",
        },
      },
    },
  },
  plugins: [
    "@tailwindcss/forms",
  ],
}
