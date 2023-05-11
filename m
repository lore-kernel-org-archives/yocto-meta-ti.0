Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD1DC77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 15:45:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.531.1683819945268478737
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 08:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BCD7E40C81;
	Thu, 11 May 2023 15:45:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPgbig_fvJwM; Thu, 11 May 2023 15:45:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7D3A440A77;
	Thu, 11 May 2023 15:45:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 83D481638CA; Thu, 11 May 2023 11:44:55 -0400 (EDT)
Date: Thu, 11 May 2023 11:44:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Randolph Sapp <rs@ti.com>
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>, reatmon@ti.com,
	detheridge@ti.com, afd@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-driver: enable
 bxs/8xe apm
Message-ID: <20230511154455.GY9226@denix.org>
References: <20230508153330.327470-1-rs@ti.com>
 <f8a68f99-3f8b-28eb-12d1-1df6b0b3a348@ti.com>
 <b8e5e148-8864-c412-62a0-11892b006607@ti.com>
 <2f0984a9-eaf3-86d3-57a4-b3c8c49d0e54@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <2f0984a9-eaf3-86d3-57a4-b3c8c49d0e54@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 15:45:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16511

On Thu, May 11, 2023 at 10:14:18AM -0500, Randolph Sapp wrote:
> On 5/8/23 10:47, Bajjuri, Praneeth wrote:
> >
> >
> >On 5/8/2023 10:38 AM, Randolph Sapp via lists.yoctoproject.org wrote:
> >>On 5/8/23 10:33, rs@ti.com wrote:
> >>>From: Randolph Sapp <rs@ti.com>
> >>>
> >>>Bump the src revision to enable the following features on Jacinto:
> >>>=A0=A0=A0=A0- Active power managment
> >>>=A0=A0=A0=A0- Power island control via firmware
> >>>
> >>>Signed-off-by: Randolph Sapp <rs@ti.com>
> >>>---
> >>>=A0 .../powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb=A0=A0=A0=
=A0=A0=A0=A0=A0 | 2 +-
> >>>=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>>diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rog=
ue-driver_23.1.6404501.bb
> >>>index f8489e80..daee230b 100644
> >>>--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23=
.1.6404501.bb
> >>>+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23=
.1.6404501.bb
> >>>@@ -22,7 +22,7 @@ SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-=
rogue-driver.git;protocol=3Dhttps;
> >>>=A0 S =3D "${WORKDIR}/git"
> >>>-SRCREV =3D "b69b689252a1158bff205603288ad12b9482770b"
> >>>+SRCREV =3D "84e164c11ee8c734c58594eca5e74b86a6e6c612"
> >>>=A0 TARGET_PRODUCT:j721e =3D "j721e_linux"
> >>>=A0 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> >>
> >>Please note, this will break kernel 5.10 support until the
> >>following patch set is merged:
> >>https://serenity.dal.design.ti.com/patchwork/project/linux-patch-revi=
ew/list/?series=3D4147
> >
> >Internal link :)
>=20
> Point me to a public mirror of our patchworks instance then. :)

meta-ti and meta-arago patches are handled by the YP Patchwork, which is=20
public:
https://patchwork.yoctoproject.org/

But LPR is inherently internal, AFAIK...

--=20
Denys

