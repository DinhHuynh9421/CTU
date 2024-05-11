package Buoi4;

import java.util.Scanner;

public class SDSVCNTT {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SinhVienCNTT ds[];
		Scanner sc = new Scanner(System.in);
		System.out.print("Nhap so sinh vien CNTT: ");
		int n = sc.nextInt();
		ds = new SinhVienCNTT[n];
		for(int i=0; i<n; i++) {
			System.out.println("Nhap thong tin sinh vien thu ["+(i+1)+"] :");
			ds[i] = new SinhVienCNTT();
			ds[i].nhap();
			ds[i].nhapDiem();
		}
		
		System.out.print("Nhap dia chi email cua sinh vien can tim: ");
		Scanner nc = new Scanner(System.in);
		String em = "";
		em = nc.nextLine();
		
		int k=0;
		for(int i=0; i<n; i++) {
			if(ds[i].getEmail().equals(em)) {
				System.out.println("Ten tai khoan ELCIT cua sinh vien can tim: "+ds[i].getTaiKhoan());
				System.out.println("Ket qua hoc tap: \n"+ds[i].getKetQua());
				k=1;
				break;
			}
		}
		if(k==0){
			System.out.println("Khong tim thay Email vua nhap!");
		}
	}


}
