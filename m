Return-Path: <matt.tsai@thermofisher.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C2B3E00B9D; Mon, 24 Sep 2018 16:15:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	KHOP_DYNAMIC,RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [208.86.201.75 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  2.0 KHOP_DYNAMIC Relay looks like a dynamic address
X-Greylist: delayed 4396 seconds by postgrey-1.32 at yocto-www;
	Mon, 24 Sep 2018 16:15:02 PDT
Received: from mx0b-002a2102.pphosted.com (mx0b-002a2102.pphosted.com
	[208.86.201.75])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05D6BE00B3E
	for <meta-ti@yoctoproject.org>; Mon, 24 Sep 2018 16:15:02 -0700 (PDT)
Received: from pps.filterd (m0118554.ppops.net [127.0.0.1])
	by mx0a-002a2102.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w8OLx9Q4177721
	for <meta-ti@yoctoproject.org>; Mon, 24 Sep 2018 22:01:45 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
	(mail-bl2nam02lp0088.outbound.protection.outlook.com [207.46.163.88])
	by mx0a-002a2102.pphosted.com with ESMTP id 2mnknhyj9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <meta-ti@yoctoproject.org>; Mon, 24 Sep 2018 22:01:45 +0000
Received: from BN7PR07MB4866.namprd07.prod.outlook.com (52.135.250.145) by
	BN7PR07MB4866.namprd07.prod.outlook.com (52.135.250.145) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1143.18; Mon, 24 Sep 2018 22:01:44 +0000
Received: from BN7PR07MB4866.namprd07.prod.outlook.com
	([fe80::1d0e:560f:f1ce:bf81]) by
	BN7PR07MB4866.namprd07.prod.outlook.com
	([fe80::1d0e:560f:f1ce:bf81%5]) with mapi id 15.20.1143.019;
	Mon, 24 Sep 2018 22:01:43 +0000
From: "Tsai, Matt" <matt.tsai@thermofisher.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: Unable to run bitbake -c virtual/kernel menuconfig
Thread-Index: AdRUUGtnZ2Wmcr32SgSZMeGfl22XHQ==
Date: Mon, 24 Sep 2018 22:01:43 +0000
Message-ID: <BN7PR07MB4866C3E8727CE0B47C74E8E792170@BN7PR07MB4866.namprd07.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [208.184.154.60]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN7PR07MB4866;
	6:ZsE81tc7CPmlE9RVN8Z4iaiVktdE5b4y3Ua/oOEHA+70dZsja1782a/i0cYNYdCInLcuE4FGhdm6MW4Fdr3h+SZHSlSh0qKEs6Wzt54UtIZEFDVPHzRZuknKrpgZZk3lfDxNbPHMqjNlRVvK1dcybyaqrvN48JEnOPE2p63rdky3/MVEH+M5rd93mJQlNxQMfmKtR5Q/0qVp6EHksGycFVQV1V9VW8XsPFn1xeXv3fy7z7wVHhLPjCNEjxgfGphTklCQNz9lle5qajP0VY+jWTTkQdfAv8PhddzLDOodQeDjFvggxUZKK/62FFRYkKsapsjYfqphFywUbvHytifemOIcjmLGlP1ZhRUuiHQKZvugECz2ptMtXM40F35zPAoyIegx/iKAKE8/inauJKiAZabWXzf68PA8iC8SB8kvosnNVu8wJ54kFdVi/ZTTTufjE50mb5nQqEsOnUulN+Nxzw==;
	5:UN517TnO/oasNU6lE6fKl8kTAJELLNt30S/oGdH0qqVoNlNzH+L2HqwqubFHiNu9neE0hJsB8HsN4NQRsp5OINgmrGhmhtRxXwz0JrtCH9kGQs9HiAr0R6cDh/wWzzLcT6+mIS/EeGQd5LkvF/iUcGalDANgcMteYBlYs+vAOwA=;
	7:yqmLheCSk+flw21ychd4HNRgyZoBQZTNLtyd3xNhxLLA5CrrwyDDuiVHDaCPtyb/di0Ab7X1HJQBx5ko+BiMIbw5mhH+/qaQrbPirTeB/nNMb8loCeNZkWatt+RCNiLQHmOM9nW6T8kXecsc1Im8xyx2XT7ELE6MgnkORXl1vc5gjokYofDOg4dmKzLTYQnaOM/+AZePD9uLKoR+H6YrtZq5NEYPapo3hFMKyor6MpMtzf5DALXQRC6cbLhwg8ft
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 36b54491-f5b0-47ec-3c00-08d6226950ab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BN7PR07MB4866; 
x-ms-traffictypediagnostic: BN7PR07MB4866:
x-microsoft-antispam-prvs: <BN7PR07MB4866D2A834350804A3EC72FD92170@BN7PR07MB4866.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155)(28532068793085)(190501279198761)(227612066756510);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(3231355)(944501410)(52105095)(10201501046)(6055026)(149066)(150027)(6041310)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(201708071742011)(7699051)(76991041);
	SRVR:BN7PR07MB4866; BCL:0; PCL:0; RULEID:; SRVR:BN7PR07MB4866; 
