#!/bin/bash

# REACT 18 COMPATIBILITY FIX - Execute this to solve all dependency issues

echo "🔧 Fixing React 19 compatibility issues..."

cd ~/Desktop/moviepoint/frontend

# Step 1: Complete cleanup
echo "Step 1: Complete cleanup..."
rm -rf node_modules package-lock.json
npm cache clean --force

# Step 2: Create React 18 compatible package.json
echo "Step 2: Creating React 18 compatible package.json..."
cat > package.json << 'EOF'
{
  "name": "moviemind-frontend",
  "private": true,
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "lint": "eslint . --ext ts,tsx --report-unused-disable-directives --max-warnings 0",
    "preview": "vite preview"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "axios": "^1.6.2",
    "@tanstack/react-query": "^5.15.5",
    "framer-motion": "^10.16.16",
    "lucide-react": "^0.292.0",
    "react-router-dom": "^6.20.1",
    "zustand": "^4.4.7"
  },
  "devDependencies": {
    "@types/react": "^18.2.43",
    "@types/react-dom": "^18.2.17",
    "@typescript-eslint/eslint-plugin": "^6.14.0",
    "@typescript-eslint/parser": "^6.14.0",
    "@vitejs/plugin-react": "^4.2.1",
    "autoprefixer": "^10.4.16",
    "eslint": "^8.55.0",
    "eslint-plugin-react-hooks": "^4.6.0",
    "eslint-plugin-react-refresh": "^0.4.5",
    "postcss": "^8.4.32",
    "tailwindcss": "^3.3.6",
    "typescript": "^5.2.2",
    "vite": "^5.0.8"
  }
}
EOF

# Step 3: Install with React 18
echo "Step 3: Installing React 18 compatible dependencies..."
npm install

# Step 4: Create Tailwind config files
echo "Step 4: Creating Tailwind configuration..."

cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#eff6ff',
          100: '#dbeafe',
          200: '#bfdbfe',
          300: '#93c5fd',
          400: '#60a5fa',
          500: '#3b82f6',
          600: '#2563eb',
          700: '#1d4ed8',
          800: '#1e40af',
          900: '#1e3a8a',
        },
        dark: {
          50: '#f8fafc',
          100: '#f1f5f9',
          200: '#e2e8f0',
          300: '#cbd5e1',
          400: '#94a3b8',
          500: '#64748b',
          600: '#475569',
          700: '#334155',
          800: '#1e293b',
          900: '#0f172a',
        }
      },
      animation: {
        'fade-in': 'fadeIn 0.5s ease-in-out',
        'slide-up': 'slideUp 0.3s ease-out',
        'slide-in': 'slideIn 0.3s ease-out',
        'pulse-slow': 'pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': { transform: 'translateY(10px)', opacity: '0' },
          '100%': { transform: 'translateY(0)', opacity: '1' },
        },
        slideIn: {
          '0%': { transform: 'translateX(-10px)', opacity: '0' },
          '100%': { transform: 'translateX(0)', opacity: '1' },
        },
      },
      fontFamily: {
        'sans': ['Inter', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [],
  darkMode: 'class',
}
EOF

cat > postcss.config.js << 'EOF'
export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

# Step 5: Update CSS with comprehensive Tailwind setup
echo "Step 5: Setting up Tailwind CSS..."
cat > src/index.css << 'EOF'
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
@tailwind base;
@tailwind components;
@tailwind utilities;

/* Custom base styles */
@layer base {
  html {
    scroll-behavior: smooth;
  }
  
  body {
    font-family: 'Inter', system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    @apply bg-gray-50 dark:bg-dark-900 text-gray-900 dark:text-gray-100;
  }
  
  * {
    @apply border-gray-200 dark:border-dark-700;
  }
}

/* Custom component styles */
@layer components {
  .btn {
    @apply px-4 py-2 rounded-lg font-medium transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2;
  }
  
  .btn-primary {
    @apply bg-primary-600 text-white hover:bg-primary-700 focus:ring-primary-500 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5;
  }
  
  .btn-secondary {
    @apply bg-gray-200 dark:bg-dark-700 text-gray-900 dark:text-gray-100 hover:bg-gray-300 dark:hover:bg-dark-600 focus:ring-gray-500;
  }
  
  .card {
    @apply bg-white dark:bg-dark-800 rounded-xl shadow-lg border border-gray-200 dark:border-dark-700 overflow-hidden;
  }
  
  .card-hover {
    @apply card transition-all duration-300 hover:shadow-2xl hover:-translate-y-1;
  }
  
  .input {
    @apply w-full px-4 py-3 border border-gray-300 dark:border-dark-600 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 bg-white dark:bg-dark-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 transition-colors;
  }
  
  .nav-link {
    @apply px-3 py-2 rounded-md text-sm font-medium transition-colors hover:bg-gray-100 dark:hover:bg-dark-700;
  }
  
  .nav-link-active {
    @apply nav-link bg-primary-100 dark:bg-primary-900 text-primary-700 dark:text-primary-300;
  }
}

/* Custom utilities */
@layer utilities {
  .text-gradient {
    @apply bg-gradient-to-r from-primary-600 to-purple-600 bg-clip-text text-transparent;
  }
  
  .bg-gradient-primary {
    @apply bg-gradient-to-br from-primary-500 to-purple-600;
  }
  
  .glass {
    @apply bg-white/10 backdrop-blur-md border border-white/20;
  }
  
  .glass-dark {
    @apply bg-black/10 backdrop-blur-md border border-black/20;
  }
  
  .scrollbar-hide {
    -ms-overflow-style: none;
    scrollbar-width: none;
  }
  
  .scrollbar-hide::-webkit-scrollbar {
    display: none;
  }
}

/* Loading skeleton animations */
.skeleton {
  @apply animate-pulse bg-gray-200 dark:bg-dark-700;
}

/* Image loading states */
.image-loading {
  @apply bg-gray-200 dark:bg-dark-700 animate-pulse;
}

.image-loaded {
  @apply animate-fade-in;
}

/* Error states */
.error-state {
  @apply text-red-600 dark:text-red-400 bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800;
}

/* Success states */
.success-state {
  @apply text-green-600 dark:text-green-400 bg-green-50 dark:bg-green-900/20 border border-green-200 dark:border-green-800;
}
EOF

# Step 6: Update main.tsx for React 18
echo "Step 6: Updating main.tsx for React 18..."
cat > src/main.tsx << 'EOF'
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
EOF

# Step 7: Create a working App.tsx
echo "Step 7: Creating working App component..."
cat > src/App.tsx << 'EOF'
import { useState } from 'react'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { Search, Film, Tv, Star, TrendingUp } from 'lucide-react'
import './App.css'

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      retry: 2,
      staleTime: 5 * 60 * 1000, // 5 minutes
      cacheTime: 10 * 60 * 1000, // 10 minutes
    },
  },
});

