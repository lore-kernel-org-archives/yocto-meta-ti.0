Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD860E0073F
	for <meta-ti@yoctoproject.org>; Wed, 27 Jun 2012 07:44:53 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q5REioJn004493;
	Wed, 27 Jun 2012 09:44:50 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q5REio88022959;
	Wed, 27 Jun 2012 09:44:50 -0500
Received: from DLEE09.ent.ti.com ([fe80::a026:b4ad:3e78:5ae5]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Wed, 27 Jun 2012 09:44:50 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "fromm@dresearch-fe.de" <fromm@dresearch-fe.de>, Enrico
	<ebutera@users.berlios.de>
Thread-Topic: [meta-ti] gstreamer / ti-dmai component does not build for
	ti8148-evm
Thread-Index: AQHNVGiCOUui6Fm7kE6GGq8cU+jQB5cOjqSAgAABWYD//63/8Q==
Date: Wed, 27 Jun 2012 14:44:48 +0000
Message-ID: <7B98F5B8-3C44-4919-B826-36C3A3B75319@ti.com>
References: <CADZ6=asseEZTzS6dz0we4-Czbr_n2Y6Pps5UsfGagh7NV04BqQ@mail.gmail.com>
	<CA+2YH7vu646k8kMUS9pYfJQ6+6s5PdvTdyxJSQewztRAaFEomg@mail.gmail.com>,
	<CADZ6=au5b5fKuhUm=4Nrsq2es66+u=X1aorgUgDLK8AZDA3mEg@mail.gmail.com>
In-Reply-To: <CADZ6=au5b5fKuhUm=4Nrsq2es66+u=X1aorgUgDLK8AZDA3mEg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: gstreamer / ti-dmai component does not build for	ti8148-evm
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
X-List-Received-Date: Wed, 27 Jun 2012 14:44:53 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7B98F5B83C444919B82636C3A3B75319ticom_"

--_000_7B98F5B83C444919B82636C3A3B75319ticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry for top post.

gst-ducati is not part of meta-ti and it wasn't integrated yet. Although so=
meone (was it Enrico?) had previously sent unfinished patches for it - you =
can check the archives. It didn't work for me on the first try and I had no=
 time debugging it further, so the patches got postponed for now - I still =
have them in my Todo list though...

Denys


----- Reply message -----
From: "Thilo Fromm" <fromm@dresearch-fe.de>
To: "Enrico" <ebutera@users.berlios.de>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: [meta-ti] gstreamer / ti-dmai component does not build for ti8148-=
evm
Date: Wed, Jun 27, 2012 10:38



Hi Enrico,

>> Hi,
>>
>> building gstreamer for ti8148 fails becasue DMAI does not build:
>
> Are you sure you can use gstreamer-ti with ti8148?

Apparently I cannot.

> AFAIK for
> multimedia it's more like the pandaboard so you should use gst-ducati.

... which is not part of meta-ti?

Regards,
Thilo

--
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228   mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77    http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=E4ftsf=FChrer: Dr. M. Weber, W. M=F6gle
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_7B98F5B83C444919B82636C3A3B75319ticom_
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
<style>
<!--
.x_EmailQuote
	{margin-left:1pt;
	padding-left:4pt;
	border-left:#800000 2px solid}
-->
</style>
<div>Sorry for top post. <br>
<br>
gst-ducati is not part of meta-ti and it wasn't integrated yet. Although so=
meone (was it Enrico?) had previously sent unfinished patches for it - you =
can check the archives. It didn't work for me on the first try and I had no=
 time debugging it further, so the
 patches got postponed for now - I still have them in my Todo list though..=
. <br>
<br>
Denys<br>
<br>
<br>
<div id=3D"x_htc_header" style=3D"">----- Reply message -----<br>
From: &quot;Thilo Fromm&quot; &lt;fromm@dresearch-fe.de&gt;<br>
To: &quot;Enrico&quot; &lt;ebutera@users.berlios.de&gt;<br>
Cc: &quot;meta-ti@yoctoproject.org&quot; &lt;meta-ti@yoctoproject.org&gt;<b=
r>
Subject: [meta-ti] gstreamer / ti-dmai component does not build for ti8148-=
evm<br>
Date: Wed, Jun 27, 2012 10:38<br>
<br>
</div>
<br>
<br>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi Enrico,<br>
<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; building gstreamer for ti8148 fails becasue DMAI does not build:<b=
r>
&gt;<br>
&gt; Are you sure you can use gstreamer-ti with ti8148?<br>
<br>
Apparently I cannot.<br>
<br>
&gt; AFAIK for<br>
&gt; multimedia it's more like the pandaboard so you should use gst-ducati.=
<br>
<br>
... which is not part of meta-ti?<br>
<br>
Regards,<br>
Thilo<br>
<br>
-- <br>
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect<br>
DResearch Fahrzeugelektronik GmbH<br>
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany<br>
Tel: &#43;49 (30) 515 932 228 &nbsp; <a href=3D"mailto:fromm@dresearch-fe.d=
e">mailto:fromm@dresearch-fe.de</a><br>
Fax: &#43;49 (30) 515 932 77 &nbsp; &nbsp;<a href=3D"http://www.dresearch.d=
e">http://www.dresearch.de</a><br>
Amtsgericht: Berlin Charlottenburg, HRB 130120 B<br>
Ust.-IDNr. DE273952058<br>
Gesch=E4ftsf=FChrer: Dr. M. Weber, W. M=F6gle<br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_7B98F5B83C444919B82636C3A3B75319ticom_--
