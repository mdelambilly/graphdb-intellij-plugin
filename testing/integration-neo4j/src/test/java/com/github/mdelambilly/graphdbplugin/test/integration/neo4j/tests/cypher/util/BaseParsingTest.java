/**
 * Copied and adapted from plugin
 * <a href="https://github.com/neueda/jetbrains-plugin-graph-database-support">Graph Database Support</a>
 * by Neueda Technologies, Ltd.
 * Modified by Alberto Venturini, 2022
 * Modified by Michel de Lambilly, 2026
 */
package com.github.mdelambilly.graphdbplugin.test.integration.neo4j.tests.cypher.util;

import com.github.mdelambilly.graphdbplugin.language.cypher.CypherParserDefinition;
import com.google.common.io.Resources;
import com.intellij.testFramework.ParsingTestCase;

import java.io.File;
import java.net.URISyntaxException;

/**
 * Base for all parsing test cases.
 */
public abstract class BaseParsingTest  extends ParsingTestCase {

    public BaseParsingTest(String testDataFolder) {
        super(testDataFolder, "cyp", new CypherParserDefinition());
    }

    @Override
    protected String getTestDataPath() {
        try {
            return new File(Resources.getResource("parsing").toURI()).getAbsolutePath();
        } catch (URISyntaxException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected boolean skipSpaces() {
        return true;
    }

    @Override
    protected boolean includeRanges() {
        return true;
    }

// UNCOMMENT TO REGENERATE RESULT TESTS FILES
// THEN RUN git add --renormalize .
//    @Override
//    protected void checkResult(@org.jetbrains.annotations.NotNull String targetDataName,
//                               @org.jetbrains.annotations.NotNull com.intellij.psi.PsiFile file) {
//        ensureCorrectReparse(file);
//        String actual = toParseTreeText(file, skipSpaces(), includeRanges()).trim();
//        String buildPath = myFullDataPath + java.io.File.separator + targetDataName + ".txt";
//        String srcPath = buildPath.replace(
//                java.io.File.separator + "build" + java.io.File.separator + "resources" + java.io.File.separator + "test" + java.io.File.separator,
//                java.io.File.separator + "src" + java.io.File.separator + "test" + java.io.File.separator + "resources" + java.io.File.separator
//        );
//        try {
//            java.nio.file.Files.writeString(java.nio.file.Path.of(srcPath), actual);
//        } catch (java.io.IOException e) {
//            throw new RuntimeException("Failed to write " + srcPath, e);
//        }
//    }
}
