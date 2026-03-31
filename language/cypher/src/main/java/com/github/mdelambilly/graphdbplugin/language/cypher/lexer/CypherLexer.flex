/**
 * Copied and adapted from plugin
 * <a href="https://github.com/neueda/jetbrains-plugin-graph-database-support">Graph Database Support</a>
 * by Neueda Technologies, Ltd.
 * Modified by Alberto Venturini, 2022
 * Modified by Michel de Lambilly, 2026
 */

package com.github.mdelambilly.graphdbplugin.language.cypher.lexer;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;

import static com.intellij.psi.TokenType.BAD_CHARACTER;
import static com.intellij.psi.TokenType.WHITE_SPACE;
import static com.github.mdelambilly.graphdbplugin.language.cypher.CypherParserDefinition.LINE_COMMENT;
import static com.github.mdelambilly.graphdbplugin.language.cypher.CypherParserDefinition.BLOCK_COMMENT;
import static com.github.mdelambilly.graphdbplugin.language.cypher.psi.CypherTypes.*;

%%

%{
  public CypherLexer() {
    this((java.io.Reader)null);
  }
%}

%public
%class CypherLexer
%implements FlexLexer
%function advance
%type IElementType
%unicode

EOL=\R
WHITE_SPACE=\s+

// ===== Existing keywords =====
K_MATCH=[Mm][Aa][Tt][Cc][Hh]
K_RETURN=[Rr][Ee][Tt][Uu][Rr][Nn]
K_DISTINCT=[Dd][Ii][Ss][Tt][Ii][Nn][Cc][Tt]
K_UNION=[Uu][Nn][Ii][Oo][Nn]
K_ALL=[Aa][Ll][Ll]
K_LOAD=[Ll][Oo][Aa][Dd]
K_CSV=[Cc][Ss][Vv]
K_WITH=[Ww][Ii][Tt][Hh]
K_HEADERS=[Hh][Ee][Aa][Dd][Ee][Rr][Ss]
K_FROM=[Ff][Rr][Oo][Mm]
K_AS=[Aa][Ss]
K_FIELDTERMINATOR=[Ff][Ii][Ee][Ll][Dd][Tt][Ee][Rr][Mm][Ii][Nn][Aa][Tt][Oo][Rr]
K_CREATE=[Cc][Rr][Ee][Aa][Tt][Ee]
K_CONSTRAINT=[Cc][Oo][Nn][Ss][Tt][Rr][Aa][Ii][Nn][Tt]
K_ON=[Oo][Nn]
K_ASSERT=[Aa][Ss][Ss][Ee][Rr][Tt]
K_IS=[Ii][Ss]
K_UNIQUE=[Uu][Nn][Ii][Qq][Uu][Ee]
K_EXISTS=[Ee][Xx][Ii][Ss][Tt][Ss]
K_INDEX=[Ii][Nn][Dd][Ee][Xx]
K_DROP=[Dd][Rr][Oo][Pp]
K_START=[Ss][Tt][Aa][Rr][Tt]
K_WHERE=[Ww][Hh][Ee][Rr][Ee]
K_NODE=[Nn][Oo][Dd][Ee]
K_RELATIONSHIP=[Rr][Ee][Ll][Aa][Tt][Ii][Oo][Nn][Ss][Hh][Ii][Pp]
K_REL=[Rr][Ee][Ll]
K_OPTIONAL=[Oo][Pp][Tt][Ii][Oo][Nn][Aa][Ll]
K_USING=[Uu][Ss][Ii][Nn][Gg]
K_JOIN=[Jj][Oo][Ii][Nn]
K_SCAN=[Ss][Cc][Aa][Nn]
K_SHORTESTPATH=[Ss][Hh][Oo][Rr][Tt][Ee][Ss][Tt][Pp][Aa][Tt][Hh]
K_ALLSHORTESTPATHS=[Aa][Ll][Ll][Ss][Hh][Oo][Rr][Tt][Ee][Ss][Tt][Pp][Aa][Tt][Hh][Ss]
K_UNWIND=[Uu][Nn][Ww][Ii][Nn][Dd]
K_MERGE=[Mm][Ee][Rr][Gg][Ee]
K_SET=[Ss][Ee][Tt]
K_DELETE=[Dd][Ee][Ll][Ee][Tt][Ee]
K_DETACH=[Dd][Ee][Tt][Aa][Cc][Hh]
K_REMOVE=[Rr][Ee][Mm][Oo][Vv][Ee]
K_FOREACH=[Ff][Oo][Rr][Ee][Aa][Cc][Hh]
K_IN=[Ii][Nn]
K_ORDER=[Oo][Rr][Dd][Ee][Rr]
K_BY=[Bb][Yy]
K_DESCENDING=[Dd][Ee][Ss][Cc][Ee][Nn][Dd][Ii][Nn][Gg]
K_DESC=[Dd][Ee][Ss][Cc]
K_ASCENDING=[Aa][Ss][Cc][Ee][Nn][Dd][Ii][Nn][Gg]
K_ASC=[Aa][Ss][Cc]
K_SKIP=[Ss][Kk][Ii][Pp]
K_LIMIT=[Ll][Ii][Mm][Ii][Tt]
K_BEGIN=[Bb][Ee][Gg][Ii][Nn]
K_COMMIT=[Cc][Oo][Mm][Mm][Ii][Tt]
K_XOR=[Xx][Oo][Rr]
K_OR=[Oo][Rr]
K_AND=[Aa][Nn][Dd]
K_NOT=[Nn][Oo][Tt]
K_STARTS=[Ss][Tt][Aa][Rr][Tt][Ss]
K_ENDS=[Ee][Nn][Dd][Ss]
K_CONTAINS=[Cc][Oo][Nn][Tt][Aa][Ii][Nn][Ss]
K_NULL=[Nn][Uu][Ll][Ll]
K_TRUE=[Tt][Rr][Uu][Ee]
K_FALSE=[Ff][Aa][Ll][Ss][Ee]
K_FILTER=[Ff][Ii][Ll][Tt][Ee][Rr]
K_EXTRACT=[Ee][Xx][Tt][Rr][Aa][Cc][Tt]
K_REDUCE=[Rr][Ee][Dd][Uu][Cc][Ee]
K_ANY=[Aa][Nn][Yy]
K_NONE=[Nn][Oo][Nn][Ee]
K_SINGLE=[Ss][Ii][Nn][Gg][Ll][Ee]
K_CASE=[Cc][Aa][Ss][Ee]
K_ELSE=[Ee][Ll][Ss][Ee]
K_END=[Ee][Nn][Dd]
K_WHEN=[Ww][Hh][Ee][Nn]
K_THEN=[Tt][Hh][Ee][Nn]
K_PROFILE=[Pp][Rr][Oo][Ff][Ii][Ll][Ee]
K_EXPLAIN=[Ee][Xx][Pp][Ll][Aa][Ii][Nn]
K_CYPHER=[Cc][Yy][Pp][Hh][Ee][Rr]
K_CALL=[Cc][Aa][Ll][Ll]
K_YIELD=[Yy][Ii][Ee][Ll][Dd]
K_COUNT=[Cc][Oo][Uu][Nn][Tt]
K_DO=[Dd][Oo]
K_FOR=[Ff][Oo][Rr]
K_REQUIRE=[Rr][Ee][Qq][Uu][Ii][Rr][Ee]
K_MANDATORY=[Mm][Aa][Nn][Dd][Aa][Tt][Oo][Rr][Yy]
K_SCALAR=[Ss][Cc][Aa][Ll][Aa][Rr]
K_OF=[Oo][Ff]
K_ADD=[Aa][Dd][Dd]
K_OPTIONS=[Oo][Pp][Tt][Ii][Oo][Nn][Ss]
K_ROWS=[Rr][Oo][Ww][Ss]

