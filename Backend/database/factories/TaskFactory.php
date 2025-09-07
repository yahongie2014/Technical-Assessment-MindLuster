<?php

namespace Database\Factories;

use App\Models\Task;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Task>
 */
class TaskFactory extends Factory
{
    protected $model = Task::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {

        return [
            'title' => $this->faker->sentence(4),
            'description' => $this->faker->optional()->paragraph(),
            'column' => $this->faker->randomElement(['todo','in_progress','done']),
            'due_date' => $this->faker->optional()->dateTimeBetween('now','+30 days'),
            'priority' => $this->faker->numberBetween(1,5),
            'meta' => ['labels'=>$this->faker->randomElements(['bug','feature','urgent'], rand(0,2))],
        ];
    }
}
