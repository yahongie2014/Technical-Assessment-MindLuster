<?php

namespace App\Http\Helpers;

use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\Response;

if (! function_exists('paginatedJsonResponse')) {
    function paginatedJsonResponse(?string $message = null, ?array $data = null, ?int $code = null, ?string $paginatedDataKey = null): JsonResponse
    {
        $code ??= Response::HTTP_OK;
        $paginatedDataKey ??= 'items';

        return response()->json([
            'status' => $code,
            'message' => $message ?? 'Data with paginated',
            'items' => $data[$paginatedDataKey],
            'pagination' => [
                'count' => (int) $data[$paginatedDataKey]->count(),
                'total' => (int) $data[$paginatedDataKey]->total(),
                'last_page' => (int) $data[$paginatedDataKey]->lastPage(),
                'per_page' => (int) $data[$paginatedDataKey]->perPage(),
                'current_page' => (int) $data[$paginatedDataKey]->currentPage(),
                'get_options' => $data[$paginatedDataKey]->getOptions(),
                'next_page_url' => $data[$paginatedDataKey]->nextPageUrl(),
            ],
        ], $code);
    }
}

if (! function_exists('responseSuccess')) {
    function responseSuccess($status = 200, $message = 'Success', $data = []): JsonResponse
    {
        return response()->json([
            'status' => $status,
            'message' => $message,
            'data' => $data,
        ], $status);
    }
}

if (! function_exists('responseFail')) {
    function responseFail($status = 422, $message = 'Failed', $data = []): JsonResponse
    {
        return response()->json([
            'status' => $status,
            'message' => $message,
            'data' => $data,
        ], $status);
    }
}