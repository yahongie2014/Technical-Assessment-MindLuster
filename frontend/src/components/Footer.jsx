import React from "react";
import { Box, Typography, Link } from "@mui/material";

export default function Footer() {
  return (
    <Box
      component="footer"
      sx={{
        mt: 4,
        py: 2,
        borderTop: "1px solid #e0e0e0",
        textAlign: "center",
        backgroundColor: "#fafafa",
      }}
    >
      <Typography variant="body2" color="text.secondary">
        © {new Date().getFullYear()} Kanban Board. All rights reserved.
      </Typography>
      <Box sx={{ mt: 1 }}>
        <Link
          href="https://github.com/yahongie2014/Technical-Assessment-MindLuster"
          target="_blank"
          rel="noopener"
          underline="hover"
          sx={{ mx: 1 }}
        >
          Repo
        </Link>
        <Link
          href="https://coder79.me"
          target="_blank"
          rel="noopener"
          underline="hover"
          sx={{ mx: 1 }}
        >
          @ME
        </Link>
      </Box>
    </Box>
  );
}
