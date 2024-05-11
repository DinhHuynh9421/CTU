package buoi_1;
import java.util.Scanner;

public class tonghaisonguyen {
	public int nhap(){
		Scanner sc = new Scanner (System.in);
		String s;int n;
		do {
			System.out.print("Nhap mot so nguyen: ");
			s =sc.nextLine();
			try{
				n=Integer.parseInt(s);
			} catch(Exception e){
				System.out.print("ban da nhap sai,nhap lai:");
				n= Integer.MIN_VALUE;
			}
		
		}while(n==Integer.MIN_VALUE);
		return n;

	}
	public static void main (String[]args){
		tonghaisonguyen t=new tonghaisonguyen();
		int a=t.nhap();
		int b= t.nhap();
		System.out.print("Tong 2 so = "+(a+b));
	}
	
}