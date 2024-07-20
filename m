Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DE1C3DA49
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 17:59:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.10786.1721498348110561918
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 20 Jul 2024 10:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4E76140C16;
	Sat, 20 Jul 2024 17:59:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNp8GBRlLwKF; Sat, 20 Jul 2024 17:59:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 272EE40B66;
	Sat, 20 Jul 2024 17:59:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0432F164001; Sat, 20 Jul 2024 13:59:00 -0400 (EDT)
Date: Sat, 20 Jul 2024 13:58:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Chirag Shilwant <c-shilwant@ti.com>, meta-ti@lists.yoctoproject.org,
	Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH] linux: Manage the kernel
 patches using the BSP system
Message-ID: <20240720175859.GO17572@denix.org>
References: <20240718182421.13591-1-reatmon@ti.com>
 <bd14cae5-e473-4542-adea-0b0cd15d9a8c@ti.com>
 <17E3A054E330ED13.19344@lists.yoctoproject.org>
 <97d92c14-f0b9-45e0-bfa6-7899c374196e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <97d92c14-f0b9-45e0-bfa6-7899c374196e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 20 Jul 2024 17:59:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17899

On Fri, Jul 19, 2024 at 09:18:14AM -0500, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
>=20
>=20
> On 7/19/2024 8:29 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >
> >
> >On 7/18/2024 11:27 PM, Chirag Shilwant wrote:
> >>Hi Ryan,
> >>On 18/07/24 23:54, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>>Applying the patches to all kernels is not going to work. Each
> >>>kernel might need different patches to address reproducibility
> >>>issues. Signed-off-by: Ryan Eatmon <reatmon@=E2=80=8Ati.=E2=80=8Acom=
> ---
> >>>meta-ti-bsp/recipes-kernel/linux/ti-kernel.=E2=80=8Ainc | 12
> >>>ZjQcmQRYFpfptBannerStart
> >>>This message was sent from outside of Texas Instruments.
> >>>Do not click links or open attachments unless you recognize
> >>>the source of this email and know the content is safe. If you
> >>>wish to report this message to IT Security, please forward the
> >>>message as an attachment to phishing@list.ti.com
> >>>ZjQcmQRYFpfptBannerEnd
> >>>Applying the patches to all kernels is not going to work.=C2=A0 Each=
 kernel
> >>>might need different patches to address reproducibility issues.
> >>>
> >>>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>>---
> >>>=C2=A0 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 12 ++++++++-=
---
> >>>=C2=A0 1 file changed, 8 insertions(+), 4 deletions(-)
> >>>
> >>>diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> >>>b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> >>>index f24fbe51..8bb30d40 100644
> >>>--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> >>>+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> >>>@@ -13,8 +13,12 @@ EXTRA_DTC_ARGS +=3D "${@get_extra_dtc_args(d)}"
> >>>=C2=A0 KERNEL_DTBDEST =3D "${KERNEL_IMAGEDEST}/dtb"
> >>>=C2=A0 KERNEL_DTBVENDORED =3D "1"
> >>>-SRC_URI:append =3D " \
> >>>-file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch=
 \
> >>>-file://0001-vt-conmakehash-improve-reproducibility.patch \
> >>>-file://0001-pnmtologo-use-relocatable-file-name.patch \
> >>>+KERNEL_PATCHES =3D ""
> >>>+
> >>>+KERNEL_PATCHES:bsp-ti-6.6 =3D " \
>=20
> This is wrong.  Should be bsp-ti-6_6.  Still not used to the name
> scheme for this.  I'll send a v2.

Yeah, this is an override, hence the number of special characters is limi=
ted -=20
had to replace dot with underscore...


> >>>+ file://0001-lib-build_OID_registry-fix-reproducibility-issues.patc=
h \
> >>>+=C2=A0=C2=A0=C2=A0 file://0001-vt-conmakehash-improve-reproducibili=
ty.patch \
> >>>+=C2=A0=C2=A0=C2=A0 file://0001-pnmtologo-use-relocatable-file-name.=
patch \
> >>>=C2=A0 "
> >>
> >>
> >>
> >>The patch title says [master/scarthgap] but I don't see these
> >>patches in scarthgap getting applied
> >
> >I'll look into it.=C2=A0 I've been a little preoccupied with master
> >this week, but I'll take a look today.
> >
> >
> > =C2=A0[1]
> >>Additionally the patches itself are missing in scarthgap branch [2]
> >>Are they applicable to scarthgap?
> >
> >Yes, they are.
> >
> >
> >>[1]: https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/r=
ecipes-kernel/linux/ti-kernel.inc?h=3Dscarthgap
> >>
> >>[2]: https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/r=
ecipes-kernel/linux/files?h=3Dscarthgap
> >>
> >>
> >>
> >>>+
> >>>+SRC_URI:append =3D " ${KERNEL_PATCHES} "
> >>>--=20
> >>>2.17.1

