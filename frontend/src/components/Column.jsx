import React, { useEffect } from "react";
import {
  Card,
  CardContent,
  Typography,
  Box,
  Tooltip,
  IconButton,
  Pagination,
} from "@mui/material";
import EditIcon from "@mui/icons-material/Edit";
import DeleteIcon from "@mui/icons-material/Delete";
import { Droppable, Draggable } from "@hello-pangea/dnd";

const PAGE_SIZE = 5;

export default function Column({
  title,
  status,
  tasks,
  onEdit,
  onDelete,
  pageState,
}) {
  const [page, setPage] = pageState;
  const start = (page - 1) * PAGE_SIZE;
  const end = start + PAGE_SIZE;
  const totalPages = Math.max(1, Math.ceil(tasks.length / PAGE_SIZE));

  useEffect(() => {
    if (page > totalPages) setPage(1);
  }, [tasks.length, totalPages]);

  return (
    <Card variant="outlined" sx={{ p: 1, minHeight: 560 }}>
      <Typography variant="h6" sx={{ px: 1, py: 0.5 }}>
        {title}
      </Typography>

      <Droppable droppableId={status} type="TASK">
        {(provided) => (
          <Box
            ref={provided.innerRef}
            {...provided.droppableProps}
            sx={{ minHeight: 420 }}
          >
            {tasks.slice(start, end).map((t, index) => (
              <Draggable draggableId={String(t.id)} index={index} key={t.id}>
                {(p, snapshot) => (
                  <Card
                    ref={p.innerRef}
                    {...p.draggableProps}
                    {...p.dragHandleProps}
                    sx={{
                      m: 1,
                      borderRadius: 2,
                      boxShadow: snapshot.isDragging ? 4 : 0,
                      border: "1px solid #ccc",
                      transition: "border 0.2s ease",
                      "&:hover": {
                        border: "2px solid #1976d2",
                      },
                    }}
                  >
                    <CardContent>
                      <Typography
                        variant="subtitle1"
                        fontWeight={600}
                        gutterBottom
                      >
                        {t.title}
                      </Typography>
                      <Typography variant="body2" color="text.secondary">
                        {t.description}
                      </Typography>
                      <Box sx={{ display: "flex", gap: 1, mt: 1 }}>
                        <Tooltip title="Edit">
                          <IconButton size="small" onClick={() => onEdit(t)}>
                            <EditIcon fontSize="small" />
                          </IconButton>
                        </Tooltip>
                        <Tooltip title="Delete">
                          <IconButton
                            size="small"
                            onClick={() => onDelete(t.id)}
                          >
                            <DeleteIcon fontSize="small" />
                          </IconButton>
                        </Tooltip>
                      </Box>
                    </CardContent>
                  </Card>
                )}
              </Draggable>
            ))}
            {provided.placeholder}
          </Box>
        )}
      </Droppable>

      <Box sx={{ display: "flex", justifyContent: "center", py: 1 }}>
        <Pagination
          count={totalPages}
          page={page}
          onChange={(_, v) => setPage(v)}
          size="small"
        />
      </Box>
    </Card>
  );
}
