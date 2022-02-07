Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3910.1644275760474461016
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 15:16:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 28BCD40C2A;
	Mon,  7 Feb 2022 23:15:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWts1g0y-Q3K; Mon,  7 Feb 2022 23:15:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 03D57406B5;
	Mon,  7 Feb 2022 23:15:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 30933174743; Mon,  7 Feb 2022 18:15:54 -0500 (EST)
Date: Mon, 7 Feb 2022 18:15:54 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: reatmon@ti.com
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH] ti-linux-fw: Bump to 08.02.00.001 release
Message-ID: <20220207231554.GX26229@denix.org>
References: <20220207195043.22226-1-reatmon@ti.com>
 <5ccc74db-39a5-51ec-e739-7e12730032d1@ti.com>
 <8727421f-652e-8514-6e18-36bb994b7a62@ti.com>
MIME-Version: 1.0
In-Reply-To: <8727421f-652e-8514-6e18-36bb994b7a62@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 07, 2022 at 04:21:22PM -0600, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
> On 2/7/2022 14:07, Bajjuri, Praneeth wrote:
> >On 2/7/2022 1:50 PM, Ryan Eatmon wrote:
> >>Updated the ti-linux-fw version for 08.02.00.001
> >>
> >>Signed-off-by: Ryan Eatmon <reatmon@ti.com> > ---
> >>=A0 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
> >>=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>index 014e89c8..612e0689 100644
> >>--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> >>@@ -19,7 +19,7 @@ CADENCE_MHDP_FW_VERSION =3D "1.2.17"
> >>=A0 IMG_DEC_FW_VERSION =3D "1.0"
> >>=A0 CNM_WAVE521_FW_VERSION =3D "1.0.00"
> >
> >Few more places needs recipe update.
> >https://git.yoctoproject.org/meta-ti/tree/recipes-bsp/ti-linux-fw/ti-l=
inux-fw.inc?h=3Ddunfell
> >
> >
> >How about
> >K3_IMAGE_GEN_SRCREV ?=3D "892c86501ff745dfde4d535923ce686f45700da3"
>=20
> That one was already changed by a previous patch that you submitted.

This change is already in dunfell-next


> >and
> >
> >CORESDK_RTOS_VERSION =3D "08.02.00.04"
>=20
> I have addressed this in v2.

BTW, I'm still not seeing patch revision description in v2...


> >and
> >
> >PV =3D "2022.01"
>=20
> That one was already changed by a previous patch that you submitted.

This change is also already in dunfell-next


>=20
> >>-TI_LINUX_FW_SRCREV ?=3D "6070de0ae4095d291e1f7679d1fe6e07253a2fc3"
> >>+TI_LINUX_FW_SRCREV ?=3D "028414712b4ab3861dc4cc2aa14d7c5f5a37b521"
> >>=A0 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
> >>=A0 BRANCH ?=3D "ti-linux-firmware"
