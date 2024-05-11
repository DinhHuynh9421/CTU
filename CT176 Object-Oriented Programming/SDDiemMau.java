package Buoi4;
import Buoi2.Diem;

public class SDDiemMau {

	public static void main(String[] args) {
		DiemMau A = new DiemMau(5, 10, "Trang");
		System.out.println(A.toString());
		DiemMau B = new DiemMau();
		B.nhap();
		System.out.println(B.toString());
		B.doiDiem(10, 8);
		System.out.println(B.toString());
		B.GanMau("Vang");
		System.out.println(B.toString());
	}

}
