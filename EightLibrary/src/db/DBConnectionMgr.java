/**
 * Copyright(c) 2001 iSavvix Corporation (http://www.isavvix.com/)
 *
 *                        All rights reserved
 *
 * Permission to use, copy, modify and distribute this material for
 * any purpose and without fee is hereby granted, provided that the
 * above copyright notice and this permission notice appear in all
 * copies, and that the name of iSavvix Corporation not be used in
 * advertising or publicity pertaining to this material without the
 * specific, prior written permission of an authorized representative of
 * iSavvix Corporation.
 *
 * ISAVVIX CORPORATION MAKES NO REPRESENTATIONS AND EXTENDS NO WARRANTIES,
 * EXPRESS OR IMPLIED, WITH RESPECT TO THE SOFTWARE, INCLUDING, BUT
 * NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR ANY PARTICULAR PURPOSE, AND THE WARRANTY AGAINST
 * INFRINGEMENT OF PATENTS OR OTHER INTELLECTUAL PROPERTY RIGHTS.  THE
 * SOFTWARE IS PROVIDED "AS IS", AND IN NO EVENT SHALL ISAVVIX CORPORATION OR
 * ANY OF ITS AFFILIATES BE LIABLE FOR ANY DAMAGES, INCLUDING ANY
 * LOST PROFITS OR OTHER INCIDENTAL OR CONSEQUENTIAL DAMAGES RELATING
 * TO THE SOFTWARE.
 *
 */

package db;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Vector;

/**
 * Manages a java.sql.Connection pool.
 *
 * @author  Anil Hemrajani
 */
public class DBConnectionMgr {

    //
	//private MemberDBMgr mem =null;
    private Vector connections = new Vector(10);
    /*   MySQL */
    
    

    private String _driver,_url,_user,_password;
    /*
	private String _driver = "org.gjt.mm.mysql.Driver",
    _url = "jdbc:mysql://127.0.0.1:3306/mydb?useUnicode=true&characterEncoding=UTF-8",
    _user = "root",  
    _password = "1234"; 
    */
	/*
	 * private String _driver = "oracle.jdbc.driver.OracleDriver", _url =
	 * "jdbc:oracle:thin:@localhost:1521:orcl", _user = "scott", _password =
	 * "tiger";
	 */

    private boolean _traceOn = false;
    private boolean initialized = false;
	
	//而ㅵ뜝�뙏�눦�삕�뜝�룞�삕 10�뜝�룞�삕 �뜝�뙏釉앹삕
    private int _openConnections = 10;

    //而ㅵ뜝�뙏�눦�삕���뜝�룞�삕泥닷뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
    private static DBConnectionMgr instance = null;

    //(2)dbmysql.properties占쎈솁占쎌뵬占쎌뱽 占쎌뵭占쎈선占쎈굶占쎈연占쎄퐣 占쎄텕->揶쏅�れ뱽 �겫�뜄�쑎占쎌궎疫뀐옙
    public DBConnectionMgr() throws IOException {
    	Properties props=new Properties();
    	FileInputStream in=new FileInputStream
    			("C:/Users/kitcoop/git/EightLibrary/EightLibrary/WebContent/dbtest/dbmysql.properties");
    			//("C:/webtest/4.jsp/sou/EightLibrary/WebContent/dbtest/dbmysql.properties");
    	props.load(in);//占쎈솁占쎌뵬占쎌벥 占쎄땀占쎌뒠 筌롫뗀�걟�뵳�딅퓠 �겫�뜄�쑎占쎌궎疫뀐옙
    	in.close();
    	_driver=props.getProperty("jdbc.drivers");
    	//占쎈굡占쎌뵬占쎌뵠�뇡�슢彛� 占쎈뻻占쎈뮞占쎈�ο옙肉� 獄쏆꼷�겫
    	if(_driver!=null)  System.setProperty("jdbc.drivers", _driver);//占쎈쾻嚥∽옙
    	//-------------------------------------------------------------------
    	_url=props.getProperty("jdbc.url");
    	_user=props.getProperty("jdbc.username");
    	_password=props.getProperty("jdbc.password");
    	System.out.println("_driver=>"+(_driver)+",_url=>"+(_url));
    	System.out.println("_user=>"+(_user)+",_password=>"+(_password));
    }

    /** Use this method to set the maximum number of open connections before
     unused connections are closed.
     */
  
