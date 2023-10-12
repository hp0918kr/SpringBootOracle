package kopo.poly.service.impl;

import kopo.poly.dto.FoodDTO;
import kopo.poly.service.IFoodService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Slf4j
@Service
public class FoodService implements IFoodService {
    @Scheduled(cron = "* * 3 * * *")
    @Override
    public List<FoodDTO> toDayFood() throws Exception {

        log.info(this.getClass().getName() + ".toDayFood Start!");

        int res = 0;

        String url = "http://www.kopo.ac.kr/kangseo/content.do?menu=262";

        Document doc = null;

        doc = Jsoup.connect(url).get();

        Elements element = doc.select("table.tbl_table tbody");

        Iterator<Element> foodIt = element.select("tr").iterator();

        FoodDTO pDTO = null;

        List<FoodDTO> pList = new ArrayList<>();
        int idx = 0;

        while (foodIt.hasNext()) {

            if (idx++ > 4) {
                break;

            }

            pDTO = new FoodDTO();


            String food = CmmUtil.nvl(foodIt.next().text()).trim();

            log.info("food : " + food);

            pDTO.setDay(food.substring(0, 3));

            pDTO.setFood_nm(food.substring(4));

            pList.add(pDTO);
        }

        log.info(this.getClass().getName() + ".toDayFood End!");

        return pList;
    }
}