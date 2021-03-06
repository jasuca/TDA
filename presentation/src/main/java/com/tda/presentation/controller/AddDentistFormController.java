package com.tda.presentation.controller;

import java.util.Collection;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.tda.model.dentist.DentistForm;
import com.tda.model.patient.Patient;
import com.tda.model.patient.PatientInTrain;
import com.tda.presentation.propertyEditor.ToothEditor;
import com.tda.service.api.DentistFormService;
import com.tda.service.api.PatientInTrainService;
import com.tda.service.api.PatientService;

@Controller
@RequestMapping(value = "/patient/{patientId}/dentist/new")
@SessionAttributes("dentistForm")
public class AddDentistFormController extends BaseDentistFormController {
	private static final String DENTIST_ADD_FORM = "dentistform/form";
	private static final String REDIRECT_AFTER_SAVE = "redirect:/";

	private DentistFormService DentistFormService;
	private PatientService patientService;
	private PatientInTrainService patientInTrainService;

	@RequestMapping(method = RequestMethod.GET)
	public String setupForm(@PathVariable("patientId") long patientId,
			Model model) {
		Patient patient = patientService.findById(patientId);
		DentistForm dentistForm = new DentistForm();
		dentistForm.setPatient(patient);
		model.addAttribute("dentistForm", dentistForm);
		model.addAttribute("toothString", dentistForm.toothsToString());

		return DENTIST_ADD_FORM;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processSubmit(
			@Valid @ModelAttribute("dentistForm") DentistForm dentistForm,
			BindingResult result, SessionStatus status) {

		if (result.hasErrors()) {
			return DENTIST_ADD_FORM;
		} else {
			DentistFormService.save(dentistForm);

			Patient patient = dentistForm.getPatient();
			List<PatientInTrain> patientInTrain = patientInTrainService
					.findByDni(patient.getDni());

			if (patientInTrain != null && patientInTrain.size() == 1) {
				patientInTrain.get(0).setDentistform(dentistForm);
				patientInTrainService.save(patientInTrain.get(0));
			}

			// status.setComplete();
			return REDIRECT_AFTER_SAVE;
		}
	}

	@Autowired
	public void setDentistFormService(DentistFormService dentistFormService) {
		this.DentistFormService = dentistFormService;
	}

	@Autowired
	public void setPatientService(PatientService patientService) {
		this.patientService = patientService;
	}

	@Autowired
	public void setPatientInTrainService(
			PatientInTrainService patientInTrainService) {
		this.patientInTrainService = patientInTrainService;
	}

	@InitBinder
	public void initBinder(WebDataBinder b) {
		b.registerCustomEditor(Collection.class, "tooths", new ToothEditor());
	}
}
