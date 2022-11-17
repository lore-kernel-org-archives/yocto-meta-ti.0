Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D82C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 21:27:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2477.1668720461006492776
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Nov 2022 13:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 16CF140DB7;
	Thu, 17 Nov 2022 21:27:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKlhTPNkVoB8; Thu, 17 Nov 2022 21:27:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E476240DB6;
	Thu, 17 Nov 2022 21:27:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D7E4016368B; Thu, 17 Nov 2022 16:27:32 -0500 (EST)
Date: Thu, 17 Nov 2022 16:27:32 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Daniel =?iso-8859-1?Q?D=EDaz?= <mrchapp@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, afd@ti.com
Subject: Re: [meta-ti] [master/kirkstone][PATCH] conf/machine/omapl138:
 correct few of the machine settings
Message-ID: <20221117212732.GM22689@denix.org>
References: <20221111011815.1980210-1-denis@denix.org>
 <CAELJN2=VYqdGGSOhxMQOrkkeG5b3f8ONr6OgcuJ0AzTKwpv6HA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAELJN2=VYqdGGSOhxMQOrkkeG5b3f8ONr6OgcuJ0AzTKwpv6HA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Nov 2022 21:27:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15348

+Andrew

On Thu, Nov 17, 2022 at 03:10:20PM -0600, Daniel D=EDaz wrote:
> Hello!
>=20
> On Thu, Nov 10, 2022 at 7:18 PM Denys Dmytriyenko <denis@denix.org> wro=
te:
> > From: Denys Dmytriyenko <denys@konsulko.com>
> >
> > Cleanup and unify again - omapl138-lcdk is the only platform supporte=
d in
> > the OMAP-L1 family. Plus there's no longer DaVinci family with corres=
ponding
> > settings. Adjust accordingly.
>=20
> We used to be able to build for am57xx-evm and beaglebone with just
> meta-ti-bsp. This patch seems to add a dependency on meta-ti-extras.
> Was this intended or has this always been required?
>=20
> Without meta-ti-extras:
>=20
> Parsing recipes...ERROR: ParseError at
> ../meta-ti/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb:2: Could
> not include required file recipes-ti/includes/ti-paths.inc
> ERROR: Parsing halted due to errors, see error messages above

Ok, that would actually be this commit responsible:

https://git.yoctoproject.org/meta-ti/commit/?h=3Dkirkstone&id=3Deda6651dd=
b4170c27fec411cf187b8c84765c815


Quick and dirty workaround I see is to replace "require" with "include" t=
o=20
break the hard dependency. ti-k3-secdev is only needed for K3 HS and can =
be=20
passed as a host tool.

Andrew, long term we should revisit the use of ti-paths.inc and overall h=
ow=20
ti-k3-secdev gets implemented and where it resides...

--=20
Denys

