Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC6E9E00948; Mon, 23 Apr 2018 10:11:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DCB1E008BF
	for <meta-ti@yoctoproject.org>; Mon, 23 Apr 2018 10:11:48 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3NHBlDI007870
	for <meta-ti@yoctoproject.org>; Mon, 23 Apr 2018 12:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524503507;
	bh=3iltLAxItFWmwQybE4O8vRjEydtGeskBqjfoWRnra30=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=aDjf/M8oka1OpU4CabUtfHuhStlLnvT91lydhYpAG3CNOD0LwYUOEL7F2A6O5TrIb
	Sme1TfN2u4KILhodt+XmYrbHOUtRzJ0kJPb8EqWpKjOZkFAF/rvrI0IMDksb7k4vve
	vgKIFPiHEPw/y4s3offYJD61v/vsLU7BtVpx5dL0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3NHBlG3031130
	for <meta-ti@yoctoproject.org>; Mon, 23 Apr 2018 12:11:47 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 23 Apr 2018 12:11:47 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Mon, 23 Apr 2018 12:11:47 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Griffis, Brad" <bgriffis@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: wget fetch issue with ti-cgt-pru_2.1.5.bb
Thread-Index: AdPbIkHhpqc3TBWiTam9B0qS25aPNQAAzM+A
Date: Mon, 23 Apr 2018 17:11:47 +0000
Message-ID: <009a3983ec77401a957b9159946f244c@ti.com>
References: <59ad3d9eeae2462fb29bf60eacc51dba@ti.com>
In-Reply-To: <59ad3d9eeae2462fb29bf60eacc51dba@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: wget fetch issue with ti-cgt-pru_2.1.5.bb
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
X-List-Received-Date: Mon, 23 Apr 2018 17:11:51 -0000
X-Groupsio-MsgNum: 10791
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_009a3983ec77401a957b9159946f244cticom_";
	type="multipart/alternative"

--_004_009a3983ec77401a957b9159946f244cticom_
Content-Type: multipart/alternative;
	boundary="_000_009a3983ec77401a957b9159946f244cticom_"

--_000_009a3983ec77401a957b9159946f244cticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Brad,

On my home machine. I was able to recreate this with wget, but I was able t=
o download through other methods. I am not sure what may be happening.

I was able to download through a browser (chrome), and I was able to downlo=
ad with "curl" using the following command:

$ curl -L http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/2.2.1/ti_=
cgt_pru_2.2.1_linux_installer_x86.bin > ti_cgt_pru_2.2.1_linux_installer_x8=
6.bin
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Cur=
rent
                                 Dload  Upload   Total   Spent    Left  Spe=
ed
100   382  100   382    0     0   2239      0 --:--:-- --:--:-- --:--:--  2=
247
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--   =
  0
100   318  100   318    0     0    848      0 --:--:-- --:--:-- --:--:--   =
848
100 17.0M  100 17.0M    0     0  4040k      0  0:00:04  0:00:04 --:--:-- 45=
17k

$ file ti_cgt_pru_2.2.1_linux_installer_x86.bin
ti_cgt_pru_2.2.1_linux_installer_x86.bin: ELF 32-bit LSB  executable, Intel=
 80386, version 1 (GNU/Linux), statically linked, stripped

- Jake

From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Griffis, Brad
Sent: Monday, April 23, 2018 12:51 PM
To: meta-ti@yoctoproject.org
Subject: [EXTERNAL] [meta-ti] wget fetch issue with ti-cgt-pru_2.1.5.bb

Recipe: meta-ti/recipes-ti/devtools/ti-cgt-pru_2.1.5.bb
Issue summary: fetch of ti_cgt_pru_2.2.1_linux_installer_x86.bin results in=
 403 forbidden error

In the rocko branch, I see we're building PRU source code from source.  I w=
anted to report a fetch issue.  This was reported to me by a customer and I=
 have independently confirmed I see the same behavior.

I can see the issue very easily just by doing a wget:

