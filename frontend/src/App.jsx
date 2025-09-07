import React from 'react'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import Board from './pages/Board'
import Login from './pages/Login'
import { isAuthed } from './features/auth'

const client = new QueryClient()

export default function App() {
  return (
    <QueryClientProvider client={client}>
      {isAuthed() ? <Board /> : <Login />}
    </QueryClientProvider>
  )
}
