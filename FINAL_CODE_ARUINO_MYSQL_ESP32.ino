
//======================================== Including the libraries.
#include <WiFi.h>
#include <HTTPClient.h>
#include <Arduino_JSON.h>
#include "DHT.h"
//============ Cài đặt DHT11.
#define DHTPIN 4 //-->  Khai báo chân 15 là chân đọc tín hiệu từ DHT11.
#define DHTTYPE DHT11 //--> Khai báo loại cảm biến DHT( DHT11)
DHT dht11_sensor(DHTPIN, DHTTYPE); //--> Khởi tạo cảm biến DHT.
//========================================
// Khai báo  chân đèn trên board 
#define ON_Board_LED 2 

//========================================  SSID và Mật khẩu  WiFi 
const char* ssid = "RCpyahhh";
const char* password = "Z50J1TMO";
//======================================== Biến dữ liệu cho request  HTTP POST.
String postData = ""; //-->  Biến  dữ liệu gửi yêu cầu HTTP POST.
String payload = "";  //-->  Biến  dữ liệu nhận phản hồi từ HTTP POST .
//======================================== 

//======================================== Các biến cho dữ liệu cảm biến DHT11.
float send_Temp;
int send_Humd;
String send_Status_Read_DHT11 = "";
// _________________________Chương trình con để đọc và lấy dữ liệu từ cảm biến DHT11.
void get_DHT11_sensor_data() {
  Serial.println();
  Serial.println("-------------get_DHT11_sensor_data()");
  send_Temp = dht11_sensor.readTemperature();     // Đọc dữ liệu nhiệt độ từ DHT11
  send_Humd = dht11_sensor.readHumidity();        // Đọc dữ liệu độ ẩm  từ DHT11
  
//Kiểm tra xem có bất kỳ lần đọc nào không thành công.
  if (isnan(send_Temp) || isnan(send_Humd)) {
    Serial.println("Failed to read from DHT sensor!");
    send_Temp = 0.00;
    send_Humd = 0;
    send_Status_Read_DHT11 = "FAILED";
  } else {
    send_Status_Read_DHT11 = "SUCCEED";
  }
  
  Serial.printf("Temperature : %.2f °C\n", send_Temp);
  Serial.printf("Humidity : %d %%\n", send_Humd);
  Serial.printf("Status Read DHT11 Sensor : %s\n", send_Status_Read_DHT11);
  Serial.println("-------------");
}

//______________________ VOID SETUP()
void setup() {

  Serial.begin(115200); //--> Khởi tạo giao tiếp  với PC.
  pinMode(ON_Board_LED,OUTPUT); //--> Khai báo ouput chân led board
  digitalWrite(ON_Board_LED, HIGH); //--> Bật Led
  delay(2000);
  digitalWrite(ON_Board_LED, LOW); //--> Tắt Led
  
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  //---------------------------------------- 
  
  Serial.println();
  Serial.println("-------------");
  Serial.print("Connecting");

  int connecting_process_timed_out = 20; //--> 20 = 20 seconds.
  connecting_process_timed_out = connecting_process_timed_out * 2;
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
  
    digitalWrite(ON_Board_LED, HIGH);
    delay(250);
    digitalWrite(ON_Board_LED, LOW);
    delay(250);
  

   //  Kiểm tra kết nối
    if(connecting_process_timed_out > 0) connecting_process_timed_out--;
    if(connecting_process_timed_out == 0) {
      delay(1000);
      ESP.restart();
    }

  }
  //---------------------------------------- 
  
  digitalWrite(ON_Board_LED, LOW); // Tắt đèn LED trên bo mạch khi kết nối với WiFi
  
   Serial.println();
  Serial.print("Successfully connected to : ");
  Serial.println(ssid);
  //Serial.print("IP address: ");
  //Serial.println(WiFi.localIP());
  Serial.println("-------------");
  //---------------------------------------- 

  // Setting up the DHT sensor (DHT11).
  dht11_sensor.begin();

  delay(2000);
}

void loop() {
     if(WiFi.status()== WL_CONNECTED) {
    HTTPClient http;  //--> Khai báo đối tượng của lớp HTTPClient.
    int httpCode;     //--> Biến  trả về HTTP code.
    
    digitalWrite(ON_Board_LED, HIGH);
    Serial.println();
    Serial.println("---------------getdata.php");
   
    // http.begin("http://Dịa chỉ ipv4 máy tính của bạn(gõ ipconfig trên cmd) /Tên thư mục chứa code (nằm trong thư mục htdoc của XAMPP)/getdata.php");
    // Ví dụ  : http.begin("http://192.168.0.0/ESP32_MySQL_Database/Final/getdata.php");     
    
    http.begin("http://192.168.137.1/ESP32_MySQL_Database/Test/getdata.php");  

    http.addHeader("Content-Type", "application/x-www-form-urlencoded");        
   
    httpCode = http.POST(postData); //--> Gửi yêu cầu''
    payload = http.getString();     //--> Nhận phản hồi response payload
  
    Serial.print("httpCode : ");
    Serial.println(httpCode); //--> In ra HTTP  code( vd : 200)
    Serial.print("payload  : ");  //IN ra payload phản hồi từ request
    Serial.println(payload);  //--> 
    
    http.end();  //--> Kết thúc kết nối
    Serial.println("---------------");
    digitalWrite(ON_Board_LED, LOW);
    //........................................ 
     
    delay(1000);

    // Gọi chương trình con get_DHT11_sensor_data().
    get_DHT11_sensor_data();
    // Chuỗi postdata gửi dữ liệu 
    postData = "id=esp32_02";
    postData += "&temperature=" + String(send_Temp);
    postData += "&humidity=" + String(send_Humd);
    postData += "&status_read_sensor_dht11=" + send_Status_Read_DHT11;
    
    payload = "";
    digitalWrite(ON_Board_LED, HIGH);
    Serial.println();
    Serial.println("---------------updateDHT11data_and_recordtable.php");
      
    http.begin("http://192.168.137.1/ESP32_MySQL_Database/Test/updateDHT11data_and_recordtable.php");  //--> Xác định đích gửi dữ liệu 
    http.addHeader("Content-Type", "application/x-www-form-urlencoded");  //--> Specify content-type header
    httpCode = http.POST(postData); //--> Gửi yêu cầu
    payload = http.getString();  //--> Nhận phản hồi (response payload)
  
    Serial.print("httpCode : ");
    Serial.println(httpCode); 
    Serial.print("payload  : ");
    Serial.println(payload);  
    
    http.end(); 
    Serial.println("---------------");
    digitalWrite(ON_Board_LED, LOW);
    //........................................ 
    
    delay(20000);
  }
  //---------------------------------------- 
}
//________________________________________________________________________________ 
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
