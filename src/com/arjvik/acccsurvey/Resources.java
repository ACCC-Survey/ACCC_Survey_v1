package com.arjvik.acccsurvey;

public final class Resources {
	public static final boolean DEBUG = true;
	public static final String DEBUG_TEXT   = "<script>alert(\"Hi! This is the ACCC Survey! This is a preview "
											+ "version right now! Created by Arjun Vikram, MedVeda\");</script>";
	public static final String POST = "get";
	
	public static final String[] INTRO_PARAMS = {"name","email","institution"},
								 INTRO_PRETTY = {"Name","Email","Institution"},
								 INTRO_TYPE	  = {"text","email","text"},
								 
								 TREATMENTS		   = {"banana","mango","lemon"},
								 TREATMENTS_PRETTY = {"Banana Therapy","Mango Therapy","Lemon Therapy"},
								 
								 AREAS		  = {"1","2"},
								 AREAS_PRETTY = {"Offered on<br>1st floor","Offered on<br>2nd floor"},
								 AREAS_POS	  = {"How do you like offering this on the first floor?",
										 		 "How do you like offering this on the second floor?"},
								 AREAS_NEG	  = {"Why do you not offer this on the first floor?",
										 		 "Why do you not offer this on the second floor?"},
								 
								 TREATMENT_AREA_PARAMS = GET_TREATMENT_AREA_PARAMS(TREATMENTS, AREAS);
	
	
	private static String[] GET_TREATMENT_AREA_PARAMS(String[] treatments, String[] areas) {
		String[] value = new String[treatments.length * areas.length];
		int i = 0;
		for (String t : treatments)
			for (String a : areas)
				value[i++] = t+"_"+a;
		return value;
	}
}
