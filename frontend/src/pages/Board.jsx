import React, { useMemo, useState } from "react";
import {
  AppBar,
  Toolbar,
  Typography,
  Container,
  TextField,
  Button,
  Grid,
  InputAdornment,
  Box,
} from "@mui/material";
import AddIcon from "@mui/icons-material/Add";
import SearchIcon from "@mui/icons-material/Search";
import { DragDropContext } from "@hello-pangea/dnd";
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { api } from "../features/api";
import { logout } from "../features/auth";
import Column from "../components/Column";
import TaskDialog from "../components/TaskDialog";

const STATUSES = ["backlog", "inprogress", "review", "done"];
const isStatus = (s) => STATUSES.includes(s);

export default function Board() {
  const qc = useQueryClient();
  const [search, setSearch] = useState("");
  const [dialogOpen, setDialogOpen] = useState(false);
  const [editing, setEditing] = useState(null);

  const { data: allTasks = [], isFetching } = useQuery({
    queryKey: ["tasks"],
    queryFn: () => api.list(),
    staleTime: 5 * 60 * 1000,
  });

  const filtered = useMemo(() => {
    if (!search.trim()) return allTasks;
    const q = search.toLowerCase();
    return allTasks.filter(
      (t) =>
        (t.title || "").toLowerCase().includes(q) ||
        (t.description || "").toLowerCase().includes(q)
    );
  }, [search, allTasks]);

  const delMut = useMutation({
    mutationFn: (id) => api.remove(id),
    onSuccess: () => qc.invalidateQueries({ queryKey: ["tasks"] }),
  });

  const moveMut = useMutation({
    mutationFn: ({ id, toStatus }) => api.update(id, { status: toStatus }),
    onMutate: async ({ id, toStatus }) => {
      await qc.cancelQueries({ queryKey: ["tasks"] });
      const prev = qc.getQueryData(["tasks"]);
      qc.setQueryData(["tasks"], (old = []) =>
        old.map((t) =>
          String(t.id) === String(id) ? { ...t, status: toStatus } : t
        )
      );
      return { prev };
    },
    onError: (_err, _vars, ctx) => {
      if (ctx?.prev) qc.setQueryData(["tasks"], ctx.prev);
    },
    onSettled: () => qc.invalidateQueries({ queryKey: ["tasks"] }),
  });

  const grouped = useMemo(
    () => ({
      backlog: filtered.filter((t) => t.status === "backlog"),
      inprogress: filtered.filter((t) => t.status === "inprogress"),
      review: filtered.filter((t) => t.status === "review"),
      done: filtered.filter((t) => t.status === "done"),
    }),
    [filtered]
  );

  const [pBacklog, setPBacklog] = useState(1);
  const [pInprog, setPInprog] = useState(1);
  const [pReview, setPReview] = useState(1);
  const [pDone, setPDone] = useState(1);

  const onDragEnd = (result) => {
    const { destination, source, draggableId } = result;
    if (!destination) return;
    const from = source.droppableId;
    const to = destination.droppableId;
    if (!isStatus(from) || !isStatus(to)) return;
    if (from === to) return;
    moveMut.mutate({ id: draggableId, toStatus: to });
  };

  const handleEdit = (t) => {
    setEditing(t);
    setDialogOpen(true);
  };

  const handleDelete = (id) => delMut.mutate(id);

  return (
    <Container maxWidth="xl" sx={{ py: 2 }}>
      <AppBar position="static" color="default" elevation={0} sx={{ mb: 2 }}>
        <Toolbar sx={{ gap: 2, flexWrap: "wrap" }}>
          <Typography variant="h6">Kanban Dashboard</Typography>
          <TextField
            size="small"
            placeholder="Search tasks..."
            sx={{ minWidth: 420, flexGrow: 1, maxWidth: 560 }}
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            InputProps={{
              startAdornment: (
                <InputAdornment position="start">
                  <SearchIcon />
                </InputAdornment>
              ),
            }}
          />
          <Button
            startIcon={<AddIcon />}
            variant="contained"
            onClick={() => {
              setEditing(null);
              setDialogOpen(true);
            }}
          >
            Add Task
          </Button>
          <Button
            onClick={() => {
              logout();
              window.location.reload();
            }}
          >
            Logout
          </Button>
        </Toolbar>
      </AppBar>

      <DragDropContext onDragEnd={onDragEnd}>
        <Grid container spacing={2}>
          <Grid item xs={12} md={3}>
            <Column
              title="Backlog"
              status="backlog"
              tasks={grouped.backlog}
              onEdit={handleEdit}
              onDelete={handleDelete}
              pageState={[pBacklog, setPBacklog]}
            />
          </Grid>
          <Grid item xs={12} md={3}>
            <Column
              title="In Progress"
              status="inprogress"
              tasks={grouped.inprogress}
              onEdit={handleEdit}
              onDelete={handleDelete}
              pageState={[pInprog, setPInprog]}
            />
          </Grid>
          <Grid item xs={12} md={3}>
            <Column
              title="Review"
              status="review"
              tasks={grouped.review}
              onEdit={handleEdit}
              onDelete={handleDelete}
              pageState={[pReview, setPReview]}
            />
          </Grid>
          <Grid item xs={12} md={3}>
            <Column
              title="Done"
              status="done"
              tasks={grouped.done}
              onEdit={handleEdit}
              onDelete={handleDelete}
              pageState={[pDone, setPDone]}
            />
          </Grid>
        </Grid>
      </DragDropContext>

      <TaskDialog
        open={dialogOpen}
        onClose={() => setDialogOpen(false)}
        initial={editing}
      />

      {isFetching && (
        <Box sx={{ mt: 1 }}>
          <Typography variant="caption" color="text.secondary">
            Updating…
          </Typography>
        </Box>
      )}
    </Container>
  );
}
