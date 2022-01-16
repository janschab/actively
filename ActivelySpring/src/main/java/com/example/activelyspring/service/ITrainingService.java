package com.example.activelyspring.service;

import com.example.activelyspring.model.TrainingRequest;
import com.example.activelyspring.model.TrainingResponse;
import com.example.activelyspring.utils.IntIdentifier;

public interface ITrainingService {

    TrainingResponse getTraining(IntIdentifier intIdentifier);

}
