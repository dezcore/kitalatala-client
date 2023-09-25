/** @type {import('next').NextConfig} */
const nextConfig = {
  output: "export",
  basePath: "/kitalatala",
  modularizeImports: {
    "@mui/icons-material": {
      transform: "@mui/icons-material/{{member}}",
    },
  },
};

module.exports = nextConfig;
