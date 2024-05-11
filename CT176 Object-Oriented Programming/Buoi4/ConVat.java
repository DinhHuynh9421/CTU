package Buoi4;

import java.util.Scanner;

public abstract class ConVat {
	
	private String giong, maulong;
	private float cannang;
	
	public abstract void Keu();
	public abstract String loai();
	
	public ConVat() {
		giong = new String();
		maulong = new String();
		cannang = 0;
	}
	
	public ConVat(ConVat cv) {
		giong = new String(cv.giong);
		maulong = new String(cv.maulong);
		cannang = cv.cannang;
	}
	
	public void nhap() {
		Scanner sc = new Scanner(System.in);
		System.out.print("Nhap loai giong: ");
		giong = sc.nextLine();
		System.out.print("Nhap mau long: ");
		maulong = sc.nextLine();
		System.out.print("Nhap can nang: ");
		cannang = sc.nextFloat();
	}
	
	public void in(){
		System.out.println("Giong: "+giong);
		System.out.println("Mau long: "+maulong);
		System.out.println("Can nang: "+cannang);
	}
	
}
