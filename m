Return-Path: <jdk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F79EE00533
	for <meta-ti@yoctoproject.org>; Sat,  1 Sep 2012 14:14:44 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q81LEiIn006559
	for <meta-ti@yoctoproject.org>; Sat, 1 Sep 2012 16:14:44 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q81LEig1016738
	for <meta-ti@yoctoproject.org>; Sat, 1 Sep 2012 16:14:44 -0500
Received: from DFLE12.ent.ti.com ([fe80::145d:e72a:4dbf:e0dd]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Sat, 1 Sep 2012 16:14:43 -0500
From: "Kridner, Jason" <jdk@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Fix image recipes in meta-ti
Thread-Index: AQHNiIbO21yNTP9P5kWsNbGiZYGBzA==
Date: Sat, 1 Sep 2012 21:14:43 +0000
Message-ID: <kkitbg3uuuda8t5puice0pub.1346534080222@email.android.com>
References: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: Fix image recipes in meta-ti
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
X-List-Received-Date: Sat, 01 Sep 2012 21:14:44 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_kkitbg3uuuda8t5puice0pub1346534080222emailandroidcom_"

--_000_kkitbg3uuuda8t5puice0pub1346534080222emailandroidcom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Will meta-oe take the recipes?


-------- Original message --------
Subject: [meta-ti] Fix image recipes in meta-ti
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
CC:


When debugging issues in meta-arago I frequently try building recipes using=
  the meta-ti,meta-oe and oe-core layers. However, I always have to remove =
the following recipes due to =93This recipe does not have the LICENSE field=
 set=94 error:
cloud9-gfx-image.bb
cloud9-gnome-image.bb
cloud9-image.bb

The issue is these recipes have an include from meta-angstrom that provides=
 this LICENSE field. Meta-ti should not have this dependency so these recip=
es should be fixed to address this. I personally do not think cloud9 relate=
d recipes that install  cloud9, nodejs, mplayer etc.. should even be in met=
a-ti which is a BSP layer but that is a completely different discussion. I =
also don=92t believe pulling in the include file that is needed from meta-a=
ngstrom is also a reasonably solution. Either these recipes need to be fixe=
d so that they can work in meta-ti with only a dependency on meta-oe and oe=
-core. Or remove the recipes from this layer and pull it into meta-angstrom=
 which I believe is the best option.
Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_kkitbg3uuuda8t5puice0pub1346534080222emailandroidcom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style>
<!--
@font-face
	{font-family:Calibri}
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif"}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline}
span.EmailStyle17
	{font-family:"Calibri","sans-serif";
	color:windowtext}
.MsoChpDefault
	{font-family:"Calibri","sans-serif"}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.WordSection1
	{}
-->
</style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
Will meta-oe take the recipes?&nbsp;<br>
<br>
<br>
-------- Original message --------<br>
Subject: [meta-ti] Fix image recipes in meta-ti <br>
From: &quot;Cooper Jr., Franklin&quot; &lt;fcooper@ti.com&gt; <br>
To: &quot;meta-ti@yoctoproject.org&quot; &lt;meta-ti@yoctoproject.org&gt; <=
br>
CC: <br>
<br>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">When debugging issues in meta-arago I frequently try=
 building recipes using&nbsp; the meta-ti,meta-oe and oe-core layers. Howev=
er, I always have to remove the following recipes due to =93This recipe doe=
s not have the LICENSE field set=94 error:</p>
<p class=3D"MsoNormal">cloud9-gfx-image.bb</p>
<p class=3D"MsoNormal">cloud9-gnome-image.bb</p>
<p class=3D"MsoNormal">cloud9-image.bb</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">The issue is these recipes have an include from meta=
-angstrom that provides this LICENSE field. Meta-ti should not have this de=
pendency so these recipes should be fixed to address this. I personally do =
not think cloud9 related recipes that
 install&nbsp; cloud9, nodejs, mplayer etc.. should even be in meta-ti whic=
h is a BSP layer but that is a completely different discussion. I also don=
=92t believe pulling in the include file that is needed from meta-angstrom =
is also a reasonably solution. Either these
 recipes need to be fixed so that they can work in meta-ti with only a depe=
ndency on meta-oe and oe-core. Or remove the recipes from this layer and pu=
ll it into meta-angstrom which I believe is the best option.</p>
<p class=3D"MsoNormal"></p>
<p class=3D"MsoNormal">Regards,</p>
<p class=3D"MsoNormal">Franklin Cooper Jr.</p>
<p class=3D"MsoNormal">Texas Instruments</p>
<p class=3D"MsoNormal">Application Engineer</p>
<p class=3D"MsoNormal"><a href=3D"mailto:fcooper@ti.com">fcooper@ti.com</a>=
</p>
<p class=3D"MsoNormal">&nbsp;</p>
</div>
</div>
</body>
</html>

--_000_kkitbg3uuuda8t5puice0pub1346534080222emailandroidcom_--
