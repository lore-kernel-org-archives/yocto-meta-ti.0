Return-Path: <sarvesh.patkar@thermofisher.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0F26E009AA; Thu, 30 Aug 2018 19:36:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [148.163.148.140 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
X-Greylist: delayed 1224 seconds by postgrey-1.32 at yocto-www;
	Thu, 30 Aug 2018 19:36:36 PDT
Received: from mx0a-002a2102.pphosted.com (mx0a-002a2102.pphosted.com
	[148.163.148.140])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0C55E00994
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2018 19:36:36 -0700 (PDT)
Received: from pps.filterd (m0126707.ppops.net [127.0.0.1])
	by mx0a-002a2102.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7V2DSnI194843
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2018 02:16:12 GMT
Received: from nam05-co1-obe.outbound.protection.outlook.com
	(mail-co1nam05lp0082.outbound.protection.outlook.com [216.32.181.82])
	by mx0a-002a2102.pphosted.com with ESMTP id 2m60vtxwf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2018 02:16:12 +0000
Received: from BN6PR07MB3585.namprd07.prod.outlook.com (10.161.153.151) by
	BN6PR07MB3172.namprd07.prod.outlook.com (10.172.105.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1080.17; Fri, 31 Aug 2018 02:16:10 +0000
Received: from BN6PR07MB3585.namprd07.prod.outlook.com
	([fe80::f99b:41e9:427d:d67]) by BN6PR07MB3585.namprd07.prod.outlook.com
	([fe80::f99b:41e9:427d:d67%2]) with mapi id 15.20.1080.015;
	Fri, 31 Aug 2018 02:16:10 +0000
From: "Patkar, Sarvesh S." <sarvesh.patkar@thermofisher.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: BeagleBone Black: cannot access USB MSC devices
Thread-Index: AdRA0Cz8Ln8SNU5FRUaFx/jzxarsxg==
Date: Fri, 31 Aug 2018 02:16:09 +0000
Message-ID: <BN6PR07MB3585011B103A75E5F1964AF3E40F0@BN6PR07MB3585.namprd07.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [208.184.154.60]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR07MB3172;
	6:TAXWXtyFYxmkJf/9xpHNTbenwwsJAmaH64yjc1Plfik/ZFoTtv73lNoOfR7uuRfpS2FhzxKuYugQi3Dp6mmT++zfpoJaIPyiMAl7ZlSYACis1ofs9PtLp0MITcW6uzGelQh7zNnBk5X1VtI4kWr6SWp6qCTyhja6yKMO1Px7FrZ3MWC/oOAla7LQlhm38F+Sy7RdN0LQK7muBJXiMsZ0NVxDh8MPbzlml6ylPE6EYXPeEh0YCZkC/HbZJXNoizh9l+CMSPMA5dV/bpZJrdALxnXglauG6cjwYyKz/9NvPjDZIrojaWPlrVCKRcIzafS5tad+lNeyXU2i6o3h1hKyDrkoIB5rBhVEkieb+bxzUpbYLII1Hw7/yix+skMU8iKeiGogPyr7IvlF1Bz8Cbzoan317azwyVY2Lianbk40XUwgJv7uTRRoK8Ysf4uqGTg+cDjYvHDyWZ8ULCUz80Cw2Q==;
	5:0dE7tLVD7UDnau6MCPp85/xnGE/Efsjx9jRsZ8aUykczDwmdGPmJIJFpivVNIAlB8Lv94Mx4k9VXPqqu44Ly4Mh8A3p9revlemJ3eUw+/96nwpM8Ni3gCd38qZwfnoqqsX8QVtCTIYBm0nDc7VwrIMWjS23RJKoLlDHYR+QtksE=;
	7:LvYSHDi2zbjkywfx7mbIf5FDgFpyDMU93J6gt59PXhhw3cSdrnOVc5dUHvrgsEyC12mDed7Cr7RhzbvM423YQjQSflvL+1NVSn1JvCfQH7nU5yZmjPA1IAye8F0AVUivjqt6L1lJOomcXZykpPcbI8daoL11cfyMQN7KDe89IOFMqd6XqMLZAUNB0yMFP5uiqhDXokcO4krxHwrvpUoZn6YfrsLFaCpzWHMQA1cHcvZPuZZJhYB2ZPHXEy6ZU9Qt
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: ed76a83f-9499-4636-bce0-08d60ee7b7a3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR07MB3172; 
x-ms-traffictypediagnostic: BN6PR07MB3172:
x-microsoft-antispam-prvs: <BN6PR07MB3172E499C841BCB8B8E72E0EE40F0@BN6PR07MB3172.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231311)(944501410)(52105095)(3002001)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699016);
	SRVR:BN6PR07MB3172; BCL:0; PCL:0; RULEID:; SRVR:BN6PR07MB3172; 
