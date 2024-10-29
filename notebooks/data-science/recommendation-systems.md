# Recommendation Systems

??? note "Work in Progress"

    Please note that the notebook you are referring to is currently a work in progress and may continue to be under development for an extended period. This ongoing process ensures that the content remains up-to-date and relevant, reflecting the latest information and research. As such, some sections may be incomplete or subject to change.

## What are recommendation systems?
A recommendation engine filters the data using different algorithms and recommends the most relevant items to users. It first captures the past behavior of a customer and based on that, recommends products which the users might be likely to buy.

If we can recommend a few items to a customer based on their needs and interests, it will create a positive impact on the user experience and lead to frequent visits

## Content based filtering
Recommend products which are similar to the ones that a user has liked in the past.

Store all user information in a vector known as the profile vector, containing user past behavior. Create also a item vector for each item with the item information. Find the the similary between a user and all the items using a method like:
- cosine similarity;
- euclidean distance;
- pearson's correlation

### How to select items for recomendation
- Top-N: top n items are recomended based on decision by the business
- Rating Scale: a threshold is set and all movies above are recommended

## Collaborative filtering
- Doesn’t require features about the items or users to be known. It is suited for a set of different types of items.
- An help recommenders to not overspecialize in a user’s profile and recommend items that are completely different from what they have seen before.

### User-User collaborative filtering
- Finds the similarity score between users. Based on this similarity score, it then picks out the most similar users and recommends products which these similar users have liked or bought previously.

- Its not effective when there are a large number of users as it will take a lot of time to compute the similarity between all user pairs

### Item-Item collaorative
- Compute the similarity between each pair of items, which is effective when the number of users is more than the items being recommended.

## Cold Start
> *What if a new user or a new item is added*
There can be two types of cold start: visitor and product.

### Visitor cold Start
When a new user is introduced to the dataset without any history. Popular-based strategy can be applied to recommend the most popular / best selling products (based on recent popularity or regional trends). Another possible solution could be to recommend the products which would bring the maximum profit to the business.

### Product Cold Start
When a new product is launched and user action is crucial to determining its value.Can use content-based filtering in this case, using the content of the new product for recommendations

## Collaborative Filtering Model

```python
    n_users = ratings.user_id.unique().shape[0]
    n_items = ratings.movie_id.unique().shape[0]

data_matrix = np.zeros((n_users, n_items))
for line in ratings.itertuples():
    data_matrix[line[1]-1, line[2]-1] = line[3]

from sklearn.metrics.pairwise import pairwise_distances 
user_similarity = pairwise_distances(data_matrix, metric='cosine')
item_similarity = pairwise_distances(data_matrix.T, metric='cosine')


def predict(ratings, similarity, type='user'):
    if type == 'user':
        mean_user_rating = ratings.mean(axis=1)
        #We use np.newaxis so that mean_user_rating has same format as ratings
        ratings_diff = (ratings - mean_user_rating[:, np.newaxis])
        pred = mean_user_rating[:, np.newaxis] + similarity.dot(ratings_diff) / np.array([np.abs(similarity).sum(axis=1)]).T
    elif type == 'item':
        pred = ratings.dot(similarity) / np.array([np.abs(similarity).sum(axis=1)])
    return pred

user_prediction = predict(data_matrix, user_similarity, type='user')
item_prediction = predict(data_matrix, item_similarity, type='item')
```
