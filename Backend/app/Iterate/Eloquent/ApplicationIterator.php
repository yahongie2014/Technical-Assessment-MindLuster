<?php

namespace App\Iterate\Eloquent;

use App\Iterate\ApplicationIteratorInterface;
use App\Models\Application;

class ApplicationIterator implements ApplicationIteratorInterface
{
    private array $applications;
    private int $position = 0;

    public function __construct()
    {
        $this->applications = Application::with(['candidate', 'job', 'interviews'])->get()->toArray();
    }

    public function hasNext(): bool
    {
        return $this->position < count($this->applications);
    }

    public function next()
    {
        if ($this->hasNext()) {
            return $this->applications[$this->position++];
        }
        return null;
    }


    public function filterByStage(string $stage, int $perPage = 10, int $page = 1): \Generator
    {
        $start = ($page - 1) * $perPage;
        $end = $start + $perPage;
        $index = 0;

        foreach ($this->applications as $app) {
            if ($app['stage'] === $stage) {
                if ($index >= $start && $index < $end) {
                    yield $app;
                }
                $index++;
            }
        }
    }



    public function countByStage(string $stage): int
    {
        return count(array_filter($this->applications, fn($app) => $app['stage'] === $stage));
    }
}
