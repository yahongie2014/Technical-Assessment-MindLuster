import { http } from "./auth";

const PREFIX = import.meta.env.VITE_API_PREFIX || "/api";

const uiToApi = (status, meta = {}) => {
  if (status === "backlog") return { column: "todo", meta };
  if (status === "done") return { column: "done", meta };
  if (status === "review") {
    const labels = Array.from(new Set([...(meta.labels || []), "review"]));
    return { column: "in_progress", meta: { ...meta, labels } };
  }
  // inprogress
  const labels = (meta.labels || []).filter((l) => l !== "review");
  return { column: "in_progress", meta: { ...meta, labels } };
};

const apiToUi = (task) => {
  const labels = task?.meta?.labels || [];
  if (task.column === "todo") return "backlog";
  if (task.column === "done") return "done";
  return labels.includes("review") ? "review" : "inprogress";
};

export const api = {
  list: async ({ q } = {}) => {
    const { data } = await http.get(`${PREFIX}/tasks`);
    const rows = Array.isArray(data) ? data : data?.data || [];

    const normalized = rows.map((r) => ({ ...r, status: apiToUi(r) }));
    if (!q || !q.trim()) return normalized;

    const query = q.toLowerCase();
    return normalized.filter(
      (t) =>
        (t.title || "").toLowerCase().includes(query) ||
        (t.description || "").toLowerCase().includes(query)
    );
  },
  create: async ({ title, description, status, priority = 1, meta = {} }) => {
    const mapped = uiToApi(status, meta);
    const payload = { title, description, priority, ...mapped };
    const { data } = await http.post(`${PREFIX}/tasks`, payload);
    const item = data?.data || data;
    return { ...item, status: apiToUi(item) };
  },

  update: async (id, { title, description, status, priority, meta } = {}) => {
    const patch = {};
    if (title !== undefined) patch.title = title;
    if (description !== undefined) patch.description = description;
    if (priority !== undefined) patch.priority = priority;
    if (status !== undefined || meta !== undefined) {
      Object.assign(patch, uiToApi(status ?? "inprogress", meta ?? {}));
    }

    const { data } = await http.put(`${PREFIX}/tasks/${id}`, patch);
    const item = data?.data || data;
    return { ...item, status: apiToUi(item) };
  },

  remove: async (id) => {
    await http.delete(`${PREFIX}/tasks/${id}`);
    return true;
  },
};

export default api;
