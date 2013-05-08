Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7F6DE0147D
	for <meta-ti@yoctoproject.org>; Wed,  8 May 2013 05:42:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48CgOZE004869;
	Wed, 8 May 2013 07:42:24 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48CgOAK005116;
	Wed, 8 May 2013 07:42:24 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 8 May 2013 07:42:23 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 8 May 2013 07:42:23 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Karicheri, Muralidharan" <m-karicheri2@ti.com>, "maxin.john@enea.com"
	<maxin.john@enea.com>
Thread-Topic: [meta-ti] [RESEND: PATCH 1/3] keystone2: boot-monitor: update
	to pull code from tip of the master
Thread-Index: AQHOS8X7NAhrLswZLk2I2ohunZx3zpj7O21h
Date: Wed, 8 May 2013 12:42:23 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E7D9A75@DLEE08.ent.ti.com>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>,
	<20130508082743.GA36018@sestofb10.enea.se>
In-Reply-To: <20130508082743.GA36018@sestofb10.enea.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [RESEND: PATCH 1/3] keystone2: boot-monitor: update to pull code from tip of the master
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
X-List-Received-Date: Wed, 08 May 2013 12:42:29 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E7D9A75DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E7D9A75DLEE08entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

No


Denys


-----Original Message-----
From: Maxin B. John [maxin.john@enea.com]
Received: Wednesday, 08 May 2013, 4:28
To: Karicheri, Muralidharan [m-karicheri2@ti.com]
CC: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: Re: [meta-ti] [RESEND: PATCH 1/3] keystone2: boot-monitor: update =
to pull code from tip of the master

Hi,

On Tue, May 07, 2013 at 05:24:17PM -0400, Murali Karicheri wrote:
 > This patch is needed to switch between release tag (when doing release
 > build) and tip of the master (when building nightly)
 >=B7
 > Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
 > ---
 >  recipes-bsp/boot-monitor/boot-monitor_git.bb |    6 ++++--
 >  1 file changed, 4 insertions(+), 2 deletions(-)
 >=B7
 > diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/=
boot-monitor/boot-monitor_git.bb
 > index c8a022a..a892720 100644
 > --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
 > +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
 > @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D25fe219a6feb=
f6e5bb45beda1b2eb315"
 >=B7=B7
 >  COMPATIBLE_MACHINE =3D "keystone-evm"
 >=B7=B7
 > -SRC_URI =3D "git://arago-project.org/git/projects/boot-monitor.git;prot=
ocol=3Dgit;branch=3D${BRANCH}"
 > +#SRC_URI =3D"git://arago-project.org/git/projects/boot-monitor.git;prot=
ocol=3Dgit;branch=3D${BRANCH}"
 > +SRC_URI =3D"git://gtgit01.gt.design.ti.com/git/projects/boot-monitor.gi=
t;protocol=3Dgit;branch=3D${BRANCH}"

While attempting to clone this repo,  "git clone git://gtgit01.gt.design.ti=
.com/git/projects/boot-monitor.git",
I get the following error message:

cloning into 'boot-monitor'...
fatal: unable to connect to gtgit01.gt.design.ti.com:
gtgit01.gt.design.ti.com: Name or service not known

Do this access problem has something to do with my local firewall
settings or somebody else also face the same problem ?

Best Regards,
Maxin
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_B0581B5571079145BA1CD78C126DBDE72E7D9A75DLEE08entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">No<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Maxin B. John [maxin.john@enea.com]<br>
<b>Received:</b> Wednesday, 08 May 2013, 4:28<br>
<b>To:</b> Karicheri, Muralidharan [m-karicheri2@ti.com]<br>
<b>CC:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> Re: [meta-ti] [RESEND: PATCH 1/3] keystone2: boot-monitor: =
update to pull code from tip of the master<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi,<br>
<br>
On Tue, May 07, 2013 at 05:24:17PM -0400, Murali Karicheri wrote:<br>
&nbsp;&gt; This patch is needed to switch between release tag (when doing r=
elease<br>
&nbsp;&gt; build) and tip of the master (when building nightly)<br>
&nbsp;&gt;=B7<br>
&nbsp;&gt; Signed-off-by: Murali Karicheri &lt;m-karicheri2@ti.com&gt;<br>
&nbsp;&gt; ---<br>
&nbsp;&gt;&nbsp; recipes-bsp/boot-monitor/boot-monitor_git.bb |&nbsp;&nbsp;=
&nbsp; 6 &#43;&#43;&#43;&#43;--<br>
&nbsp;&gt;&nbsp; 1 file changed, 4 insertions(&#43;), 2 deletions(-)<br>
&nbsp;&gt;=B7<br>
&nbsp;&gt; diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/reci=
pes-bsp/boot-monitor/boot-monitor_git.bb<br>
&nbsp;&gt; index c8a022a..a892720 100644<br>
&nbsp;&gt; --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb<br>
&nbsp;&gt; &#43;&#43;&#43; b/recipes-bsp/boot-monitor/boot-monitor_git.bb<b=
r>
&nbsp;&gt; @@ -11,7 &#43;11,8 @@ LIC_FILES_CHKSUM =3D&quot;<a href=3D"file:=
//COPYING;md5=3D25fe219a6febf6e5bb45beda1b2eb315">file://COPYING;md5=3D25fe=
219a6febf6e5bb45beda1b2eb315</a>&quot;<br>
&nbsp;&gt;=B7=B7<br>
&nbsp;&gt;&nbsp; COMPATIBLE_MACHINE =3D &quot;keystone-evm&quot;<br>
&nbsp;&gt;=B7=B7<br>
&nbsp;&gt; -SRC_URI =3D &quot;git://arago-project.org/git/projects/boot-mon=
itor.git;protocol=3Dgit;branch=3D${BRANCH}&quot;<br>
&nbsp;&gt; &#43;#SRC_URI =3D&quot;git://arago-project.org/git/projects/boot=
-monitor.git;protocol=3Dgit;branch=3D${BRANCH}&quot;<br>
&nbsp;&gt; &#43;SRC_URI =3D&quot;git://gtgit01.gt.design.ti.com/git/project=
s/boot-monitor.git;protocol=3Dgit;branch=3D${BRANCH}&quot;<br>
<br>
While attempting to clone this repo,&nbsp; &quot;git clone git://gtgit01.gt=
.design.ti.com/git/projects/boot-monitor.git&quot;,<br>
I get the following error message: <br>
<br>
cloning into 'boot-monitor'...<br>
fatal: unable to connect to gtgit01.gt.design.ti.com:<br>
gtgit01.gt.design.ti.com: Name or service not known<br>
<br>
Do this access problem has something to do with my local firewall<br>
settings or somebody else also face the same problem ? <br>
<br>
Best Regards,<br>
Maxin<br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E7D9A75DLEE08entticom_--