// ===== New keywords (Phase 1) =====
K_ACCESS=[Aa][Cc][Cc][Ee][Ss][Ss]
K_ACTIVE=[Aa][Cc][Tt][Ii][Vv][Ee]
K_ADMINISTRATOR=[Aa][Dd][Mm][Ii][Nn][Ii][Ss][Tt][Rr][Aa][Tt][Oo][Rr]
K_ADMIN=[Aa][Dd][Mm][Ii][Nn]
K_ALTER=[Aa][Ll][Tt][Ee][Rr]
K_ASSIGN=[Aa][Ss][Ss][Ii][Gg][Nn]
K_BOOSTED=[Bb][Oo][Oo][Ss][Tt][Ee][Dd]
K_BRIEF=[Bb][Rr][Ii][Ee][Ff]
K_BTREE=[Bb][Tt][Rr][Ee][Ee]
K_CATALOG=[Cc][Aa][Tt][Aa][Ll][Oo][Gg]
K_CHANGE=[Cc][Hh][Aa][Nn][Gg][Ee]
K_CONSTRAINTS=[Cc][Oo][Nn][Ss][Tt][Rr][Aa][Ii][Nn][Tt][Ss]
K_COPY=[Cc][Oo][Pp][Yy]
K_CURRENT=[Cc][Uu][Rr][Rr][Ee][Nn][Tt]
K_DATABASES=[Dd][Aa][Tt][Aa][Bb][Aa][Ss][Ee][Ss]
K_DATABASE=[Dd][Aa][Tt][Aa][Bb][Aa][Ss][Ee]
K_DBMS=[Dd][Bb][Mm][Ss]
K_DEFAULT=[Dd][Ee][Ff][Aa][Uu][Ll][Tt]
K_DEFINED=[Dd][Ee][Ff][Ii][Nn][Ee][Dd]
K_DENY=[Dd][Ee][Nn][Yy]
K_ELEMENTS=[Ee][Ll][Ee][Mm][Ee][Nn][Tt][Ss]
K_ELEMENT=[Ee][Ll][Ee][Mm][Ee][Nn][Tt]
K_EXECUTE=[Ee][Xx][Ee][Cc][Uu][Tt][Ee]
K_EXIST=[Ee][Xx][Ii][Ss][Tt]
K_FUNCTIONS=[Ff][Uu][Nn][Cc][Tt][Ii][Oo][Nn][Ss]
K_FUNCTION=[Ff][Uu][Nn][Cc][Tt][Ii][Oo][Nn]
K_GRANT=[Gg][Rr][Aa][Nn][Tt]
K_GRAPHS=[Gg][Rr][Aa][Pp][Hh][Ss]
K_GRAPH=[Gg][Rr][Aa][Pp][Hh]
K_IF=[Ii][Ff]
K_INDEXES=[Ii][Nn][Dd][Ee][Xx][Ee][Ss]
K_KEY=[Kk][Ee][Yy]
K_LABELS=[Ll][Aa][Bb][Ee][Ll][Ss]
K_LABEL=[Ll][Aa][Bb][Ee][Ll]
K_MANAGEMENT=[Mm][Aa][Nn][Aa][Gg][Ee][Mm][Ee][Nn][Tt]
K_NAMES=[Nn][Aa][Mm][Ee][Ss]
K_NAME=[Nn][Aa][Mm][Ee]
K_NEW=[Nn][Ee][Ww]
K_NODES=[Nn][Oo][Dd][Ee][Ss]
K_OUTPUT=[Oo][Uu][Tt][Pp][Uu][Tt]
K_PASSWORD=[Pp][Aa][Ss][Ss][Ww][Oo][Rr][Dd]
K_POPULATED=[Pp][Oo][Pp][Uu][Ll][Aa][Tt][Ee][Dd]
K_PRIVILEGES=[Pp][Rr][Ii][Vv][Ii][Ll][Ee][Gg][Ee][Ss]
K_PRIVILEGE=[Pp][Rr][Ii][Vv][Ii][Ll][Ee][Gg][Ee]
K_PROCEDURES=[Pp][Rr][Oo][Cc][Ee][Dd][Uu][Rr][Ee][Ss]
K_PROCEDURE=[Pp][Rr][Oo][Cc][Ee][Dd][Uu][Rr][Ee]
K_PROPERTY=[Pp][Rr][Oo][Pp][Ee][Rr][Tt][Yy]
K_READ=[Rr][Ee][Aa][Dd]
K_RELATIONSHIPS=[Rr][Ee][Ll][Aa][Tt][Ii][Oo][Nn][Ss][Hh][Ii][Pp][Ss]
K_REPLACE=[Rr][Ee][Pp][Ll][Aa][Cc][Ee]
K_REQUIRED=[Rr][Ee][Qq][Uu][Ii][Rr][Ee][Dd]
K_REVOKE=[Rr][Ee][Vv][Oo][Kk][Ee]
K_ROLES=[Rr][Oo][Ll][Ee][Ss]
K_ROLE=[Rr][Oo][Ll][Ee]
K_SHOW=[Ss][Hh][Oo][Ww]
K_STATUS=[Ss][Tt][Aa][Tt][Uu][Ss]
K_STOP=[Ss][Tt][Oo][Pp]
K_SUSPENDED=[Ss][Uu][Ss][Pp][Ee][Nn][Dd][Ee][Dd]
K_TO=[Tt][Oo]
K_TRAVERSE=[Tt][Rr][Aa][Vv][Ee][Rr][Ss][Ee]
K_TYPES=[Tt][Yy][Pp][Ee][Ss]
K_TYPED=[Tt][Yy][Pp][Ee][Dd]
K_TYPE=[Tt][Yy][Pp][Ee]
K_USERS=[Uu][Ss][Ee][Rr][Ss]
K_USER=[Uu][Ss][Ee][Rr]
K_VERBOSE=[Vv][Ee][Rr][Bb][Oo][Ss][Ee]
K_WRITE=[Ww][Rr][Ii][Tt][Ee]

