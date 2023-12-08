<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Ticket extends Model
{
    use HasFactory;

    protected $fillable = [
        'ref',
        'status',
        'trajet_id',
        'student_id',
    ];

    /**
     * Get trajet for the ticket
     *
     * @return BelongsTo
     */
    public function trajet(): BelongsTo
    {
        return $this->belongsTo(Trajet::class);
    }

    /**
     * Get student for the ticket
     *
     * @return BelongsTo
     */
    public function student(): BelongsTo
    {
        return $this->belongsTo(Student::class);
    }

    /**
     * Get payments for the ticket
     *
     * @return BelongsTo
     */
    public function payments(): HasMany
    {
        return $this->hasMany(Payment::class);
    }
}
