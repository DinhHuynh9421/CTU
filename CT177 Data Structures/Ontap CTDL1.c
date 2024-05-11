//(0)Khai bao

#define Maxlength... // do dai max dsach

typedef...ElemenType; //kieu ptu ds

typedef int Position //kieu vtri cac ptu 

typedef struct {
	ElementType Elements[Maxlength]; // mang chua cac ptu ds
	Position Last; //giu do dai ds
	
}List;

//(1) cac P'toan List

1. makenullList(L) //kh tao List L rong
2. emptyList(L) // ktra L rong ?
3. first(L) // vtri ptu dau tien
4. endList(L)// vtri sau vtri end
5. Next(P,L) // vtri sau vtri P trong List L
6. previous(P,L) // vtri truoc P, L
7. retrieve(P,L) // value ptu vtri P, List L,
8. locate(X,L) // tim X,trong L. 
               // if Find => vtri ptu dau tien co value X, L; 
			   //else => endList(L)
9.insertList(X,L) // xen ptu co value X=>List L tai vtri P
10.deleteList(P,L) // xoa ptu vtri P, L

// (2) viet ham

void makenullList(List *L){ // 1 //truyen dia chi
	L->Last=0; //dat do dai List =0 //or (*L).Last=0; ?
}

int emptyList(List L){ //2 ktra do dai ==0 hay k, 
	return L.Last==0;// =>1 or 0 (if Last =0 => 1, else Last !=0 =>0
}

Position first(List L){ // 3
	return 1;
}

Position endList(List L){ //4
	return L.Last+1; //chi so = vtri +1
}

Position Next(Position P, List L){ //5
	return P+1;  //sau P
}

Positon Previous(Position P, List L){//6
	return P-1; //truoc P
}

ElementType Retrieve(Position P, List L){//7
	return L.Elements[P-1]; //value ptu tai P => chi so -1
}

Position locate(ElementType X, List L){ //8 Cach 1: sd Ptoan CTDL
	Position P=1; //khoi tao vtri dtien
	int Found =0; // Found = 1 or 0(tim thay or k thay)
	while(p<=L.Last && !Found)
	   if(L.Elements[P-1])==X) Found =1;
	   else P++; //sau ptu end
	return P; 
}

Position locate(ElementType X, List L){ //cach 2: sd cac Ptoan Ds
    Position P = first(L); //sdung bien khi kq khog thay doi khi thuc hien cac ctrinh con
    Position E = end(L);
    int Found = 0;
	while(P!=E && !Found) //sdung P!=end(L) cung dc nhung lau hon
	   if(retrieve(P,L) ==X) Found =1;
	   else P = next(P,L);
	return P; // ket thuc khi 1 trong 2 dkien xra 
}

void insertList(ElementType X, Position P, List *L){ //*L nhan su thay doi //9
	if(L->Last ==Maxlength) printf("Danh sach day!\n");
	  
	else if(P<1 || P>L->Last+1);  printf("Vi tri khong hop le!\n");
	 
	else {// vtri hop le 
		Position Q; // vtri Q
		for(Q=L->Last; Q>=P; Q--) //Q-- tra 1 vtri
		 L->Elements[Q] = L->Elements[Q-1];// value ptu sau = value ptu truoc // Last thay Last -1 va...
		L->Last++;
		L->Elements[P-1]=X; //xen
	}
}

void DeleteList(Position P, List *L){ //10
	if(L->Last == 0) printf("Danh sach rong!\n");
	   
	else if(P<1 || P>L->Last)  printf("Vi tri khong hop le!");
	   
	  else{
	  	Position P;
		  for(Q=P; Q<=Last-1; Q++)
		    L->Elements[Q-1] = L->Elements[Q]; //value truoc = value sau
			L->Last--; 
	  } 
} 


 


























