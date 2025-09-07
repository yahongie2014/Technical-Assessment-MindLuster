import React, { useEffect, useState } from "react";
import {
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  TextField,
  MenuItem,
  Button,
} from "@mui/material";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import { api } from "../features/api";

export default function TaskDialog({ open, onClose, initial }) {
  const editing = !!initial?.id;
  const [form, setForm] = useState(
    initial || { title: "", description: "", status: "backlog" }
  );
  const qc = useQueryClient();

  useEffect(
    () => setForm(initial || { title: "", description: "", status: "backlog" }),
    [initial]
  );

  const createMut = useMutation({
    mutationFn: (payload) => api.create(payload),
    onSuccess: () => qc.invalidateQueries({ queryKey: ["tasks"] }),
  });
  const updateMut = useMutation({
    mutationFn: ({ id, patch }) => api.update(id, patch),
    onSuccess: () => qc.invalidateQueries({ queryKey: ["tasks"] }),
  });

  const handleSave = async () => {
    if (!form.title.trim()) return;
    if (editing) await updateMut.mutateAsync({ id: form.id, patch: form });
    else await createMut.mutateAsync(form);
    onClose();
  };

  return (
    <Dialog
      open={open}
      onClose={onClose}
      fullWidth
      maxWidth="sm"
      PaperProps={{
        sx: {
          border: "2px solid #1976d2",
          borderRadius: 2,
        },
      }}
    >
      <DialogTitle>{editing ? "Edit task" : "Add task"}</DialogTitle>
      <DialogContent>
        <TextField
          fullWidth
          margin="dense"
          label="Title"
          value={form.title}
          onChange={(e) => setForm({ ...form, title: e.target.value })}
        />
        <TextField
          fullWidth
          multiline
          minRows={3}
          margin="dense"
          label="Description"
          value={form.description}
          onChange={(e) => setForm({ ...form, description: e.target.value })}
        />
        <TextField
          select
          fullWidth
          margin="dense"
          label="Status"
          value={form.status}
          onChange={(e) => setForm({ ...form, status: e.target.value })}
        >
          <MenuItem value="backlog">Backlog</MenuItem>
          <MenuItem value="inprogress">In Progress</MenuItem>
          <MenuItem value="review">Review</MenuItem>
          <MenuItem value="done">Done</MenuItem>
        </TextField>
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose}>Cancel</Button>
        <Button variant="contained" onClick={handleSave}>
          {editing ? "Update" : "Create"}
        </Button>
      </DialogActions>
    </Dialog>
  );
}
