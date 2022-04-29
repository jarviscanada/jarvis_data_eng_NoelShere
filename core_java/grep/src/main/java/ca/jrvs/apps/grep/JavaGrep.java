package ca.jrvs.apps.grep;



import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Queue;

public interface JavaGrep {

    /**
     * Top level search workflow
     * @throws IOException
     */

    void process() throws IOException;

    /**
     * Traverse a given directory and return all files
     * @param rootDir input directory
     * @return files under the rootDir
     */

    List<File> listFiles (String rootDir);

    /**
     * Read a file and return all the lines
     *
     * Explain FileReader, BufferReader, and character encoding
     *
     *  file to be read
     * @return line
     * @throws IllegalArgumentException if a given inputFile is not a file
     * */

     List<String> readLines(File inputFile);
    /**
     * check if a line contains the regex pattern (passed by user)
     * @param line
     * @return true if there is a match
     */
     boolean containsPattern(String line);
    /**
     * Write lnes to a file
     * Explore: FileoutputStream, outputStreamwriter, and BufferWriter
     * @param lines matched lines
     * @throws IOException if write failed
     *
     */

    void writeToFile(List<String> lines) throws IOException;

    String getRootPath();

    void setRootPath(String rootPath);

    String getRegex();

    void setRegex(String regex);

    String getOutFile();

    void setOutFile();

    void setOutFile(String outFile);
}

