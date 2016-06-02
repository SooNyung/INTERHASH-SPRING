package spring.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import spring.model.UserInfoCommand;

	
public class PageRanksView extends AbstractXlsView {
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		response.setHeader("Content-Disposition", "attachment; filename=\"userinfolist.xls\";");
		
		Sheet sheet = createFirstSheet(workbook);
		createColumnLabel(sheet);
	
		List<UserInfoCommand> pageRanks = (List<UserInfoCommand>) model.get("pageRanks");
		int rowNum = 1;
		for (UserInfoCommand rank : pageRanks) {
			createPageRankRow(sheet, rank, rowNum++);
		}
	}
	
	private Sheet createFirstSheet(Workbook workbook) {
		Sheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "유저 목록");
		sheet.setColumnWidth(1, 256 * 20);
		return sheet;
	}
	
	private void createColumnLabel(Sheet sheet) {
		Row firstRow = sheet.createRow(0);
		Cell cell = firstRow.createCell(0);
		cell.setCellValue("이메일");
	
		cell = firstRow.createCell(1);
		cell.setCellValue("비밀번호");
		cell = firstRow.createCell(2);
		cell.setCellValue("나이");
		cell = firstRow.createCell(3);
		cell.setCellValue("핸드폰번호");
		cell = firstRow.createCell(4);
		cell.setCellValue("가입날짜");
	}
	
	private void createPageRankRow(Sheet sheet, UserInfoCommand rank, int rowNum) {
		Row row = sheet.createRow(rowNum);
		Cell cell = row.createCell(0);
		cell.setCellValue(rank.getEmail());
	
		cell = row.createCell(1);
		cell.setCellValue(rank.getPassword());

		cell = row.createCell(2);
		cell.setCellValue(rank.getAge());
		cell = row.createCell(3);
		cell.setCellValue(rank.getPhonenumber());
		cell = row.createCell(4);
		cell.setCellValue(rank.getJoindate().toString());
	}
	
}