MATCH (n:Person) RETURN n;
MATCH (n:Person&Employee) RETURN n;
MATCH (n:Person|Animal) RETURN n;
MATCH (n:!Deleted) RETURN n;
MATCH (n:%) RETURN n;
MATCH (n:Person&!Intern|Animal) RETURN n;
MATCH (n:(Person|Animal)&!Deleted) RETURN n;
MATCH (n:Person:Employee) RETURN n;
MATCH ()-[r:KNOWS|LIKES]->() RETURN r;
MATCH ()-[r:KNOWS&!DEPRECATED]->() RETURN r;
MATCH (n IS Person) RETURN n;
MATCH (n IS Person&Employee) RETURN n;
MATCH (n) WHERE n:Person&Employee RETURN n;
MATCH (n) WHERE n IS Person RETURN n;
MATCH (n) WHERE n IS NULL RETURN n;
MATCH (n) WHERE n IS NOT NULL RETURN n;MATCH ()
MATCH (n);
MATCH (n), (n);
MATCH p=(n);
MATCH (n), p=(n);
MATCH SHORTESTPATH((n));
MATCH ALLSHORTESTPATHS((n));
MATCH (n:Label)
MATCH (n {param})
MATCH (n {key: "value"})
MATCH (n {key: "value", key: "value"})
MATCH (n)--(n);
MATCH (n)<--(n);
MATCH (n)-->(n);
MATCH (n)<-->(n);
MATCH (n)-[]-(n);
MATCH (n)-[var]-(n);
MATCH (n)-[var:Type]-(n);
MATCH (n)-[var:Type]-(n);
MATCH (n)-[var?]-(n);
MATCH (n)-[var?:Type]-(n);
MATCH (n)-[var:Type|:Type]-(n);
MATCH (n)-[var:Type|Type]-(n);
MATCH (n)-[var:Type*]-(n);
MATCH (n)-[var:Type*..]-(n);
MATCH (n)-[var:Type*2..]-(n);
MATCH (n)-[var:Type*..2]-(n);
MATCH (n)-[var:Type*2..2]-(n);
MATCH (n)-[var {param}]-(n);
MATCH (n)-[var {key: "value"}]-(n);
MATCH (n)-[var {key: "value", key: "value"}]-(n);
MATCH (n) - [:Type] -> (m)
