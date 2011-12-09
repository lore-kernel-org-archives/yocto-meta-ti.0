Return-Path: <jdk@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16488E006B5
	for <meta-ti@lists.yoctoproject.org>;
	Fri,  9 Dec 2011 05:59:29 -0800 (PST)
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id pB9DxSBg020047
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 9 Dec 2011 07:59:28 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pB9DxSkW027215;
	Fri, 9 Dec 2011 07:59:28 -0600 (CST)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pB9DxR7F008810;
	Fri, 9 Dec 2011 07:59:28 -0600 (CST)
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Fri, 9 Dec 2011 07:59:28 -0600
From: "Kridner, Jason" <jdk@ti.com>
To: Otavio Salvador <otavio@ossystems.com.br>, Koen Kooi
	<koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] [PATCH v2] beaglebone-getting-started: fix LICENSE,
	update to latest git
Thread-Index: AQHMtmwhSlyynEUeIEWiG74D54cUNpXTiFon
Date: Fri, 9 Dec 2011 13:59:27 +0000
Message-ID: <F61A9010E56D7F4C93A19FD36DAAC3592F2E39@DFLE34.ent.ti.com>
References: <1323432702-7423-1-git-send-email-koen@dominion.thruhere.net>,
	<CAP9ODKpXCJXmGPp=7KznuRnurZrVg=KT_AA=x_u5rbeL+wb9eg@mail.gmail.com>
In-Reply-To: <CAP9ODKpXCJXmGPp=7KznuRnurZrVg=KT_AA=x_u5rbeL+wb9eg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH v2] beaglebone-getting-started: fix LICENSE, update to latest git
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
X-List-Received-Date: Fri, 09 Dec 2011 13:59:30 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_F61A9010E56D7F4C93A19FD36DAAC3592F2E39DFLE34entticom_"

--_000_F61A9010E56D7F4C93A19FD36DAAC3592F2E39DFLE34entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Acked-by: Jason Kridner <jdk@ti.com>

However, note that there is now a 3f87d61b7d960d50eb68cd30154e12ceef6e417c =
with updated Windows drivers based on user feedback.

________________________________
From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] o=
n behalf of Otavio Salvador [otavio@ossystems.com.br]
Sent: Friday, December 09, 2011 7:14 AM
To: Koen Kooi
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2] beaglebone-getting-started: fix LICENSE, =
update to latest git

Acked-by: Otavio Salvador <otavio@ossystems.com.br<mailto:otavio@ossystems.=
com.br>>

On Fri, Dec 9, 2011 at 10:11, Koen Kooi <koen@dominion.thruhere.net<mailto:=
koen@dominion.thruhere.net>> wrote:
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net<mailto:koen@dominion.t=
hruhere.net>>
---
 recipes-misc/payload/beaglebone-getting-started.bb<http://beaglebone-getti=
ng-started.bb> |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb<http://beag=
lebone-getting-started.bb> b/recipes-misc/payload/beaglebone-getting-starte=
d.bb<http://beaglebone-getting-started.bb>
index b2b9308..142da90 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb<http://beaglebone-=
getting-started.bb>
+++ b/recipes-misc/payload/beaglebone-getting-started.bb<http://beaglebone-=
getting-started.bb>
@@ -1,13 +1,13 @@
 DESCRIPTION =3D "BeagleBone Getting Started Guide"

-PR =3D "r15"
+PR =3D "r16"

 inherit allarch

-LICENSE =3D "GPLv2+ && MIT && PD && others"
+LICENSE =3D "GPLv2+ & MIT & PD & others"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D603591dea023c3c75b48e07cb47=
ce639"

-SRCREV =3D "46c58edffaca856fbe5efa8126af7b1e933a1c9b"
+SRCREV =3D "a698888220634a1b549bc2f2e6b33aa03709cb19"
 SRC_URI =3D "git://github.com/jadonk/beaglebone-getting-started.git<http:/=
/github.com/jadonk/beaglebone-getting-started.git>"

 S =3D "${WORKDIR}/git"
--
1.7.2.5

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
https://lists.yoctoproject.org/listinfo/meta-ti



--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br<mailto:otavio@ossystems.com.br>  http://www=
.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