x-forefront-prvs: 07817FCC2D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(366004)(396003)(376002)(346002)(189003)(199004)(51914003)(74316002)(6916009)(5630700001)(478600001)(86362001)(2906002)(2900100001)(68736007)(5660300001)(6116002)(790700001)(3846002)(606006)(99286004)(97736004)(21615005)(66066001)(25786009)(106356001)(105586002)(486006)(476003)(186003)(7696005)(236005)(14454004)(9686003)(8676002)(8936002)(6306002)(54896002)(9326002)(53936002)(7736002)(81166006)(5250100002)(102836004)(966005)(26005)(6436002)(217873002)(316002)(81156014)(55016002)(14444005)(2501003)(256004)(6506007)(2351001)(5640700003)(33656002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR07MB3172;
	H:BN6PR07MB3585.namprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: thermofisher.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: jECXlgCZ1LniFelRxHPVudaBw0J9ZzaZ2DcyuRwgPnLxldmYILxUMV2sYHDTt2k7dpbxDVqETOwDHbWYrnHbklXVAdKhdpLAJ9HdZP8mzJQGvbSx3rUGNOL8NsBe7l6UlEe8RtwtKXpgnTW+t8Z8TpJdtwuX7cbl58ZuojX6LAbl8pKjE6ItPsam6z/zWcxHBG9XOkk0oEYoYIYlPTDxdplYrOlpSQw/OD46ppaninn+TKUYwD0Pf4x0BjZrcqYLZPgBAttR0nahzRfRF1w4hG3S5nq2NiZurHqgI6deKI72ZxlKiUv7KAxUYWR6/4pUiyPBQfh249RkN+J+fGp/Ykr8q6aRul4f7MgyaSH/FQc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: thermofisher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed76a83f-9499-4636-bce0-08d60ee7b7a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2018 02:16:09.8511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b67d722d-aa8a-4777-a169-ebeb7a6a3b67
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR07MB3172
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-31_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=969 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1808310021
Subject: BeagleBone Black: cannot access USB MSC devices
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
X-List-Received-Date: Fri, 31 Aug 2018 02:36:37 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR07MB3585011B103A75E5F1964AF3E40F0BN6PR07MB3585namp_"

--_000_BN6PR07MB3585011B103A75E5F1964AF3E40F0BN6PR07MB3585namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am a beginner in Yocto and still learning to configure the images generat=
ed.

I am trying to use USB devices with the BeagleBone Black (Rev C) . Specific=
ally, I want to access a Mass Storage Class Device (a USB Flash Drive) from=
 the BeagleBone Black. I used the meta, meta-poky and meta-ti layers to bui=
ld a core-image-minimal image for beaglebone machine. On booting up with th=
e image, I do not see any obvious errors. However, it cannot detect the pre=
sence of a USB Device connected to it. I checked this using fdisk -l. lsusb=
 command is not found.

I went through an old email chain https://lists.yoctoproject.org/pipermail/=
linux-yocto/2014-June/002787.html to find if there was a solution. One of t=
he things mentioned was to use menuconfig to configure the kernel for built=
-in USB support. But, I am not sure if the .config file is being picked up =
by bitbake.

How do I enable USB support for MSC devices on BeagleBone Black?

poky branch=3D sumo-19.0.0
meta-ti branch=3D ti2018.02

Thanks for the help!
Sarvesh


--_000_BN6PR07MB3585011B103A75E5F1964AF3E40F0BN6PR07MB3585namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am a beginner in Yocto and still learning to confi=
gure the images generated.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to use USB devices with the BeagleBone B=
lack (Rev C) . Specifically, I want to access a Mass Storage Class Device (=
a USB Flash Drive) from the BeagleBone Black. I used the meta, meta-poky an=
d meta-ti layers to build a core-image-minimal
 image for beaglebone machine. On booting up with the image, I do not see a=
ny obvious errors. However, it cannot detect the presence of a USB Device c=
onnected to it. I checked this using fdisk -l. lsusb command is not found.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I went through an old email chain <a href=3D"https:/=
/lists.yoctoproject.org/pipermail/linux-yocto/2014-June/002787.html">
https://lists.yoctoproject.org/pipermail/linux-yocto/2014-June/002787.html<=
/a> to find if there was a solution. One of the things mentioned was to use=
 menuconfig to configure the kernel for built-in USB support. But, I am not=
 sure if the .config file is being
 picked up by bitbake.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">How do I enable USB support for MSC devices on Beagl=
eBone Black?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">poky branch=3D sumo-19.0.0<o:p></o:p></p>
<p class=3D"MsoNormal">meta-ti branch=3D ti2018.02<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for the help!<o:p></o:p></p>
<p class=3D"MsoNormal">Sarvesh<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN6PR07MB3585011B103A75E5F1964AF3E40F0BN6PR07MB3585namp_--
