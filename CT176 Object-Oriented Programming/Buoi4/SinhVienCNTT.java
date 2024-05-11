package Buoi4;

import java.util.Scanner;

import Buoi3.SinhVien;

public class SinhVienCNTT extends SinhVien{
	
private String taikhoan, matkhau, email;
	
	public SinhVienCNTT() {
		super();
		taikhoan = new String();
		matkhau = new String();
		email = new String();
	}
	
	public SinhVienCNTT(SinhVienCNTT sv) {
		super((SinhVien)sv);
		taikhoan = new String(sv.taikhoan);
		matkhau = new String(sv.matkhau);
		email = new String(sv.email);
	}
	
	public void nhap() {
		super.nhap();
		Scanner sc = new Scanner(System.in);
		System.out.print("Nhap ten tai khoan: ");
		taikhoan = sc.nextLine();
		System.out.print("Nhap mat khau: ");
		matkhau = sc.nextLine();
		System.out.print("Nhap email: ");
		email = sc.nextLine();
	}
	
	public void in() {
		super.in();
		System.out.println("Ten tai khoan: "+taikhoan);
		System.out.println("Email: "+ email);
	}
	
	public String toString() {
		return super.toString() + "Ten tai khoan: "+taikhoan+"\nEmail: "+email;
	}
	
	public void doiMatKhau(String newpass) {
		matkhau = new String(newpass);
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getTaiKhoan() {
		return taikhoan;
	}
	
}
