Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA697C35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 18:22:48 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.2001.1742408565323598992
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 11:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=G0G0B63G;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JIMfRL397854
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Mar 2025 13:22:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742408561;
	bh=R3gQuCpsyN8NfK3aOnL0MyUygMOaTajbByGLN5oNUbs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=G0G0B63GzxyrxKt7W3mXqq/KZgYDDDB+nhyOAZg2n5mffFNv4W0G8uTAJN/IRF7zL
	 1e0mixmbx8bLEolFN+ODTaTZrWq2KRqnlbzZbRrslIYoKy8hTKZhREQqbChXbwPzSP
	 Bzm06LLLusxIkEHGlg9Z2msLn/z7BHjza53lUnao=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52JIMfJ3117593
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Mar 2025 13:22:41 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 13:22:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 13:22:41 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JIMfVN048021;
	Wed, 19 Mar 2025 13:22:41 -0500
Message-ID: <9c50229e-235d-4825-a3cd-1053f51bc234@ti.com>
Date: Wed, 19 Mar 2025 13:22:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-ti][scarthgap/master][PATCH v5 3/3]
 recipes-graphics: port gc320 libs to work on kernel 6.12
To: Denys Dmytriyenko <denis@denix.org>, <afd@ti.com>,
        Andrew Davis
	<afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20250318023836.3507801-1-a-christidis@ti.com>
 <20250318023836.3507801-4-a-christidis@ti.com>
 <9859996f-68b6-485c-86cb-9182c5a5e219@ti.com>
 <20250318213853.GL23729@denix.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20250318213853.GL23729@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 52JIMfRL397854
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Mar 2025 18:22:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18406


On 3/18/25 4:38 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 18, 2025 at 04:=E2=80=8A01:=E2=80=8A37PM -0500, Andrew Davi=
s via=20
> lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: > On 3/17/25 9:=E2=80=8A=
38 PM, Antonios=20
> Christidis via lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: > >From:=
 Antonios=20
> Christidis <a-christidis@=E2=80=8Ati.=E2=80=8Acom> > >
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uPdqXRfP1m17CwYkH=
LKDfHEYvlwyW_vqb9VOfJCHARPcQCe_gAXq208Sc3o-G_CVgqCM4tPnpSqs9A$>=20
>
> ZjQcmQRYFpfptBannerEnd
> On Tue, Mar 18, 2025 at 04:01:37PM -0500, Andrew Davis via lists.yoctop=
roject.org wrote:
> > On 3/17/25 9:38 PM, Antonios Christidis via lists.yoctoproject.org wr=
ote:
> > >From: Antonios Christidis <a-christidis@ti.com>
> > >
> > >The user mode libraries needed recompiling with the scarthgap revisi=
on of gcc to
> > >remove all the warnings about 32bit API usage during the linking sta=
ge, new
> > >SRCREV and branch includes this changes. Versions of the libraries r=
emain the
> > >same.
> > >
> > >Signed-off-by: Antonios Christidis <a-christidis@ti>
> > >---
> > >v5:
> > >- Move the symb link of libGAL.so within the ${PN} package. While ma=
king
> > >   sure the header files are part of the ${PN}-dev package.
> > >
> > >v3:
> > >- Removed commented lines and extra lib directory that was being cre=
ated
> > >   in do_install()
> > >
> > >v2:
> > >- No longer include withing the PN package /usr/include file and sym=
b
> > >   link to library file. This is done by not chaning the FILES/PACKA=
GES
> > >   variables, thus creating a -dev package.
> > >
> > >  .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb    | 8 ++++=
+---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > >diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.1=
1.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > >index 807f421c..6b7226ab 100644
> > >--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > >+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > >@@ -11,10 +11,10 @@ COMPATIBLE_MACHINE =3D "omap-a15"
> > >  CLEANBROKEN =3D "1"
> > >-BRANCH =3D "ti-${PV}"
> > >+BRANCH =3D "ti-${PV}-scarthgap"
> > >  SRC_URI =3D "git://git.ti.com/git/graphics/ti-gc320-libs.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
> > >-SRCREV =3D "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
> > >+SRCREV =3D "85c175e8425c33dda6e272aeb45afe0f69a79096"
> > >  RRECOMMENDS:${PN} =3D "ti-gc320-driver"
> > >@@ -43,4 +43,6 @@ do_install() {
> > >      chown -R root:root ${D}
> > >  }
> > >-INSANE_SKIP:${PN} +=3D "ldflags"
> > >+FILES:${PN}:append =3D " ${libdir}"
> >=20
> > FILES:${PN} +=3D "${libdir}" ?
>
> 1. I agree it's best not to use blank :append overrides and instead use=
 +=3D
> 2. ${libdir} is already a default and doesn't need to be added explicit=
ly

Regarding #1, moving forward I'll prefer to use "+=3D" instead of the=20
"append". This will be included in a new version of the series.
Regarding #2, the default search pattern for ${PN} packages is:=20
"/usr/lib/lib*.so.* /usr/lib/*.so.*" so the symb link would never get=20
included in the ${PN} package. I was not clear enough when making my=20
change, but by explicitly stating ${libdir} the symb link is included in=20
the ${PN} package.

> --=20
> Denys

