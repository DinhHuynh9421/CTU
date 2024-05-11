package buoi2;

import java.util.Scanner;

public class Diem {
	private int x;
	private int y;

	public Diem() {
		x = 0;
		y = 0;
	}

	public Diem(int x1, int y1) {
		x = x1;
		y = y1;
	}

	public void nhap() {
		Scanner sc = new Scanner(System.in);
		System.out.println("nhap hoanh do:");
		x = sc.nextInt();
		System.out.println("nhap tung do:");
		y = sc.nextInt();
	}

	public void in() {
		// (x,y)
		System.out.println("(" + x + "," + y + ")");
	}

	public void tinhTien(int dx, int dy) {
		x += dx;
		y += dy;
	}

	public int layX() {
		return x;
	}

	public int layY() {
		return y;
	}

	public float khoangCach() {
		return (float) Math.sqrt(x * x + y * y);
	}

	public float khoangCach(Diem B) {
		return (float) Math.sqrt(Math.pow(x - B.x, 2) + Math.pow(y - B.y, 2));
	}

	public static void main(String[] args) {
		Diem A = new Diem(3, 4);
		System.out.println("toa do diem A:");
		A.in();

		Diem B = new Diem();
		System.out.println("toa do diem B:");
		B.nhap();
		B.in();

		System.out.println("toa do diem C doi xung qua tam O:");
		Diem C = new Diem(-B.x, -B.y);
		C.in();
		
		System.out.println("tinh tien la:");
		B.tinhTien(3, 7);
		B.in();

		System.out.println("khoang cach BO: " + B.khoangCach());
		System.out.println("khoang cach AB: " + B.khoangCach(A));

	}

}