brad@brad-XPS-15-9560:~$ wget http://software-dl.ti.com/codegen/esd/cgt_pub=
lic_sw/PRU/2.2.1/ti_cgt_pru_2.2.1_linux_installer_x86.bin
--2018-04-23 11:48:42--  http://software-dl.ti.com/codegen/esd/cgt_public_s=
w/PRU/2.2.1/ti_cgt_pru_2.2.1_linux_installer_x86.bin
Resolving software-dl.ti.com (software-dl.ti.com)... 23.209.190.17
Connecting to software-dl.ti.com (software-dl.ti.com)|23.209.190.17|:80... =
connected.
HTTP request sent, awaiting response... 302 Moved Temporarily
Location: https://www.ti.com/general/docs/licreg/anonymousproddownload.tsp?=
downloadPage=3Dtrue&location=3Dhttp://software-dl.ti.com/codegen/esd/cgt_pu=
blic_sw/PRU/2.2.1/ti_cgt_pru_2.2.1_linux_installer_x86.bin [following]
--2018-04-23 11:48:42--  https://www.ti.com/general/docs/licreg/anonymouspr=
oddownload.tsp?downloadPage=3Dtrue&location=3Dhttp://software-dl.ti.com/cod=
egen/esd/cgt_public_sw/PRU/2.2.1/ti_cgt_pru_2.2.1_linux_installer_x86.bin
Resolving www.ti.com<http://www.ti.com> (www.ti.com<http://www.ti.com>)... =
23.34.71.13, 2600:1407:21:281::b48, 2600:1407:21:285::b48
Connecting to www.ti.com<http://www.ti.com> (www.ti.com)|23.34.71.13|:443<h=
ttp://www.ti.com)|23.34.71.13|:443>... connected.
HTTP request sent, awaiting response... 302 Moved Temporarily
Location: http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/2.2.1/ti_=
cgt_pru_2.2.1_linux_installer_x86.bin?tracked=3D1 [following]
--2018-04-23 11:48:42--  http://software-dl.ti.com/codegen/esd/cgt_public_s=
w/PRU/2.2.1/ti_cgt_pru_2.2.1_linux_installer_x86.bin?tracked=3D1
Connecting to software-dl.ti.com (software-dl.ti.com)|23.209.190.17|:80... =
connected.
HTTP request sent, awaiting response... 403 Forbidden
2018-04-23 11:48:42 ERROR 403: Forbidden.

The above console snippet comes from my home PC where there is no firewall/=
proxy to complicate things.  There seems to be a fundamental issue being ab=
le to fetch this file.  Interestingly, if I run the command from inside the=
 TI firewall it works ok.

Best regards,
Brad

---------------------------------------------------

Brad Griffis
TI Digital Field Applications
Member Group Technical Staff (MGTS)
Schaumburg, IL
Office: 847-517-4699

[cid:image001.jpg@01D3DB04.5E41A970]<https://store.ti.com/?HQS=3Dsdm-mm-nul=
l-americascentral-besig-store-null-wwe>


--_000_009a3983ec77401a957b9159946f244cticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Brad,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">On my home machine. I =
was able to recreate this with wget, but I was able to download through oth=
er methods. I am not sure what may be happening.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I was able to download=
 through a browser (chrome), and I was able to download with &#8220;curl&#8=
221; using the following command:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">$ curl -L http://software-dl.ti.com/codegen/esd/cgt_public=
_sw/PRU/2.2.1/ti_cgt_pru_2.2.1_linux_installer_x86.bin &gt; ti_cgt_pru_2.2.=
1_linux_installer_x86.bin<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp; % Total&nbsp;&nbsp;&nbsp; % Received % Xferd&nbsp; =
Average Speed &nbsp;&nbsp;Time&nbsp;&nbsp;&nbsp; Time&nbsp;&nbsp;&nbsp;&nbs=
p; Time&nbsp; Current<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dload&nbsp; Upl=
oad&nbsp;&nbsp; Total&nbsp;&nbsp; Spent&nbsp;&nbsp;&nbsp; Left&nbsp; Speed<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">100&nbsp;&nbsp; 382&nbsp; 100&nbsp;&nbsp; 382&nbsp;&nbsp;&=
nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp; 2239&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 0 --:--:-- --:--:-- --:--:--&nbsp; 2247<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 0&nbs=
p;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 --:--:-- --:--:--=
 --:--:--&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">100&nbsp;&nbsp; 318&nbsp; 100&nbsp;&nbsp; 318&nbsp;&nbsp;&=
nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 848&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 0 --:--:-- --:--:-- --:--:--&nbsp;&nbsp; 848<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">100 17.0M&nbsp; 100 17.0M&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&=
nbsp;&nbsp; 0&nbsp; 4040k&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 0:00:04&nbs=
p; 0:00:04 --:--:-- 4517k<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">$ file ti_cgt_pru_2.2.1_linux_installer_x86.bin<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">ti_cgt_pru_2.2.1_linux_installer_x86.bin: ELF 32-bit LSB&n=
bsp; executable, Intel 80386, version 1 (GNU/Linux), statically linked, str=
ipped<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">- Jake<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ti-=
bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org]
<b>On Behalf Of </b>Griffis, Brad<br>
<b>Sent:</b> Monday, April 23, 2018 12:51 PM<br>
<b>To:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> [EXTERNAL] [meta-ti] wget fetch issue with ti-cgt-pru_2.1.5=
.bb<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Recipe: meta-ti/recipes-ti/devtools/ti-cgt-pru_2.1.5=
.bb<o:p></o:p></p>
<p class=3D"MsoNormal">Issue summary: fetch of ti_cgt_pru_2.2.1_linux_insta=
ller_x86.bin results in 403 forbidden error<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the rocko branch, I see we&#8217;re building PRU =
source code from source. &nbsp;I wanted to report a fetch issue.&nbsp; This=
 was reported to me by a customer and I have independently confirmed I see =
the same behavior.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I can see the issue very easily just by doing a wget=
:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">brad@brad-XPS-15-9560:~$ wget <a href=3D"http://soft=
ware-dl.ti.com/codegen/esd/cgt_public_sw/PRU/2.2.1/ti_cgt_pru_2.2.1_linux_i=
nstaller_x86.bin">
http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/2.2.1/ti_cgt_pru_2.=
2.1_linux_installer_x86.bin</a><o:p></o:p></p>
<p class=3D"MsoNormal">--2018-04-23 11:48:42--&nbsp; <a href=3D"http://soft=
ware-dl.ti.com/codegen/esd/cgt_public_sw/PRU/2.2.1/ti_cgt_pru_2.2.1_linux_i=
nstaller_x86.bin">
http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/2.2.1/ti_cgt_pru_2.=
2.1_linux_installer_x86.bin</a><o:p></o:p></p>
<p class=3D"MsoNormal">Resolving software-dl.ti.com (software-dl.ti.com)...=
 23.209.190.17<o:p></o:p></p>
