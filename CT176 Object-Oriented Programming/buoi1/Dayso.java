
package buoi_1;
import java.util.Scanner;

public class Dayso {
	int a[];
	public void nhap(){
		Scanner sc = new Scanner(System.in);
		System.out.print(" Nhap phan tu day so");
		int n = sc.nextInt();
		a= new int [n];
		for (int i=0;i<n;i++){
			System.out.print(" Nhap phan tu thu"+ (i+1)+";");
			a[i]= sc.nextInt();
			
		}
		
		
	}
	public void dem(){
		Scanner sc=new Scanner (System.in);
		int x;
		System.out.println("\n nhap x:");
		x = sc.nextInt();
		int count =0;
		for(int i =0 ; i<a.length;i++){
			if(a[i]==x)
				count ++;
		}
		
	}
	public void in(){
		for(int i=0;i<a.length-1;i++)
			System.out.print(" "+a[i]);
		
		
	}
	public int tongdayso (){
		int tong = 0;
		for (int e:a){
			tong+=e;
		}return tong;
	}

}
