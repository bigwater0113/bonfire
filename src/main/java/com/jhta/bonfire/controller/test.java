package com.jhta.bonfire.controller;

public class test {
	public static void main(String[] args) {
		int ddd=0;
		int Cnt=13;
		int viewCnt=12;
		boolean matchCnt=false;
		int[] selectAuthors=new int[viewCnt];
		for(int i=0;i<viewCnt;i++) {
			matchCnt=false;
			int num=(int)(Math.random()*Cnt)+1;
			for(int j=0;j<viewCnt;j++) {
				if(selectAuthors[j]==num) matchCnt=true;
			}
			if(matchCnt) {
				i--;
				continue;
			}
			selectAuthors[i]=num;
			System.out.println(ddd++);
		}
		for(int selectAuthor:selectAuthors) {
			System.out.println("aa:"+selectAuthor);
		}
	}
}
