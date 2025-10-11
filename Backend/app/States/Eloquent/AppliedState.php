<?php

namespace App\States\Eloquent;

use App\Models\Application;
use App\States\ApplicationStageStateInterface;
use App\States\Eloquent\PhoneScreenState;

class AppliedState implements ApplicationStageStateInterface
{
    public const NAME = 'applied';

    public function moveToNext(Application $application): void
    {
        $application->stage = PhoneScreenState::NAME;
        $application->save();

        $application->histories()->create([
            'from_stage' => self::NAME,
            'to_stage'   => PhoneScreenState::NAME,
        ]);
    }

    public function getName(): string
    {
        return self::NAME;
    }
}
