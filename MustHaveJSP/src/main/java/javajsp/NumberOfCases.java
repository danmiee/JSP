package javajsp;

public class NumberOfCases {

	public static String print(int num) {		
		
		int cnt = 0;
		String str = "";
		
		if(num>=10 && num<=100) {
			
			for(int i=1; i<=10; i++) {
				for(int j=1; j<=10; j++) {
					for(int k=1; k<=10; k++) {
						if(2*i+3*j+5*k==num) {
							cnt++;
							str += "("+i+","+j+","+k+")";
						}
					}
					
				}
			}
		return str + " : " + cnt;	
		}
		return "10~100 사이의 값을 입력하세요.";
		
	}
	
}
