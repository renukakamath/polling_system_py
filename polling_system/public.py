from flask import *
from database import*
import smtplib
from email.mime.text import MIMEText
from flask_mail import Mail
from datetime import *
from capture import *
from facedetection import *
from model_manager import *

import uuid
import json
from web3 import Web3, HTTPProvider

# truffle development blockchain address
blockchain_address = ' http://127.0.0.1:9545'
# Client instance to interact with the blockchain
web3 = Web3(HTTPProvider(blockchain_address))
# Set the default account (so we don't need to set the "from" for every transaction call)
web3.eth.defaultAccount = web3.eth.accounts[0]
compiled_contract_path = 'C:/Users/renuk/OneDrive/Desktop/RISS/polling_system (2)/polling_system/polling_system/polling_system/polling_system/node_modules/.bin/build/contracts/polling.json'
# compiled_contract_path = 'F:/NGO/node_modules/.bin/build/contracts/medicines.json'
# Deployed contract address (see `migrate` command output: `contract address`)
deployed_contract_address = '0xfb0d9BEF85f375B438196C4551fFa5bF176be385'


public=Blueprint('public',__name__)

@public.route('/')
def homepage():


	q="SELECT * FROM `elections`"
	res=select(q)
	if res:

		from datetime import datetime
		cur_date=datetime.today().strftime('%Y-%m-%d')
		print("cur_date : ",cur_date)


		import time

		curr_time = time.strftime("%H:%M", time.localtime())

		print("Current Time is :", curr_time)
		print("Current Time is :", type(curr_time))

		
		for i in res:
			print(i,"iiiii")
			print("election_date : ",i['election_date'])
			print("election_date : ",type(i['election_date']))
			dd=i['election_date']

			if (cur_date == dd):
				# print("CCCCCCCCCCCC")
				if curr_time > "07.00" and curr_time < "17:00" :
					qq="UPDATE `elections` SET `status`='started' WHERE `election_id`='%s'"%(i['election_id'])
					update(qq)
				elif curr_time > "17:00":
					qq="UPDATE `elections` SET `status`='completed' WHERE `election_id`='%s'"%(i['election_id'])
					update(qq)
					print("hiiiii")
			else:
				print("......................")
			





	return render_template("index.html")


@public.route('/login',methods=['get','post'])
def login():
	if 'submit' in request.form:
		uname=request.form['uname']
		passs=request.form['psw']
		q="SELECT * FROM `login` WHERE `username`='%s' AND `password`='%s'"%(uname,passs)
		res=select(q)

		if res:
			if res[0]['login_type']=='admin':
				flash('WELCOME ADMIN')
				return redirect(url_for("admin.admin_home"))

			elif res[0]['login_type']=='candidate':
				flash('WELCOME CANDIDATE')
				q="SELECT * FROM `candidates` WHERE `login_id`='%s'"%(res[0]['login_id'])
				res1=select(q)
				session['cid']=res1[0]['candidate_id']
				return redirect(url_for("candidates.candidates_home"))

			elif res[0]['login_type']=='district':
				q="SELECT * FROM `districts` WHERE `login_id`='%s'"%(res[0]['login_id'])
				res1=select(q)
				session['district_id']=res1[0]['district_id']
				return redirect(url_for("district.district_home"))

			elif res[0]['login_type']=='booth':
				q="SELECT * FROM `booths` WHERE `login_id`='%s'"%(res[0]['login_id'])
				res1=select(q)
				if res1:
					session['booth_id']=res1[0]['booth_id']
					return redirect(url_for("booth.booth_home"))
				else:
					flash("Username Or Password Incorrect")

			elif res[0]['login_type']=='voter':
				flash('WELCOME VOTER')
				q="SELECT * FROM `voters` WHERE `login_id`='%s'"%(res[0]['login_id'])
				res1=select(q)

				print(q)
				session['voter_id']=res1[0]['voter_id']
				return redirect(url_for("voters.voters_home"))




	return render_template("login.html")

