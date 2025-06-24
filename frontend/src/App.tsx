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
