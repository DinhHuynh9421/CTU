package buoi2;

import java.util.Scanner;

public class Date {
	private int d, m, y;

	public Date() {
		d=m=y=1;
	}

	public Date(int d1, int m1, int y1) {
		d = d1;
		m = m1;
		y = y1;
	}

	public void nhap() {
		Scanner sc = new Scanner(System.in);
		do {
			System.out.println("nhap ngay:");
			d = sc.nextInt();
			System.out.println("nhap thang:");
			m = sc.nextInt();
			System.out.println("nhap nam:");
			y = sc.nextInt();
		} while (!hople());
	}

	public boolean hople() {
		int max[] = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		boolean h = false;
		if (y % 4 == 0) max[2] = 29;
		if ( y > 0  && m > 0 && m < 13 &&  d > 0 && d <= max[m]) h = true ;	
		return h;
	}
    public void in() {
		System.out.println(d + "/" + m + "/" + y);
	}
	public Date homSau() {
		Date a = new Date(d, m, y);
		a.d=a.d+1;
		if (!a.hople()) {
			a.d = 1;
			a.m++;
			
			if (!a.hople()) {
				a.m = 1;
				a.y++;
			}
		}
		return a;
	}

	public Date congNgay(int n) {
		Date a = new Date(d, m, y);
		for (int i = 0; i < n; i++) 
			a = a.homSau();
		return a;
	}

	

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
