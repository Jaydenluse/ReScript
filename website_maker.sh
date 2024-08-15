#!/bin/bash

# Check if a project name was provided
if [ $# -eq 0 ]; then
    echo "Please provide a project name."
    exit 1
fi

PROJECT_NAME=$1

# Create project directory
mkdir $PROJECT_NAME
cd $PROJECT_NAME

# Initialize npm project
npm init -y

# Install dependencies
npm install react react-dom react-router-dom
npm install -D vite @vitejs/plugin-react typescript @types/react @types/react-dom tailwindcss postcss autoprefixer
npm install -D eslint prettier eslint-config-prettier eslint-plugin-react eslint-plugin-react-hooks @typescript-eslint/eslint-plugin @typescript-eslint/parser

# Create ESLint config
cat > .eslintrc.json << EOL
{
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:react-hooks/recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier"
  ],
  "plugins": ["react", "react-hooks", "@typescript-eslint"],
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "ecmaVersion": 2021,
    "sourceType": "module",
    "ecmaFeatures": {
      "jsx": true
    }
  },
  "settings": {
    "react": {
      "version": "detect"
    }
  },
  "rules": {
    "react/react-in-jsx-scope": "off"
  }
}
EOL

# Create Prettier config
cat > .prettierrc << EOL
{
  "singleQuote": true,
  "trailingComma": "es5",
  "tabWidth": 2,
  "semi": true
}
EOL

# Add lint and format scripts to package.json
npm pkg set scripts.lint="eslint src --ext .js,.jsx,.ts,.tsx"
npm pkg set scripts.format="prettier --write \"src/**/*.{js,jsx,ts,tsx,css,md}\""

# Create Vite config
cat > vite.config.ts << EOL
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
})
EOL

# Initialize Tailwind CSS
npx tailwindcss init -p

# Update tailwind.config.js
cat > tailwind.config.js << EOL
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'dark-blue': '#0f172a',
        'light-blue': '#38bdf8',
        'gray-blue': '#334155',
      },
    },
  },
  plugins: [],
}
EOL

# Create src directory and files
mkdir src
cd src

# Create index.css with updated styles
cat > index.css << EOL
@tailwind base;
@tailwind components;
@tailwind utilities;

html, body {
  @apply bg-dark-blue;
  min-height: 100vh;
}

body {
  position: relative;
  margin: 0;
}

body::before,
body::after {
  content: '';
  position: fixed;
  left: 0;
  right: 0;
  height: 2px;
  background: linear-gradient(to right, #6366f1, #a855f7, #ec4899);
  z-index: 1000;
}

body::before {
  top: 0;
}

body::after {
  bottom: 0;
}

.text-gradient {
  background: linear-gradient(to right, #6b98b6, #4bc3ff);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
EOL

# Create main.tsx
cat > main.tsx << EOL
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
EOL

# Create App.tsx
cat > App.tsx << EOL
import { HashRouter as Router, Routes, Route } from 'react-router-dom';
import Layout from './components/Layout';
import Home from './pages/Home';
import About from './pages/About';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<Home />} />
          <Route path="about" element={<About />} />
        </Route>
      </Routes>
    </Router>
  );
}

export default App;
EOL

# Create components directory and Layout.tsx
mkdir components
cat > components/Layout.tsx << EOL
import React from 'react';
import { Outlet, Link, useLocation } from 'react-router-dom';

