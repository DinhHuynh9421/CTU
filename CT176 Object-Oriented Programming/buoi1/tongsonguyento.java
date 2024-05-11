package buoi_1;

import java.util.Scanner;

public class tongsonguyento {
	public static boolean nguyento(int n){
	      boolean  tongsonguyento = true;
	   if ( n < 2 ) 
		   tongsonguyento = false;
	   else 
		   for(int i=2;i<=Math.sqrt(n);i++)
			   if(n%i==0)
	       tongsonguyento = false;
	  return tongsonguyento;    
		    
		   
		
		
	}
	public static void main (String[]args){
		Scanner sc = new Scanner(System.in);
		int n;
		 n =sc.nextInt();
		 if(nguyento(n))
			 System.out.println(" n la so nguyen to");
		 else
			 System.out.println("n khong la so nguyen to");
	}
	public static void main(String[] args) {
					s =sc.nextLine();
	}

}
