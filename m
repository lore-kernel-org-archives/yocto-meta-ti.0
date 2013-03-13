Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A7D0E00709
	for <meta-ti@yoctoproject.org>; Wed, 13 Mar 2013 09:25:28 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2DGPQh4006747;
	Wed, 13 Mar 2013 11:25:26 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2DGPQKk022156;
	Wed, 13 Mar 2013 11:25:26 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 13 Mar 2013 11:25:26 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"liljegren.mats2@gmail.com" <liljegren.mats2@gmail.com>
Thread-Topic: [meta-ti] License errors
Thread-Index: AQHOIAcm9f+PBtTLTE2zopz+TXPiMpijzq7H
Date: Wed, 13 Mar 2013 16:25:25 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E773EDD@DLEE08.ent.ti.com>
References: <20130313162332.GA17056@enea.se>
In-Reply-To: <20130313162332.GA17056@enea.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: License errors
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
X-List-Received-Date: Wed, 13 Mar 2013 16:25:28 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E773EDDDLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E773EDDDLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

README file


Denys


-----Original Message-----
From: Mats Liljegren [liljegren.mats2@gmail.com]
Received: Wednesday, 13 Mar 2013, 12:23
To: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: [meta-ti] License errors

When I bitbake with meta-ti layer I get the following errors:

ERROR: This recipe does not have the LICENSE field set (cloud9-image)
ERROR: This recipe does not have the LICENSE field set (cloud9-gfx-image)
ERROR: This recipe does not have the LICENSE field set (cloud9-gnome-image)
ERROR: This recipe does not have the LICENSE field set (ti-hw-bringup-image=
)
ERROR: Unable to parse
/media/sdc1/fb/mlil/enea-base/poky/meta-ti/recipes-misc/images/ti-hw-bringu=
p-image.bb: Exited with "1"--:--:--
ERROR: Command execution failed: Exited with 1

I use master branch for poky as well as for meta-ti.

Is there a fix for this already, or should I create a patch for it? If the
latter, what license should I use? MIT?

Regards
Mats Liljegren
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_B0581B5571079145BA1CD78C126DBDE72E773EDDDLEE08entticom_
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
pt; color:black">README file<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Mats Liljegren [liljegren.mats2@gmail.com]<br>
<b>Received:</b> Wednesday, 13 Mar 2013, 12:23<br>
<b>To:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> [meta-ti] License errors<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">When I bitbake with meta-ti layer I get the follow=
ing errors:<br>
<br>
ERROR: This recipe does not have the LICENSE field set (cloud9-image)<br>
ERROR: This recipe does not have the LICENSE field set (cloud9-gfx-image)<b=
r>
ERROR: This recipe does not have the LICENSE field set (cloud9-gnome-image)=
<br>
ERROR: This recipe does not have the LICENSE field set (ti-hw-bringup-image=
)<br>
ERROR: Unable to parse<br>
/media/sdc1/fb/mlil/enea-base/poky/meta-ti/recipes-misc/images/ti-hw-bringu=
p-image.bb: Exited with &quot;1&quot;--:--:--<br>
ERROR: Command execution failed: Exited with 1<br>
<br>
I use master branch for poky as well as for meta-ti.<br>
<br>
Is there a fix for this already, or should I create a patch for it? If the<=
br>
latter, what license should I use? MIT?<br>
<br>
Regards<br>
Mats Liljegren<br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E773EDDDLEE08entticom_--
