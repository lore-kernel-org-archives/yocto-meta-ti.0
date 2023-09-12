Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485ECCA0EF7
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 17:17:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.163.1694539049055734534
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 10:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4283940C2A;
	Tue, 12 Sep 2023 17:17:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HcHd99NjZpx0; Tue, 12 Sep 2023 17:17:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B8B36409AE;
	Tue, 12 Sep 2023 17:17:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D0A4F163CAA; Tue, 12 Sep 2023 13:17:20 -0400 (EDT)
Date: Tue, 12 Sep 2023 13:17:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
	reatmon@ti.com, praneeth@ti.com, srk@ti.com
Subject: Re: [meta-ti][kirkstone][PATCH v2] kernel-rdepends: Remove PRU
 Ethernet firmwares for legacy devices
Message-ID: <20230912171720.GG3359@denix.org>
References: <20230908114439.13213-1-r-gunasekaran@ti.com>
 <3bce9ebc-90ba-e525-67da-fda1b8ce95a4@ti.com>
 <c318dc95-5177-9bc1-645e-08feba12d7aa@ti.com>
 <20230911170552.GC3359@denix.org>
 <a7a82135-4cee-12c5-3324-19e14c882519@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <a7a82135-4cee-12c5-3324-19e14c882519@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 17:17:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16954

On Tue, Sep 12, 2023 at 10:25:38AM +0530, Ravi Gunasekaran wrote:
>=20
>=20
> On 9/11/23 10:35 PM, Denys Dmytriyenko wrote:
> > On Mon, Sep 11, 2023 at 09:58:23AM +0530, Ravi Gunasekaran via lists.=
yoctoproject.org wrote:
> >> Andrew,
> >>
> >> On 9/8/23 7:49 PM, Andrew Davis wrote:
> >>> On 9/8/23 6:44 AM, Ravi Gunasekaran via lists.yoctoproject.org wrot=
e:
> >>>> Remove the PRU Ethernet firmwares from being packaged for
> >>>> AM33x, AM43x and AM57x.
> >>>>
> >>>
> >>> Commit messages should give the "why", we can read the code.
> >>
> >> I will provide reasoning in the v2.
> >>
> >>>
> >>> Are we dropping support for PRUETH from these boards? I still
> >>> use this, I'm sure others do too.
> >>>
> >>
> >> PRUETH drivers for these devices are not upstreamed and PRUTETH will=
 not
> >> be supported in SDK 9.1 as well. Plan to upstream and port to SDK is=
 still
> >> being worked on. So I wanted to remove these firmwares from being pa=
ckaged.
> >=20
> > So, besides PRU ETH, what about SW, HSR and PRP firmwares that are be=
ing=20
> > removed here?
>=20
> Ah ok. I get your perspective.
>=20
> SW, HSR and PRP are different ethernet modes and they have their respec=
tive firmwares.
> In driver space, it is just PRUETH driver and it loads different types =
of ethernet
> firmware based on the configuration. I used PRUETH as an umbrella term =
as that's what
> is used in our documentation.=20
>=20
> Based on Ryan's feedback on the approach to remove these firmwares,
> I will reword the commit message to give this view in v2

Thanks for the explanation - indeed, a bit more details in the commit mes=
sage=20
would help.


> >>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> >>>> ---
> >>>> Changes from v1:
> >>>> --------------
> >>>> * Corrected the commit message.
> >>>>
> >>>> =A0 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 3 ---
> >>>> =A0 1 file changed, 3 deletions(-)
> >>>>
> >>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc =
b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> >>>> index 266a7ef5..317ab1b1 100644
> >>>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> >>>> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> >>>> @@ -12,9 +12,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7=
xx =3D " vpdma-fw"
> >>>> =A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:dra7xx =3D " goodi=
x-fw"
> >>>> =A0 =A0 # Add run-time dependency for PRU Ethernet firmware to the=
 rootfs
> >>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx =3D " prueth-f=
w prusw-fw pruhsr-fw pruprp-fw"
> >>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D " prueth-fw=
 pruhsr-fw pruprp-fw"
> >>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " prueth-fw=
 pruhsr-fw pruprp-fw"
> >>>> =A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx =3D " pruet=
h-fw-am65x"
> >>>> =A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm =3D " p=
rueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
> >>>> =A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D " pruet=
h-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
> >>>>
> >>>> base-commit: c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f