const Layout: React.FC = () => {
  const location = useLocation();

  const isActive = (path: string) => {
    return location.pathname === path ? 'bg-gray-blue' : '';
  };

  return (
    <div className="min-h-screen flex flex-col bg-dark-blue text-white">
      <header className="bg-gray-blue shadow-lg">
        <div className="container mx-auto px-4 py-6">
          <nav>
            <ul className="flex space-x-4">
              <li>
                <Link to="/" className={\`px-4 py-2 rounded-md transition duration-300 ease-in-out \${isActive('/')} hover:bg-light-blue hover:text-dark-blue\`}>
                  Home
                </Link>
              </li>
              <li>
                <Link to="/about" className={\`px-4 py-2 rounded-md transition duration-300 ease-in-out \${isActive('/about')} hover:bg-light-blue hover:text-dark-blue\`}>
                  About
                </Link>
              </li>
            </ul>
          </nav>
        </div>
      </header>
      <main className="flex-grow container mx-auto px-4 py-8">
        <Outlet />
      </main>
      <footer className="bg-gray-blue py-6">
        <div className="container mx-auto px-4 text-center">
          <p>&copy; {new Date().getFullYear()} Raybone. All rights reserved.</p>
        </div>
      </footer>
    </div>
  );
};

export default Layout;
EOL

mkdir pages

# Create Home.tsx with new styling
cat > pages/Home.tsx << EOL
import React from 'react';

const Home = () => {
  return (
    <div className="max-w-4xl mx-auto">
      <h1 className="text-5xl font-bold mb-4 text-gradient">Welcome...</h1>
      <p className="text-xl text-gray-400 mb-8">
          Quickly set up a modern React application with Tailwind CSS and Vite, so you can focus on building great features.
      </p>
      <div className="flex space-x-4 mb-12">
        <button className="bg-light-blue text-dark-blue px-6 py-2 rounded-md hover:bg-blue-400 transition duration-300">
          Get Started
        </button>
        <button className="border border-light-blue text-light-blue px-6 py-2 rounded-md hover:bg-gray-blue transition duration-300">
          View on GitHub
        </button>
      </div>
      <div className="bg-gray-blue rounded-lg p-6 shadow-lg">
        <h2 className="text-2xl font-semibold mb-4 text-light-blue">Features</h2>
        <ul className="list-disc list-inside space-y-2 text-gray-300">
          <li>React for building user interfaces</li>
          <li>Tailwind CSS for rapid styling</li>
          <li>Vite for fast development and building</li>
          <li>TypeScript for type safety</li>
          <li>React Router for seamless navigation</li>
          <li>Automatic project structure setup</li>
        </ul>
      </div>
    </div>
  );
};

export default Home;
EOL

# Create About.tsx with new styling
cat > pages/About.tsx << EOL
import React from 'react';

const About = () => {
  return (
    <div className="max-w-4xl mx-auto">
      <h1 className="text-5xl font-bold mb-8 text-gradient text-center">About...</h1>
      <div className="bg-gray-blue rounded-lg p-6 shadow-lg">
        <p className="text-xl text-gray-300 mb-6">
          This script is designed to streamline the process of setting up a modern React application, saving developers time and ensuring best practices are followed from the start.
        </p>
        <h2 className="text-2xl font-semibold mb-4 text-light-blue">Purpose</h2>
        <p className="text-gray-300 mb-6">
            To accelerate the initial phase of React development by automating the setup of a robust, scalable project structure with cutting-edge tools and technologies.
        </p>
        <h2 className="text-2xl font-semibold mb-4 text-light-blue">Key Features</h2>
        <ul className="list-disc list-inside space-y-2 text-gray-300">
          <li>One-command setup for a complete React project</li>
          <li>Integration of Vite for lightning-fast builds and hot module replacement</li>
          <li>Preconfigured Tailwind CSS for rapid UI development</li>
          <li>TypeScript support for enhanced code quality and developer experience</li>
          <li>React Router setup for seamless navigation in single-page applications</li>
          <li>Customizable project structure that follows best practices</li>
        </ul>
        <h2 className="text-2xl font-semibold mt-6 mb-4 text-light-blue">How It Works</h2>
        <p className="text-gray-300 mb-6">
          Simply run the script with a project name, and it will:
        </p>
        <ol className="list-decimal list-inside space-y-2 text-gray-300">
          <li>Create a new directory for your project</li>
          <li>Initialize a new npm project</li>
          <li>Install all necessary dependencies</li>
          <li>Set up configuration files for Vite, TypeScript, and Tailwind CSS</li>
          <li>Create a basic project structure with sample components</li>
          <li>Configure scripts for development, building, and previewing your app</li>
        </ol>
      </div>
    </div>
  );
};

export default About;
EOL

# Go back to project root
cd ..

# Create index.html
cat > index.html << EOL
<!DOCTYPE html>
<html lang="en" class="bg-gray-blue">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ReScript</title>
  </head>
  <body class="bg-gray-blue">
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>
EOL

# Update package.json scripts
npm pkg set scripts.dev="vite"
npm pkg set scripts.build="tsc && vite build"
npm pkg set scripts.preview="vite preview"

echo "Project $PROJECT_NAME has been created successfully!"
echo "To start your development server, run:"
echo "cd $PROJECT_NAME && npm run dev"