--_000_F61A9010E56D7F4C93A19FD36DAAC3592F2E39DFLE34entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle"></style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Courier New;color: #000000;font-s=
ize: 10pt;">
Acked-by: Jason Kridner &lt;jdk@ti.com&gt;
<div><br>
</div>
<div>However, note that there is now a&nbsp;3f87d61b7d960d50eb68cd30154e12c=
eef6e417c with updated Windows drivers based on user feedback.</div>
<div><br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div id=3D"divRpF266963" style=3D"direction: ltr; "><font face=3D"Tahoma" s=
ize=3D"2" color=3D"#000000"><b>From:</b> meta-ti-bounces@yoctoproject.org [=
meta-ti-bounces@yoctoproject.org] on behalf of Otavio Salvador [otavio@ossy=
stems.com.br]<br>
<b>Sent:</b> Friday, December 09, 2011 7:14 AM<br>
<b>To:</b> Koen Kooi<br>
<b>Cc:</b> meta-ti@lists.yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] [PATCH v2] beaglebone-getting-started: fix LI=
CENSE, update to latest git<br>
</font><br>
</div>
<div></div>
<div>Acked-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r" target=3D"_blank">otavio@ossystems.com.br</a>&gt;
<div><br>
<div class=3D"gmail_quote">On Fri, Dec 9, 2011 at 10:11, Koen Kooi <span di=
r=3D"ltr">
&lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=3D"_blank">koen@do=
minion.thruhere.net</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.net" =
target=3D"_blank">koen@dominion.thruhere.net</a>&gt;<br>
---<br>
&nbsp;recipes-misc/payload/<a href=3D"http://beaglebone-getting-started.bb"=
 target=3D"_blank">beaglebone-getting-started.bb</a> | &nbsp; &nbsp;6 &#43;=
&#43;&#43;---<br>
&nbsp;1 files changed, 3 insertions(&#43;), 3 deletions(-)<br>
<br>
diff --git a/recipes-misc/payload/<a href=3D"http://beaglebone-getting-star=
ted.bb" target=3D"_blank">beaglebone-getting-started.bb</a> b/recipes-misc/=
payload/<a href=3D"http://beaglebone-getting-started.bb" target=3D"_blank">=
beaglebone-getting-started.bb</a><br>
index b2b9308..142da90 100644<br>
--- a/recipes-misc/payload/<a href=3D"http://beaglebone-getting-started.bb"=
 target=3D"_blank">beaglebone-getting-started.bb</a><br>
&#43;&#43;&#43; b/recipes-misc/payload/<a href=3D"http://beaglebone-getting=
-started.bb" target=3D"_blank">beaglebone-getting-started.bb</a><br>
@@ -1,13 &#43;1,13 @@<br>
&nbsp;DESCRIPTION =3D &quot;BeagleBone Getting Started Guide&quot;<br>
<br>
-PR =3D &quot;r15&quot;<br>
&#43;PR =3D &quot;r16&quot;<br>
<br>
&nbsp;inherit allarch<br>
<br>
-LICENSE =3D &quot;GPLv2&#43; &amp;&amp; MIT &amp;&amp; PD &amp;&amp; other=
s&quot;<br>
&#43;LICENSE =3D &quot;GPLv2&#43; &amp; MIT &amp; PD &amp; others&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D603591dea023c3c75=
b48e07cb47ce639&quot;<br>
<br>
-SRCREV =3D &quot;46c58edffaca856fbe5efa8126af7b1e933a1c9b&quot;<br>
&#43;SRCREV =3D &quot;a698888220634a1b549bc2f2e6b33aa03709cb19&quot;<br>
&nbsp;SRC_URI =3D &quot;git://<a href=3D"http://github.com/jadonk/beaglebon=
e-getting-started.git" target=3D"_blank">github.com/jadonk/beaglebone-getti=
ng-started.git</a>&quot;<br>
<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.2.5<br>
<br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@yocto=
project.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</font></span></blockquote>
</div>
<br>
<br clear=3D"all">
<div><br>
</div>
-- <br>
Otavio Salvador&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>&nbsp;
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a><br>
Mobile: &#43;55 53 9981-7854&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;=
 &nbsp;<a href=3D"http://projetos.ossystems.com.br" target=3D"_blank">http:=
//projetos.ossystems.com.br</a><br>
<br>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_F61A9010E56D7F4C93A19FD36DAAC3592F2E39DFLE34entticom_--
