import React, { useState } from "react";
import {
  Container,
  Card,
  Box,
  Typography,
  TextField,
  Button,
} from "@mui/material";
import LockIcon from "@mui/icons-material/Lock";
import { login } from "../features/auth";

export default function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const onSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError("");
    try {
      await login(email, password);
      window.location.reload();
    } catch (err) {
      setError("Login failed try this: demo@example.com|password");
    } finally {
      setLoading(false);
    }
  };

  return (
    <>
      <Container maxWidth="xs" sx={{ mt: 12 }}>
        <Card variant="outlined" sx={{ p: 3 }}>
          <Box sx={{ display: "flex", alignItems: "center", gap: 1, mb: 2 }}>
            <LockIcon />
            <Typography variant="h6">User Login</Typography>
          </Box>
          <Box component="form" onSubmit={onSubmit}>
            <TextField
              fullWidth
              label="Email"
              margin="dense"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
            <TextField
              fullWidth
              type="password"
              label="Password"
              margin="dense"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
            {error && (
              <Typography color="error" variant="body2" sx={{ mt: 1 }}>
                {error}
              </Typography>
            )}
            <Button
              type="submit"
              variant="contained"
              fullWidth
              sx={{ mt: 2 }}
              disabled={loading}
            >
              {loading ? "Signing in…" : "Sign in"}
            </Button>
          </Box>
        </Card>
      </Container>

      <footer className="bg-gray-100 py-4 mt-10">
        <div className="container mx-auto text-center space-x-4">
          <a
            href="https://github.com/yahongie2014/Technical-Assessment-MindLuster"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center bg-black text-white px-4 py-2 rounded hover:bg-gray-900 space-x-2 transition"
          >
            <img
              src="https://www.logo.wine/a/logo/GitHub/GitHub-Icon-White-Dark-Background-Logo.wine.svg"
              alt="GitHub"
              className="w-6 h-6"
              style={{ width: "32px", height: "32px" }}
            />
            <span>GitHub</span>
          </a>

          <a
            href="https://documenter.getpostman.com/view/2836787/2sB3QMK8Z6"
            download
            className="inline-flex items-center bg-orange-600 text-white px-4 py-2 rounded hover:bg-orange-700 space-x-2 transition"
            style={{
              backgroundColor: "#FF6C37",
            }}
          >
            <img
              src="https://www.svgrepo.com/show/354202/postman-icon.svg"
              alt="Postman"
              className="w-6 h-6"
              style={{
                width: "32px",
                height: "32px",
              }}
            />
            <span>Download Postman</span>
          </a>
        </div>
      </footer>
    </>
  );
}
