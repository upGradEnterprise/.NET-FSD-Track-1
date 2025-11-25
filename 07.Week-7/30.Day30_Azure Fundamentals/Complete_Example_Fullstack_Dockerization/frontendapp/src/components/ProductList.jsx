// src/components/ProductList.js
import { useEffect, useState } from "react";
import productService from "../services/ProductService";
import "./ProductList.css";

function ProductList() {
  const [products, setProducts] = useState([]);
 

  
  useEffect( () => {

    async function fetchData() {
     try {
          const response =  await productService.getAllProducts();          
           setProducts(response.data);
    } catch (err) {
      console.error("Error fetching products", err);
    }
  }

  fetchData();
  }, []);

   

  return (
    <div className="container">
      <h3>Product Management (Front-End Application)</h3>
  

      <table className="product-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price ($)</th>
            <th>Category</th> 
          </tr>
        </thead>
        <tbody>
          {products.map((p) => (
            <tr key={p.id}>
              <td>{p.id}</td>
              <td>{p.name}</td>
              <td>{p.price}</td>
              <td>{p.category}</td> 
            </tr>
          ))}
          {products.length === 0 && (
            <tr>
              <td colSpan="5" className="no-data">
                No products found.
              </td>
            </tr>
          )}
        </tbody>
      </table>
    </div>
  );
}


export default ProductList;