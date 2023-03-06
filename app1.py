from flask import flash,Flask,render_template,redirect,url_for,jsonify,request,session
from flask_mysqldb import MySQL
import flask_excel as excel
from flask_session import Session
app=Flask(__name__)
app.secret_key='A@Bullela@_3'
app.config['MYSQL_HOST'] ='localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD']='Yashu@123456'
app.config['MYSQL_DB']='FACULTY'
app.config["SESSION_TYPE"] = "filesystem"
mysql=MySQL(app)
excel.init_excel(app)
Session(app)
@app.route('/')
def welcome():
    return render_template('mainpage.html')
@app.route('/mainpage')
def home():
    return render_template('mainpage.html')
@app.route('/Aboutpage')
def about():
    return render_template('aboutpage.html')
@app.route('/blog')
def blog():
    return render_template('blog.html')        
@app.route('/registerpage',methods=['GET','POST'])
def register():
    if request.method=="POST":
        cursor=mysql.connection.cursor()
        fac_id=request.form['id']
        cursor.execute('SELECT Faculty_id from faculty')
        data=cursor.fetchall()
        cursor.close()
        if (fac_id,) in data:
            flash('Faculty Id already exists')
            return render_template('facultyregister.html')
        name=request.form['name']
        gender=request.form['gender']
        contactno=request.form['contactno']
        email=request.form['email']
        subjects=request.form['subjects']
        sections=request.form['sections']
        dept=request.form['dept']
        security_key=request.form['security_key']
        cursor=mysql.connection.cursor()
        cursor.execute('SELECT contact_no from faculty')
        contacts=cursor.fetchall()
        cursor.close()
        if (contactno,) in  contacts:
            flash('Contact no already exists')
            return render_template('facultyregister.html')
        cursor=mysql.connection.cursor()
        cursor.execute('SELECT email_id from faculty')
        emails=cursor.fetchall()
        cursor.execute('SELECT email from admin')
        admin_emails=cursor.fetchall()
        cursor.close()
        if (email,) in  emails or (email,) in admin_emails:
            flash('email id already exists')
            return render_template('facultyregister.html')
        cursor=mysql.connection.cursor()
        cursor.execute('SELECT security_code from faculty')
        security_codes=cursor.fetchall()
        cursor.execute('SELECT security_code from admin')
        admin_codes=cursor.fetchall()
        cursor.close()
        if (security_key,) in security_codes or (security_key,) in admin_codes :
            flash('Security key already exists')
            return render_template('facultyregister.html')
        password=request.form['password']
        cursor=mysql.connection.cursor()
        cursor.execute('INSERT INTO FACULTY (fac_id,fac_name,fac_dept,fac_email,fac_password)VALUES(%s,%s,%s,%s,%s)',[fac_id,fac_name,fac_dept,fac_email,fac_password])
        mysql.connection.commit()
        flash('Details Registered Succesfully!')
        return render_template('facultyregister.html')
    return render_template('facultyregister.html')

@app.route('/facultylogin',methods=['GET','POST'])
def facultylogin():
    if request.method=='POST':
        user=request.form['userName']
        password=request.form['password']
        cursor=mysql.connection.cursor()
        cursor.execute('SELECT userName,password from admin where userName=%s',[user])
        data=cursor.fetchall()[0]
        user=data[0]
        password=data[1]
        cursor.close()
        if user==user and password==password:
            return redirect(url_for('dashboard'))
        else:
            return render_template('facultyloginpage.html')
    return render_template('facultyloginpage.html')
@app.route('/forgetpassword',methods=['GET','POST'])
def password():
    if request.method=='POST':
        print(request.form)
        key=request.form['key']
        password=request.form['password']
        email=request.form['email']
        passcode=request.form['p_key']
        if key==secret_key:
            cursor=mysql.connection.cursor()
            cursor.execute('update admin set password=%s,email=%s,passcode=%s',[password,email,passcode])
            mysql.connection.commit()
            cursor.close()
            return redirect(url_for('home'))
        else:
            return redirect(url_for('password'))
    return render_template('secret.html')
@app.route("/dashboard",methods=['GET','POST'])
def dashboard():
    return render_template('dashboard.html')
@app.route("/feedback",methods=['GET','POST'])
def feedbackform():
    return render_template('feedback.html')
@app.route("/calendar",methods=['GET','POST'])
def calendar():
    return render_template('calendar.html')
@app.route('/addfeedback',methods=['GET','POST'])
def addfeedback():
    if request.method=='POST':
        print(request.form)
        roll_no=request.form['rollno']
        full_name=request.form['fullname']
        mail_id=request.form['mailid']
        mobile_no=request.form['mobileno']
        section=request.form['section']
        faculty_name=request.form['facname']
        dept_name=request.form['Deptname']
        subject=request.form['subject']
        feedback=request.form['feedback']
        cursor=mysql.connection.cursor()
        cursor.execute('insert into feedback(roll_no,full_name,mail_id,mobile_no,faculty_name,dept_name,subject,feedback,section) values(%s,%s,%s,%s,%s,%s,%s,%s,%s)',[roll_no,full_name,mail_id,mobile_no,faculty_name,dept_name,subject,feedback,section])
        mysql.connection.commit()
        cursor.close()
        return '''<h1>form details submitted<h1>'''
    return render_template('dashboard.html')

@app.route('/viewfeedback',methods=['GET','POST'])
def view():
    if request.method=="POST":
        section=request.form['section']
        cursor=mysql.connection.cursor()
        cursor.execute('SELECT * from feedback where section=%s',[section])
        feedback=cursor.fetchall()
        cursor.close()
        return render_template('table.html',section=feedback)
    return render_template('viewform.html')

@app.route('/download',methods=['GET'])
def download():
    if request.method=="GET":
        cursor=mysql.connection.cursor()
        cursor.execute('DESC FEEDBACK')
        feedback=cursor.fetchall()
        lst=[i[0] for i in feedback]
        cursor.execute('SELECT * from feedback')
        data=[list(i) for i in cursor.fetchall()]
        print(data)
        data.insert(0,lst)
        return excel.make_response_from_array(data, "xlsx",file_name="feedback_data")
@app.route('/logout')
def logout():
    session['user']=None
    return render_template('mainpage.html')
if __name__=='__main__':
    app.run(debug=True,use_reloader=True)
