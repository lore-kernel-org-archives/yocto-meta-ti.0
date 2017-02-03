Return-Path: <v2panchal@live.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6218FE009DA; Fri,  3 Feb 2017 05:12:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (v2panchal[at]live.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [65.55.116.26 listed in list.dnswl.org]
X-Greylist: delayed 62 seconds by postgrey-1.32 at yocto-www;
	Fri, 03 Feb 2017 05:12:30 PST
Received: from BLU004-OMC1S15.hotmail.com (blu004-omc1s15.hotmail.com
	[65.55.116.26])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6ED47E009D4
	for <meta-ti@yoctoproject.org>; Fri,  3 Feb 2017 05:12:30 -0800 (PST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com ([65.55.116.7])
	by BLU004-OMC1S15.hotmail.com over TLS secured channel with
	Microsoft SMTPSVC(7.5.7601.23008); Fri, 3 Feb 2017 05:11:28 -0800
Received: from HE1EUR01FT052.eop-EUR01.prod.protection.outlook.com
	(10.152.0.59) by HE1EUR01HT149.eop-EUR01.prod.protection.outlook.com
	(10.152.1.111) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.874.2;
	Fri, 3 Feb 2017 13:10:46 +0000
Received: from DB6PR0802MB2600.eurprd08.prod.outlook.com (10.152.0.51) by
	HE1EUR01FT052.mail.protection.outlook.com (10.152.1.94) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.874.2 via Frontend Transport; Fri, 3 Feb 2017 13:10:46 +0000
Received: from DB6PR0802MB2600.eurprd08.prod.outlook.com ([10.172.252.17]) by
	DB6PR0802MB2600.eurprd08.prod.outlook.com ([10.172.252.17]) with
	mapi id 15.01.0860.027; Fri, 3 Feb 2017 13:10:46 +0000
From: Vivek Panchal <v2panchal@live.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: Need information about TI DM365 and AM437X support
Thread-Index: AQHSfZmdOzxbD5g7JEqB5Zlki6nylaFXQk+9
Date: Fri, 3 Feb 2017 13:10:46 +0000
Message-ID: <DB6PR0802MB2600E8A185B3690B668549429E4F0@DB6PR0802MB2600.eurprd08.prod.outlook.com>
References: <AM5PR0802MB2596E5D5DCDC6E115C1FAF0E9E4C0@AM5PR0802MB2596.eurprd08.prod.outlook.com>
In-Reply-To: <AM5PR0802MB2596E5D5DCDC6E115C1FAF0E9E4C0@AM5PR0802MB2596.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yoctoproject.org; dkim=none (message not signed)
	header.d=none; yoctoproject.org;
	dmarc=none action=none header.from=live.com; 
x-incomingtopheadermarker: OriginalChecksum:D343C719197B108956767BF136B3287BE4E389F32C821B47C43BD0352F7254B5;
	UpperCasedChecksum:D59F56A29BF154468578AAF50D28C441EEB767BDF2245968AF78A5EFB94D117C;
	SizeAsReceived:7843; Count:39
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [M+RJuAOb4ozDg8nt0pIOn0K/+wnACUDi]
x-incomingheadercount: 39
x-eopattributedmessage: 0
x-microsoft-exchange-diagnostics: 1; HE1EUR01HT149;
	5:rcWRNxAdeoWASnelvMnQNUU9i0FMN0EjzgalOwD/PoIzOnB3cwedU/WjVEHC+zEIylwKUt/TA4YKMRRhmcSC8QRei+KNvcZaKjwBSEvQU00ZB4MjBoFdLEVNIRwxCTBIVcOEcIM1AfdyBdpQSs3pgqeDcf6rrYqDnviOKm2GEXY=;
	24:C2nanY9wlWimGil1fNNJNjVMquG/t/I+EAOhTrXVvmU2grBCLE22ILor/LUC6/cWee/d2fsMORvqPiMKLqzkl+pFHMVH396HTLgVNbiNr5o=;
	7:BO/2lGw1414MGa4osE9L7gkzJAP2eUORjdr3bN7mI52YEkEPN3Qpry0wbJEQrDQaT7AMIB5QyA0LyWFFDg02L2nJVwr29R+6yj4O4QEYQNB1wXTkb2pmp0GBMT30A6JzTNkk4p41WJlPFoTHvNZw9+sBWecWMrhkhLfvzZZWnTPcVd2/XMvyWjyZPpFYPaIomToo2isvmzRDC1dMu28SLhEvUeKae36vXh0U4Deg6fak2wRxnTsTKtCLCip0IogQ+ztR8hlXZCi3Qd4v+wvcQHby32lqz4/9ZKP6ROXlGvRcu8zk8RU0ntwMWVVP8uIukQTB5moWBiiYN+CSteZDhTJr3KqYGOMcJpo5pCYnAmc9D5h7ULCL5wDvmdNRbFLdYYiZcYoZRkLYL4Uy6bYQERnyEoQghLFhYoUqYtKFehUmhH/YGp3rr7qr61zuTBxBuGCkAB27zvc9qIb/ixjh4A34+H7jN2M23qrEl7JTJwuIGF7DmJCogKSZDXfZRaeP+P9Jy+pY0UVGjNIhKj6Aww==
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(10019020)(98900005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1EUR01HT149;
	H:DB6PR0802MB2600.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; 
x-ms-office365-filtering-correlation-id: 0998f852-a103-4692-0a91-08d44c3610f4
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(1601124038)(5061506426)(5061507331)(1603103135)(1601125107)(1701031045);
	SRVR:HE1EUR01HT149; 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(444111334)(432015086)(82015046); SRVR:HE1EUR01HT149;
	BCL:0; PCL:0; RULEID:; SRVR:HE1EUR01HT149; 
x-forefront-prvs: 02070414A1
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: live.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2017 13:10:46.1125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT149
X-OriginalArrivalTime: 03 Feb 2017 13:11:28.0074 (UTC)
	FILETIME=[076B8AA0:01D27E1F]
Subject: Fw: Need information about TI DM365 and AM437X support
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2017 13:12:31 -0000
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DB6PR0802MB2600E8A185B3690B668549429E4F0DB6PR0802MB2600_"

--_000_DB6PR0802MB2600E8A185B3690B668549429E4F0DB6PR0802MB2600_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


I am making Ti's DM365 and AM437x processor based custom boards and thinkin=
g to use yocto project for the same purpose. Till now I don't have any info=
rmation that DM365 is supported in yocto project or not ? I found am437x-ev=
m is supported in it.


I am new to yocto build system and need help to build uboot,kernel, filesys=
tem for above mentioned processors.


Please let me know further path.


Thanks,

V2P

--_000_DB6PR0802MB2600E8A185B3690B668549429E4F0DB6PR0802MB2600_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Arial,Helvetica,sans-serif;" dir=3D"ltr">
<p><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-=
size: 12pt;">Hi,</span><br>
</p>
<div style=3D"color: rgb(0, 0, 0);">
<div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Arial,Helvetica,sans-serif">
<div>
<p><br>
</p>
<p>I am making Ti's DM365 and AM437x processor based custom boards and thin=
king to use yocto project for the same purpose. Till now I don't have any i=
nformation that DM365 is supported in yocto project or not ? I found am437x=
-evm is supported in it.
<br>
</p>
<p><br>
</p>
<p>I am new to yocto build system and need help to build uboot,kernel, file=
system for above mentioned processors.
<br>
</p>
<p><br>
</p>
Please let me know further path.<br>
<br>
</div>
<p></p>
<p>Thanks,</p>
<p>V2P<br>
</p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DB6PR0802MB2600E8A185B3690B668549429E4F0DB6PR0802MB2600_--
