package buoi2;

public class SDPhanSo {
	public static void main(String[] args) {
		PhanSo A = new PhanSo(3,2);
		System.out.print("Phan so A: ");
		A.in();
		PhanSo B = new PhanSo(9,2);
		System.out.print("Phan so B: ");
		B.in();
//		System.out.print("phan so X: ");
//		PhanSo X =new PhanSo(4,9);
//	    X.nhap();
//	    X.in();
//	    System.out.print("phan so Y: ");
//		PhanSo Y =new PhanSo(4,9);
//		Y.nhap();
//		Y.in();
		System.out.print("Cong: ");
		A.cong(B).in();
		System.out.print("Tru: ");
		A.tru(B).in();
		System.out.print("Nhan: ");
		A.nhan(B).in();
		System.out.print("Chia: ");
		A.chia(B).in();
		
	}
}
