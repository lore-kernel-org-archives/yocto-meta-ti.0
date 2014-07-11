Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90E0CE002F9; Fri, 11 Jul 2014 08:43:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A964E002AA
	for <meta-ti@yoctoproject.org>; Fri, 11 Jul 2014 08:43:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6BFgkqu016081;
	Fri, 11 Jul 2014 10:42:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6BFgkFh006855;
	Fri, 11 Jul 2014 10:42:46 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 11 Jul 2014 10:42:46 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"cbrake@bec-systems.com" <cbrake@bec-systems.com>
Thread-Topic: [meta-ti] [diasy] omap2plus_defconfig does not include systemd
	support
Thread-Index: AQHPnQqvsfmVJ7TmkkmbSO6PGhb7mZubA29e
Date: Fri, 11 Jul 2014 15:42:45 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE73207ADE2@DLEE08.ent.ti.com>
References: <CAOd_LFxuEix6fEiRA8aA89OhR=tdPZTAp+NxfZAxA565Hirj_Q@mail.gmail.com>
In-Reply-To: <CAOd_LFxuEix6fEiRA8aA89OhR=tdPZTAp+NxfZAxA565Hirj_Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [diasy] omap2plus_defconfig does not include systemd	support
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
X-List-Received-Date: Fri, 11 Jul 2014 15:43:13 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE73207ADE2DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE73207ADE2DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Should the meta-ti layer be defining a prefered provider for the
beagleboard kernel?

It's already defining a default provider:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/include=
/omap3.inc?h=3Ddaisy#n25

Denys


Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Cliff Brake [cbrake@bec-systems.com]
Received: Friday, 11 Jul 2014, 9:19
To: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: [meta-ti] [diasy] omap2plus_defconfig does not include systemd sup=
port

Hi,

I'm trying to get a daisy build working on the beagleboard.  Its
currently building the linux-ti-staging-3.14 kernel for the bb.
However, this kernel appears to use the omap2plus_defconfig from the
http://git.ti.com/ti-linux-kernel repo.  What is the best path to get
omap2plus_defconfig modified to support systemd (its just a minor
tweak for cgroups?  Ideally, we'd get omap2plus_defconfig modified in
the upstream kernel.  Perhaps for now, we could have a config fragment
in the recipe?

NOTE: multiple providers are available for virtual/kernel
(linux-ti-staging, linux-mainline, linux-dummy, linux)
NOTE: consider defining a PREFERRED_PROVIDER entry to match virtual/kernel

Should the meta-ti layer be defining a prefered provider for the
beagleboard kernel?

Thanks,
Cliff
--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_B0581B5571079145BA1CD78C126DBDE73207ADE2DLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">&gt; Should the meta-ti layer be defining a prefered provi=
der for the<br>
beagleboard kernel?<br>
<br>
It's already defining a default provider:<br>
<br>
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/include=
/omap3.inc?h=3Ddaisy#n25<br>
<br>
Denys<br>
<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Cliff Brake [cbrake@bec-systems.com]<br>
<b>Received:</b> Friday, 11 Jul 2014, 9:19<br>
<b>To:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> [meta-ti] [diasy] omap2plus_defconfig does not include syst=
emd support<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi,<br>
<br>
I'm trying to get a daisy build working on the beagleboard.&nbsp; Its<br>
currently building the linux-ti-staging-3.14 kernel for the bb.<br>
However, this kernel appears to use the omap2plus_defconfig from the<br>
<a href=3D"http://git.ti.com/ti-linux-kernel">http://git.ti.com/ti-linux-ke=
rnel</a> repo.&nbsp; What is the best path to get<br>
omap2plus_defconfig modified to support systemd (its just a minor<br>
tweak for cgroups?&nbsp; Ideally, we'd get omap2plus_defconfig modified in<=
br>
the upstream kernel.&nbsp; Perhaps for now, we could have a config fragment=
<br>
in the recipe?<br>
<br>
NOTE: multiple providers are available for virtual/kernel<br>
(linux-ti-staging, linux-mainline, linux-dummy, linux)<br>
NOTE: consider defining a PREFERRED_PROVIDER entry to match virtual/kernel<=
br>
<br>
Should the meta-ti layer be defining a prefered provider for the<br>
beagleboard kernel?<br>
<br>
Thanks,<br>
Cliff<br>
-- <br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE73207ADE2DLEE08entticom_--
