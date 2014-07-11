Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3974E003FA; Fri, 11 Jul 2014 07:31:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 982BCE002AC
	for <meta-ti@yoctoproject.org>; Fri, 11 Jul 2014 07:31:44 -0700 (PDT)
Received: from usnygrcas2.raymondcorp.local (nothing.attdns.com
	[130.1.155.195] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id s6BEVgPs013523
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Jul 2014 09:31:42 -0500
Received: from USNYGRMBX3.raymondcorp.local ([169.254.3.227]) by usnygrcas2
	([130.1.155.199]) with mapi id 14.03.0174.001; Fri, 11 Jul 2014 10:31:41
	-0400
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Kernel Config Fragments?
Thread-Index: Ac+cdTGOhruSzqR4T+iz1DxxXzpWXwAMFNWAABu4N5A=
Date: Fri, 11 Jul 2014 14:31:41 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622BAB12E1@usnygrmbx3.raymondcorp.local>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BAB10CA@usnygrmbx3.raymondcorp.local>
	<B0581B5571079145BA1CD78C126DBDE732079D2F@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE732079D2F@DLEE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [130.1.155.204]
MIME-Version: 1.0
X-mailWatchMessageID: 1405089104.37689.1642.2849636388
X-mailWatchContentScore: Score of 0 assigned to Content
X-mailWatchUCEScore: Score of 0 assigned to UCE
X-mailWatch: Analyzed by IntelliReach MessageScreen(tm)
Subject: Re: Kernel Config Fragments?
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
X-List-Received-Date: Fri, 11 Jul 2014 14:31:49 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D1F292BE8E4CC4F93079C1A7A58D5622BAB12E1usnygrmbx3raymo_"

--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BAB12E1usnygrmbx3raymo_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I see it was added in April with patch to the setup-defconfig
I will apply patch.
Thanks

-Josh Vanderpool

From: Dmytriyenko, Denys [mailto:denys@ti.com]
Sent: Thursday, July 10, 2014 5:15 PM
To: meta-ti@yoctoproject.org; Vanderpool Josh
Subject: RE: [meta-ti] Kernel Config Fragments?

Yes, it does, please check the recipe for examples.

Denys


Sent from my Android phone using TouchDown (www.nitrodesk.com<http://www.=
nitrodesk.com>)

-----Original Message-----
From: Vanderpool Josh [Joshua.Vanderpool@raymondcorp.com]
Received: Thursday, 10 Jul 2014, 16:16
To: meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org> [meta-ti@yo=
ctoproject.org]
Subject: [meta-ti] Kernel Config Fragments?
Does the linux-ti-staging allow the use of config fragments.

We would like to have a bbappend that includes the configuration fragment=
 in our upper layer.
Currently we have to use the menuconfig which is a manual process, if the=
re is a better automated process please advise.

Regards,
-Josh

Confidentiality Notice: The preceding e-mail message (including any attac=
hments) contains information that may be confidential, protected by appli=
cable legal privileges, or constitute non-public information. It is inten=
ded to be conveyed only to the designated recipient(s). If you are not an=
 intended recipient of this message, please notify the sender by replying=
 to this message and then delete it from your system. Use, dissemination,=
 distribution or reproduction of this message by unintended recipients is=
 not authorized and may be unlawful.


Confidentiality Notice: The preceding e-mail message (including any attac=
hments) contains information that may be confidential, protected by appli=
cable legal privileges, or constitute non-public information. It is inten=
ded to be conveyed only to the designated recipient(s). If you are not an=
 intended recipient of this message, please notify the sender by replying=
 to this message and then delete it from your system. Use, dissemination,=
 distribution or reproduction of this message by unintended recipients is=
 not authorized and may be unlawful.

--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BAB12E1usnygrmbx3raymo_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-mi=
crosoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:wo=
rd" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D=
"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-asci=
i">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">=

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
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
p.msochpdefault, li.msochpdefault, div.msochpdefault
	{mso-style-name:msochpdefault;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";}
span.emailstyle17
	{mso-style-name:emailstyle17;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
=2EMsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I see it was added i=
n April with patch to the setup-defconfig<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I will apply patch.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></s=
pan></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-Josh Vanderpool<o:p=
></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></s=
pan></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0i=
n 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&qu=
ot;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"fo=
nt-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Dm=
ytriyenko, Denys [mailto:denys@ti.com]
<br>
<b>Sent:</b> Thursday, July 10, 2014 5:15 PM<br>
<b>To:</b> meta-ti@yoctoproject.org; Vanderpool Josh<br>
<b>Subject:</b> RE: [meta-ti] Kernel Config Fragments?<o:p></o:p></span><=
/p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"colo=
r:black">Yes, it does, please check the recipe for examples.<br>
<br>
Denys<br>
<br>
<br>
Sent from my Android phone using TouchDown (<a href=3D"http://www.nitrode=
sk.com">www.nitrodesk.com</a>)<br>
<br>
-----Original Message----- <br>
<b>From:</b> Vanderpool Josh [Joshua.Vanderpool@raymondcorp.com]<br>
<b>Received:</b> Thursday, 10 Jul 2014, 16:16<br>
<b>To:</b> <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproje=
ct.org</a> [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> [meta-ti] Kernel Config Fragments?</span><span style=3D"f=
ont-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;=
"><o:p></o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal">Does the linux-ti-staging allow the use of config =
fragments.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">We would like to have a bbappend that includes the=
 configuration fragment in our upper layer.<o:p></o:p></p>
<p class=3D"MsoNormal">Currently we have to use the menuconfig which is a=
 manual process, if there is a better automated process please advise.<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">-Josh<o:p></o:p></p>
</div>
<p>Confidentiality Notice: The preceding e-mail message (including any at=
tachments) contains information that may be confidential, protected by ap=
plicable legal privileges, or constitute non-public information. It is in=
tended to be conveyed only to the designated
 recipient(s). If you are not an intended recipient of this message, plea=
se notify the sender by replying to this message and then delete it from =
your system. Use, dissemination, distribution or reproduction of this mes=
sage by unintended recipients is not authorized
 and may be unlawful.<o:p></o:p></p>
</div>
</div>
<p>
Confidentiality Notice: The preceding e-mail message (including any attac=
hments) contains information that may be confidential, protected by appli=
cable legal privileges, or constitute non-public information. It is inten=
ded to be conveyed only to the designated recipient(s). If you are not an=
 intended recipient of this message, please notify the sender by replying=
 to this message and then delete it from your system. Use, dissemination,=
 distribution or reproduction of this message by unintended recipients is=
 not authorized and may be unlawful.<p>

</body>
</html>

--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BAB12E1usnygrmbx3raymo_--
