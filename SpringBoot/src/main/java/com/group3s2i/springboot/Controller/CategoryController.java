package com.group3s2i.springboot.Controller;


import com.group3s2i.springboot.DAO.CategoryRepository;
import com.group3s2i.springboot.Model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;


@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api")

public class CategoryController {

    @Autowired
    CategoryRepository categoryRepository;

    // get all employees
    @GetMapping("/category")
    public List<Category> getAllCategories(){
        return categoryRepository.findAll();
    }

    @GetMapping("/category/sub/{idUP}")
    public Optional<List<Category>> getCategoryByIdUP(@PathVariable Category idUP){
        return categoryRepository.findByidup (idUP);

    }
    @GetMapping("/category/main")
    public Optional<List<Category>> getCategoryByIdUPEqualsNull(){
        return categoryRepository.findByIdupEqualsNull ();

    }
    @GetMapping("/category/sub")
    public Optional<List<Category>> getCategoryByIdUPNOTEqualsNull(){
        return categoryRepository.findByParentIdNotNull ();

    }
    // get category rest api
    @GetMapping("/category/{id}")
    public ResponseEntity<Category> getCategoryById(@PathVariable long id){
        Category category = categoryRepository.findById(id)
                .orElseThrow(()-> new ResourceNotFoundException("category does not exist with id :"+ id));
        return   ResponseEntity.ok(category);
    }

    //create category rest api
    @PostMapping("/category")
    public Category createCategory(@RequestBody Category category){
        return categoryRepository.save (category);
    }

    @PutMapping("/category/{id}/")
    public ResponseEntity<Category> updateCategory(@PathVariable("id") long id, @RequestBody Category category) {
        System.out.println("Update Category with ID = " + id + "...");

        Optional<Category> optionalCategory = categoryRepository.findById(id);

        if (optionalCategory.isPresent()) {
            Category category1 = optionalCategory.get();
            category1.setName (category.getName());
            category1.setDescription (category.getDescription());
            category1.setParentId (category.getParentId ());

            return new ResponseEntity<>(categoryRepository.save(category), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    @DeleteMapping("/category/{id}")
    public Map<String, Boolean> deleteCategory(@PathVariable(value = "id") Long id)
            throws com.group3s2i.springboot.Exceptions.ResourceNotFoundException {
        Category category = categoryRepository.findById(id)
                .orElseThrow(() -> new com.group3s2i.springboot.Exceptions.ResourceNotFoundException("Category not found  id :: " + id));

        categoryRepository.delete(category);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return response;
    }

    @GetMapping("/category/count")
    public Long count(){
        return categoryRepository.count ();
    }

}
