<?php

namespace App\States\Eloquent;

use App\Models\Application;
use App\States\ApplicationStageStateInterface;

class InterviewState implements ApplicationStageStateInterface
{
    public const NAME = 'interview';

    public function moveToNext(Application $application): void
    {
        $application->stage = HiredState::NAME;
        $application->save();

        $application->histories()->create([
            'from_stage' => self::NAME,
            'to_stage'   => HiredState::NAME,
        ]);
    }

    public function getName(): string
    {
        return self::NAME;
    }
}
