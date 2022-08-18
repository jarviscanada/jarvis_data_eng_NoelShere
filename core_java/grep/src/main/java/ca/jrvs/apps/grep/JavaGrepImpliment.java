package ca.jrvs.apps.grep;

import java.io.*;
import java.util.*;


public class JavaGrepImpliment implements JavaGrep {

    //private final Logger logger = LoggerFactory.getLogger(JavaGrep.class);

    private String regex;
    private String rootPath;
    private String outFile;

    public static void main(String[] args) {

        if (args.length != 3)
        {
            throw new IllegalArgumentException("Usage: Javagrep regex rootpath outfile");
        }

        JavaGrepImpliment javaGrepImp = new JavaGrepImpliment(); // set JavaGrepImpliment class object
        javaGrepImp.setRegex(args[0]);
        javaGrepImp.setRootPath(args[1]);
        javaGrepImp.setOutFile(args[2]);

       // BasicConfigurator.configure();

        try{
            javaGrepImp.process(); // try to run process() function, if it doesnt catch and print error

        } catch (Exception e){
            e.printStackTrace(); // output error change later to log
        }

    }
    @Override
    public String getRegex() {
        return regex;
    }

    @Override
    public void setRegex(String regex) {
        this.regex = regex;
    }

    @Override
    public void process() throws IOException {


        List<String> Lines = new ArrayList<>();
        List<File> FilePath = listFiles(getRootPath()); // List file path

        for(File F: FilePath) // for each
        {
            for(String line: readLines(F))
            {
                if(containsPattern(line)) // if true add the matched line

                    Lines.add(line); // append all the lines to listFiles

            }
        }

        writeToFile(Lines);
    }

    @Override
    public List<String> readLines(File inputFile)
    {
        List<String> Read = new ArrayList<>();
        String Temp;
        try{
            BufferedReader br = new BufferedReader(new FileReader(inputFile));

            while((Temp = br.readLine()) != null){ // read until end of line
                Read.add(Temp); // append to list
            }
            br.close(); // close read cursor

        } catch (IOException ex){
            ex.printStackTrace(); // need to change to log
        }


        return Read;
    }



    @Override
    public List<File> listFiles(String rootDir) {

        File directory = new File(rootDir);
        List<File> fileList = new ArrayList<>();

        Queue<File> queue = new LinkedList<>();
        queue.add(directory);

        while(!queue.isEmpty()){

            File currentFile = queue.poll();
            if (currentFile.isDirectory()){
                queue.addAll(Arrays.asList(currentFile.listFiles()));
            }
            else{
                fileList.add(currentFile);
            }
        }

        return fileList;

    }

    @Override
    public boolean containsPattern(String line) {


        if (line.matches(getRegex()))
        {
            return true;
        }
        return false;
    }

    @Override
    public void writeToFile(List<String> lines) throws IOException {

        BufferedWriter bw = new BufferedWriter(new FileWriter(getOutFile()));



        for(String line : lines){
            bw.write(line);

            bw.newLine();
        }

        bw.close();

    }

    @Override
    public String getRootPath() {

        return rootPath;
    }

    @Override
    public void setRootPath(String rootPath) {
        this.rootPath = rootPath;
    }

    @Override
    public String getOutFile() {
        return outFile;
    }

    @Override
    public void setOutFile() {

    }

    @Override
    public void setOutFile(String outFile) {
        this.outFile = outFile;
    }



}
