#!/bin/bash
# Bash script to automate the rest of my nextjs typescript set up after creating a new repo.

# Should be run in the base of a newly generated nextjs project with typescript
# run `chmod +x setup.sh` to make executable

# I'd rather create two arrays. 1 for normal dependencies and 1 for dev.
# loop through those with the appropriate commands.

# npm packages add any npm packages you want to install to the appropriate arrays
packages=("styled-components" "@types/styled-components")
devPackages=(
  "babel-plugin-styled-components"
  "eslint-plugin-import"
  "@typescript-eslint/eslint-plugin"
  "@typescript-eslint/parser"
  "eslint-config-airbnb-typescript"
  "eslint-plugin-jsx-a11y"
  "eslint-plugin-react"
  "eslint-plugin-react-hooks"
)

echo "Installing npm packages."
for p in ${packages[@]}; do
  npm install $p
done

for dp in ${devPackages[@]}; do 
  npm install --save-dev $dp
done

# array of file paths to delete
delFiles=(
  "./styles/Home.module.css"
  "./styles/globals.css"
  "./public/favicon.ico"
  "./public/vercel.svg"
  "./pages/api/hello.ts"
)

echo "Deleting unneeded files."
for file in ${delFiles[@]}; do
  rm -f $file
done

# array of directories to create
folders=("@types" "src")
echo "Creating needed directories"
for f in ${folders[@]}; do
  mkdir $f
done

# 2 arrays. 1 for the file paths we will write to. 1 for urls we will read.
# They should be of the same length. They will be connected by index.
writePaths=(
  "./.babelrc"
  "./pages/_document.tsx"
  "./styles/theme.ts"
  "./styles/global.ts"
  "./pages/_app.tsx"
  "./@types/styled.d.ts"
  "./pages/index.tsx"
  "./.eslintrc"
)
readUrls=(
  "https://gist.githubusercontent.com/rv-rmcgavin/7ec4e5b3dcc0dbda30c343e5fcfdff3f/raw/5f1d7dfe915286baecc78397332a74f5116b72a2/.babelrc"
  "https://gist.githubusercontent.com/rv-rmcgavin/7ec4e5b3dcc0dbda30c343e5fcfdff3f/raw/524e8b864a42b4ac257cbd5ff1ab640e5c3c54af/_document.tsx"
  "https://gist.githubusercontent.com/rv-rmcgavin/7ec4e5b3dcc0dbda30c343e5fcfdff3f/raw/41e1fef5a02eea57b0af54aad33845fed599bbdf/theme.ts"
  "https://gist.githubusercontent.com/rv-rmcgavin/7ec4e5b3dcc0dbda30c343e5fcfdff3f/raw/de3cf9fdc2b31139eb6777420dd9c918f7140850/global.ts"
  "https://gist.githubusercontent.com/rv-rmcgavin/7ec4e5b3dcc0dbda30c343e5fcfdff3f/raw/838e47f49a833515a94555e6c4f07eac17e2c52b/_app.tsx"
  "https://gist.githubusercontent.com/rv-rmcgavin/7ec4e5b3dcc0dbda30c343e5fcfdff3f/raw/c369dd7414015b8c6ce86a62403b9e58a3a9c776/styled.d.ts"
  "https://gist.githubusercontent.com/rv-rmcgavin/7ec4e5b3dcc0dbda30c343e5fcfdff3f/raw/724b7fbf01b61db8a131b3d28a773bccc150988e/index.tsx"
  "https://gist.githubusercontent.com/rickMcGavin/6698c9413a3cfb4969c560d2269dfe9c/raw/30274ab74136c5aa35978fb786b4c089f3b43142/.eslintrc.json"
  "https://gist.githubusercontent.com/rickMcGavin/6698c9413a3cfb4969c560d2269dfe9c/raw/30274ab74136c5aa35978fb786b4c089f3b43142/.prettierrc.json"
)

echo "Downloading and saving files from gists"
for i in ${!writePaths[@]}; do
  wget -O ${writePaths[$i]} ${readUrls[$i]}
done