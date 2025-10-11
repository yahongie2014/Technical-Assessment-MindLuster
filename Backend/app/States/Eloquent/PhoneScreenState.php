<?php

namespace App\States\Eloquent;

use App\Models\Application;
use App\States\ApplicationStageStateInterface;

class PhoneScreenState implements ApplicationStageStateInterface
{
    public const NAME = 'phone_screen';

    public function moveToNext(Application $application): void
    {
        $application->stage = InterviewState::NAME;
        $application->save();

        $application->histories()->create([
            'from_stage' => self::NAME,
            'to_stage'   => InterviewState::NAME,
        ]);
    }

    public function getName(): string
    {
        return self::NAME;
    }
}