// ===== Compound tokens (legacy, kept for backward compatibility) =====
// These use fragments that are NOT promoted to standalone tokens.
// The individual words (EACH, RANGE, LOOKUP, TEXT, POINT, TRANSACTIONS)
// remain as fragments only used in compounds.
_EACH=[Ee][Aa][Cc][Hh]
_RANGE=[Rr][Aa][Nn][Gg][Ee]
_LOOKUP=[Ll][Oo][Oo][Kk][Uu][Pp]
_TEXT=[Tt][Ee][Xx][Tt]
_POINT=[Pp][Oo][Ii][Nn][Tt]
_TRANSACTIONS=[Tt][Rr][Aa][Nn][Ss][Aa][Cc][Tt][Ii][Oo][Nn][Ss]

K_CREATE_INDEX={K_CREATE}{WHITE_SPACE}{K_INDEX}
K_CREATE_RANGE_INDEX={K_CREATE}{WHITE_SPACE}{_RANGE}{WHITE_SPACE}{K_INDEX}
K_CREATE_LOOKUP_INDEX={K_CREATE}{WHITE_SPACE}{_LOOKUP}{WHITE_SPACE}{K_INDEX}
K_CREATE_TEXT_INDEX={K_CREATE}{WHITE_SPACE}{_TEXT}{WHITE_SPACE}{K_INDEX}
K_CREATE_POINT_INDEX={K_CREATE}{WHITE_SPACE}{_POINT}{WHITE_SPACE}{K_INDEX}
K_IF_EXISTS={K_IF}{WHITE_SPACE}{K_EXISTS}
K_IF_NOT_EXISTS={K_IF}{WHITE_SPACE}{K_NOT}{WHITE_SPACE}{K_EXISTS}
K_ON_EACH_LABELS={K_ON}{WHITE_SPACE}{_EACH}{WHITE_SPACE}{K_LABELS}
K_ON_EACH_TYPE={K_ON}{WHITE_SPACE}{_EACH}{WHITE_SPACE}{K_TYPE}
K_ON_TYPE={K_ON}{WHITE_SPACE}{K_TYPE}
K_IN_TRANSACTIONS={K_IN}{WHITE_SPACE}{_TRANSACTIONS}

