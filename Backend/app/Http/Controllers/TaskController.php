<?php

namespace App\Http\Controllers;

use App\Http\Requests\TaskUpdateValidation;
use App\Http\Requests\TaskValidation;
use App\Http\Resources\TaskResource;
use App\Models\Task;
use http\Env\Response;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $user = $request->user();
        $column = $request->query('column');
        $tasks = $user->tasks()->column($column)->latest()->paginate(20);
        return TaskResource::collection($tasks)->additional([
            'filters' => ['column' => $column],
        ]);

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(TaskValidation $request)
    {
        $task = $request->user()->tasks()->create($request->validated());
        return (new TaskResource($task))->response()->setStatusCode(201);

    }

    /**
     * Display the specified resource.
     */
    public function show(Task $task)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Task $task)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(TaskUpdateValidation $request, $id)
    {
        $task = $request->user()->tasks()->find($id);
        if ($task) {
            $task->update($request->validated());
        } else {
            return response()->json(['message' => 'This Task Deleted !']);
        }
        return new TaskResource($task->fresh());
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, $id)
    {
        $task = $request->user()->tasks()->find($id);
        if ($task) {
            $task->delete();
        } else {
            return response()->json(['message' => 'Already Deleted !']);
        }
        return response()->json(['message' => 'Deleted']);

    }

}
