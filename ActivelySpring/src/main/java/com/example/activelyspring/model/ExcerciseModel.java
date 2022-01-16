package com.example.activelyspring.model;

import java.time.Instant;

public class ExcerciseModel {

    private int series;
    private int reps;
    private Instant breakDuration;

    public int getSeries() {
        return series;
    }

    public void setSeries(int series) {
        this.series = series;
    }

    public int getReps() {
        return reps;
    }

    public void setReps(int reps) {
        this.reps = reps;
    }

    public Instant getBreakDuration() {
        return breakDuration;
    }

    public void setBreakDuration(Instant breakDuration) {
        this.breakDuration = breakDuration;
    }
}
