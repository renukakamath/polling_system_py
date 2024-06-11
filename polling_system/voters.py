from flask import *
from database import*
from core import *
from capture import *
from facedetection import *
from model_manager import *



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




voters=Blueprint('voters',__name__)

@voters.route('/voters_home')
def voters_home():
	return render_template("voters_home.html")

@voters.route('/voters_view_district_details')
def voters_view_district_details():
	data={}

	vid=session['voter_id']
	q="SELECT * FROM `districts`"
	res=select(q)
	data['result']=res

	return render_template("voters_view_district_details.html",data=data)

@voters.route('/voters_view_booth')
def voters_view_booth():
	data={}
	vid=session['voter_id']
	ids=request.args['ids']

	q="SELECT* FROM `booths` WHERE `district_id`='%s'"%(ids)
	res=select(q)
	data['result']=res

	return render_template("voters_view_booth.html",data=data)



@voters.route('/voters_view_candidates')
def voters_view_candidates():
	data={}
	vid=session['voter_id']

	q="SELECT * FROM `candidates`  INNER JOIN `elections` USING (`election_id`) WHERE `candidate_status`='accepted' and district_id=(SELECT `district_id` FROM `voters` INNER JOIN `booths` USING (`booth_id`) WHERE `voter_id`='%s')"%(session['voter_id'])
	res=select(q)
	data['voters']=res
	return render_template("voters_view_candidates.html",data=data)

@voters.route('/voters_view_election_status')
def voters_view_election_status():
	data={}
	vid=session['voter_id']
	
	q="SELECT* FROM `elections`"
	res=select(q)
	data['status']=res

	if 'action' in request.args:
		action=request.args['action']
		ids=request.args['ids']
	else:
		action=None

	if action == "makevote":

		s=vallogin()
		print("valuee..........",s)
		if s == "No face detected, Try register again...":
			flash(s)
			return redirect(url_for('voters.voters_view_election_status'))
		else:
			flash("Verification Completed.")
			return redirect(url_for('voters.voters_make_vote',ids=ids))



	return render_template("voters_view_election_status.html",data=data)

@voters.route('/voters_make_vote')
def voters_make_vote():
	data={}
	vid=session['voter_id']
	ids=request.args['ids']
	data['ids']=ids
	q="SELECT * FROM `vote` INNER JOIN `candidates` USING (`candidate_id`) INNER JOIN `elections` USING (`election_id`) WHERE `election_id`='%s' AND vote.`voter_id`='%s'"%(ids,vid)
	print(q)
	res=select(q)
	if res:
		flash('ALREADY VOTED')
		return redirect(url_for('voters.voters_view_election_status'))
	else:

		q="SELECT *,CONCAT(`first_name`,' ',`last_name`) AS NAME FROM `candidates` WHERE `election_id`='%s' and district_id=(SELECT `district_id` FROM `voters` INNER JOIN `booths` USING (`booth_id`) WHERE `voter_id`='%s')"%(ids,session['voter_id'])
		print(q)
		res=select(q)
		data['candidates']=res

	if 'action'in request.args:
		action=request.args['action']
		cids=request.args['cids']

	else:
		action=None

	if action=='vote':
		cid=request.args['cids']
		q = "select * from vote order by vote_id desc"
		res = select(q)
		if len(res) > 0 :
			previous_hash = res[0]['hash_value']
		else:
			previous_hash = '0'
		hashing_value = str(vid) + str(ids) + str(previous_hash)
		new_hash = get_hashed_value(hashing_value)

		#block

		import datetime
		d=datetime.datetime.now().strftime("%d-%m-%Y %H:%M:%S")
		with open(compiled_contract_path) as file:
			contract_json = json.load(file)  # load contract info as JSON
			contract_abi = contract_json['abi']  # fetch contract's abi - necessary to call its functions
			contract = web3.eth.contract(address=deployed_contract_address, abi=contract_abi)
			id=web3.eth.get_block_number()
		message = contract.functions.add_vote(id,int(vid),int(cid),new_hash,d).transact()


		q="INSERT INTO `vote`(`vote_time`,`voter_id`,`candidate_id`,`hash_value`) VALUES(NOW(),'%s','%s','%s')"%(vid,cid,new_hash)
		insert(q)
		# q="INSERT INTO `vote` (`vote_time`,`voter_id`,`candidate_id`) VALUES (NOW(),'%s','%s')"%(vid,cids)
		# insert(q)
		return redirect(url_for('voters.voters_view_election_status'))

	return render_template("voters_make_vote.html",data=data)


@voters.route('/voters_view_result')
def voters_view_result():
	data={}
	vid=session['voter_id']
	# eid=request.args['eid']
	q="SELECT *, CONCAT (`candidates`.`first_name`,' ',`candidates`.`last_name`)AS NAME FROM `result` INNER JOIN `candidates` USING (`candidate_id`)"
	res=select(q)
	data['result']=res
	return render_template("voters_view_result.html",data=data)

	
