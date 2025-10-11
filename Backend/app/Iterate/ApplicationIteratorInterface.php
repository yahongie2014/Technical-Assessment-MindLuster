<?php

namespace App\Iterate;

interface ApplicationIteratorInterface
{
    public function next();
    public function hasNext(): bool;
    public function filterByStage(string $stage): \Generator;
}
