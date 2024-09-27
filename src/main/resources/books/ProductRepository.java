package repository;

import model.Product;

import java.util.Arrays;
import java.util.Objects;

public class ProductRepository extends BaseRepository<Product>{
  private static ProductRepository productRepository;
  public static ProductRepository getInstance() {
      if(Objects.isNull(productRepository)) {
          productRepository = new ProductRepository();
      }
      return productRepository;
  }



}
