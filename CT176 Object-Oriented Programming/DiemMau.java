package Buoi4;
import Buoi2.Diem;
import java.util.Scanner;

public class DiemMau extends Diem {
	private String mau;
	public DiemMau(){
		super();
		mau = new String();
	}
	public DiemMau(int x, int y, String mau){
		super(x, y);
		this.mau = new String(mau);
	}
	public DiemMau(DiemMau D){
		super((Diem) D);
		mau = new String(D.mau);
	}
	public void nhap(){
		super.nhapDiem();
		Scanner sc = new Scanner(System.in);
		System.out.println("Nhap vao mau cua diem: ");
		mau = sc.nextLine();
	}
	public void in(){
		super.hienThi();
		System.out.println("Diem co mau: "+mau);
	}
	public String toString(){
		return super.toString()+"Diem co mau: "+mau+"\n";
	}
	public void GanMau(String mau){
		this.mau = new String(mau);
	}
	
}
