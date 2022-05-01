import { DefaultTheme } from 'styled-components';

const getMediaQuery = (screenSize: number): string => {
  return `@media only screen and (min-width: ${screenSize}px)`;
};

const breakpoints = {
  sm: 640,
  md: 768,
  lg: 1024,
  xl: 1280,
  xxl: 1536,
};

export const theme: DefaultTheme = {
  colors: {
    primary: 'hsl(172, 67%, 45%)', // strong cyan
    neutral: {
      500: 'hsl(184, 14%, 56%)',
    },
    white: 'hsl(0, 0%, 100%)',
  },
  breakpoints,
  media: {
    small: getMediaQuery(breakpoints.sm),
    medium: getMediaQuery(breakpoints.md),
    large: getMediaQuery(breakpoints.lg),
    xLarge: getMediaQuery(breakpoints.xl),
    xxLarge: getMediaQuery(breakpoints.xxl),
  },
};
