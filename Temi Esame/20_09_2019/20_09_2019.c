int monotono(int *vet,int N,int *pos){

    int act = 1, max=0, ind;

    for(int i=0;i<N-1;i++){
        if(vet[i]<vet[i+1]) act++;
        else{
            if(act > max){
                max = act;
                ind = i - max + 1;
            }
            act = 1;
        }
    }

    *pos = ind;
    return max;

}
