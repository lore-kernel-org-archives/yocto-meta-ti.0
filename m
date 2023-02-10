Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DB9C636D4
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 22:12:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.7877.1676067123736250596
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 14:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 13F3340C13;
	Fri, 10 Feb 2023 22:12:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3viobs_jPRpe; Fri, 10 Feb 2023 22:12:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B070540BA8;
	Fri, 10 Feb 2023 22:11:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AD500163758; Fri, 10 Feb 2023 17:11:31 -0500 (EST)
Date: Fri, 10 Feb 2023 17:11:31 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, sinthu.raja@mistralsolutions.com,
	"Bajjuri, Praneeth" <praneeth@ti.com>, denys@ti.com,
	detheridge@ti.com, meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>, "Kumar, Udit" <u-kumar1@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH V2] conf: machine: j721s2: Add ehrpwm
 overlay for am68-sk
Message-ID: <20230210221131.GH22689@denix.org>
References: <20230207151300.3223-1-sinthu.raja@ti.com>
 <d5b39582-d7a8-2d0e-c6f0-8881f0f1ae7e@ti.com>
 <d8203dbe-37ec-6bd5-7928-f6e0b93d062b@ti.com>
 <CAEd-yTSg3gNDZSafhTYq6BEKXx3yOD7X7xgi-okq2SjDra+BCg@mail.gmail.com>
 <4c12871e-0da5-423b-be26-6263ddc3ec03@ti.com>
 <6de90508-7a11-18cc-60ae-fee82c0672fe@ti.com>
 <831db73d-5100-9b5c-3f7e-4c62cd055d7a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <831db73d-5100-9b5c-3f7e-4c62cd055d7a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 22:12:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15811

On Wed, Feb 08, 2023 at 02:10:23PM -0600, Andrew Davis via lists.yoctopro=
ject.org wrote:
> >>I'd also like to poke again the idea of pulling in DTB/DTBO files bas=
ed
> >>on some pattern matching instead of manually adding each time. I know=
 the
> >>idea got shot down, but I think this is going to be a growing problem=
 as
> >>we start to increase our usage of DT Overlays in the near future..
> >
> >The one annoying with making all of the DTBs being patterns is that we=
 have=20
> >to implement the logic to expand the wildcarding and set=20
> >KERNEL_DEVICETREE.=A0 If anyone tries to point to a different kernel (=
say an=20
> >upstream version) then nothing from meta-ti will work.=A0 And that may=
 not be=20
> >a show stopper issue, it's just the one that popped up in my head when=
 you=20
> >first brought up the idea for doing it for all platforms.
> >
> >Maybe this would be a good feature to promote to bitbake to support? A=
nd=20
> >alternative to KERNEL_DEVICETREE?=A0 A different variable?
>=20
> That is an option, no need to make it TI specific, I'd imagine wildcard
> filtering would be useful for many other's bsp layers.

To be fair - it wasn't "shut down" completely. I just pointed out that an=
y=20
dynamic processing of DTBs/DTBOs list would require more work.

KERNEL_DEVICETREE is a top-level global variable used and referenced from=
=20
other places besides the kernel recipe, specifically for image packaging,=
=20
e.g. by WIC or FIT or anything else. If it only gets populated later on d=
uring=20
the build process when the kernel gets built, none of those places will b=
e=20
able to see the list. There are some hurdles to overcome, but it may be a=
=20
nice generic feature to add...

--=20
Denys

