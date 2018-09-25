Return-Path: <matt.tsai@thermofisher.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E4ADE006F1; Tue, 25 Sep 2018 16:19:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [208.86.201.75 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mx0b-002a2102.pphosted.com (mx0b-002a2102.pphosted.com
	[208.86.201.75])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3DC9E0053F
	for <meta-ti@yoctoproject.org>; Tue, 25 Sep 2018 16:19:42 -0700 (PDT)
Received: from pps.filterd (m0104973.ppops.net [127.0.0.1])
	by mx0a-002a2102.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w8PNJgSd190828
	for <meta-ti@yoctoproject.org>; Tue, 25 Sep 2018 23:19:42 GMT
Received: from nam01-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam01lp0118.outbound.protection.outlook.com
	[207.46.163.118])
	by mx0a-002a2102.pphosted.com with ESMTP id 2mqqqhnae6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <meta-ti@yoctoproject.org>; Tue, 25 Sep 2018 23:19:41 +0000
Received: from BN7PR07MB4866.namprd07.prod.outlook.com (52.135.250.145) by
	BN7PR07MB4404.namprd07.prod.outlook.com (52.135.247.16) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1164.25; Tue, 25 Sep 2018 23:19:40 +0000
Received: from BN7PR07MB4866.namprd07.prod.outlook.com
	([fe80::1d0e:560f:f1ce:bf81]) by
	BN7PR07MB4866.namprd07.prod.outlook.com
	([fe80::1d0e:560f:f1ce:bf81%5]) with mapi id 15.20.1143.022;
	Tue, 25 Sep 2018 23:19:40 +0000
From: "Tsai, Matt" <matt.tsai@thermofisher.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: Poky and meta-ti advice for Beaglebone Black
Thread-Index: AdRVJFAXAS9yv9+7QxusIVarhlGYuw==
Date: Tue, 25 Sep 2018 23:19:39 +0000
Message-ID: <BN7PR07MB486664B157A30E27F0FAE23692160@BN7PR07MB4866.namprd07.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [208.184.154.60]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN7PR07MB4404;
	6:LBFhrfkgDFVx4sSv51GWtJ5qcs6dyzRuxgd5LlC9o9ikEWCYmLr7T6mO4iyk/YMNsEbRi3Pg6oXWzKJsM+SoKkyImWEoiy4xDyb1zUjSfh7MphMRT737blWch4Deb6x4TUja00u5K9EvQ1F+QWXa3pndbLX9evob3dWKCENb7Mo+fNlLkCGSOFMxTi+88+5YR+1KZurXRiguApK0L8x95RA9t0NU+tNaDiFxcifn3Z9P3h8wwIsUt78egtzgDC68vbkCk24Sa9t1w1fVtmfXlKpCvuskBkpHxQ7dScW6mpq5MZFUD4HUjp15w8VqQBVJ29IlHV55+n1WHKnFWIyIHYMFpNPSCbM2n/Bi3HiTlRVRV2pSX2PtfKAT2zAltsdbNikVWO/fvHSQ5jtstSebByXRg4iaUEM3qEmmpO2oJX871DQS2KGAc8DoGbbh6j66tZcB/QwbpnaPwVrm6pyj+g==;
	5:uO+VWBIi2ZITwgNez6n669a26j401K6735tKQsQdrBWg7DYGBcpO8TjHQtjgEFuUco63RB3enT3SyMKDBbcmDh7Wq1njyQ18oMYnuKU/5f1PqgKz1SmcGNOjpwszlUNGatp3siwV12ebjjTJ8D5MkmWGOTY3VK/0EJt5e0/xz+A=;
	7:thKR8yx/uX2Xk0cV4CQJnA8YDJPHYZMhpI8M/MqPwBBhGttMotpbqMtsE2CwhMWpYt4vwk61DvEaxBrevyxZGn0GSSujI0S6NQ0D+6vaVVmJ4itdjOsDjTZ/ff9HclPwjtKSwOHtiKIYyywleL9jGpbVkKgZXskRk7krLz9ehm+KJPQfnuFw9ZKLID6uNi9FIXFXo3lwD7Y1Fso4OPD4euJlUILiuojKGV3Frox63hmYe68XboMI5u4zfP/Mdhq3
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: b46bd90d-0e1d-47d3-36ed-08d6233d5e42
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BN7PR07MB4404; 
x-ms-traffictypediagnostic: BN7PR07MB4404:
x-microsoft-antispam-prvs: <BN7PR07MB44040EC1CDB051533F5D495E92160@BN7PR07MB4404.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155)(28532068793085)(190501279198761)(227612066756510);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150027)(6041310)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051);
	SRVR:BN7PR07MB4404; BCL:0; PCL:0; RULEID:; SRVR:BN7PR07MB4404; 
