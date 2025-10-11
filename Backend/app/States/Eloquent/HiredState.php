<?php

namespace App\States\Eloquent;

use App\Models\Application;
use App\States\ApplicationStageStateInterface;

class HiredState implements ApplicationStageStateInterface
{
    public const NAME = 'hired';

    public function moveToNext(Application $application): void
    {
        throw new \Exception("Application is already hired and cannot move to another stage.");
    }

    public function getName(): string
    {
        return self::NAME;
    }
}
