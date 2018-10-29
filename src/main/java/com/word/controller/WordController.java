package com.word.controller;

import com.word.dto.ShowPage;
import com.word.dto.Table;
import com.word.service.WordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by XiuYin.Cui on 2018/1/11.
 */
@Controller
public class WordController {

    @Autowired
    private WordService tableService;

    @RequestMapping("/getWord")
    public String getJson(Model model){
        List<Table> list = tableService.tableList();

        List<ShowPage> getShowPageList = getShowPageList(list);
        model.addAttribute("table",getShowPageList);
        return "word";
    }


    private List<ShowPage> getShowPageList(List<Table> tableList){
        List<ShowPage> showPageList = new ArrayList<>();
        String thisTitle="";
        String nextTitle="";
        int i = 1;
        int j = 1;
        int m = 1;
        ShowPage showPage = new ShowPage();
        List<Table> list = new ArrayList<>();
        for(Table temp:tableList){
            thisTitle= temp.getTitle();
            if(thisTitle.equals(nextTitle)){
                String tag = temp.getTag();
                temp.setTagNew("接口名称："+tag);
                temp.setTag(i+"."+j+" "+temp.getTag());
                list.add(temp);
                j++;
            }else if(!nextTitle.equals("")){
                showPage.setTitle(i+"."+nextTitle);
                showPage.setTableList(list);
                showPageList.add(showPage);
                i++;
                j=1;
                showPage = new ShowPage();
                list = new ArrayList<>();
            }
            nextTitle= temp.getTitle();
        }
        return showPageList;
    }
}
