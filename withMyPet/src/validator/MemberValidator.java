package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import vo.Member;


public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {

		return Member.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Member m = (Member)target;
		String e_mail = m.getE_mail();
		if(e_mail == null || e_mail.equals("")){
			errors.rejectValue("id", "required");
		}
	}

}