    //�뚣끇苑뽳옙�∽옙占쏙옙�뱽 占쎈섯占쎈선占쎌궎占쎈뮉 占쎌젟占쎌읅筌롫뗄苑뚳옙諭�
    public static DBConnectionMgr getInstance() throws Exception{
        //�뚣끇苑뽳옙�∽옙占쏙옙�뵠 占쎄문占쎄쉐占쎌뵠 占쎈툧占쎈┷占쎈선占쎌뿳占쎈뼄筌롳옙
		if (instance == null) {
            synchronized (DBConnectionMgr.class) {
                //占쎄문占쎄쉐占쎌뵠 占쎈툧占쎈┷占쎈선占쎌뿳占쎈뼄筌롳옙
				if (instance == null) {
					//揶쏆빘猿쒙옙源�占쎄쉐
                    instance = new DBConnectionMgr();
                }
            }
        }
        return instance;//占쎌깈�빊�뮉釉� 占쎄깻占쎌삋占쎈뮞筌잛럩�몵嚥∽옙 獄쏆꼹�넎
    }
    //----------------------------------------------------------------------
    public void setOpenConnectionCount(int count) {
        _openConnections = count;
    }


    public void setEnableTrace(boolean enable) {
        _traceOn = enable;
    }


    /** Returns a Vector of java.sql.Connection objects */
    public Vector getConnectionList() {
        return connections;
    }


    /** Opens specified "count" of connections and adds them to the existing pool */
    //�뜝�떗湲곗뿉 �뜝�룞�삕�뜝�뜥媛앹껜�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�뙇�뙋�삕 �뜝�뙣�냼�벝�삕

	public synchronized void setInitOpenConnections(int count)
            throws SQLException {

        Connection c = null;//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕泥�
        ConnectionObject co = null;//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�뜥媛앹껜
		                           //�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�뙇�뙋�삕 �뜝�룞�삕泥�

        for (int i = 0; i < count; i++) {
			//count�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�겮 �뜝�룞�삕�뜝�뜥媛앹껜�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
            c = createConnection();
			//�뜝�룞�삕�뜝�떢�슱�삕 �뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�뜥媛앹껜,�뜝�럥�뿬�뜝�룞�삕�뜝�룞�삕
            co = new ConnectionObject(c, false);
             //�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�떢�슱�삕 �뜝�룞�삕�뜝�뜥媛앹껜�뜝�룞�삕 �뜝�뙥怨ㅼ삕
            connections.addElement(co);
            trace("ConnectionPoolManager: Adding new DB connection to pool (" + connections.size() + ")");
        }
    }


    /** Returns a count of open connections */
    public int getConnectionCount() {
        return connections.size();
    }


    /** Returns an unused existing or new connection.  */
    //�뜝�룞�삕�뜝�뜥媛앹껜�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙣�냼�벝�삕

	public synchronized Connection getConnection()
            throws Exception {
        if (!initialized) {
			//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 DB�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕鈺닷뜝�룞�삕�뜝占� �뜝�뙣紐⑤━�슱�삕 �뜝�떥�벝�삕
            Class c = Class.forName(_driver);
			//�뜝�뙓�벝�삕 �뜝�룞�삕�뜝占�(�뜝�룞�삕�뜝�룞�삕鈺닷뜝�떊�띿삕�뜝�룞�삕�뜝占�)
            DriverManager.registerDriver((Driver) c.newInstance());

            initialized = true;//�뜝�룞�삕�뜝�뙂�궪�삕�뜝�룞�삕 
        }


        Connection c = null;
        ConnectionObject co = null;
		//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�뜥媛앹껜
        boolean badConnection = false;


        for (int i = 0; i < connections.size(); i++) {
			//�뜝�룞�삕�뜝�떢�슱�삕 �뜝�룞�삕雍됵옙 �뜝�룞�삕�뜝�뜥媛앹껜�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�듅�뙋�삕.
            co = (ConnectionObject) connections.elementAt(i);

            // If connection is not in use, test to ensure it's still valid!
            if (!co.inUse) {//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�듅�씛�삕�뜝占� 
                try {
					//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�뜥媛앹껜 �뜝�룞�삕�뜝�룞�삕
                    badConnection = co.connection.isClosed();
                    if (!badConnection)
                        badConnection = (co.connection.getWarnings() != null);
                } catch (Exception e) {
                    badConnection = true;
                    e.printStackTrace();
                }

                // Connection is bad, remove from pool
                if (badConnection) { //�뜝�룞�삕�뜝�룞�삕�뜝�떗怨ㅼ삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
				    //�뜝�룞�삕�뜝�떢�슱�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦�씛�삕
                    connections.removeElementAt(i);
                    trace("ConnectionPoolManager: Remove disconnected DB connection #" + i);
                    continue;
                }

                c = co.connection;
                co.inUse = true;//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕

                trace("ConnectionPoolManager: Using existing DB connection #" + (i + 1));
                break;
            }
        }
        //�뜝�룞�삕泥��뜝�룞�삕 �뜝�룞�삕�뜝�듅�떎紐뚯삕(�뜝�룞�삕�뜝�룞�삕�뜝�떦�떎紐뚯삕)
        if (c == null) {
            c = createConnection();
            co = new ConnectionObject(c, true);
            connections.addElement(co);//�뜝�룞�삕�뜝�떢�슱�삕�뜝�뙥怨ㅼ삕

            trace("ConnectionPoolManager: Creating new DB connection #" + connections.size());
        }

        return c;//�뜝�룞�삕�솚
    }


