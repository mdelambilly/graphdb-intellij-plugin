/**
 * Copied and adapted from plugin
 * <a href="https://github.com/neueda/jetbrains-plugin-graph-database-support">Graph Database Support</a>
 * by Neueda Technologies, Ltd.
 * Modified by Alberto Venturini, 2022
 * Modified by Michel de Lambilly, 2026
 */
package com.github.mdelambilly.graphdbplugin.language.cypher.formatter.converter;

import com.github.mdelambilly.graphdbplugin.language.cypher.psi.CypherTypes;
import com.intellij.lang.ASTNode;
import com.intellij.openapi.editor.Document;
import com.intellij.psi.PsiElement;
import com.intellij.psi.impl.source.tree.TreeUtil;
import com.intellij.psi.tree.IElementType;
import com.intellij.psi.tree.TokenSet;
import com.intellij.util.containers.ContainerUtil;
import com.github.mdelambilly.graphdbplugin.language.cypher.formatter.CypherPreFormatter;
import com.github.mdelambilly.graphdbplugin.language.cypher.psi.CypherTokenType;
import org.jetbrains.annotations.NotNull;

import java.util.Map;
import java.util.Set;

public class KeywordCaseConverter extends AbstractCypherConverter {
    private static final Set<IElementType> TO_LOWER_CASE_SPECIAL = ContainerUtil.newHashSet(
            CypherTypes.K_TRUE,
            CypherTypes.K_FALSE,
            CypherTypes.K_EXISTS,
            CypherTypes.K_FILTER,
            CypherTypes.K_EXTRACT,
            CypherTypes.K_REDUCE,
            CypherTypes.K_ANY,
            CypherTypes.K_NONE,
            CypherTypes.K_SINGLE,
            // Phase 1: new keywords that should stay lowercase when used as identifiers
            CypherTypes.K_ACCESS,
            CypherTypes.K_ACTIVE,
            CypherTypes.K_ADMIN,
            CypherTypes.K_ADMINISTRATOR,
            CypherTypes.K_ALTER,
            CypherTypes.K_ASSIGN,
            CypherTypes.K_BOOSTED,
            CypherTypes.K_BRIEF,
            CypherTypes.K_BTREE,
            CypherTypes.K_CATALOG,
            CypherTypes.K_CHANGE,
            CypherTypes.K_CONSTRAINTS,
            CypherTypes.K_COPY,
            CypherTypes.K_CURRENT,
            CypherTypes.K_DATABASE,
            CypherTypes.K_DATABASES,
            CypherTypes.K_DBMS,
            CypherTypes.K_DEFAULT,
            CypherTypes.K_DEFINED,
            CypherTypes.K_DENY,
            CypherTypes.K_ELEMENT,
            CypherTypes.K_ELEMENTS,
            CypherTypes.K_EXECUTE,
            CypherTypes.K_EXIST,
            CypherTypes.K_FUNCTION,
            CypherTypes.K_FUNCTIONS,
            CypherTypes.K_GRANT,
            CypherTypes.K_GRAPH,
            CypherTypes.K_GRAPHS,
            CypherTypes.K_IF,
            CypherTypes.K_INDEXES,
            CypherTypes.K_KEY,
            CypherTypes.K_LABEL,
            CypherTypes.K_LABELS,
            CypherTypes.K_MANAGEMENT,
            CypherTypes.K_NAME,
            CypherTypes.K_NAMES,
            CypherTypes.K_NEW,
            CypherTypes.K_NODES,
            CypherTypes.K_OUTPUT,
            CypherTypes.K_PASSWORD,
            CypherTypes.K_POPULATED,
            CypherTypes.K_PRIVILEGES,
            CypherTypes.K_PROCEDURE,
            CypherTypes.K_PROCEDURES,
            CypherTypes.K_PROPERTY,
            CypherTypes.K_READ,
            CypherTypes.K_RELATIONSHIPS,
            CypherTypes.K_REPLACE,
            CypherTypes.K_REQUIRED,
            CypherTypes.K_REVOKE,
            CypherTypes.K_ROLE,
            CypherTypes.K_ROLES,
            CypherTypes.K_SHOW,
            CypherTypes.K_STATUS,
            CypherTypes.K_STOP,
            CypherTypes.K_SUSPENDED,
            CypherTypes.K_TO,
            CypherTypes.K_TRAVERSE,
            CypherTypes.K_TYPE,
            CypherTypes.K_TYPES,
            CypherTypes.K_USER,
            CypherTypes.K_USERS,
            CypherTypes.K_VERBOSE,
            CypherTypes.K_WRITE
    );

    private static final Map<IElementType, String> SPECIAL_KEYWORDS = Map.of(
            CypherTypes.K_SHORTESTPATH, "shortestPath",
            CypherTypes.K_ALLSHORTESTPATHS, "allShortestPaths",
            CypherTypes.K_ON_TYPE, "ON type",
            CypherTypes.K_ON_EACH_TYPE, "ON EACH type",
            CypherTypes.K_ON_EACH_LABELS, "ON EACH labels"
    );

    public KeywordCaseConverter(CypherPreFormatter.FormatterTask formatterTask, @NotNull Document document) {
        super(formatterTask, document);
    }

    @Override
    protected String convert(PsiElement element) {
        if (CypherTokenType.class.isAssignableFrom(element.getNode().getElementType().getClass())) {
            CypherTokenType type = (CypherTokenType) element.getNode().getElementType();
            if (type.getOriginalName().startsWith("K_")) {
                if (TreeUtil.findParent(element.getNode(), TokenSet.create(
                        CypherTypes.VARIABLE,
                        CypherTypes.LABEL_NAME,
                        CypherTypes.REL_TYPE_NAME,
                        CypherTypes.PROPERTY_KEY_NAME,
                        CypherTypes.NAMESPACE,
                        CypherTypes.PARAMETER,
                        CypherTypes.PROCEDURE_NAME)) != null) {
                    return null;
                }

                if (SPECIAL_KEYWORDS.containsKey(type)) {
                    return SPECIAL_KEYWORDS.get(type);
                }

                if (TO_LOWER_CASE_SPECIAL.contains(type)) {
                    return element.getText().toLowerCase();
                }

                if (type == CypherTypes.K_NULL) {
                    // if no K_IS sibling to K_NULL -> to lower case
                    ASTNode keywordIS = TreeUtil.findSiblingBackward(element.getNode(), CypherTypes.K_IS);
                    if (keywordIS == null) {
                        return element.getText().toLowerCase();
                    }
                }

                return element.getText().toUpperCase();
            }
        }

        return null;
    }
}
