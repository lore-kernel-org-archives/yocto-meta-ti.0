Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DA56E00533
	for <meta-ti@yoctoproject.org>; Sat,  1 Sep 2012 14:21:13 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q81LLCU5014058
	for <meta-ti@yoctoproject.org>; Sat, 1 Sep 2012 16:21:12 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q81LLCk5022984
	for <meta-ti@yoctoproject.org>; Sat, 1 Sep 2012 16:21:12 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Sat, 1 Sep 2012 16:21:12 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Kridner, Jason" <jdk@ti.com>
Thread-Topic: [meta-ti] Fix image recipes in meta-ti
Thread-Index: Ac2Ig7pGwFxbqvJjRsORVyoWs1t29wALPzCA//+t/rs=
Date: Sat, 1 Sep 2012 21:21:12 +0000
Message-ID: <B3DA41A9-3C2F-4C4E-A414-68BA6D249EF7@ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C2B2B46@DFLE09.ent.ti.com>,
	<kkitbg3uuuda8t5puice0pub.1346534080222@email.android.com>
In-Reply-To: <kkitbg3uuuda8t5puice0pub.1346534080222@email.android.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Sat, 01 Sep 2012 21:21:13 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B3DA41A93C2F4C4EA41468BA6D249EF7ticom_"

--_000_B3DA41A93C2F4C4EA41468BA6D249EF7ticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Unless the meta-angstrom dependency is fixed then I would see them having t=
he same issue.

On Sep 1, 2012, at 4:14 PM, "Kridner, Jason" <jdk@ti.com<mailto:jdk@ti.com>=
> wrote:

Will meta-oe take the recipes?


-------- Original message --------
Subject: [meta-ti] Fix image recipes in meta-ti
From: "Cooper Jr., Franklin" <fcooper@ti.com<mailto:fcooper@ti.com>>
To: "meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>" <meta-ti@yo=
ctoproject.org<mailto:meta-ti@yoctoproject.org>>
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


--_000_B3DA41A93C2F4C4EA41468BA6D249EF7ticom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body bgcolor=3D"#FFFFFF">
<div>Unless the meta-angstrom dependency is fixed then I would see them hav=
ing the same issue.<br>
<br>
On Sep 1, 2012, at 4:14 PM, &quot;Kridner, Jason&quot; &lt;<a href=3D"mailt=
o:jdk@ti.com">jdk@ti.com</a>&gt; wrote:<br>
<br>
</div>
<div></div>
<blockquote type=3D"cite">
<div><style>
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
</style>Will
 meta-oe take the recipes?&nbsp;<br>
<br>
<br>
-------- Original message --------<br>
Subject: [meta-ti] Fix image recipes in meta-ti <br>
From: &quot;Cooper Jr., Franklin&quot; &lt;<a href=3D"mailto:fcooper@ti.com=
">fcooper@ti.com</a>&gt;
<br>
To: &quot;<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.=
org</a>&quot; &lt;<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yocto=
project.org</a>&gt;
<br>
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
</div>
</blockquote>
</body>
</html>

--_000_B3DA41A93C2F4C4EA41468BA6D249EF7ticom_--
