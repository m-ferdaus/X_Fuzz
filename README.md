# X-Fuzz: An Evolving and Interpretable Neurofuzzy Learner for Data Streams


While evolving neuro-fuzzy systems have shown promise for learning from non-stationary streaming data with concept drift, most existing models lack transparency due to the limited interpretability of Takagi-Sugeno fuzzy architecture's linear rule consequents. The lack of transparency limits the reliability of crucial applications. To address this limitation, this paper proposes a new evolving neuro-fuzzy system called X-Fuzz that enhances interpretability by integrating the LIME technique to provide local explanations and evaluates them using faithfulness and monotonicity metrics. X-Fuzz is rigorously tested on streaming datasets with diverse concept drifts via prequential analysis. Experiments demonstrate X-Fuzz's capabilities in mining insights from large and dynamic data streams exhibiting diverse concept drifts including abrupt, gradual, recurring contextual, and cyclical drifts. In addition, for online runway exit prediction using real aviation data, X-Fuzz achieved 98.04\% accuracy, significantly exceeding recent methods. With its balance of efficiency and transparency, X-Fuzz represents a promising approach for trustworthy evolving artificial intelligence that can handle complex, non-stationary data streams in critical real-world settings.

By open-sourcing X-Fuzz, we aim to advance research into interpretable and trustworthy evolving fuzzy systems for critical real-world applications involving dynamic data streams.
# How to Cite
Please cite the following work if you want to use X_Fuzz.

@article{x-fuzz,
  title={X-Fuzz: An Evolving and Interpretable Neurofuzzy Learner for Data Streams},
  author={Ferdaus, Md Meftahul and Dam, Tanmoy and Alam, Sameer and Pham, Duc-Thinh},
  journal={IEEE Transactions on Artificial Intelligence}, 
  year={2023},
  publisher={IEEE}
}
