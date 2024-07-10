package p2;
import java.sql.*;
import java.util.ArrayList;

public class Connect {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public Connect()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/tution","root","root");
			System.out.println("MySQL DB Connected !!!");
		}
		catch(Exception e)
		{
			System.out.println("MySQL DB Connection Error :: " + e.getMessage());
			e.printStackTrace();
		}
	}
	public ArrayList<String> getCategory()
	{
		ArrayList<String> arr=new ArrayList<String>	();
		
		try {
			String sql="select distinct(category) from products;";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				 
				arr.add(rs.getString(1));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return arr;	
	}
	
	public ArrayList<Products> getAllRecords(String category) {
		ArrayList<Products>arr = new ArrayList<Products>();
		try {
			String sql="";
			if(category.equals("all"))
			{
				sql = "select id,title,category,description,image,price,`rating.rate` from products;";
				ps=con.prepareStatement(sql);
			}
			else {
				sql = "select id,title,category,description,image,price,`rating.rate` from products where category=?;";
				ps = con.prepareStatement(sql);
				ps.setString(1,category);
			}
			rs=ps.executeQuery();
			while(rs.next())
			{
				Products p1=new Products();
				p1.setId(rs.getInt(1));
				p1.setTitle(rs.getString(2));
				p1.setCategory(rs.getString(3));
				p1.setDescription(rs.getString(4));
				p1.setImage(rs.getString(5));
				p1.setPrice(rs.getDouble(6));
				p1.setRate(rs.getDouble(7));
				arr.add(p1);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}

	public ArrayList<Products> getAllProducts(String pname)
	{
		ArrayList<Products> arr=new ArrayList<Products>();
		try {
			String sql="";
			sql="select id,title,category,description,image,price,`rating.rate` from products where title like ?";
			ps=con.prepareStatement(sql);
			ps.setString(1, pname + "%");
			rs=ps.executeQuery();
			while(rs.next())
			{
				Products p1=new Products();
				p1.setId(rs.getInt(1));
				p1.setTitle(rs.getString(2));
				p1.setCategory(rs.getString(3));
				p1.setDescription(rs.getString(4));
				p1.setImage(rs.getString(5));
				p1.setPrice(rs.getDouble(6));
				p1.setRate(rs.getDouble(7));
				arr.add(p1);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}

}