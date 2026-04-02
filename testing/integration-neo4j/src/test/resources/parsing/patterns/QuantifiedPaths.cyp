MATCH (a)-[:KNOWS]->{2,5}(b) RETURN b
MATCH (a)-[:KNOWS]->{3}(b) RETURN b
MATCH (a)-[:KNOWS]->+(b) RETURN b
MATCH (a)-[:KNOWS]->*(b) RETURN b
MATCH (a)-[:KNOWS]->{1,}(b) RETURN b
MATCH (a)-[:KNOWS]->{,3}(b) RETURN b
MATCH (a)-[:KNOWS]->(b)-[:LIKES]->(c) RETURN c