x-forefront-prvs: 0805EC9467
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39860400002)(346002)(376002)(396003)(189003)(199004)(54094003)(53754006)(504964003)(74316002)(486006)(6506007)(26005)(105586002)(2351001)(6916009)(186003)(14454004)(478600001)(102836004)(106356001)(6346003)(8676002)(81156014)(99286004)(66066001)(55016002)(7736002)(2906002)(97736004)(33656002)(2501003)(256004)(8936002)(5660300001)(2900100001)(25786009)(5250100002)(71200400001)(71190400001)(3846002)(81166006)(6436002)(6116002)(790700001)(68736007)(86362001)(316002)(476003)(6306002)(5640700003)(54896002)(9686003)(53936002)(5630700001)(7696005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN7PR07MB4866;
	H:BN7PR07MB4866.namprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: thermofisher.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: FEPAMvTOFjp9rAEsf7D8yBgAV4+bDBJiFVNgciTOpJFmq1Dq0BNUA49QeENDteqr11RFG/BrmlB6ZaTpLM6IsAcMN/iXr+e1yxwKSNYwsCZs4zPNx+Z5zM9G0UD/B8B9R+7kP9dzqP6jmVnaRGXZUgcChZc36cNs9U+T4BcdcDz8g9c7OFbVG1AqsIYXvDNuGOI5LMJyTMSuEVYc3tYh5ioy1Jf1o4tZakxhFKmgRJUPIu7NEmGmORP13yxejdG5UmA7TBmGy+xAA3oNxfG/J+rfZGY0hvEf4aihL8jjimVhpuffA68hPFyTbssvdi99tQ3bJC3hVCSR0NwVPz26SlVQXshQbcQWwqLHezLOPLg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: thermofisher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b54491-f5b0-47ec-3c00-08d6226950ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2018 22:01:43.8731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b67d722d-aa8a-4777-a169-ebeb7a6a3b67
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4866
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2017-11-13_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=926 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1809240209
Subject: Unable to run bitbake -c virtual/kernel menuconfig
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
X-List-Received-Date: Mon, 24 Sep 2018 23:15:04 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN7PR07MB4866C3E8727CE0B47C74E8E792170BN7PR07MB4866namp_"

--_000_BN7PR07MB4866C3E8727CE0B47C74E8E792170BN7PR07MB4866namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I was trying to configure Linux kernel using Yocto and meta-ti layer: Poky =
branch is sumo-19.0.0; meta-ti branch is sumo. I was able set up the Yocto =
build system to build the core-image-minimal successfully. My build host is=
 machine Ubuntu 16.04LTS and the target device is Beaglebone Black. However=
, when I tried to customize the kernel using "bitbake -c virtual/kernel men=
uconfig", I got the following error:

  GEN     ./Makefile
  HOSTLD  scripts/kconfig/mconf
scripts/kconfig/mconf.o: In function `show_help':
mconf.c:(.text+0x914): undefined reference to `stdscr'
scripts/kconfig/lxdialog/checklist.o: In function `print_arrows':
checklist.c:(.text+0x2c): undefined reference to `wmove'
checklist.c:(.text+0x4c): undefined reference to `acs_map'
...
scripts/kconfig/lxdialog/menubox.o: In function `print_arrows.constprop.0':
menubox.c:(.text+0x3c3): undefined reference to `wrefresh'
collect2: error: ld returned 1 exit status
scripts/Makefile.host:111: recipe for target 'scripts/kconfig/mconf' failed
make[3]: *** [scripts/kconfig/mconf] Error 1
.../build/tmp/work-shared/beaglebone/kernel-source/Makefile:512: recipe for=
 target 'menuconfig' failed
make[2]: *** [menuconfig] Error 2
Makefile:146: recipe for target 'sub-make' failed
make[1]: *** [sub-make] Error 2
Makefile:24: recipe for target '__sub-make' failed
make: *** [__sub-make] Error 2
Command failed.

I wonder if anyone has the same issue and how to solve this problem. Please=
 help. Thank you in advance!




--_000_BN7PR07MB4866C3E8727CE0B47C74E8E792170BN7PR07MB4866namp_
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
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I was trying to configure Linux kernel using Yocto a=
nd meta-ti layer: Poky branch is sumo-19.0.0; meta-ti branch is sumo. I was=
 able set up the Yocto build system to build the core-image-minimal success=
fully. My build host is machine Ubuntu
 16.04LTS and the target device is Beaglebone Black. However, when I tried =
to customize the kernel using &#8220;bitbake -c virtual/kernel menuconfig&#=
8221;, I got the following error:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; GEN&nbsp;&nbsp;&nbsp;&nbsp; ./Makefile<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp; HOSTLD&nbsp; scripts/kconfig/mconf<o:p></o:p>=
</p>
<p class=3D"MsoNormal">scripts/kconfig/mconf.o: In function `show_help':<o:=
p></o:p></p>
<p class=3D"MsoNormal">mconf.c:(.text&#43;0x914): undefined reference to `s=
tdscr'<o:p></o:p></p>
<p class=3D"MsoNormal">scripts/kconfig/lxdialog/checklist.o: In function `p=
rint_arrows':<o:p></o:p></p>
<p class=3D"MsoNormal">checklist.c:(.text&#43;0x2c): undefined reference to=
 `wmove'<o:p></o:p></p>
<p class=3D"MsoNormal">checklist.c:(.text&#43;0x4c): undefined reference to=
 `acs_map'<o:p></o:p></p>
<p class=3D"MsoNormal">...<o:p></o:p></p>
<p class=3D"MsoNormal">scripts/kconfig/lxdialog/menubox.o: In function `pri=
nt_arrows.constprop.0':<o:p></o:p></p>
<p class=3D"MsoNormal">menubox.c:(.text&#43;0x3c3): undefined reference to =
`wrefresh'<o:p></o:p></p>
<p class=3D"MsoNormal">collect2: error: ld returned 1 exit status<o:p></o:p=
></p>
<p class=3D"MsoNormal">scripts/Makefile.host:111: recipe for target 'script=
s/kconfig/mconf' failed<o:p></o:p></p>
<p class=3D"MsoNormal">make[3]: *** [scripts/kconfig/mconf] Error 1<o:p></o=
:p></p>
<p class=3D"MsoNormal">&#8230;/build/tmp/work-shared/beaglebone/kernel-sour=
ce/Makefile:512: recipe for target 'menuconfig' failed<o:p></o:p></p>
<p class=3D"MsoNormal">make[2]: *** [menuconfig] Error 2<o:p></o:p></p>
<p class=3D"MsoNormal">Makefile:146: recipe for target 'sub-make' failed<o:=
p></o:p></p>
<p class=3D"MsoNormal">make[1]: *** [sub-make] Error 2<o:p></o:p></p>
<p class=3D"MsoNormal">Makefile:24: recipe for target '__sub-make' failed<o=
:p></o:p></p>
<p class=3D"MsoNormal">make: *** [__sub-make] Error 2<o:p></o:p></p>
<p class=3D"MsoNormal">Command failed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I wonder if anyone has the same issue and how to sol=
ve this problem. Please help. Thank you in advance!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN7PR07MB4866C3E8727CE0B47C74E8E792170BN7PR07MB4866namp_--
