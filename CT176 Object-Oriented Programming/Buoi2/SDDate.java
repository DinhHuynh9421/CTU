package buoi2;

import java.util.Scanner;

public class SDDate {

	public static void main(String[] args) {
		Date d1 = new Date(13, 9, 2022);
		d1.in();

		Date d2 = new Date();
		d2.nhap();
		d2.in();

		Scanner sc = new Scanner(System.in);
		System.out.println("nhap so ngay can cong:");
		int n = sc.nextInt();

		d2 = d2.congNgay(n);
		System.out.println("sau khi cong");
		d2.in();
	}

}