<p class=3D"MsoNormal">Connecting to software-dl.ti.com (software-dl.ti.com=
)|23.209.190.17|:80... connected.<o:p></o:p></p>
<p class=3D"MsoNormal">HTTP request sent, awaiting response... 302 Moved Te=
mporarily<o:p></o:p></p>
<p class=3D"MsoNormal">Location: <a href=3D"https://www.ti.com/general/docs=
/licreg/anonymousproddownload.tsp?downloadPage=3Dtrue&amp;location=3Dhttp:/=
/software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/2.2.1/ti_cgt_pru_2.2.1_li=
nux_installer_x86.bin">
https://www.ti.com/general/docs/licreg/anonymousproddownload.tsp?downloadPa=
ge=3Dtrue&amp;location=3Dhttp://software-dl.ti.com/codegen/esd/cgt_public_s=
w/PRU/2.2.1/ti_cgt_pru_2.2.1_linux_installer_x86.bin</a> [following]<o:p></=
o:p></p>
<p class=3D"MsoNormal">--2018-04-23 11:48:42--&nbsp; <a href=3D"https://www=
.ti.com/general/docs/licreg/anonymousproddownload.tsp?downloadPage=3Dtrue&a=
mp;location=3Dhttp://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/2.2.1=
/ti_cgt_pru_2.2.1_linux_installer_x86.bin">
https://www.ti.com/general/docs/licreg/anonymousproddownload.tsp?downloadPa=
ge=3Dtrue&amp;location=3Dhttp://software-dl.ti.com/codegen/esd/cgt_public_s=
w/PRU/2.2.1/ti_cgt_pru_2.2.1_linux_installer_x86.bin</a><o:p></o:p></p>
<p class=3D"MsoNormal">Resolving <a href=3D"http://www.ti.com">www.ti.com</=
a> (<a href=3D"http://www.ti.com">www.ti.com</a>)... 23.34.71.13, 2600:1407=
:21:281::b48, 2600:1407:21:285::b48<o:p></o:p></p>
<p class=3D"MsoNormal">Connecting to <a href=3D"http://www.ti.com">www.ti.c=
om</a> (<a href=3D"http://www.ti.com)|23.34.71.13|:443">www.ti.com)|23.34.7=
1.13|:443</a>... connected.<o:p></o:p></p>
<p class=3D"MsoNormal">HTTP request sent, awaiting response... 302 Moved Te=
mporarily<o:p></o:p></p>
<p class=3D"MsoNormal">Location: <a href=3D"http://software-dl.ti.com/codeg=
en/esd/cgt_public_sw/PRU/2.2.1/ti_cgt_pru_2.2.1_linux_installer_x86.bin?tra=
cked=3D1">
http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/2.2.1/ti_cgt_pru_2.=
2.1_linux_installer_x86.bin?tracked=3D1</a> [following]<o:p></o:p></p>
<p class=3D"MsoNormal">--2018-04-23 11:48:42--&nbsp; <a href=3D"http://soft=
ware-dl.ti.com/codegen/esd/cgt_public_sw/PRU/2.2.1/ti_cgt_pru_2.2.1_linux_i=
nstaller_x86.bin?tracked=3D1">
http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/2.2.1/ti_cgt_pru_2.=
2.1_linux_installer_x86.bin?tracked=3D1</a><o:p></o:p></p>
<p class=3D"MsoNormal">Connecting to software-dl.ti.com (software-dl.ti.com=
)|23.209.190.17|:80... connected.<o:p></o:p></p>
<p class=3D"MsoNormal">HTTP request sent, awaiting response... 403 Forbidde=
n<o:p></o:p></p>
<p class=3D"MsoNormal">2018-04-23 11:48:42 ERROR 403: Forbidden.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The above console snippet comes from my home PC wher=
e there is no firewall/proxy to complicate things.&nbsp; There seems to be =
a fundamental issue being able to fetch this file.&nbsp; Interestingly, if =
I run the command from inside the TI firewall
 it works ok.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Brad<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">---------------------------------------------------<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Brad Griffis<o:p></o:p></p>
<p class=3D"MsoNormal">TI Digital Field Applications<o:p></o:p></p>
<p class=3D"MsoNormal">Member Group Technical Staff (MGTS)<o:p></o:p></p>
<p class=3D"MsoNormal">Schaumburg, IL<o:p></o:p></p>
<p class=3D"MsoNormal">Office: 847-517-4699<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://store.ti.com/?HQS=3Dsdm-mm-null-a=
mericascentral-besig-store-null-wwe"><span style=3D"color:windowtext;text-d=
ecoration:none"><img border=3D"0" width=3D"624" height=3D"77" id=3D"Picture=
_x0020_9" src=3D"cid:image001.jpg@01D3DB04.5E41A970"></span></a><o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_009a3983ec77401a957b9159946f244cticom_--

--_004_009a3983ec77401a957b9159946f244cticom_
Content-Type: image/jpeg; name="image001.jpg"
Content-Description: image001.jpg
Content-Disposition: inline; filename="image001.jpg"; size=15513;
	creation-date="Mon, 23 Apr 2018 17:11:46 GMT";
	modification-date="Mon, 23 Apr 2018 17:11:46 GMT"
Content-ID: <image001.jpg@01D3DB04.5E41A970>
Content-Transfer-Encoding: base64

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

--_004_009a3983ec77401a957b9159946f244cticom_--
