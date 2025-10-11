<?php

namespace App\States;

use App\Models\Application;

interface ApplicationStageStateInterface
{
    public function moveToNext(Application $application): void;
    public function getName(): string;
}
