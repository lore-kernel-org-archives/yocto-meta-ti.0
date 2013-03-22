Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBB38E01457
	for <meta-ti@yoctoproject.org>; Fri, 22 Mar 2013 07:44:21 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2MEiKcf029057;
	Fri, 22 Mar 2013 09:44:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2MEiKuO021530;
	Fri, 22 Mar 2013 09:44:20 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 22 Mar 2013 09:44:19 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 22 Mar 2013 09:44:19 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: David Hirst <hirst689@gmail.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] adding a recipe to oe/bitbake for tisdk-rootfs-image
Thread-Index: AQHOJwoR8lLpYQIXdUaIyawDzOtQWZixx/fg
Date: Fri, 22 Mar 2013 14:44:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C40B958@DFLE08.ent.ti.com>
References: <CAHu+ux3bSH_q0ZwAv94v-5AKJDtPd=ityWisQtzTv_qz2NpTNg@mail.gmail.com>
In-Reply-To: <CAHu+ux3bSH_q0ZwAv94v-5AKJDtPd=ityWisQtzTv_qz2NpTNg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: adding a recipe to oe/bitbake for tisdk-rootfs-image
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
X-List-Received-Date: Fri, 22 Mar 2013 14:44:21 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C40B958DFLE08entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C40B958DFLE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please post this in the meta-arago mailing list: meta-arago@arago-project.o=
rg<mailto:meta-arago@arago-project.org> since your referring to the tisdk-r=
ootfs-image.bb recipe which is located in meta-arago not meta-ti.

If you can send the tweaked image recipe and your new task to the meta-arag=
o mailing list it will be easier for us to help you. It sounds like your fo=
llowing the right steps so I'm not sure what is wrong unless I see it.

From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of David Hirst
Sent: Friday, March 22, 2013 9:32 AM
To: meta-ti@yoctoproject.org
Subject: [meta-ti] adding a recipe to oe/bitbake for tisdk-rootfs-image

Hi,
    I have been struggling with a oe/bitbake issue. I wanted to add an othe=
r .bb to the image file.
I have tried multiple ways but always end up at the same spot. I have creat=
ed a new task-XXX.bb file which includes my bb
I edited the tisdk-rootfs-image.bb<http://tisdk-rootfs-image.bb> to include=
 the task-XXX.bb.
Once built I find that everything built fine and the new recipe was built b=
ut was not loaded into the tosdk-rootfs-image.tar,gz.
If I look into the image directory for the bb file I see the compiled appli=
cation in usr/sbin.
I have tried this with my own .bb file and net-snmp bb file which comes wit=
h the default oe-layersetup installation with the same result.
Did I not edit a file or miss some other required step?

--
David Hirst
hirst689@gmail.com<mailto:hirst689@gmail.com>

--_000_8F29D6B095ED194EA1980491A5E029710C40B958DFLE08entticom_
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
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Please post this in the m=
eta-arago mailing list:
<a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-project.or=
g</a> since your referring to the tisdk-rootfs-image.bb recipe which is loc=
ated in meta-arago not meta-ti.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><br>
If you can send the tweaked image recipe and your new task to the meta-arag=
o mailing list it will be easier for us to help you. It sounds like your fo=
llowing the right steps so I&#8217;m not sure what is wrong unless I see it=
.<o:p></o:p></span></p>
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
<b>On Behalf Of </b>David Hirst<br>
<b>Sent:</b> Friday, March 22, 2013 9:32 AM<br>
<b>To:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> [meta-ti] adding a recipe to oe/bitbake for tisdk-rootfs-im=
age<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi,<br>
&nbsp;&nbsp;&nbsp; I have been struggling with a oe/bitbake issue. I wanted=
 to add an other .bb to the image file.<br>
I have tried multiple ways but always end up at the same spot. I have creat=
ed a new task-XXX.bb file which includes my bb<br>
I edited the <a href=3D"http://tisdk-rootfs-image.bb">tisdk-rootfs-image.bb=
</a> to include the task-XXX.bb.<br>
Once built I find that everything built fine and the new recipe was built b=
ut was not loaded into the tosdk-rootfs-image.tar,gz.<br>
If I look into the image directory for the bb file I see the compiled appli=
cation in usr/sbin.<br>
I have tried this with my own .bb file and net-snmp bb file which comes wit=
h the default oe-layersetup installation with the same result.<br>
Did I not edit a file or miss some other required step?<br clear=3D"all">
<br>
-- <br>
David Hirst<br>
<a href=3D"mailto:hirst689@gmail.com" target=3D"_blank">hirst689@gmail.com<=
/a><br>
<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C40B958DFLE08entticom_--