    /** Marks a flag in the ConnectionObject to indicate this connection is no longer in use */
    //�뜝�뙠�냲�삕�뜝�룞�삕�뜝�뙇�뙋�삕 �뜝�뙣�냼�벝�삕
	public synchronized void freeConnection(Connection c) {
        if (c == null)//�뜝�뙠�냲�삕�뜝�룞�삕�뜝�뙇�뙋�삕 �뜝�룞�삕�뜝�뜥媛앹껜�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
            return;

        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            //�뜝�뙠�냲�삕�뜝�룞�삕 �뜝�룞�삕�뜝�뜥媛앹껜==�뜝�뙣紐⑤━�궪�삕�뜝�룞�삕 李얍뜝�룞�삕 �뜝�룞�삕泥�
			if (c == co.connection) {
                co.inUse = false;//�뜝�뙠�냲�삕泥섇뜝�룞�삕
                break;
            }
        }

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            //10�뜝�떛�궪�삕�뜝�룞�삕 �뜝�떬嫄곕냲�삕 
			//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�뜥媛앹껜�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
			if ((i + 1) > _openConnections && !co.inUse)
                removeConnection(co.connection);
        }
    }

    public void freeConnection(Connection c, PreparedStatement p, ResultSet r) {
        try {
            if (r != null) r.close();
            if (p != null) p.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, Statement s, ResultSet r) {
        try {
            if (r != null) r.close();
            if (s != null) s.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, PreparedStatement p) {
        try {
            if (p != null) p.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, Statement s) {
        try {
            if (s != null) s.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    /** Marks a flag in the ConnectionObject to indicate this connection is no longer in use */
    public synchronized void removeConnection(Connection c) {
        if (c == null)
            return;

        ConnectionObject co = null;
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (c == co.connection) {
                try {
                    c.close();
                    connections.removeElementAt(i);
                    trace("Removed " + c.toString());
                } catch (Exception e) {
                    e.printStackTrace();
                }

                break;
            }
        }
    }


    private Connection createConnection()
            throws SQLException {
        Connection con = null;

        try {
            if (_user == null)
                _user = "";
            if (_password == null)
                _password = "";

            Properties props = new Properties();
            props.put("user", _user);
            props.put("password", _password);

            con = DriverManager.getConnection(_url, props);
        } catch (Throwable t) {
            throw new SQLException(t.getMessage());
        }

        return con;
    }


    /** Closes all connections and clears out the connection pool */
    public void releaseFreeConnections() {
        trace("ConnectionPoolManager.releaseFreeConnections()");

        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (!co.inUse)
                removeConnection(co.connection);
        }
    }


    /** Closes all connections and clears out the connection pool */
    public void finalize() {
        trace("ConnectionPoolManager.finalize()");

        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            try {
                co.connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            co = null;
        }

        connections.removeAllElements();
    }


    private void trace(String s) {
        if (_traceOn)
            System.err.println(s);
    }

}

//inner class�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
class ConnectionObject {
	//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�뜥媛앹껜
    public java.sql.Connection connection = null;
    public boolean inUse = false;//�뜝�럥�뿬�뜝�룞�삕�뜝�룞�삕

    public ConnectionObject(Connection c, boolean useFlag) {
        connection = c;
        inUse = useFlag;
    }
}
