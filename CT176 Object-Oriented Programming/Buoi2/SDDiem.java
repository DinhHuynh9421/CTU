package buoi2;

public class SDDiem {

	public static void main(String[] args) {
		Diem A = new Diem(3, 4);
		System.out.println("toa do diem A:");
		A.in();

		Diem B = new Diem();
		System.out.println("toa do diem B:");
		B.nhap();
		B.in();

		System.out.println("toa do diem C doi xung qua tam O:");
		Diem C = new Diem(-B.layX(), -B.layY());
		C.in();
		
		System.out.println("tinh tien la:");
		B.tinhTien(3, 7);
		B.in();

		System.out.println("khoang cach BO: " + B.khoangCach());
		System.out.println("khoang cach AB: " + B.khoangCach(A));

	}

}