@public.route('/candidates_register',methods=['get','post'])
def candidates_register():
	data={}
	q="SELECT * FROM `elections`"
	res=select(q)
	data['election']=res
	q="SELECT * FROM `districts`"
	res=select(q)
	data['dist']=res
	if 'submit' in request.form:
		uname=request.form['uname']
		district=request.form['district']
		passs=request.form['psw']
		election=request.form['election']
		fname=request.form['fname']
		lname=request.form['lname']
		
		dob=request.form['dob']
		place=request.form['place']
		city=request.form['city']
		state=request.form['state']
		pno=request.form['pno']
		email=request.form['email']
		aadhar=request.form['aadhar']


		img1=request.files['cast']
		cast="static/img"+str(uuid.uuid4())+img1.filename
		img1.save(cast)


		img2=request.files['income']
		income="static/img"+str(uuid.uuid4())+img2.filename
		img2.save(income)
		img3=request.files['ration']

		ration="static/img"+str(uuid.uuid4())+img3.filename
		img3.save(ration)


		img4=request.files['voter']
		voter="static/img"+str(uuid.uuid4())+img4.filename
		img4.save(voter)

		img5=request.files['aadhar']

		aadhar="static/img"+str(uuid.uuid4())+img5.filename
		img5.save(aadhar)

		img6=request.files['ncriminal']

		ncriminal="static/img"+str(uuid.uuid4())+img6.filename
		img6.save(ncriminal)


		img7=request.files['payment']

		payment="static/img"+str(uuid.uuid4())+img7.filename
		img7.save(payment)


		img8=request.files['symbol']

		symbol="static/img"+str(uuid.uuid4())+img8.filename
		img8.save(symbol)


		d= datetime.strptime(dob, '%Y-%m-%d')
		a=datetime.today()
		v=a.year-d.year
		print(v,"...")
		print(d)
		
		
		
		if v<25:
			flash('UNDER AGE')
		else:
			q="SELECT * FROM `candidates` WHERE `aadhar`='%s'"%(aadhar)
			print(q)
			res8=select(q)
			if res8:
				flash('REGISTRATION FAILD BECAUSE AADHAR NUMBER ALREADY EXIST')
			else:
				q="INSERT INTO `login`(`username`,`password`,`login_type`) VALUES('%s','%s','pending')"%(uname,passs)
				login_id=insert(q)
				q="INSERT INTO `candidates` (`login_id`,`election_id`,`first_name`,`last_name`,`age`,`dob`,`place`,`city`,`state`,`phone`,`email`,`candidate_status`,district_id,aadhar,caste_certificate,income_certificate,Ration_card,Voter_id,Aadhar_Card,Non_criminal_certificate,payment_certificate,symbol_certificate) VALUES('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','pending','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(login_id,election,fname,lname,v,dob,place,city,state,pno,email,district,aadhar,cast,income,ration,voter,aadhar,ncriminal,payment,symbol)
				insert(q)
				flash('REGISTERED')
	return render_template("candidates_register.html",data=data)

@public.route('/voter_reg',methods=['get','post'])
def voter_reg():

	data={}
	q="SELECT * FROM `booths`"
	res=select(q)
	data['booth']=res

	
	q="SELECT * FROM `elections`"
	res=select(q)
	data['election']=res

	if 'submit' in request.form:
		booth=request.form['booth']
		election=request.form['election']
		fname=request.form['fname']
		lname=request.form['lname']
		
		dob=request.form['dob']
		place=request.form['place']
		city=request.form['city']
		state=request.form['state']
		phone=request.form['num']
		email=request.form['email']
		uname=request.form['uname']
		passs=request.form['psw']


		cpasss=request.form['cpsw']

		aadhar=request.form['aadhar']
		voterid=request.form['voterid']
		img1=request.files['voterids']
		voterids="static/img"+str(uuid.uuid4())+img1.filename
		img1.save(voterids)
		img2=request.files['aadharcard']
		aadharcard="static/img"+str(uuid.uuid4())+img2.filename
		img2.save(aadharcard)
		
		
		
		q="SELECT * FROM `voters` WHERE `aadhar`='%s'"%(aadhar)
		res8=select(q)
		if res8:
			flash('REGISTRATION FAILD BECAUSE AADHAR NUMBER ALREADY EXIST')
		else:
			q="INSERT INTO `login`(`username`,`password`,`login_type`) VALUES ('%s','%s','voter_pending')"%(uname,passs)	
			login_id=insert(q)

			q="INSERT INTO `voters`(`login_id`,`booth_id`,`election_id`,`first_name`,`last_name`,`dob`,`place`,`city`,`state`,`phone`,`email`,aadhar,voter_id_number,Voterid,aadhar_card,voter_image)VALUES('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','pending')"%(login_id,booth,election,fname,lname,dob,place,city,state,phone,email,aadhar,voterid,voterids,aadharcard)
			insert(q)



			
			with open(compiled_contract_path) as file:
				contract_json = json.load(file)  # load contract info as JSON
				contract_abi = contract_json['abi']  # fetch contract's abi - necessary to call its functions
				contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)
				id=web3.eth.get_block_number()
			message = contract.functions.add_user(id,int(login_id),fname,lname,place,phone,email,voterid,aadhar,voterids).transact()

			path=captures(login_id)
			q="update voters set voter_image='%s' where login_id='%s'"%(path,login_id)
			update(q)
			enf("static/trainimages/")



		



			

			try:
				gmail = smtplib.SMTP('smtp.gmail.com', 587)

				gmail.ehlo()

				gmail.starttls()

				gmail.login('projectsriss2020@gmail.com','messageforall')

			except Exception as e:
				print("Couldn't setup email!!"+str(e))

			msg = MIMEText("Your Username is " + uname +" and password is " + passs  )
			# msg = MIMEText("Your password is Haii")

			msg['Subject'] = 'Your Username and Password'

			msg['To'] = email

			msg['From'] = 'projectsriss2020@gmail.com'

			try:

				gmail.send_message(msg)
				print(msg)
				print(email)
				flash('REGISTERED')

			except Exception as e:

				print("COULDN'T SEND EMAIL", str(e))

				# For Message Close

			# return jsonify({'tasks':"success"})
			flash("Registration Success")
			return redirect(url_for('public.login'))
	
	return render_template("voter_reg.html",data=data)