package ppeonfun.service.admin.project;

import java.util.List;

import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

public interface ProjectService {

	/**
	 * 페이징 객체 반환
	 * @param inData - 페이징 데이터
	 * @return 페이징 객체 반환
	 */
	public Paging getPaging(Paging inData);
	/**
	 * 페이징된 프로젝트 반환
	 * @param paging - 페지이 객체
	 * @return 프로젝트 반환
	 */
	public List<Project> selectAllProject(Paging paging);
	
	/**
	 * 프로젝트 소유자 이름 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);
	/**
	 * 프로젝트 
	 * @param project
	 * @return
	 */
	public Project selectProject(Project project);
	
	/**
	 * 생성한 프로젝트 반환
	 * @param mNo - 생성자 번호
	 * @return - 생성한 프로젝트 반환
	 */
	public Project input(int mNo);

}
