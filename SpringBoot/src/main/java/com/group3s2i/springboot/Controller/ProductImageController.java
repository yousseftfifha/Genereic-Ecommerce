package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.Config.response.UploadFileResponse;
import com.group3s2i.springboot.DAO.ProductImageRepository;
import com.group3s2i.springboot.DAO.ProductRepository;
import com.group3s2i.springboot.Model.Category;
import com.group3s2i.springboot.Model.Product;
import com.group3s2i.springboot.Model.ProductImage;
import com.group3s2i.springboot.Service.FileStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @author tfifha youssef
 */
@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api")
public class ProductImageController {

    @Autowired
    private ProductImageRepository productImageRepository;

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private FileStorageService fileStorageService;

    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/product/images")
    public ResponseEntity<List<ProductImage>> getImage () {
        List<ProductImage> productImages = productImageRepository.findAll ();
        return new ResponseEntity<>(productImages, HttpStatus.OK);
    }
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/product/images/{id}")
    public Optional<ProductImage> getAllProductImageByUserId(@PathVariable(value = "id") Long id) {
        return productImageRepository.findById (id);
    }
    @CrossOrigin(origins = "http://localhost:4200")
    @RequestMapping(value = "/uploadFile/product/{id}", method = RequestMethod.POST ,consumes = "multipart/form-data")
    public UploadFileResponse uploadFileToCategory(@RequestPart ("file") MultipartFile file1,@PathVariable("id") Long id) {
        System.out.println("Update User with ID = " + id + "...");
        String fileName = fileStorageService.storeFile(file1);

        String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/downloadFile/")
                .path(fileName)
                .toUriString();
        ProductImage productImage=new ProductImage ();
        productRepository.findById(id).map(product -> {
            productImage.setProduct (product);
            productImage.setUrl (fileDownloadUri);
            return productImageRepository.save(productImage);
        }).orElseThrow(() -> new ResourceNotFoundException ("UserID " + id + " not found"));


        return new UploadFileResponse(fileName, fileDownloadUri,
                file1.getContentType(), file1.getSize());
    }


}
