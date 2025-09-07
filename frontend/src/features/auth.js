import axios from "axios";

export const TOKEN_KEY = "kanban_demo_token";
const BASE_URL = import.meta.env.VITE_API_URL || "http://localhost:8000/api";
const API_PREFIX = import.meta.env.VITE_API_PREFIX || "";

export const http = axios.create({ baseURL: BASE_URL });

http.interceptors.request.use((cfg) => {
  const t = localStorage.getItem(TOKEN_KEY);
  if (t) cfg.headers.Authorization = `Bearer ${t}`;
  return cfg;
});

export const isAuthed = () => !!localStorage.getItem(TOKEN_KEY);

export const login = async (email, password) => {
  const { data } = await http.post(`${API_PREFIX}/auth/login`, {
    email,
    password,
  });
  if (!data?.token && !data?.access_token) {
    throw new Error("No token in response");
  }
  localStorage.setItem(TOKEN_KEY, data.token || data.access_token);
  return data.user || null;
};

export const logout = () => localStorage.removeItem(TOKEN_KEY);

export const __debug = { BASE_URL, API_PREFIX };
