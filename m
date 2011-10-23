Return-Path: <joelagnel@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7952EE006D1
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 14:27:59 -0700 (PDT)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9NLRwDY019851
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 16:27:58 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9NLRwIb016555
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 16:27:58 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9NLRvL6028339
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 16:27:57 -0500 (CDT)
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Sun, 23 Oct 2011 16:27:58 -0500
From: "Fernandes, Joel A" <joelagnel@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: linux-ti33x-psp_3.0+3.1rc SRCREV
Thread-Index: AcyRyqA4oaxWyvoeQNW0CNgF/1aUJA==
Date: Sun, 23 Oct 2011 21:27:57 +0000
Message-ID: <083BC63EECB6FD41B8E81CF7FD87CC0F040A57@DLEE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: AFMZ AeKE Ar0X Dk7N EXfD Ec/M Ee9C Fgps FiJ+ FoWd GQmP
	HdoZ Kg3E LS+1 L8Kb MExJ; 1;
	bQBlAHQAYQAtAHQAaQBAAHkAbwBjAHQAbwBwAHIAbwBqAGUAYwB0AC4AbwByAGcA;
	Sosha1_v1; 7; {B1F5F7E2-84E9-4828-AC47-152980F38B51};
	agBvAGUAbABhAGcAbgBlAGwAQAB0AGkALgBjAG8AbQA=; Sun,
	23 Oct 2011 21:27:54 GMT;
	bABpAG4AdQB4AC0AdABpADMAMwB4AC0AcABzAHAAXwAzAC4AMAArADMALgAxAHIAYwAgAFMAUgBDAFIARQBWAA==
x-cr-puzzleid: {B1F5F7E2-84E9-4828-AC47-152980F38B51}
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: linux-ti33x-psp_3.0+3.1rc SRCREV
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Oct 2011 21:27:59 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_083BC63EECB6FD41B8E81CF7FD87CC0F040A57DLEE09entticom_"

--_000_083BC63EECB6FD41B8E81CF7FD87CC0F040A57DLEE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear Koen,

In the last update to SRCREV,
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments=
/commit/?id=3Dab07a0ea4be961a7e8c7b8b64a56ce6c730cd6e0

The Commit: c7fc664a6a36a4721b43dc287e410a2453f0b782 doesn't exist anymore =
in arago. Due to this the fetch breaks.

joel@minted ~/repo/linux-omap-2.6 $ git show c7fc664a6a36a4721b43dc287e410a=
2453f0b782
fatal: bad object c7fc664a6a36a4721b43dc287e410a2453f0b782

Either the Arago tree was rebased or the commit ID is not valid.

Thanks,
Joel

--_000_083BC63EECB6FD41B8E81CF7FD87CC0F040A57DLEE09entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
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
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.Section1
	{page:Section1;}
-->
</style><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"Section1">
<p class=3D"MsoNormal">Dear Koen,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the last update to SRCREV,<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://git.angstrom-distribution.org/cgi-=
bin/cgit.cgi/meta-texasinstruments/commit/?id=3Dab07a0ea4be961a7e8c7b8b64a5=
6ce6c730cd6e0">http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-t=
exasinstruments/commit/?id=3Dab07a0ea4be961a7e8c7b8b64a56ce6c730cd6e0</a><o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The Commit: c7fc664a6a36a4721b43dc287e410a2453f0b782=
 doesn&#8217;t exist anymore in arago. Due to this the fetch breaks.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">joel@minted ~/repo/linux-omap-2.6 $ git show c7fc664=
a6a36a4721b43dc287e410a2453f0b782<o:p></o:p></p>
<p class=3D"MsoNormal">fatal: bad object c7fc664a6a36a4721b43dc287e410a2453=
f0b782<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Either the Arago tree was rebased or the commit ID i=
s not valid.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Joel<o:p></o:p></p>
</div>
</body>
</html>

--_000_083BC63EECB6FD41B8E81CF7FD87CC0F040A57DLEE09entticom_--
