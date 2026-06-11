Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FFBCD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:51:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51062.1781196662788662006
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 09:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B4AA140C8F;
	Thu, 11 Jun 2026 16:51:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ap6y_dXA8uva; Thu, 11 Jun 2026 16:51:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6A3AD40C8E;
	Thu, 11 Jun 2026 16:50:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A331B176D83; Thu, 11 Jun 2026 12:50:57 -0400 (EDT)
Date: Thu, 11 Jun 2026 12:50:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: reatmon@ti.com, denys@konsulko.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
Message-ID: <20260611165057.GR23325@denix.org>
References: <18B7DA0BBD971E15.267903@lists.yoctoproject.org>
 <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
 <d5d84531-360e-4f57-b4bf-699614b3d749@ti.com>
 <20260611132320.GM23325@denix.org>
 <664e282c-f132-497b-9763-4d0df91bdd52@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <664e282c-f132-497b-9763-4d0df91bdd52@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 16:51:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20032

On Thu, Jun 11, 2026 at 11:30:42AM -0500, Antonios Christidis via lists.y=
octoproject.org wrote:
>=20
> On 6/11/26 8:23 AM, Denys Dmytriyenko wrote:
> >On Wed, Jun 10, 2026 at 09:17:37PM -0500, Ryan Eatmon via lists.yoctop=
roject.org wrote:
> >>
> >>On 6/10/2026 5:58 PM, Antonios Christidis wrote:
> >>>Dear Ryan Denys,
> >>>
> >>>
> >>>Let me know your thoughts on the overall patch. I am particularly
> >>>interested on your opinions on the following change:
> >>>
> >>>On 6/10/26 5:51 PM, Antonios Christidis via lists.yoctoproject.org w=
rote:
> >>>>BSP_MESA_PVR_VERSION:bsp-ti-6_18: =3D "2%"
> >>So... I think what this does is establish the pattern for which
> >>version it will match to.  And then from that pattern it will pick
> >>the highest version.
> >>
> >>So for ALL 6_18 builds it will probably choose 25 and never 24.
> >>Which is not what you want.
> >>
> >>... I think ...
> >>
> >>We have never tried to mix versions like this in the past, so I'm
> >>not 100% sure what the best course is.
> >>
> >>Likely a mixture of the override based on machine needs to be in
> >>there. And for that I'm thinking you might need an extra variable.
> >>
> >>BSP_MESA_PVR_VERSION_6_18 ?=3D "25%"
> >>BSP_MESA_PVR_VERSION_6_18:am57 =3D "24%"
> >>BSP_MESA_PVR_VERSION_6_18:ti33 =3D "24%"
> >>etc...
> >>
> >>BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "${BSP_MESA_PVR_VERSION_6_18}"
> >>
> >>
> >>Something along those lines?  That would be the most clear for
> >>people to follow as well.
> >It was done differently in this patch:
> >
> >mesa-pvr 24 was maked compatible only with SGX platforms, while mesa-p=
vr 25
> >was marked compatible with the rest of the platforms. Also not ideal t=
hough.
> >
> I think Ryan's idea is easier to follow, compared to the flow I have
> included in this series.
>=20
> Another way of going about this (I'm not saying this is easier
> and/or a better method) would be to create 2 MACHINEOVERIDES.=A0On a
> per platform level (ex: am62pxx.inc) to add ```MACHINEOVERRIDES =3D.
> "rogue-core:"```, then within ti-bsp
> ```BSP_MESA_PVR_VERSION:bsp-ti-6_18:rogue-core =3D "25%"``` picking
> the right version when paired against a sgx-core override.
>=20
> An added benefit to this, the new overrides would cut down on the
> need for duplicate variables tracking Rogue vs SGX (examples:
> BSP_SGX_DRIVER_VERSION, BSP_ROGUE_DRIVER_VERSION).
>=20
> A downside to this flow, tracking what is currently included
> within=A0MACHINEOVERRIDES , describing what architecture of GPU core
> doesn't really fit well with pre-existing overrides.
>=20
>=20
> Let me know what you think?

FWIW, we used to have separate "sgx" and "rogue" flags in MACHINE_FEATURE=
S=20
years ago. Not exactly MACHINEOVERRIDES, but still easy to do conditional=
s.

But complaints were that all this needs to be unified and, first, both of=
=20
those flags were merged into "gpu" MACHINE_FEATURES and eventually comple=
tely=20
removed.

So, I'd argue if you do want to bump mesa-pvr version, it has to be done =
for=20
all the platforms regardless of the graphics core, SGX or Rogue. We've al=
ready=20
went through a lengthy period in kirkstone (2022 era) where SGX was compl=
etely=20
broken and customers were sent back to use dunfell (2020 era) just to get=
 SGX=20
working at all...


> >>>I wish there was a way to use syntax like
> >>>"BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%|25%" or even
> >>>"24.0.1|25.2.8".=A0Is there a better way of enabling this logic ?
> >>>
> >>>Also already aware of the extra ":" post-pended to the variable, I
> >>>can send a v3 if that's all the feedback.
> >>>
> >>>
> >>>Kind Regards,
> >>>
> >>>Antonios
> >>>

