Return-Path: <prvs=151c7130d=Kevin.E.Cribbs@L3Harris.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27B85E00DFC; Thu, 12 Sep 2019 08:19:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_MED autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [166.20.51.117 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 302 seconds by postgrey-1.32 at yocto-www;
	Thu, 12 Sep 2019 08:19:39 PDT
Received: from smtp6out.l-3com.com (smtp6out.l-3com.com [166.20.51.117])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8AC21E00D5F
	for <meta-ti@yoctoproject.org>; Thu, 12 Sep 2019 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=l3harris.com; i=@l3harris.com; q=dns/txt; s=mail1;
	t=1568301581; x=1599837581;
	h=from:to:subject:date:message-id:mime-version;
	bh=Bv8gBM3v5uoa53RPGcy/dl1J+lvU2790xlFOvYSjWx0=;
	b=eJ44GBEbksgncpwFXFVQQW2ILzgNYkuujOPJjcPZscD0jcxZiNfCkvvr
	rdNEcwx3FLa/hEmQfBQq3vEgL57Qu5LJKCWn7c6UTgK5hpfOhH2EqdfX+
	r3pf+x4s/9e4AlhRvEx3QVrt/7utog0SJU7OduJ1hikI9O2/EYITza1s5
	PEsYFkEJ86qlFSIpnUpxnuAwmtgs8+Nofd9KRVp0Z0fey/8JE9zct5put
	rvGTFGp43Vcr7w+9F5UiCrYdZFM7nKa8aYrf56hL6uJ4m5pkEu36RnIyE
	B/zGxoi8z9LF81713jIGEWm6L1jUyqrMDSxSkv7xQ1Wz29M9Vt01qrUCX w==;
X-filenames: image002.png
X-filesizes: 4710
X-filetypes: image/png
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,497,1559520000"; 
	d="png'150?scan'150,208,217,150";a="423764419"
X-L3Internal: true
Received: from ex11dag01azusva.rootforest.com (HELO mail.l3t.com)
	([141.199.128.141])
	by smtp6out.l-3com.com with ESMTP; 12 Sep 2019 15:14:36 +0000
Received: from EX01DAG01AZUSVA.rootforest.com (141.199.128.131) by
	EX11DAG01AZUSVA.rootforest.com (141.199.128.141) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Thu, 12 Sep 2019 15:14:35 +0000
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.183)
	by smtp.l3t.com (141.199.128.131) with Microsoft SMTP Server
	(version=TLS1_2, 
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via
	Frontend Transport; Thu, 12 Sep 2019 15:14:35 +0000
Received: from CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM (52.145.1.138) by
	CY1P110MB0501.NAMP110.PROD.OUTLOOK.COM (52.145.1.145) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.28; Thu, 12 Sep 2019 15:14:33 +0000
Received: from CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM
	([fe80::c82b:7d59:7f61:ead0]) by CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM
	([fe80::c82b:7d59:7f61:ead0%11]) with mapi id 15.20.2136.029;
	Thu, 12 Sep 2019 15:14:33 +0000
From: <Kevin.E.Cribbs@L3Harris.com>
To: <meta-ti@yoctoproject.org>
Thread-Topic: meta-ti (a345e0c2) Linux kernel fails to boot on Beagleboard-xM
	(rev C)
Thread-Index: AdVpe0LdIvib1Q0MQVWJHkv1VVoaYw==
Date: Thu, 12 Sep 2019 15:14:33 +0000
Message-ID: <CY1P110MB04703E6886F03EF65BC06EFFE8B00@CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Kevin.E.Cribbs@L3Harris.com; 
x-originating-ip: [166.20.224.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29f4c797-52f3-4652-f4c4-08d73793eaa2
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
	SRVR:CY1P110MB0501; 
x-ms-traffictypediagnostic: CY1P110MB0501:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY1P110MB05010735C20FC150832AA5CFE8B00@CY1P110MB0501.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(199004)(189003)(7696005)(4744005)(8676002)(102836004)(8936002)(26005)(256004)(606006)(6116002)(86362001)(733005)(2501003)(5660300002)(33656002)(966005)(2351001)(486006)(99936001)(186003)(55016002)(476003)(81166006)(53936002)(71190400001)(14454004)(5640700003)(3846002)(861006)(81156014)(498600001)(6436002)(790700001)(66066001)(6916009)(7736002)(25786009)(66446008)(66476007)(66946007)(64756008)(9686003)(66556008)(6506007)(76116006)(54896002)(74316002)(99286004)(2906002)(236005)(52536014)(71200400001)(6306002)(66616009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1P110MB0501;
	H:CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:3; MX:3; 
x-ms-exchange-senderadcheck: 1
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f4c797-52f3-4652-f4c4-08d73793eaa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 15:14:33.1223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba488c5e-f105-4a2b-a8b1-b57b26a44117
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kevin.E.Cribbs@cse.L3T.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0501
X-OriginatorOrg: L3Harris.com
Subject: meta-ti (a345e0c2) Linux kernel fails to boot on Beagleboard-xM (rev C)
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
X-List-Received-Date: Thu, 12 Sep 2019 15:19:44 -0000
X-Groupsio-MsgNum: 12195
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_CY1P110MB04703E6886F03EF65BC06EFFE8B00CY1P110MB0470NAMP_";
	type="multipart/alternative"

--_004_CY1P110MB04703E6886F03EF65BC06EFFE8B00CY1P110MB0470NAMP_
Content-Type: multipart/alternative;
	boundary="_000_CY1P110MB04703E6886F03EF65BC06EFFE8B00CY1P110MB0470NAMP_"

--_000_CY1P110MB04703E6886F03EF65BC06EFFE8B00CY1P110MB0470NAMP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I created a Yocto Project Bugzilla bug (13517) for this problem. Randy MacL=
eod said "meta-ti is not tracked in this bugzilla. Please contact the BSP o=
wner".
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13517

What is the correct procedure for reporting problems with the meta-ti layer?

Kevin Cribbs
Principal Member Engineering Staff
Integrated Mission Systems / L3HARRIS TECHNOLOGIES
t +1 856 338 3763
L3Harris.com / kevin.e.cribbs@L3Harris.com
1 Federal Street / Camden, NJ 08103 / USA
[L3Harris_Lockup_TM]<http://www.l3harris.com/>


  =


CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient and may contain material that is proprietary, co=
nfidential, privileged or otherwise legally protected or restricted under a=
pplicable government laws. Any review, disclosure, distributing or other us=
e without expressed permission of the sender is strictly prohibited. If you=
 are not the intended recipient, please contact the sender and delete all c=
opies without reading, printing, or saving.


--_000_CY1P110MB04703E6886F03EF65BC06EFFE8B00CY1P110MB0470NAMP_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Minion Pro";
	panose-1:2 4 5 3 5 3 6 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I created a Yocto Project Bugzilla bug (13517) for t=
his problem. Randy MacLeod said &#8220;meta-ti is not tracked in this bugzi=
lla. Please contact the BSP owner&#8221;.<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D13517">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13517=
</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What is the correct procedure for reporting problems=
 with the meta-ti layer?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><b><span style=3D"font=
-size:12.0pt;color:black">Kevin Cribbs<o:p></o:p></span></b></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><b><span style=3D"font=
-size:10.0pt;color:black">Principal Member Engineering Staff<br>
</span></b><b><span style=3D"font-size:9.0pt;color:#CF102D;text-transform:u=
ppercase">Integrated Mission Systems / L3HARRIS TECHNOLOGIES<o:p></o:p></sp=
an></b></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;color:black">t &#43;1 856 338 3763<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;color:black">L3Harris.com / kevin.e.cribbs@L3Harris.com<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt;text-autospace:none"><=
span style=3D"font-size:9.0pt;color:black">1 Federal Street / Camden, NJ 08=
103 / USA<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt;text-autospace:none"><=
a href=3D"http://www.l3harris.com/"><span style=3D"font-size:12.0pt;color:b=
lack;text-decoration:none"><img border=3D"0" width=3D"134" height=3D"29" st=
yle=3D"width:1.3958in;height:.302in" id=3D"Picture_x0020_1" src=3D"cid:imag=
e002.png@01D5695B.3FE350A0" alt=3D"L3Harris_Lockup_TM"></span></a><span sty=
le=3D"font-size:12.0pt;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<span><span><br>&nbsp;</span>&nbsp;</span><br>
<DIV><span style=3D"FONT-FAMILY: Times New Roman"><span style=3D"FONT-SIZE:=
 14px">CONFIDENTIALITY NOTICE: This email and any attachments are for the s=
ole use of the intended recipient and may contain material that is propriet=
ary, confidential, privileged or otherwise legally protected or restricted =
under applicable government laws. Any review, disclosure, distributing or o=
ther use without expressed permission of the sender is strictly prohibited.=
 If you are not the intended recipient, please contact the sender and delet=
e all copies without reading, printing, or saving.</span></span>
<DIV style=3D'FONT-SIZE: 14px; FONT-FAMILY: "Times New Roman"'><br></DIV></=
DIV></body>
</html>

--_000_CY1P110MB04703E6886F03EF65BC06EFFE8B00CY1P110MB0470NAMP_--

--_004_CY1P110MB04703E6886F03EF65BC06EFFE8B00CY1P110MB0470NAMP_
Content-Type: image/png; name="image002.png"
Content-Description: image002.png
Content-Disposition: inline; filename="image002.png"; size=4710;
	creation-date="Thu, 12 Sep 2019 15:14:32 GMT";
	modification-date="Thu, 12 Sep 2019 15:14:32 GMT"
Content-ID: <image002.png@01D5695B.3FE350A0>
Content-Transfer-Encoding: base64

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

--_004_CY1P110MB04703E6886F03EF65BC06EFFE8B00CY1P110MB0470NAMP_--
