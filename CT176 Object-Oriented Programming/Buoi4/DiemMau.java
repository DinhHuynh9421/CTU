package Buoi4;

import java.util.Scanner;

import Buoi2.Diem;

public class DiemMau extends Diem{
	
private String mau;
	
	public DiemMau() {
		super();
		mau = new String();
	}
	
	public DiemMau(int x1, int y1, String m) {
		super(x1,y1);
		mau = new String(m);
	}
	
	public DiemMau(DiemMau dm) {
		super((Diem)dm);
		mau = new String(dm.mau);
	}
	
	public void nhapDiem() {
		super.nhapDiem();
		Scanner sc = new Scanner (System.in);
		System.out.print("Nhap mau: ");
		mau = sc.nextLine();
	}
	
	public void hienThi() {
		super.hienThi();
		System.out.println(", voi mau "+mau);
	}
	
	public void hienThi(String s) {
		System.out.println(s);
		hienThi();
	}
	
	public String toString() {
		return super.toString() + ", voi mau "+ mau;
	}
	
	public void ganMau(String m) {
		mau = new String(m);
	}
	

}
