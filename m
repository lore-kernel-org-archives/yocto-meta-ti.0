Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AF02E006B5; Tue, 19 Aug 2014 13:40:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 404FBE004F5
	for <meta-ti@yoctoproject.org>; Tue, 19 Aug 2014 13:40:06 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7JKe3ld027140;
	Tue, 19 Aug 2014 15:40:03 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7JKe2sU012815;
	Tue, 19 Aug 2014 15:40:03 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 19 Aug 2014 15:40:02 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>, Maciej Borzecki
	<maciej.borzecki@open-rnd.pl>
Thread-Topic: [meta-ti] BBB + uboot 2014.07 - not booting
Thread-Index: AQHPu5BD7pHOl42Zs0q9vEGG7BYhZ5vYU1sAgABZr4D//7bxgA==
Date: Tue, 19 Aug 2014 20:40:01 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6FF1FF@DFLE08.ent.ti.com>
References: <5087658.bcI9hl3Jbj@localhost.localdomain>
	<CAMCfZKEMsoh1gkR7rj82G5yJFK-DXdEWJC50hieasmFJTsxiyA@mail.gmail.com>
	<CAMCfZKFdtGbnGLR86D-PfsQ1hXJ=pKCqsf7HvKt1wgmAzz=XBg@mail.gmail.com>
In-Reply-To: <CAMCfZKFdtGbnGLR86D-PfsQ1hXJ=pKCqsf7HvKt1wgmAzz=XBg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: BBB + uboot 2014.07 - not booting
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
X-List-Received-Date: Tue, 19 Aug 2014 20:40:17 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C6FF1FFDFLE08entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C6FF1FFDFLE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Diego Sueiro
Sent: Tuesday, August 19, 2014 3:00 PM
To: Maciej Borzecki
Cc: meta-ti mailing list
Subject: Re: [meta-ti] BBB + uboot 2014.07 - not booting


On Tue, Aug 19, 2014 at 11:39 AM, Diego Sueiro <diego.sueiro@gmail.com<mail=
to:diego.sueiro@gmail.com>> wrote:

I don't have this issue on SD card, bug I'm facing with another error when =
MLO is installed on eMMC. This is my error message:
U-Boot SPL 2014.07 (Aug 13 2014 - 08:23:53)
omap_hsmmc_send_cmd: timedout waiting on cmd inhibit to clear
spl: mmc init failed: err - -19
### ERROR ### Please RESET the board ###

Anyone have tested the MLO on eMMC?

I did some tests using yocto and meta-ti on daisy branch (beaglebone black)=
 using u-boot_2014.07.bb<http://u-boot_2014.07.bb> (upstream) and u-boot-ti=
-staging_2014.07.bb<http://u-boot-ti-staging_2014.07.bb> recipes. And the r=
esults:

  *   u-boot_2014.07: MLO works on SDcard and eMMC(2GB)
  *   u-boot-ti-staging: MLO works on eMMC(2GB), but fails on SDcard
I did not tracked the differences yet.

Could someone test the MLO on eMMC for u-boot-ti-staging(v2014.07)?
[Franklin] I just booted up the board and it worked fine for me on the SD C=
ard. I am however using a slightly newer commit "8bd803d2c552f5f85a79b4bfed=
7b322fbaf89e27" which is the latest commit on that branch.

Give that one a shot and see if it works for you.


Regards,


--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=3Dassinatura=
_diego&utm_medium=3De-mail&utm_campaign=3DAssinatura%20Email%20Diego>

/*long live rock 'n roll*/

--_000_8F29D6B095ED194EA1980491A5E029710C6FF1FFDFLE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1204292270;
	mso-list-template-ids:-1469560488;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ti-=
bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org]
<b>On Behalf Of </b>Diego Sueiro<br>
<b>Sent:</b> Tuesday, August 19, 2014 3:00 PM<br>
<b>To:</b> Maciej Borzecki<br>
<b>Cc:</b> meta-ti mailing list<br>
<b>Subject:</b> Re: [meta-ti] BBB &#43; uboot 2014.07 - not booting<o:p></o=
:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On Tue, Aug 19, 2014 at 11:39 AM, Diego Sueiro &lt;<=
a href=3D"mailto:diego.sueiro@gmail.com" target=3D"_blank">diego.sueiro@gma=
il.com</a>&gt; wrote:<o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">I don't have this issue on SD card, bug I'm facing w=
ith another error when MLO is installed on eMMC. This is my error message:<=
o:p></o:p></p>
</div>
<div>
<blockquote style=3D"margin-left:30.0pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">U-Boot SPL 2014.07 (Aug 13 2014 - 08:23:53)<o:p></o:=
p></p>
</div>
<div>
<p class=3D"MsoNormal">omap_hsmmc_send_cmd: timedout waiting on cmd inhibit=
 to clear<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">spl: mmc init failed: err - -19<o:p></o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">### ERROR ### Please RESET the board ###<o:p></o:p><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</blockquote>
<p class=3D"MsoNormal">Anyone have tested the MLO on eMMC?<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><br>
I did some tests using yocto and meta-ti on daisy branch (beaglebone black)=
 using
<a href=3D"http://u-boot_2014.07.bb">u-boot_2014.07.bb</a> (upstream) and&n=
bsp;<a href=3D"http://u-boot-ti-staging_2014.07.bb">u-boot-ti-staging_2014.=
07.bb</a> recipes. And the results:<o:p></o:p></p>
</div>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo1">
u-boot_2014.07: MLO works on SDcard and eMMC(2GB)<o:p></o:p></li><li class=
=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;=
mso-list:l0 level1 lfo1">
u-boot-ti-staging: MLO works on&nbsp;eMMC(2GB), but fails on SDcard<o:p></o=
:p></li></ul>
</div>
<div>
<p class=3D"MsoNormal">I did not tracked the differences yet.<o:p></o:p></p=
>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Could someone test the MLO on eMMC for u-boot-ti-sta=
ging(v2014.07)?<o:p></o:p></p>
<p class=3D"MsoNormal"><b><i><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">[Franklin] I just b=
ooted up the board and it worked fine for me on the SD Card. I am however u=
sing a slightly newer commit &#8220;8bd803d2c552f5f85a79b4bfed7b322fbaf89e2=
7&#8221;
 which is the latest commit on that branch.<o:p></o:p></span></i></b></p>
<p class=3D"MsoNormal"><b><i><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></=
span></i></b></p>
<p class=3D"MsoNormal"><b><i><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Give that one a sho=
t and see if it works for you.</span></i></b><span style=3D"font-size:11.0p=
t;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<div>
<div>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">--<br>
*dS<br>
Diego Sueiro<br>
<br>
Administrador do Embarcados<br>
<a href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;=
utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=
=3D"_blank">www.embarcados.com.br</a><br>
<br>
/*long live rock 'n roll*/<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C6FF1FFDFLE08entticom_--
