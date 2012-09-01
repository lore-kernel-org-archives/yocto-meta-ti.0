Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02E94E00533
	for <meta-ti@yoctoproject.org>; Sat,  1 Sep 2012 14:07:32 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q81L7WIn015281
	for <meta-ti@yoctoproject.org>; Sat, 1 Sep 2012 16:07:32 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q81L7Wd2011113
	for <meta-ti@yoctoproject.org>; Sat, 1 Sep 2012 16:07:32 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Sat, 1 Sep 2012 16:07:32 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: Fix image recipes in meta-ti
Thread-Index: Ac2Ig7pGwFxbqvJjRsORVyoWs1t29w==
Date: Sat, 1 Sep 2012 21:07:31 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Fix image recipes in meta-ti
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
X-List-Received-Date: Sat, 01 Sep 2012 21:07:33 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C2B2B46DFLE09entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C2B2B46DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

When debugging issues in meta-arago I frequently try building recipes using=
  the meta-ti,meta-oe and oe-core layers. However, I always have to remove =
the following recipes due to "This recipe does not have the LICENSE field s=
et" error:
cloud9-gfx-image.bb
cloud9-gnome-image.bb
cloud9-image.bb

The issue is these recipes have an include from meta-angstrom that provides=
 this LICENSE field. Meta-ti should not have this dependency so these recip=
es should be fixed to address this. I personally do not think cloud9 relate=
d recipes that install  cloud9, nodejs, mplayer etc.. should even be in met=
a-ti which is a BSP layer but that is a completely different discussion. I =
also don't believe pulling in the include file that is needed from meta-ang=
strom is also a reasonably solution. Either these recipes need to be fixed =
so that they can work in meta-ti with only a dependency on meta-oe and oe-c=
ore. Or remove the recipes from this layer and pull it into meta-angstrom w=
hich I believe is the best option.
Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C2B2B46DFLE09entticom_
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
<p class=3D"MsoNormal">When debugging issues in meta-arago I frequently try=
 building recipes using&nbsp; the meta-ti,meta-oe and oe-core layers. Howev=
er, I always have to remove the following recipes due to &#8220;This recipe=
 does not have the LICENSE field set&#8221; error:<o:p></o:p></p>
<p class=3D"MsoNormal">cloud9-gfx-image.bb<o:p></o:p></p>
<p class=3D"MsoNormal">cloud9-gnome-image.bb<o:p></o:p></p>
<p class=3D"MsoNormal">cloud9-image.bb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The issue is these recipes have an include from meta=
-angstrom that provides this LICENSE field. Meta-ti should not have this de=
pendency so these recipes should be fixed to address this. I personally do =
not think cloud9 related recipes that
 install&nbsp; cloud9, nodejs, mplayer etc.. should even be in meta-ti whic=
h is a BSP layer but that is a completely different discussion. I also don&=
#8217;t believe pulling in the include file that is needed from meta-angstr=
om is also a reasonably solution. Either these
 recipes need to be fixed so that they can work in meta-ti with only a depe=
ndency on meta-oe and oe-core. Or remove the recipes from this layer and pu=
ll it into meta-angstrom which I believe is the best option.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Franklin Cooper Jr.<o:p></o:p></p>
<p class=3D"MsoNormal">Texas Instruments<o:p></o:p></p>
<p class=3D"MsoNormal">Application Engineer<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"mailto:fcooper@ti.com">fcooper@ti.com</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C2B2B46DFLE09entticom_--
