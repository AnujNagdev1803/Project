/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package optimizinginformation;

/**
 *
 * @author Nikith1000Projects
 */
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.Set;

/**
 * Generates minhash for a collection of documents.  
 * 
 * The permutations are represented by randomized hash functions: ax + b % p.
 * p is a prime such that p >= n where n is the number of terms in the collection.
 * a and b are chosen uniformly at random from {1,2,...,p-1}.
 * 
 * MinHash matrix generated will by M * N.  M = number documents and N = number of permutations.
 * Each element in the MinHash matrix will be the MinHash value of the document.
 * @note: MinHash matrix has documents as rows and permutations as columns.
 * 
 * There is minimal preprocessing 
 * @author Alex Shum
 */
public class MinHash {
	File folder;
	int numPermutations;
	int numTerms;
	int mod; //p: ax + b % p
	

	
	/**
	 * Calculates the exact jaccard simularity between two documents.
	 * @param file1 Filename of first document.
	 * @param file2 Filename of second document.
	 * @return Jaccard simularity
	 * @throws IOException If files cannot be opened.
	 */
	public double exactJaccard(String file1, String file2) throws IOException {
		Set<String> words1 = ProcessingFunctions.UniqueWordList( file1);
		Set<String> words2 = ProcessingFunctions.UniqueWordList( file2);
		
		int a = words1.size();
		int b = words2.size();
		
		words1.retainAll(words2);
		int intersect = words1.size();
	
          double x = (double) intersect / (a + b - intersect);
	return(x);
	}
	
	
	
}