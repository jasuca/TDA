package com.tda.presentation.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.tda.model.patient.Patient;
import com.tda.model.socialworker.SocialWorkerForm;
import com.tda.service.api.PatientService;
import com.tda.service.api.SocialWorkerFormService;

@Controller
@RequestMapping(value = "/patient/{patientId}/socialworker/new")
@SessionAttributes("socialWorkerForm")
public class AddSocialWorkerFormController extends
		BaseSocialWorkerFormController {
	private static final String SOCIAL_WORKER_ADD_FORM = "socialworkerform/form";
	private static final String REDIRECT_AFTER_SAVE = "redirect:/";
	
	private SocialWorkerFormService socialWorkerFormService;
	private PatientService patientService;

	@RequestMapping(method = RequestMethod.GET)
	public String setupForm(@PathVariable("patientId") long patientId,
			Model model) {
		Patient patient = patientService.findById(patientId);
		SocialWorkerForm socialWorkerForm = new SocialWorkerForm();
		socialWorkerForm.setPatient(patient);
		model.addAttribute("socialWorkerForm", socialWorkerForm);
		return SOCIAL_WORKER_ADD_FORM;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processSubmit(
			@Valid @ModelAttribute("socialWorkerForm") SocialWorkerForm socialWorkerForm,
			BindingResult result, SessionStatus status) {

		if (result.hasErrors()) {
			return SOCIAL_WORKER_ADD_FORM;
		} else {
			socialWorkerFormService.save(socialWorkerForm);
			status.setComplete();
//			return "redirect:/patient/" + socialWorkerForm.getPatient().getId();
			return REDIRECT_AFTER_SAVE;
		}
	}

	@Autowired
	public void setSocialWorkerFormService(
			SocialWorkerFormService socialWorkerFormService) {
		this.socialWorkerFormService = socialWorkerFormService;
	}

	@Autowired
	public void setPatientService(PatientService patientService) {
		this.patientService = patientService;
	}
}
