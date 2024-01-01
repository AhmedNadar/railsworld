const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,html,slim,haml}',
    './app/components/**/*', // Rails view components
    './app/assets/images/**/*',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        satoshi: ['Satoshi', "sans-serif"],
        zodiak: ['Zodiak', "serif"],
        tanker: ['Tanker', "serif-serif"],
      },
      colors: {
        primary: {
          '50': '#fef2f2',
          '100': '#fde6e6',
          '200': '#fad1d2',
          '300': '#f5acae',
          '400': '#ef7d82',
          '500': '#e44f5a',
          '600': '#c52c3e',
          '700': '#af2136',
          '800': '#931e33',
          '900': '#7e1d31',
          '950': '#460b16',
        },
        secondary: {
          '50': '#f2fbf8',
          '100': '#d2f5eb',
          '200': '#a4ebd7',
          '300': '#6fd9c1',
          '400': '#41c0a6',
          '500': '#27a58d',
          '600': '#1b7b6b',
          '700': '#1b6a5e',
          '800': '#1a554c',
          '900': '#1a4741',
          '950': '#092a26',
        },
        livid_brown: {
          '50': '#f9f6f8',
          '100': '#f5eef2',
          '200': '#eddde5',
          '300': '#dfc2d0',
          '400': '#ca9cb2',
          '500': '#b67e97',
          '600': '#a0627b',
          '700': '#884e63',
          '800': '#714353',
          '900': '#603b48',
          '950': '#472732',
        },
        toronto_blue: {
          '50': '#f0f6fe',
          '100': '#ddeafc',
          '200': '#c3dcfb',
          '300': '#99c6f7',
          '400': '#69a7f1',
          '500': '#4586ec',
          '600': '#3069e0',
          '700': '#2755ce',
          '800': '#2645a7',
          '900': '#27438f',
          '950': '#1a2851',
      },

      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
