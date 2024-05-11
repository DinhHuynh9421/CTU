package Buoi4;

public class SDDiemM {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		

//		Diem a = new Diem();
//		a.nhapDiem();
//		a.hienThi();
		
		DiemMau a = new DiemMau(5,10,"trang");
//		a.nhapDiem();
		System.out.print("Diem A: ");
		a.hienThi();
		
		System.out.println("Nhap diem B: ");
		DiemMau b = new DiemMau();
		b.nhapDiem();
		System.out.print("Diem B: ");
		b.hienThi();
		
		b.doiDiem(10, 8);
		System.out.print("Diem B sau khi doi (10,8): ");
		b.hienThi();
		
		b.ganMau("vang");
		System.out.print("Diem B sau khi doi mau: ");
		b.hienThi();

		
	}

}
