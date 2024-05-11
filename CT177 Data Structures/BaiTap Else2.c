            /* II. Danh Sach Lien Ket*/
  //  [1] CAC PHEP TOAN DANH SACH LIEN KET CAC SO int
  
  //Bai 1: Nhap value, khong trung nhau
  List readSet(){
    List L;
    int n;
    ElementType x;
    makenullList(&L);
    scanf("%d", &n);
    for(int i=1; i<=n; i++){
        scanf("%d", &x);
        if(!member(x, L))
        addFirst(x, &L);
        
    }
    return L;
}

//Bai 2: tb cong
double getAvg(List L){
    Position P=L;
    if (P->Next==NULL)
        return -10000.000;
    else {
        double S=0;
        int count=0;
        while (P->Next!=NULL){
            S += P->Next->Element;
            P=P->Next;
            count++;
        }
        return S/count;
    }
}

//Bai 3: xoa x, p
void deleteList(Position p, List *pL){
    Position Temp ;
    Temp =p->Next;
    p->Next=Temp->Next;
    free(Temp);
}

// Bai 4:Giao 2 tap hop
List intersection(List L1, List L2){
    List KQ;
    makenullList(&KQ);
    Position P = L1;
    while(P-> Next != NULL){
        if(member(P->Next ->Element, L2) )
        append(P->Next->Element, &KQ);
        P = P->Next;
    }
 
    return KQ;
}

// Bai 5:sap xep tang dan
void sort(List *pL){
    Position P,Q;
    ElementType temp;
    P=(*pL);
    while (P->Next!=NULL){
        Q=P->Next;
        while(Q->Next!=NULL){
            if (P->Next->Element>Q->Next->Element){
                temp=P->Next->Element;
                P->Next->Element=Q->Next->Element;
                Q->Next->Element=temp;
            }
            Q=Q->Next;
        }
        P=P->Next;
    }
}

//Bai 6: xoa ptu dau tien x
void erase(ElementType x, List *pL){
    Position P = locate(x, *pL);
    if(P-> Next != NULL)
       deleteList(P, pL);
    else
       printf("Not found %d\n", x);
}

// Bai 7:xen ptu x
void insertList(ElementType X, Position P, List *pL){
    struct Node* t=(struct Node*)malloc(sizeof(struct Node));
    //Position t=(struct Node*)malloc(sizeof(struct Node));
	t->Element=X;
	t->Next=P->Next;
	P->Next=t;
}

// Bai 8: cap phat vung nho moi & cho truong lien ket(Next) cua vung nho nay tro den NULL
void makenullList(List *L){
    (*L) = (struct Node*)malloc(sizeof(struct Node));
    (*L) ->Next = NULL;
    
}

   //[2] CAC PHEP TOAN CO BAN [2]
   
//Bai 1:Nhap tap hop value x, khong trung nhau
List readSet(){
    List L;
    int n;
    ElementType X;
    makenullList(&L);
    scanf("%d",&n);
    for(int i=1; i<=n; i++){
        scanf("%d",&X);
        if (!member(X,L))
            addFirst(X,&L);
    }
    return L;
}

//Bai 3: hien thi so le
void printOddNumbers(List L){
    Position P=L;
    while (P->Next!=NULL){
        if (P->Next->Element%2==1)
            printf("%d ", P->Next->Element);
        P=P->Next;
    }
}

//Bai 6: tbinh cong
double getAvg(List L){
    Position P=L;
    if (P->Next==NULL)
        return -10000.000;
    else {
        double S=0;
        int count=0;
        while (P->Next!=NULL){
            S += P->Next->Element;
            P=P->Next;
            count++;
        }
        return S/count;
    }
}

//Bai 7: xoa all ptu co value x
void removeAll(ElementType X, List *pL){
    Position P=locate(X,*pL);
    while (P->Next!=NULL){
        deleteList(P, pL);
        P=locate(X,*pL);
    }
}

//Khai bao List result : 5
typedef int ElementType;
struct Node
{
	ElementType Element;
	struct Node* Next;
};
typedef struct Node* Position;
typedef Position List;

     //[4] DANH SACH SINH VIEN [4]
    
//Bai 1: tra vi tri dau tien co ma so x neu tim thay, khong thi tra ve sau vi tri cuoi cung
struct Node *locate(char x[10] , List L){
	struct Node *P=L;
	int Found=0;
	while (P->Next!=NULL && !Found){
		if (strcmp(P->Next->Element.ID,x)==0) //strcmp so sanh chuoi
			Found=1;
		else
			P=P->Next;
	}
	return P;	
}

//Bai 2: Khai bao List luu tru dssv
typedef struct 
{
   char ID[10];
   char Name[50];
   float R1, R2, R3;
}Student;

struct Node
{
	Student Element;
	struct Node* Next;	
};

typedef struct Node* List;

        //[5] DA THUC [5]
        
//Bai 3: Nhap da thuc,nhap don thuc e(heso, bac),  chen don thuc e vao da thuc
DaThuc nhapDaThuc(){
	DaThuc d;
	DonThuc s;
	int n;	
	d=khoitao();
	scanf("%d",&n);
	for (int i=1; i<=n; i++){
		scanf("%lf",&s.he_so);
		scanf("%d",&s.bac);
		chenDonThuc(s,&d);
	}
	return d;
}

//Bai 1:Khoi Tao
DaThuc khoitao(){
	DaThuc d;
	d=(struct Node*)malloc(sizeof(struct Node));
	d->Next=NULL;
	return d;
}