// ===== Literals =====
_DECIMAL_EXPONENT=[eE] [+-]? {_INTEGER_PART}+ {_PART_LETTER}*
_INTEGER_PART= "_"? [0-9]

L_IDENTIFIER={_LETTER}{_PART_LETTER}*
L_IDENTIFIER_TEXT=\`[^`]+\`
L_DECIMAL=[0-9] {_INTEGER_PART}* "_"? "." {_INTEGER_PART}+ {_DECIMAL_EXPONENT}? {L_IDENTIFIER}?
         | "." {_INTEGER_PART}+ {_DECIMAL_EXPONENT}? {L_IDENTIFIER}?
         | [0-9] {_INTEGER_PART}* {_DECIMAL_EXPONENT} {L_IDENTIFIER}?
L_HEX_INTEGER=0[xX][0-9a-fA-F]*
L_OCTAL_INTEGER=0"o"[0-7]*
L_INTEGER=0|[1-9][0-9]*
L_STRING=('([^'\\]|\\.)*'|\"([^\"\\]|\\.)*\")

_LETTER=[a-zA-Z]
_PART_LETTER=[a-zA-Z_$0-9]

LINE_COMMENT = "//" [^\r\n]*
BLOCK_COMMENT = "/*" ( ([^"*"]|[\r\n])* ("*"+ [^"*""/"] )? )* ("*" | "*"+"/")?

%%
<YYINITIAL> {
  {WHITE_SPACE}             { return WHITE_SPACE; }

  {LINE_COMMENT}            { return LINE_COMMENT; }
  {BLOCK_COMMENT}           { return BLOCK_COMMENT; }

  ";"                       { return SEMICOLON; }
  "("                       { return PARENTHESIS_OPEN; }
  ")"                       { return PARENTHESIS_CLOSE; }
  "{"                       { return BRACKET_CURLYOPEN; }
  "}"                       { return BRACKET_CURLYCLOSE; }
  "["                       { return BRACKET_SQUAREOPEN; }
  "]"                       { return BRACKET_SQUARECLOSE; }
  "$"                       { return DOLLAR; }
  "::"                      { return OP_COLONCOLON; }
  ":"                       { return OP_COLON; }
  "."                       { return OP_DOT; }
  "="                       { return OP_EQUAL; }
  "<"                       { return OP_LESSTHEN; }
  ">"                       { return OP_GREATHERTHEN; }
  "+"                       { return OP_PLUS; }
  "-"                       { return OP_MINUS; }
  "*"                       { return OP_MUL; }
  "`"                       { return OP_BACTICK; }
  ","                       { return OP_COMMA; }
  "?"                       { return OP_QUESTIONSIGN; }
  "|"                       { return OP_PIPE; }
  ".."                      { return OP_RANGE; }
  "+="                      { return OP_PLUSEQUALS; }
  "<>"                      { return OP_INVALIDNOTEQUALS; }
  "!="                      { return OP_NOTEQUALS; }
  "!"                       { return OP_EXCLAMATION; }
  "<="                      { return OP_LESSTHANEQUALS; }
  ">="                      { return OP_GREATERTHANEQUALS; }
  "/"                       { return OP_DIVIDE; }
  "%"                       { return OP_MODULO; }
  "^"                       { return OP_POW; }
  "&"                       { return OP_AMPERSAND; }
  "=~"                      { return OP_REGEXMATCH; }

  // === Compound tokens FIRST (longest match) ===
  {K_CREATE_RANGE_INDEX}    { return K_CREATE_RANGE_INDEX; }
  {K_CREATE_LOOKUP_INDEX}   { return K_CREATE_LOOKUP_INDEX; }
  {K_CREATE_TEXT_INDEX}     { return K_CREATE_TEXT_INDEX; }
  {K_CREATE_POINT_INDEX}    { return K_CREATE_POINT_INDEX; }
  {K_CREATE_INDEX}          { return K_CREATE_INDEX; }
  {K_IF_NOT_EXISTS}         { return K_IF_NOT_EXISTS; }
  {K_IF_EXISTS}             { return K_IF_EXISTS; }
  {K_ON_EACH_LABELS}        { return K_ON_EACH_LABELS; }
  {K_ON_EACH_TYPE}          { return K_ON_EACH_TYPE; }
  {K_ON_TYPE}               { return K_ON_TYPE; }
  {K_IN_TRANSACTIONS}       { return K_IN_TRANSACTIONS; }

  // === Keywords: longest first within prefix groups ===
  // ALLSHORTESTPATHS before ALL
  {K_ALLSHORTESTPATHS}      { return K_ALLSHORTESTPATHS; }
  // ADMINISTRATOR before ADMIN
  {K_ADMINISTRATOR}         { return K_ADMINISTRATOR; }
  // ASCENDING before ASC, ASSERT before AS
  {K_ASCENDING}             { return K_ASCENDING; }
  {K_ASSIGN}                { return K_ASSIGN; }
  {K_ASSERT}                { return K_ASSERT; }
  {K_ASC}                   { return K_ASC; }
  {K_AS}                    { return K_AS; }
  // CONSTRAINTS before CONSTRAINT, CONTAINS before COMMIT/COUNT/COPY
  {K_CONSTRAINTS}           { return K_CONSTRAINTS; }
  {K_CONSTRAINT}            { return K_CONSTRAINT; }
  {K_CONTAINS}              { return K_CONTAINS; }
  {K_CURRENT}               { return K_CURRENT; }
  // DATABASES before DATABASE
  {K_DATABASES}             { return K_DATABASES; }
  {K_DATABASE}              { return K_DATABASE; }
  // DESCENDING before DESC, DETACH before DELETE/DEFAULT/DEFINED/DENY
  {K_DESCENDING}            { return K_DESCENDING; }
  {K_DISTINCT}              { return K_DISTINCT; }
  // ELEMENTS before ELEMENT
  {K_ELEMENTS}              { return K_ELEMENTS; }
  {K_ELEMENT}               { return K_ELEMENT; }
  // EXISTS before EXIST, EXTRACT/EXPLAIN/EXECUTE before EX-
  {K_EXTRACT}               { return K_EXTRACT; }
  {K_EXPLAIN}               { return K_EXPLAIN; }
  {K_EXECUTE}               { return K_EXECUTE; }
  {K_EXISTS}                { return K_EXISTS; }
  {K_EXIST}                 { return K_EXIST; }
  // FOREACH before FOR, FUNCTIONS before FUNCTION, FIELDTERMINATOR/FILTER/FALSE
  {K_FOREACH}               { return K_FOREACH; }
  {K_FIELDTERMINATOR}       { return K_FIELDTERMINATOR; }
  {K_FUNCTIONS}             { return K_FUNCTIONS; }
  {K_FUNCTION}              { return K_FUNCTION; }
  // GRAPHS before GRAPH, GRANT
  {K_GRAPHS}                { return K_GRAPHS; }
  {K_GRAPH}                 { return K_GRAPH; }
  // INDEXES before INDEX
  {K_INDEXES}               { return K_INDEXES; }
  // LABELS before LABEL
  {K_LABELS}                { return K_LABELS; }
  {K_LABEL}                 { return K_LABEL; }
  // MANAGEMENT before MANDATORY/MATCH/MERGE
  {K_MANAGEMENT}            { return K_MANAGEMENT; }
  {K_MANDATORY}             { return K_MANDATORY; }
  // NAMES before NAME, NODES before NODE, NONE before NOT
  {K_NAMES}                 { return K_NAMES; }
  {K_NAME}                  { return K_NAME; }
  {K_NODES}                 { return K_NODES; }
  // OPTIONAL/OPTIONS before OR/ORDER/OUTPUT
  {K_OPTIONAL}              { return K_OPTIONAL; }
  {K_OPTIONS}               { return K_OPTIONS; }
  // PASSWORD, POPULATED, PRIVILEGES before PROCEDURE/PROCEDURES/PROFILE/PROPERTY
  {K_POPULATED}             { return K_POPULATED; }
  {K_PRIVILEGES}            { return K_PRIVILEGES; }
  {K_PROCEDURES}            { return K_PROCEDURES; }
  {K_PROCEDURE}             { return K_PROCEDURE; }
  // RELATIONSHIPS before RELATIONSHIP, REPLACE/REQUIRED/REVOKE/REMOVE/RETURN/REDUCE before RE-
  {K_RELATIONSHIPS}         { return K_RELATIONSHIPS; }
  {K_RELATIONSHIP}          { return K_RELATIONSHIP; }
  {K_REQUIRED}              { return K_REQUIRED; }
  {K_REPLACE}               { return K_REPLACE; }
  // ROLES before ROLE
  {K_ROLES}                 { return K_ROLES; }
  {K_ROLE}                  { return K_ROLE; }
  // SHORTESTPATH before SHOW/SINGLE/SKIP/STATUS/STOP/STARTS/SUSPENDED
  {K_SHORTESTPATH}          { return K_SHORTESTPATH; }
  {K_SUSPENDED}             { return K_SUSPENDED; }
  {K_STARTS}                { return K_STARTS; }
  // TRAVERSE/TRUE/TYPES/TYPED before TYPE/THEN/TO
  {K_TRAVERSE}              { return K_TRAVERSE; }
  {K_TYPES}                 { return K_TYPES; }
  {K_TYPED}                 { return K_TYPED; }
  {K_TYPE}                  { return K_TYPE; }
  // USERS before USER, USING/UNWIND/UNION/UNIQUE before U-
  {K_USERS}                 { return K_USERS; }
  {K_USER}                  { return K_USER; }
  // VERBOSE before VARIABLE

  // === Remaining keywords (no prefix conflicts) ===
  {K_MATCH}                 { return K_MATCH; }
  {K_RETURN}                { return K_RETURN; }
  {K_UNION}                 { return K_UNION; }
  {K_ALL}                   { return K_ALL; }
  {K_LOAD}                  { return K_LOAD; }
  {K_CSV}                   { return K_CSV; }
  {K_WITH}                  { return K_WITH; }
  {K_HEADERS}               { return K_HEADERS; }
  {K_FROM}                  { return K_FROM; }
  {K_CREATE}                { return K_CREATE; }
  {K_ON}                    { return K_ON; }
  {K_IS}                    { return K_IS; }
  {K_UNIQUE}                { return K_UNIQUE; }
  {K_INDEX}                 { return K_INDEX; }
  {K_DROP}                  { return K_DROP; }
  {K_START}                 { return K_START; }
  {K_WHERE}                 { return K_WHERE; }
  {K_NODE}                  { return K_NODE; }
  {K_REL}                   { return K_REL; }
  {K_USING}                 { return K_USING; }
  {K_JOIN}                  { return K_JOIN; }
  {K_SCAN}                  { return K_SCAN; }
  {K_UNWIND}                { return K_UNWIND; }
  {K_MERGE}                 { return K_MERGE; }
  {K_SET}                   { return K_SET; }
  {K_DELETE}                { return K_DELETE; }
  {K_DETACH}                { return K_DETACH; }
  {K_REMOVE}                { return K_REMOVE; }
  {K_IN}                    { return K_IN; }
  {K_ORDER}                 { return K_ORDER; }
  {K_BY}                    { return K_BY; }
  {K_DESC}                  { return K_DESC; }
  {K_SKIP}                  { return K_SKIP; }
  {K_LIMIT}                 { return K_LIMIT; }
  {K_BEGIN}                 { return K_BEGIN; }
  {K_COMMIT}                { return K_COMMIT; }
  {K_XOR}                   { return K_XOR; }
  {K_OR}                    { return K_OR; }
  {K_AND}                   { return K_AND; }
  {K_NOT}                   { return K_NOT; }
  {K_ENDS}                  { return K_ENDS; }
  {K_NULL}                  { return K_NULL; }
  {K_TRUE}                  { return K_TRUE; }
  {K_FALSE}                 { return K_FALSE; }
  {K_FILTER}                { return K_FILTER; }
  {K_REDUCE}                { return K_REDUCE; }
  {K_ANY}                   { return K_ANY; }
  {K_NONE}                  { return K_NONE; }
  {K_SINGLE}                { return K_SINGLE; }
  {K_CASE}                  { return K_CASE; }
  {K_ELSE}                  { return K_ELSE; }
  {K_END}                   { return K_END; }
  {K_WHEN}                  { return K_WHEN; }
  {K_THEN}                  { return K_THEN; }
  {K_PROFILE}               { return K_PROFILE; }
  {K_CYPHER}                { return K_CYPHER; }
  {K_CALL}                  { return K_CALL; }
  {K_YIELD}                 { return K_YIELD; }
  {K_COUNT}                 { return K_COUNT; }
  {K_DO}                    { return K_DO; }
  {K_FOR}                   { return K_FOR; }
  {K_REQUIRE}               { return K_REQUIRE; }
  {K_SCALAR}                { return K_SCALAR; }
  {K_OF}                    { return K_OF; }
  {K_ADD}                   { return K_ADD; }
  {K_ROWS}                  { return K_ROWS; }

  // New keywords (no prefix conflicts)
  {K_ACCESS}                { return K_ACCESS; }
  {K_ACTIVE}                { return K_ACTIVE; }
  {K_ADMIN}                 { return K_ADMIN; }
  {K_ALTER}                 { return K_ALTER; }
  {K_BOOSTED}               { return K_BOOSTED; }
  {K_BRIEF}                 { return K_BRIEF; }
  {K_BTREE}                 { return K_BTREE; }
  {K_CATALOG}               { return K_CATALOG; }
  {K_CHANGE}                { return K_CHANGE; }
  {K_COPY}                  { return K_COPY; }
  {K_DBMS}                  { return K_DBMS; }
  {K_DEFAULT}               { return K_DEFAULT; }
  {K_DEFINED}               { return K_DEFINED; }
  {K_DENY}                  { return K_DENY; }
  {K_GRANT}                 { return K_GRANT; }
  {K_IF}                    { return K_IF; }
  {K_KEY}                   { return K_KEY; }
  {K_NEW}                   { return K_NEW; }
  {K_OUTPUT}                { return K_OUTPUT; }
  {K_PASSWORD}              { return K_PASSWORD; }
  {K_PROPERTY}              { return K_PROPERTY; }
  {K_READ}                  { return K_READ; }
  {K_REVOKE}                { return K_REVOKE; }
  {K_SHOW}                  { return K_SHOW; }
  {K_STATUS}                { return K_STATUS; }
  {K_STOP}                  { return K_STOP; }
  {K_TO}                    { return K_TO; }
  {K_VERBOSE}               { return K_VERBOSE; }
  {K_WRITE}                 { return K_WRITE; }

  // === Identifiers and literals (must come AFTER all keywords) ===
  {L_IDENTIFIER}            { return L_IDENTIFIER; }
  {L_IDENTIFIER_TEXT}       { return L_IDENTIFIER_TEXT; }
  {L_DECIMAL}               { return L_DECIMAL; }
  {L_INTEGER}               { return L_INTEGER; }
  {L_STRING}                { return L_STRING; }
  {L_HEX_INTEGER}           { return L_HEX_INTEGER; }
  {L_OCTAL_INTEGER}         { return L_OCTAL_INTEGER; }

}

[^] { return BAD_CHARACTER; }