function App() {
  const [searchQuery, setSearchQuery] = useState('')
  const [darkMode, setDarkMode] = useState(false)

  const toggleDarkMode = () => {
    setDarkMode(!darkMode)
    document.documentElement.classList.toggle('dark')
  }

  return (
    <QueryClientProvider client={queryClient}>
      <div className={`min-h-screen transition-colors ${darkMode ? 'dark' : ''}`}>
        <div className="min-h-screen bg-gradient-to-br from-blue-50 via-white to-purple-50 dark:from-dark-900 dark:via-dark-800 dark:to-purple-900">
          {/* Header */}
          <header className="bg-white/80 dark:bg-dark-800/80 backdrop-blur-md border-b border-gray-200 dark:border-dark-700 sticky top-0 z-50">
            <div className="container mx-auto px-4 py-4">
              <div className="flex items-center justify-between">
                <div className="flex items-center space-x-2">
                  <Film className="h-8 w-8 text-primary-600" />
                  <h1 className="text-2xl font-bold text-gradient">
                    MovieMind
                  </h1>
                </div>
                <button
                  onClick={toggleDarkMode}
                  className="btn btn-secondary"
                >
                  {darkMode ? '☀️' : '🌙'}
                </button>
              </div>
            </div>
          </header>

          <main className="container mx-auto px-4 py-8">
            {/* Hero Section */}
            <section className="text-center mb-12">
              <h2 className="text-5xl font-bold text-gray-900 dark:text-white mb-4">
                Discover Your Next
                <span className="text-gradient"> Favorite Movie</span>
              </h2>
              <p className="text-xl text-gray-600 dark:text-gray-300 mb-8 max-w-2xl mx-auto">
                Search through millions of movies and TV shows. Get personalized recommendations and build your ultimate watchlist.
              </p>
              
              {/* Search Bar */}
              <div className="max-w-2xl mx-auto mb-8">
                <div className="relative">
                  <Search className="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-400 h-5 w-5" />
                  <input
                    type="text"
                    placeholder="Search for movies, TV shows..."
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    className="input pl-12 pr-4 py-4 text-lg"
                  />
                </div>
              </div>
            </section>

            {/* Status Cards */}
            <section className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-12">
              <div className="card-hover p-6 text-center">
                <div className="w-12 h-12 bg-primary-100 dark:bg-primary-900/30 rounded-full flex items-center justify-center mx-auto mb-4">
                  <Search className="h-6 w-6 text-primary-600 dark:text-primary-400" />
                </div>
                <h3 className="font-semibold text-gray-900 dark:text-white mb-2">
                  Smart Search
                </h3>
                <p className="text-sm text-gray-600 dark:text-gray-400">
                  ✅ Ready
                </p>
              </div>

              <div className="card-hover p-6 text-center">
                <div className="w-12 h-12 bg-green-100 dark:bg-green-900/30 rounded-full flex items-center justify-center mx-auto mb-4">
                  <Film className="h-6 w-6 text-green-600 dark:text-green-400" />
                </div>
                <h3 className="font-semibold text-gray-900 dark:text-white mb-2">
                  Movie Database
                </h3>
                <p className="text-sm text-gray-600 dark:text-gray-400">
                  ✅ Connected
                </p>
              </div>

              <div className="card-hover p-6 text-center">
                <div className="w-12 h-12 bg-purple-100 dark:bg-purple-900/30 rounded-full flex items-center justify-center mx-auto mb-4">
                  <Tv className="h-6 w-6 text-purple-600 dark:text-purple-400" />
                </div>
                <h3 className="font-semibold text-gray-900 dark:text-white mb-2">
                  TV Shows
                </h3>
                <p className="text-sm text-gray-600 dark:text-gray-400">
                  ✅ Available
                </p>
              </div>

              <div className="card-hover p-6 text-center">
                <div className="w-12 h-12 bg-yellow-100 dark:bg-yellow-900/30 rounded-full flex items-center justify-center mx-auto mb-4">
                  <Star className="h-6 w-6 text-yellow-600 dark:text-yellow-400" />
                </div>
                <h3 className="font-semibold text-gray-900 dark:text-white mb-2">
                  Watchlist
                </h3>
                <p className="text-sm text-gray-600 dark:text-gray-400">
                  ✅ Ready
                </p>
              </div>
            </section>

            {/* Tech Stack */}
            <section className="card p-8 text-center">
              <h3 className="text-2xl font-semibold mb-6 text-gray-900 dark:text-white">
                🚀 Frontend Setup Complete!
              </h3>
              <p className="text-gray-600 dark:text-gray-300 mb-8">
                All dependencies are properly configured. Ready to build amazing features!
              </p>
              
              <div className="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-5 gap-4">
                <div className="p-4 bg-blue-50 dark:bg-blue-900/20 rounded-lg">
                  <h4 className="font-semibold text-blue-700 dark:text-blue-300 mb-1">
                    React 18
                  </h4>
                  <p className="text-xs text-blue-600 dark:text-blue-400">
                    ✅ Stable
                  </p>
                </div>
                <div className="p-4 bg-cyan-50 dark:bg-cyan-900/20 rounded-lg">
                  <h4 className="font-semibold text-cyan-700 dark:text-cyan-300 mb-1">
                    Tailwind CSS
                  </h4>
                  <p className="text-xs text-cyan-600 dark:text-cyan-400">
                    ✅ Configured
                  </p>
                </div>
                <div className="p-4 bg-green-50 dark:bg-green-900/20 rounded-lg">
                  <h4 className="font-semibold text-green-700 dark:text-green-300 mb-1">
                    React Query
                  </h4>
                  <p className="text-xs text-green-600 dark:text-green-400">
                    ✅ Ready
                  </p>
                </div>
                <div className="p-4 bg-purple-50 dark:bg-purple-900/20 rounded-lg">
                  <h4 className="font-semibold text-purple-700 dark:text-purple-300 mb-1">
                    TypeScript
                  </h4>
                  <p className="text-xs text-purple-600 dark:text-purple-400">
                    ✅ Active
                  </p>
                </div>
                <div className="p-4 bg-orange-50 dark:bg-orange-900/20 rounded-lg">
                  <h4 className="font-semibold text-orange-700 dark:text-orange-300 mb-1">
                    Framer Motion
                  </h4>
                  <p className="text-xs text-orange-600 dark:text-orange-400">
                    ✅ Loaded
                  </p>
                </div>
              </div>

              <div className="mt-8 p-4 bg-gray-50 dark:bg-dark-700 rounded-lg">
                <p className="text-sm text-gray-600 dark:text-gray-400 mb-2">
                  🎯 <strong>Next Steps:</strong>
                </p>
                <div className="text-left text-sm text-gray-600 dark:text-gray-400 space-y-1">
                  <p>1. Set up Django backend API endpoints</p>
                  <p>2. Connect TMDB and OMDB APIs</p>
                  <p>3. Build search and detail components</p>
                  <p>4. Implement watchlist functionality</p>
                  <p>5. Add trending content dashboard</p>
                </div>
              </div>
            </section>
          </main>
        </div>
      </div>
    </QueryClientProvider>
  )
}

export default App
EOF

# Step 8: Test the setup
echo "Step 8: Testing the setup..."
npm run build
if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 SUCCESS! All dependencies resolved!"
    echo "✅ React 18: Installed"
    echo "✅ Tailwind CSS: Configured"
    echo "✅ TypeScript: Working"
    echo "✅ All packages: Compatible"
    echo ""
    echo "🚀 Start development server:"
    echo "   npm run dev"
    echo ""
    echo "🎯 Frontend is ready! Now focus on Django backend."
else
    echo "❌ Build failed. Check the error messages above."
fi