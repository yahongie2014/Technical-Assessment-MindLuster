<?php

namespace App\Models;

use App\States\ApplicationStageStateInterface;
use App\States\Eloquent\AppliedState;
use App\States\Eloquent\HiredState;
use App\States\Eloquent\InterviewState;
use App\States\Eloquent\PhoneScreenState;
use App\States\Eloquent\RejectedState;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use function Illuminate\Support\match;

class Application extends Model
{
    use HasFactory;

    protected $guarded = [];

    public static function initialStage(): string
    {
        return AppliedState::NAME;
    }

    /**
     * Relations
     */
    public function job()
    {
        return $this->belongsTo(Job::class);
    }

    public function candidate()
    {
        return $this->belongsTo(Candidate::class);
    }

    public function interviews()
    {
        return $this->hasMany(Interview::class);
    }

    /*
    |--------------------------------------------------------------------------
    | State Machine Logic
    |--------------------------------------------------------------------------
    */

    public function moveToNextStage(): void
    {
        $this->getStateInstance()->moveToNext($this);
    }

    public function getStateInstance(): ApplicationStageStateInterface
    {
        return match($this->stage){
        AppliedState::NAME      => new AppliedState(),
            PhoneScreenState::NAME  => new PhoneScreenState(),
            InterviewState::NAME    => new InterviewState(),
            HiredState::NAME        => new HiredState(),
            RejectedState::NAME     => new RejectedState(),
            default                 => new AppliedState(),
        };
    }

    public function reject(): void
    {
        if ($this->stage === RejectedState::NAME) {
            throw new \Exception("Application is already rejected.");
        }

        $from = $this->stage;
        $this->stage = RejectedState::NAME;
        $this->save();

        $this->histories()->create([
            'from_stage' => $from,
            'to_stage' => RejectedState::NAME,
        ]);
    }

    public function histories()
    {
        return $this->hasMany(ApplicationStageHistory::class);
    }
}
