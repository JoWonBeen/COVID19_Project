package com.covid19.controller.coronaInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CoronaInformationController {

	@RequestMapping(value = "/CoronaSymptoms.do", method = RequestMethod.GET)
	public String coronaSymptoms() {
		return "coronaInfo/coronaSymptoms";
	}
	@RequestMapping(value = "/CoronaVaccineTypes.do", method = RequestMethod.GET)
	public String coronaVaccineType() {
		return "coronaInfo/coronaVaccineTypes";
	}
	@RequestMapping(value = "/VaccineTargetTiming.do", method = RequestMethod.GET)
	public String vaccinationTargetTiming() {
		return "coronaInfo/vaccinationTargetTiming";
	}
	@RequestMapping(value = "/VaccineStatus.do", method = RequestMethod.GET)
	public String vaccinationstatus() {
		return "coronaInfo/vaccinationStatus";
	}
	@RequestMapping(value = "/VaccineSymptoms.do", method = RequestMethod.GET)
	public String vaccinationSymptoms() {
		return "coronaInfo/vaccinationSymptoms";
	}
}
