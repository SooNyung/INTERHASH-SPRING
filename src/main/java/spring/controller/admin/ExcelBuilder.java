package spring.controller.admin;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import org.springframework.web.servlet.view.document.AbstractXlsView;

import spring.model.MemberCommand;
 
/**
 * This class builds an Excel spreadsheet document using JExcelApi library.
 * @author www.codejava.net
 *
 */
public class ExcelBuilder extends AbstractXlsView {
 
    @Override
    protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
         
        // create a new Excel sheet
        Sheet sheet = createFirstSheet(workbook);
        createColumnLabel(sheet);
         
        // get data model which is passed by the Spring container
        List<MemberCommand> member = (List<MemberCommand>) model.get("member");
        // create data rows
        int rowCount = 1;//두번째 줄
         
        for (MemberCommand memberList : member) {
            createPageRankRow(sheet,memberList,rowCount++);
        }
        
      response.setHeader("Content-Disposition", "attachment; filename=" + "cdma-statistic" + ".xls");
      //다운받을 파일 이름
      response.setHeader("Content-Description", "JSP Generated Data");
      response.setContentType("application/vnd.ms-excel"); 
    }

	private Sheet createFirstSheet(Workbook workbook) {
		Sheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "회원 관리");
		sheet.setColumnWidth(1,256*20);
		return sheet;
	}
	
	//내용
	private void createPageRankRow(Sheet sheet, MemberCommand memberList, int rowCount) {
		Row row = sheet.createRow(rowCount);
		Cell cell = row.createCell(0);
		cell.setCellValue(memberList.getEmail());
		
		cell = row.createCell(1);
		cell.setCellValue(memberList.getNickname());
		
		cell = row.createCell(2);
		cell.setCellValue(memberList.getReportcount());
		
	}

	//상단 칼럼명
	private void createColumnLabel(Sheet sheet) {
		Row fisrtRow = sheet.createRow(0);
		Cell cell = fisrtRow.createCell(0);
		cell.setCellValue("이메일");
		
		cell= fisrtRow.createCell(1);
		cell.setCellValue("닉네임");
		
		cell= fisrtRow.createCell(2);
		cell.setCellValue("신고 횟수");
		
	}

	

}