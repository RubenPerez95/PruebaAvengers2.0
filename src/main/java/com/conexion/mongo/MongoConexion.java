package com.conexion.mongo;

import java.util.Set;
import org.bson.Document;
 
import com.mongodb.*;
import com.mongodb.client.*;
 
public class MongoConexion {
 
	public static void main(String[] args) {
 
		MongoClient mongo = null;
		MongoDatabase db = null;
		MongoCollection<Document> collection = null;
		MongoCursor<Document> cursor = null;
		Set<String> keys = null;
 
		//Conectar con MongoDB
		mongo = CrearConexion();
 
		//OK
		if (mongo !=null){
 
			//Abrir Base de Datos
			db = AbrirBaseDeDatos(mongo);
 
			//Abrir Coleccion
			collection = AbrirColeccion(db);
 
			//Setea cursor
			cursor = collection.find().iterator();
 
			while (cursor.hasNext())
            {
            	Document doc = cursor.next();
            	keys = doc.keySet();
 
            	ScanIntoDocument(doc, keys, false);
            	System.out.println("\n");
            }
 
		}else {
            System.out.println("Error: Conexion no establecida");
		}
	}
 
	/**
	 * CrearConexion
	 * @return
	 */
    private static MongoClient CrearConexion() {
 
    	String bd = "mongodb://usuarioGeneral:usuarioGeneral2018@ds233763.mlab.com:33763/avengerslive";
        MongoClientURI uri=new MongoClientURI(bd);
        MongoClient client=new MongoClient(uri);
 
        return client;
    }
 
    /**
     * AbrirBaseDeDatos
     * @param mongo
     * @return
     */
    private static MongoDatabase AbrirBaseDeDatos(MongoClient mongo){
 
    	return mongo.getDatabase("avengerslive");
    }
 
    /**
     * AbrirColeccion
     * @param db
     * @return
     */
    private static MongoCollection<Document> AbrirColeccion(MongoDatabase db){
 
    	return db.getCollection("Empleados");
    }
 
    /**
     * ScanIntoDocument
     * @param doc
     * @param keys
     * @param tab
     */
    private static void ScanIntoDocument(Document doc, Set<String> keys, boolean tab){
 
    	Integer Numero;
 
    	for (String key : keys){
    		Object ob = doc.get(key);
 
    		if (ob.getClass() == Document.class) {
    			Set<String> OneKeys = null;
    			Document OneDoc = (Document) doc.get(key);
    			OneKeys = OneDoc.keySet();
 
    			System.out.println(key + ": ");
 
    			ScanIntoDocument(OneDoc, OneKeys, true);
 
    		} else if (ob.getClass() == Double.class){
    			Double Ndoble = doc.getDouble(key);
    			Numero = Ndoble.intValue();
    			if (tab){
    	    		System.out.println("\t" + key + ": " + Numero.toString());
    	    	} else{
    			System.out.println(key + ": " + Numero.toString());
    	    	}
 
    		} else{
    			if (tab){
    	    		System.out.println("\t" + key + ": " + doc.get(key).toString());
    	    	} else{
    			System.out.println(key + ": " + doc.get(key).toString());
    	    	}
    		}
    	}
    }
}
