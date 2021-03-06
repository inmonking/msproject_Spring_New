package com.msproject.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import aj.org.objectweb.asm.Type;
import lombok.extern.slf4j.Slf4j;

// 로그 수집 작업을 하려면 모든 메서드에 해야 함
// 로그 수집은 중요한 업무이지만 핵심적인 업무는 아니고 공통적인 업무에 해당
// 공통적인 업무는 모든 class의 모든 method에 작성하지 말고
// Advice에 모아서 작성하고
// 세부적인 모드에서는 핵심업무에 집중하도록 처리

@Component	// 스프링 beans로 등록되기 위한 설정
@Aspect		// AOP bean - 공통 업무를 지원하는 코드
@Slf4j
public class LogAdvice {
	// 포인트컷 - 실행시점,
	// Around(메서드 실행 전 후)
	// Before(메서드 실행 전)
	// After (메서드 실행 후)
	
	//execution 경로에 //는 하위 패키지들이
	//다 들어갈 수 있다는 의미
	@Around("execution(* com.msproject.controller..*Controller.*(..))"
			+ " or execution(* com.msproject.service..*Impl.*(..))"
			+ " or execution(* com.msproject.persistence..*Impl.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable{
		long start = System.currentTimeMillis();
		
		
		Object result = joinPoint.proceed();//핵심업무 실행
		// 호출한 클래스 이름
		String type = joinPoint.getSignature().getDeclaringTypeName();
		
		// 호출한 클래스의 이름에 따라 if문을 타고 출력
		String name = "";
		if(type.indexOf("Controller") > -1) {
			name = "Contorller \t:";
		}else if(type.indexOf("Service") > -1) {
			name = "ServiceImpl \t:";
		}else if(type.indexOf("DAO") > -1) {
			name = "DaoImpl \t:";
		}
		
		// 호출한 클래스, method 정보
		log.info(name+type+"."+joinPoint.getSignature().getName());
		// method에 전달되는 매개 변수들
		log.info(Arrays.deepToString(joinPoint.getArgs()));
		// 메서드 끝나는 시간
		long end = System.currentTimeMillis();
		long time = end-start;
		log.info("실행시간: "+time);
		
		return result;
	}
}
