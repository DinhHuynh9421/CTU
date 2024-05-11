package buoi2;

import java.util.Scanner;

public class PhanSo {
	private int a, b;
	public PhanSo(){//a/b
		a=0;
		b=0;
	}
	public PhanSo(int tu, int mau){
		a=tu;
		b=mau;
	}
	public void nhap(){
		do{
			Scanner sc=new Scanner(System.in);
			System.out.println("nhap tu so:");
			a=sc.nextInt();
			System.out.println("nhap mau so:");
			b=sc.nextInt();
		}while(b==0);
		
	}
	public void in(){
		//a/b
		if(b<0){
			a=a*-1;
			b=b*-1;
		}
		if(a==0){
			System.out.println(a);
		}else
		if(b==1){
			System.out.println(a);
		}else
		System.out.println(a+"/"+b);
	}
	public void nghichDao(){
		int t=a;
		a=b;
		b=t;
	}
	public PhanSo gtNghichDao(){
		PhanSo k = new PhanSo();
		k.a=b;
		k.b=a;
		
		return k;
	}
	public float soThuc(){
		return (float) a/b;
	}
	public boolean lonnHon(PhanSo n){
		float x=soThuc();
		float y=soThuc();
		if(x>y)return false;
		return true;
	}
	public int timUCLN(int a, int b){
		int t=a%b;
		while(t!=0){
			a=b;
			b=t;
			t=a%b;
			
		}
		return b;
	}
	public void chuanhoa(){
		int t=timUCLN(a,b);
		a=a/t;
		b=b/t;
	}
	public PhanSo cong(PhanSo n){
		PhanSo c =new PhanSo();
		c.a = a*n.b + n.a*b;  //tu=mau*tu+tu*mau
		c.b = b*n.b;//mau=mau * mau
		c.chuanhoa();
		return c;
	}
	
	public PhanSo tru(PhanSo n){
		PhanSo c =new PhanSo();
		c.a = a*n.b - n.a*b;// tu=mau*tu+tu*mau
		c.b = b*n.b;//mau=mau * mau
		c.chuanhoa();
		return c;
	}
	public PhanSo nhan(PhanSo n){
		PhanSo c =new PhanSo();
		c.a = a * n.a;
		c.b = b * n.b;
		c.chuanhoa();
		
		return c;
	}
	
	public PhanSo chia(PhanSo n) {
		PhanSo c = new PhanSo();
		c.a = a * n.b;
		c.b = b * n.a;
		c.chuanhoa();
		
		return c;
	}

	

}
