## W4-D3
- Interactive plots with `plot.ly`
- Install mongodb: 
    * https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/
    * https://docs.mongodb.com/manual/administration/install-on-linux/
- MongoDB basics
    * Insert/Edit JSON documents
    * Basic comparision queries: https://docs.mongodb.com/manual/reference/operator/query-comparison/
    * Array Queries: https://docs.mongodb.com/manual/reference/operator/query-comparison/
    * Complex query with array:
        Get all restaurants that ends with "House" and cuisine is not Americar neither Irish that have 
        all grades greater than 10
    ```json
    {
        "name": /House$/,
        "cuisine": { "$nin": ["American", "Irish"] },
        "grades": {
            "$not":{
                "$elemMatch":{ "score":{"$lte": 10 }}
            }
        }
    }
    ```
    * delete documents
    * ALL WITH COMPASS -> https://www.mongodb.com/products/compass
- Mongoimport to import JSON documents
    * `$ mongoimport --db datarest --collection restaurantes ~/Desktop/primer-dataset.json`
- MongoDB with Python
    * PyMongo client
        - https://api.mongodb.com/python/current/tutorial.html
    ```python
    from pymongo import MongoClient
    client = MongoClient()
    #client = MongoClient('localhost', 27017) # Default connection params
    # client = MongoClient('mongodb://localhost:27017') # Mongourl style
    
    # Get database
    db = client.test_database

    # Access collection
    collection = db.test_collection
    # collection = db['test-collection']

    # Insert document
    post = {
        "author": "Mike",
        "text": "My first blog post!"
    }
    db.posts.insert_one(postdict)

    # Find one query with simple filter
    db.posts.find_one({"author": "Mike"})
    # Find by id
    db.posts.find_one({"_id": post_id}) 

    # Count
    db.posts.count_documents()
    # Count with filter
    db.posts.count_documents({"author": "Mike"})

    # Filter and sort (example with $lt less-than operator)
    d = datetime.datetime(2009, 11, 12, 12)
    db.posts.find({"date": {"$lt": d}}).sort("author")

    ```
- (Mongo Queries) - https://github.com/ironhack-labs/lab-advance-querying-mongo
- (MBW Missing but wanted) - LAB ETL process with PyMongo

## W4-D4
- SPECIAL GUEST TALK: Advanced data visualization `https://d3js.org/`
- Processing data in python, pandas for mongoimport:
    * `df.to_json("rest_with_coords.json", orient="records", lines=True)`
    * `mongoimport --db restaurants --collection clean  rest_with_coords.json`
    * In compass, create a `2d sphere` index  with the `geojson` document key
- Geospatial range Queries in MongoDB with `pymongo`
    * GeoJSON Point `{ type: "Point", coordinates: [ 40, 5 ] }`
    * Create sphere2d index in python: `db.collection.createIndex( { <location field> : "2dsphere" } )`
    * Query `$near` operator: https://docs.mongodb.com/manual/reference/operator/query/near/#op._S_near
- Working with Geospartial data in Tableau.
    * How to arrange data in Tableau
    * Make a map visualization (place marks and organize data)
    * Filtering geospartial data in mongodb with `$near` geospartial query
- VISUALIZATION PROJECT Geospatial Business Intelligence (BI)
    * Make a geospartial analysis of the `companies` dataset
    * Things you know:
        - You have a software company with 50 employees
        - The company creates video games
        - Roles in your company: 20 developers, 20 Designers/Creatieves/UX/UI and 10 executives/managers
    * Do an analysis about placing the new company offices in the best environment based on the following criteria:
        - There should be software engineers working around
        - The surroundings must have a good ratio of big companies vs startups
        - Ensure you have in your surroundings companies that cover the interests of your team
        - Avoid old companies, prefer recently created ones
        
