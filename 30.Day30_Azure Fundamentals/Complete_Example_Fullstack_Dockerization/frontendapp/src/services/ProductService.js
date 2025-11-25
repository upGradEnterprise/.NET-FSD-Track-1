import axios from "axios";
 



const axiosObj = axios.create({
    baseURL:  import.meta.env.VITE_API_URL
});

 

class ProductService {
 
    async getAllProducts() {
        console.log("Message from ProductService");
        return await axiosObj.get("/Products");
    }

    async getProductById(id) {
        return await axiosObj.get(`/Products/${id}`);
    }

    async createProduct(product) {
        return await axiosObj.post('/Products', product);
    } 
}

let productService = new ProductService();

export default productService;