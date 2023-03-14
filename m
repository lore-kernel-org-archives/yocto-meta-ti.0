Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74BFC7618B
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 19:53:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4975.1678823605455423575
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 12:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 620DB40C6B;
	Tue, 14 Mar 2023 19:53:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7z06oyDwLvbg; Tue, 14 Mar 2023 19:53:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 37C9840301;
	Tue, 14 Mar 2023 19:53:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 40C741637C2; Tue, 14 Mar 2023 15:52:50 -0400 (EDT)
Date: Tue, 14 Mar 2023 15:52:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH] linux-ti-staging: Add 6.1
 recipe
Message-ID: <20230314195250.GA18050@denix.org>
References: <20230314162027.28974-1-afd@ti.com>
 <f744c42c-7678-a43a-4dd7-c7323ec3236d@ti.com>
 <5a346fe0-c71a-155f-3d60-fe28d05d9929@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <5a346fe0-c71a-155f-3d60-fe28d05d9929@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Mar 2023 19:53:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15981

On Tue, Mar 14, 2023 at 11:46:23AM -0500, Bajjuri, Praneeth wrote:
> On 3/14/2023 11:37 AM, Ryan Eatmon wrote:
> >
> >Is there a better way of adding 6.1 without destroying the 5.10
> >support?  =A0Because until we have 6.1 up and working it would be
> >nice to have a working kirkstone for anyone using it...
>=20
> Want to hear from denys as well based on past migration history.
>=20
> IMO, there was a window during early migration at 5.10 phase where
> we limited features to get the initial baseline ready and added
> overlays over the time when kernel added the same.

Yes, this will be a major regression for existing customers using meta-ti=
=20
on Kirkstone!

In the past, Yocto migration was better aligned with the BSP migration an=
d=20
both would happen at about the same time every year. So, the new BSP woul=
d=20
be available in the new Yocto branch and there was a choice of using an o=
ld=20
branch with stable and feature-complete BSP, or a new, but unstable and=20
initially incomplete branch. That provided extra freedom and flexibility=20
to start completely from scratch in the new branch...

That has changed a bit recently with 5.4 -> 5.10 migration happening in=20
Dunfell couple of years ago. And this time around 5.10 -> 6.1 in Kirkston=
e.=20
Both branches are Yocto LTS with many active users having some expectatio=
n=20
of stability.

In Dunfell, initial 5.10 recipe was added in mid-January 2021:
https://git.yoctoproject.org/meta-ti/commit/?id=3D874ff0d7f9f31703e0a71a9=
f5d968051b77c2df0

It broke things for many people and I suggested marking it to not be used=
=20
as the default:
https://git.yoctoproject.org/meta-ti/commit/?id=3D6496a0edeb8a84bfb1b9e13=
ec58814ea5babcde7

Three months later, by mid-April 2021 the change was reverted and 5.10 go=
t=20
promoted to the default:
https://git.yoctoproject.org/meta-ti/commit/?id=3D7793303e6c1543e5058bf1a=
7e83ea72f3a45c079

Although I'd argue it was a bit too soon, as lots of DTBs/DTBOs still had=
 to=20
be removed from machine configs:
https://git.yoctoproject.org/meta-ti/commit/?id=3D8b206b32ec181624b929aa7=
f998f26ed99e140a7
https://git.yoctoproject.org/meta-ti/commit/?id=3Dfb0a0ddd25d4308152ce824=
3e00b444cbb5d565d
https://git.yoctoproject.org/meta-ti/commit/?id=3D9ea50db095f91bad7c9b2f6=
43347dc25be6e10dd
https://git.yoctoproject.org/meta-ti/commit/?id=3Dad28c5878171ef5b364f6bc=
9d8a5de514731964b
https://git.yoctoproject.org/meta-ti/commit/?id=3Dba0ddc5ae9ebf9777d31283=
f272e4ed518e1f514
https://git.yoctoproject.org/meta-ti/commit/?id=3D43bf0f36a3ac62cc3378688=
358ba704a27b501ce
https://git.yoctoproject.org/meta-ti/commit/?id=3D8bdfe1413c00e0c55132989=
dafcf8d91827999c3


> Remove all non-upstream Device Tree Overlays. We could have filtered th=
em
> out like as done in mainline and next testing. The issue would be as th=
ey
> are added back to 6.1 and upstream we would need to conditionally
> re-enable each. Easier to get a clean start.

I'd say we set DEFAULT_PREFERENCE =3D "-1" and, indeed, use automatic fil=
tering=20
of DT files similar to mainline/next recipes, until 6.1 mostly catches up=
 and=20
have majority of them integrated...

--=20
Denys

