                                /*I.DS Dac  */

      //   [1] . PHEP TOAN DS SINH VIEN  [1]
      
//bai1 p la vi tri hop le thi xoa sv o vitri p trong dsach dc chi boi con tro pL

void xoaTai(int p, DanhSach *pL){
    if(pL->n==0)
    printf("Danh sach rong");
    else if(p<1 || p>pL->n)
    printf("Danh sach hop le\n");
    else {
        int q;
        for(q=p-1; q<pL->n; q++)
           pL->A[q] = pL->A[q+1];
    }
    pL->n--;
}

//bai 2 p vitri sv co mso x trong dsach, if p la vtri hop le ->xoa sv o vtri p trong dsach chi boi *pL
void xoaSinhVien(char ms[], DanhSach *pL){
    int p;
    p=tim(ms,*pL); //tim sv co ma so x tren danh sach
    if (p!=pL->n+1){
        xoaTai(p,pL);
    }
}

//bai 3 ham tra ve dsach sv rong
DanhSach dsRong(){
    DanhSach L;
    L.n=0;
    return L;
}

  // [2].CAC PHEP TOAN DS DAC CAC SO int [2]
  
//bai 1: hien thi so le - printOddNubers()
void printOddNumbers(List L){
    Position p=1;
    while(p!=L.Last+1){
        if(L.Elements[p-1]%2!=0)
        printf("%d ", L.Elements[p-1]);
        p++;
        
    }
}

//bai 2: xoa ptu vitri p dc tro boi *pL
void deleteList(Position p, List *pL){
    if(p<1 || p>pL->Last+1)
    printf("Vi tri khong hop le\n");
    else if(pL->Last==0)
    printf("Danh sach rong\n");
    else {
        Position Q;
        for(Q=p-1; Q<pL->Last-1; Q++)
        pL->Elements[Q]=pL->Elements[Q+1];
        pL->Last--;
    }
}

//bai 3: tinh trung binh cong
float getAvg(List L){
    Position P=1;
    if (L.Last == 0)
        return -10000.000;
    else {
        float S=0;
        float count=0;
        while (P != L.Last+1){
            S+= P; //S=S+P;
            P++;
            count++;
        }
        return S/count;
    }
}

//bai 4:giao cua 2 tap hop
void intersection(List L1, List L2, List *pL){
    makenullList(pL);
    Position p=1;
    while(p!=L1.Last+1){
        if(member(L1.Elements[p-1],L2)){
            insertSet(L1.Elements[p-1],pL);
        }
        p++;
    }
}

//bai 5:khoi tao ds rong
void makenullList(List *pL){
	pL->Last=0;
}

//bai 6: ptu trung nhau bi xoa bo, chi giu ptu dau tien
void normalize(List *pL){
    Position p,q;
    p=1;
    while (p!=pL->Last+1){
        q=p+1;
        while (q!=pL->Last+1){
            if (pL->Elements[p-1]==pL->Elements[q-1])
                deleteList(q,pL);
            else
                q++;
        }
        p++;
    }
}

//bai 7:xen x vao vtri p
void insertList(int x,Position P, List *pL){
    if(pL->Last==Maxlength)
    printf("Danh sach day\n");
    else {
        pL->Elements[pL->Last]=x;
        pL->Last=pL->Last+1;
    }
}

//bai 8: xoa ptu dau tien co value x
void erase(int x, List *pL){
    Position p;
    p = locate(x, *pL);
    if(p!= pL->Last+1)
      deleteList(p, pL);
}

//bai 1.1: sap xep tang dan
void sort(List *pL){
    Position p,q;
    ElementType temp;
    for(p=1;p<pL->Last;p++)
        for(q=p+1;q<=pL->Last;q++)
            if(pL->Elements[p-1]>pL->Elements[q-1]){
                temp=pL->Elements[p-1];
                pL->Elements[p-1]=pL->Elements[q-1];
                pL->Elements[q-1]=temp;
            }
}

//bai 2.2: xoa all ptu co value x
void removeAll(ElementType x,List *pL) { 
	Position P;
	do {
	    P=locate(x,*pL);
	    if (P!=pL->Last+1)
	        deleteList(P,pL);
	} while (P!=pL->Last+1);        
} 

//bai 3.3:liet ke all ptu cua ds
void printList(List L) {
	Position P;
	P = 1;
	while (P != L.Last+1) {
		printf("%d ",L.Elements[P-1]);
		P = P+1;
	}
	printf("\n");
}

//bai 4.4: hieu cua 2 tap hop L1, L2
void difference(List L1, List L2, List *pL){
    makenullList(pL);
    Position P;
    P=1;
    while (P!=L1.Last+1){
        if (!member(L1.Elements[P-1],L2))
            insertSet(L1.Elements[P-1], pL);
        P++;
    }
}

//bai 5.5:nhap cac ptu tu ban phim
void readList(List *pL) {	
	int i,N;
	ElementType X;
	makenullList(pL);
	scanf("%d",&N);
	for(i=1;i<=N;i++) { 
		scanf("%d",&X);
		insertList(X,pL->Last+1,pL);
	}
}

//bai 6.6: tim vi tri xuat hien dau tien
Position locate(ElementType X, List L) {
	Position P;
	int Found = 0;
	P = 1;
	while ((P != L.Last+1) && (Found == 0))
		if (L.Elements[P-1] == X) Found = 1;
		else P = P+1;
	return P;
}

//Bai 7.7: khai bao result 0 2 4 6 8
#define Maxlength 100
typedef int ElementType;
typedef int Position;
typedef struct{
    ElementType Elements[Maxlength];
    Position Last;
}List;

//Bai8.8: chep all so chan tu l1 sang ds ket qua chi boi ctro pL2
void copyEvenNumbers(List L1, List *pL2){
    makenullList(pL2);
    ElementType x;
    Position p=1;
    while (p!=L1.Last+1){
        x=L1.Elements[p-1];
        if (x%2==0)
            insertList(x,pL2->Last+1,pL2);
        p++;    
    }
}

    // [3] KHAI BAO DANH SACH [3]
    
//Bai 1: cau truc 2 truong
#define Maxlength 40
typedef int Position;
typedef struct SinhVien{
    char Mssv[10];
    char Name[50];
    float DLT;
    float DTH1;
    float DTH2;
}SinhVien;
typedef struct {
    struct SinhVien A[Maxlength];
    Position n;
}List;

//Bai 2: result : Yes
#define Maxlength 100
typedef struct {
    float phantu[Maxlength];
    int sophantu;
}List;

//Bai 3: 2x^3 + 5x^2
#define Maxlength 100
struct DaThuc{
    DonThuc A[Maxlength];
    int so_luong;
};

//Bai 1.1: Polygon
typedef struct{
    int x,y;
}point;

typedef struct{
    point points[100];
    int so_luong;
}Polygon;

//Bai 2.2: Toi di hoc. Ban o nha result : Yes
#define MaxLength 80
typedef struct {
    char Phantu[MaxLength];
    int Sokytu;
} Line;