x-forefront-prvs: 08062C429B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(376002)(366004)(136003)(39860400002)(189003)(199004)(57704003)(40764003)(53754006)(186003)(2351001)(8936002)(478600001)(68736007)(7736002)(74316002)(66066001)(97736004)(14454004)(33656002)(105586002)(102836004)(106356001)(26005)(5640700003)(476003)(7696005)(345774005)(3846002)(71190400001)(790700001)(486006)(5660300001)(6116002)(6506007)(5250100002)(2906002)(71200400001)(34290500001)(53936002)(6436002)(55016002)(54896002)(6306002)(9686003)(2501003)(256004)(6916009)(2900100001)(81156014)(81166006)(8676002)(86362001)(316002)(5630700001)(99286004)(25786009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN7PR07MB4404;
	H:BN7PR07MB4866.namprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: thermofisher.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: K82EiqXolf8vZK7QLo6GO9bomSlsXKGaL3yYSezDSg5IL+zF0lbAdKSq6gAhYOBy9Rz2VSWlpE8TShSWrgqBpVu0PfsbEAdVWk+mEJBz7wGVuQXXmM/YR32xAj5KKQHx/9x9KaFKD5MWgotOmjnJfpxTcR3xO7h4gb1/pf9zRKz9Dow7PpvlJP1LdIOGQt4qrVlZ9hGSSOZMiIVam9wS2f2wk3Jue98udi1VIyTVATe8Hn04osAzmRdC95G+v9Bb4Y3G+5BZR/Yqh9uSoC1k49PnSsbZ7HPxcNgH3VdSTx5V2gzrT3oAb8talAECsvhipMGnvLnM4DDldIMEKh2gz50Lvvvaks4qAneHgwKafkk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: thermofisher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46bd90d-0e1d-47d3-36ed-08d6233d5e42
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2018 23:19:39.9357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b67d722d-aa8a-4777-a169-ebeb7a6a3b67
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4404
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-09-25_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=740 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1809250228
Subject: Poky and meta-ti advice for Beaglebone Black
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
X-List-Received-Date: Tue, 25 Sep 2018 23:19:43 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN7PR07MB486664B157A30E27F0FAE23692160BN7PR07MB4866namp_"

--_000_BN7PR07MB486664B157A30E27F0FAE23692160BN7PR07MB4866namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am new to Yocto and was trying to use poky and meta-ti to customize Linux=
 to run on Beaglebone Black. There are a couple of questions I encountered,=
 hopefully I can get some advice here:

  1.  What is the recommended poky and meta-ti branch/tag to use?
  2.  If we need to enable some common device support such as Ethernet, USB=
 host port, I2C, ...etc., what do we need to modify on these recommended po=
ky and meta-ti software?

Thank you for your help!


--_000_BN7PR07MB486664B157A30E27F0FAE23692160BN7PR07MB4866namp_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
/* List Definitions */
@list l0
	{mso-list-id:114715111;
	mso-list-type:hybrid;
	mso-list-template-ids:2047656716 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:242112341;
	mso-list-type:hybrid;
	mso-list-template-ids:-1346459036 1601994804 67698713 67698715 67698703 67=
698713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-fareast-font-family:Calibri;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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
<p class=3D"MsoNormal">I am new to Yocto and was trying to use poky and met=
a-ti to customize Linux to run on Beaglebone Black. There are a couple of q=
uestions I encountered, hopefully I can get some advice here:<o:p></o:p></p=
>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo2">What is the recommended poky and meta-ti branch/tag to use?
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso=
-list:l0 level1 lfo2">If we need to enable some common device support such =
as Ethernet, USB host port, I2C, &#8230;etc., what do we need to modify on =
these recommended poky and meta-ti software?<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you for your help!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN7PR07MB486664B157A30E27F0FAE23692160BN7PR07MB4866namp_--
