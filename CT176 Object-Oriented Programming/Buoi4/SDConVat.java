package Buoi4;

import java.util.Scanner;

public class SDConVat {

	public static void main(String[] args) {
		
		ConVat ds[];
		Scanner sc = new Scanner(System.in);
		System.out.print("Nhap so con vat: ");
		int n = sc.nextInt();
		ds = new ConVat[n];
		for(int i=0; i<n; i++) {
			System.out.println("Con thu "+(i+1));
			System.out.print("Nhap thong tin cho Bo(1) hay Heo(2) hay De(3) hay Ga(4): ");
			int k = sc.nextInt();
			if(k>4 || k<1){
				System.out.println("Thong tin sai, vui long nhap lai: ");
				i--;
			}
			if(k==1) {
				ds[i] = new Bo();
				ds[i].nhap();
			} else if(k==2) {
				ds[i] = new Heo();
				ds[i].nhap();
			} else if(k==3) {
				ds[i] = new De();
				ds[i].nhap();
			} else if(k==4){
				ds[i] = new Ga();
				ds[i].nhap();
			}
		}
		
		for(int i=0; i<n; i++) {
			System.out.print("Loai: "+ds[i].loai());
			ds[i].in();
			ds[i].Keu();
			System.out.println();
		}
		
	}

}
