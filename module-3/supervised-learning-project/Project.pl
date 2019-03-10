   - PROJECT: Supervised Learning - Classification
      * Multiple class problem. Use `OneVsRestClassifier`.
      * Is your dataset balanced?
         - What is the balance between classes?
      * Train 2 different models
      * Give metrics (de los dos modelos)
         - Accuracy or Balanced Accuracy Score (if your dataset is not balanced)
         ```python
from sklearn.metrics import balanced_accuracy_score
score = balanced_accuracy_score(actual_values, predictions)
from sklearn.metrics import accuracy_score
score = accuracy_score(actual_values, predictions)
```
         - Precision
         - Recall
         - F1Score
         - ROC Curve 
         - AUC
         - Confussion Matrix (not normalized)