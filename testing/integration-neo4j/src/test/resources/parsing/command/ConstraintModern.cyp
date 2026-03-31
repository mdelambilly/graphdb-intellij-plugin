// Modern constraint syntax (Neo4j 4.4+)

// Unnamed, IS UNIQUE
CREATE CONSTRAINT FOR (n:Person) REQUIRE n.name IS UNIQUE;

// Named, IS NOT NULL
CREATE CONSTRAINT myConstraint FOR (n:Person) REQUIRE n.email IS NOT NULL;

// Named, IF NOT EXISTS, IS NODE KEY
CREATE CONSTRAINT nodeKey IF NOT EXISTS FOR (n:Person) REQUIRE n.id IS NODE KEY;

// Relationship constraint, IS NOT NULL
CREATE CONSTRAINT FOR ()-[r:KNOWS]-() REQUIRE r.since IS NOT NULL;

// IS KEY (shorthand)
CREATE CONSTRAINT FOR (n:Person) REQUIRE n.id IS KEY;

// IS TYPED with type name
CREATE CONSTRAINT FOR (n:Person) REQUIRE n.age IS TYPED INTEGER;

// IS :: (coloncolon syntax)
CREATE CONSTRAINT FOR (n:Person) REQUIRE n.name IS :: STRING;

// Drop constraint
DROP CONSTRAINT myConstraint;

// Drop constraint with IF EXISTS
DROP CONSTRAINT myConstraint IF EXISTS;
