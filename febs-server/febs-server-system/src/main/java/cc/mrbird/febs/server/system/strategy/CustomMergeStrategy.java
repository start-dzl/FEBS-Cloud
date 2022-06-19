package cc.mrbird.febs.server.system.strategy;

import com.alibaba.excel.write.handler.RowWriteHandler;
import com.alibaba.excel.write.metadata.holder.WriteSheetHolder;
import com.alibaba.excel.write.metadata.holder.WriteTableHolder;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;

import java.util.Objects;

/**
 * 自定义单元格合并策略
 */
public class CustomMergeStrategy implements RowWriteHandler {

    Integer start;

    Integer end;

    public CustomMergeStrategy(Integer start, Integer end) {
        this.start = start;
        this.end = end;
    }


    @Override
    public void afterRowDispose(WriteSheetHolder writeSheetHolder, WriteTableHolder writeTableHolder,
                                Row row, Integer relativeRowIndex, Boolean isHead) {
        // 如果是标题,则直接返回
        if (isHead) {
            return;
        }

        // 获取当前sheet
        Sheet sheet = writeSheetHolder.getSheet();


        // 判断是否需要和上一行进行合并
        // 不能和标题合并，只能数据行之间合并
        if (row.getRowNum() <= 1) {
            return;
        }
        // 获取上一行数据
        Row lastRow = sheet.getRow(row.getRowNum() - 1);

        StringBuilder cv = new StringBuilder();
        StringBuilder cvLast = new StringBuilder();

        for (int i = start; i < end; i++) {
            Cell cell = row.getCell(i);
            Cell lastRowCell = lastRow.getCell(i);

            if(!Objects.isNull(cell)&& !Objects.isNull(lastRowCell)) {

                cv.append(cell.getStringCellValue());
                cvLast.append(lastRowCell.getStringCellValue());
                if(cv.toString().equals(cvLast.toString())) {
                    CellRangeAddress cellRangeAddress = new CellRangeAddress(row.getRowNum() - 1, row.getRowNum(), i, i);
                    sheet.addMergedRegionUnsafe(cellRangeAddress);
                }
            }
        }

    }
}
