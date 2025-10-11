<?php

namespace App\States\Eloquent;

use App\Models\Application;
use App\States\ApplicationStageStateInterface;

class RejectedState implements ApplicationStageStateInterface
{
    public const NAME = 'rejected';

    public function moveToNext(Application $application): void
    {
        throw new \Exception("Application is rejected and cannot move to another stage.");
    }

    public function getName(): string
    {
        return self::NAME;
    }
}
