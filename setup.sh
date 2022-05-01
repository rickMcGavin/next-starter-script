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
  "https://raw.githubusercontent.com/rickMcGavin/next-starter-script/main/starter-files/.babelrc"
  "https://raw.githubusercontent.com/rickMcGavin/next-starter-script/main/starter-files/_document.tsx"
  "https://raw.githubusercontent.com/rickMcGavin/next-starter-script/main/starter-files/theme.ts"
  "https://raw.githubusercontent.com/rickMcGavin/next-starter-script/main/starter-files/global.ts"
  "https://raw.githubusercontent.com/rickMcGavin/next-starter-script/main/starter-files/_app.tsx"
  "https://raw.githubusercontent.com/rickMcGavin/next-starter-script/main/starter-files/styled.d.ts"
  "https://raw.githubusercontent.com/rickMcGavin/next-starter-script/main/starter-files/index.tsx"
  "https://raw.githubusercontent.com/rickMcGavin/next-starter-script/main/starter-files/.eslintrc.json"
  "https://raw.githubusercontent.com/rickMcGavin/next-starter-script/main/starter-files/.prettierrc.json"
)

echo "Downloading and saving files from gists"
for i in ${!writePaths[@]}; do
  wget -O ${writePaths[$i]} ${readUrls[$i]}
done