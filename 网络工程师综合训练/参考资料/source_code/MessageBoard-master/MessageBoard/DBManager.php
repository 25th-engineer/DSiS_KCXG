<?php

//  数据管理类
class CDBManager{
    protected $dbServer;
    protected $dbUser;
    protected $dbPass;
    protected $dbName;
    var $conn;

    function __construct()
    {
        $this->conn = new mysqli($this->dbServer, $this->dbUser, $this->dbPass, $this->dbName);
        //检测连接
        if ($this->conn->connect_error)
            echo "连接失败：" . $this->conn->connect_error;
    }

    //  析构函数
    function __destruct(){
        $this->conn->close();
    }

    function getConn()
    {
        return $this->conn;
    }

    function Query($sql)
    {
        $result = $this->conn->query($sql);
        return $result;
    }
}

//  留言板数据管理类
class CMessageBoardDBM extends CDBManager{
    //  构造函数
    function __construct()
    {
        $this->dbServer = "localhost:3306";
        $this->dbUser = "root";
        $this->dbPass = "";
        $this->dbName = "MessageBoard";
        parent::__construct();
    }

    //  析构函数
    function __destruct(){
        parent::__destruct();
    }
}
?>