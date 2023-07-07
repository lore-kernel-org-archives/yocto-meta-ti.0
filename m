Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7096EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 21:27:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6496.1688765226194832078
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Jul 2023 14:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6307B40C83;
	Fri,  7 Jul 2023 21:27:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_ebZ0fmI35r; Fri,  7 Jul 2023 21:27:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3B11640C13;
	Fri,  7 Jul 2023 21:27:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 80BFA163BF0; Fri,  7 Jul 2023 17:27:02 -0400 (EDT)
Date: Fri, 7 Jul 2023 17:27:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH] conf: switch k3r5
 multiconfig to baremetal
Message-ID: <20230707212702.GK1518@denix.org>
References: <20230706193122.1891075-1-denis@denix.org>
 <CANPvuRkq3qONAsF6ar3ngGd4KEJ_uZ+8u8ZvuDKCQZKmnh3Ljw@mail.gmail.com>
 <CANPvuR=bbiHkBG9BgrOkBj=oUvatC4vpJNDO79y4k5OYR8q3ww@mail.gmail.com>
 <CANPvuRmc7w96-pFJXFt57MqtW8j5nDJvqPy7tx3+SZ_aW01r8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CANPvuRmc7w96-pFJXFt57MqtW8j5nDJvqPy7tx3+SZ_aW01r8Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Jul 2023 21:27:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16836

On Fri, Jul 07, 2023 at 05:05:27PM +0100, Jose Quaresma wrote:
> Jose Quaresma <quaresma.jose@gmail.com> escreveu no dia sexta, 7/07/202=
3
> =E0(s) 17:02:
>=20
> > Foreword to the mailing list.
> >
> > ---------- Forwarded message ---------
> > De: Jose Quaresma <quaresma.jose@gmail.com>
> > Date: sexta, 7/07/2023 =E0(s) 10:51
> > Subject: Re: [meta-ti] [master/kirkstone][PATCH] conf: switch k3r5
> > multiconfig to baremetal
> > To: Denys Dmytriyenko <denis@denix.org>
> >
> >
> > Hi Denys,
> >
> > Thanks for doing that, I will do some tests with this on kirstone.
> >
>=20
> Have tested this on kirkstone and have some issues when using the spdx
> bbclass,
> maybe the spdx deploy folder also needs to be adjusted.
> Can have another look next week.

Thanks for testing. Please keep us posted. As I just replied to Ryan, any=
=20
additional customizations outside of meta-ti may require adjustments in t=
he=20
distro or local.conf.

