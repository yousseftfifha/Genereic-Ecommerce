package com.group3s2i.springboot.Controller;


import com.group3s2i.springboot.DAO.OrderRepository;
import com.group3s2i.springboot.Model.Order;
import com.group3s2i.springboot.Service.InvoiceService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Locale;

import static java.lang.String.format;
import static org.springframework.http.HttpStatus.OK;
import static org.springframework.http.MediaType.APPLICATION_PDF;

@Controller
@RequestMapping("/api")
public class InvoiceController {

    static private Logger logger = LogManager.getLogger(InvoiceController.class);

   @Autowired
   private OrderRepository orderRepository;
    @Resource
    private InvoiceService invoiceService;

    // display invoice generator : /resources/templates/forms.html
    @GetMapping("/forms")
    public String invoiceForms() {
        return "forms";
    }

    // generate invoice pdf
    @PostMapping(value = "/invoice/{id}", produces = "application/pdf")
    public ResponseEntity<InputStreamResource> invoiceGenerate(@PathVariable Long id,
                                                               @RequestParam(name = "lang", defaultValue = "en") String lang) throws IOException {
        logger.info("Start invoice generation...");
        final Order order = orderRepository.getById (id);
        final File invoicePdf = invoiceService.generateInvoiceFor(order, Locale.forLanguageTag(lang));
        logger.info("Invoice generated successfully...");

        final HttpHeaders httpHeaders = getHttpHeaders(id, lang, invoicePdf);
        return new ResponseEntity<>(new InputStreamResource(new FileInputStream(invoicePdf)), httpHeaders, OK);
    }

    private HttpHeaders getHttpHeaders(Long id, String lang, File invoicePdf) {
        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentType(APPLICATION_PDF);
        respHeaders.setContentLength(invoicePdf.length());
        respHeaders.setContentDispositionFormData("attachment", format("%s-%s.pdf", id, lang));
        return respHeaders;
    }
}
