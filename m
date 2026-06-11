Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA45CD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 13:35:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45739.1781184906726472618
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 06:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8B14D40CD8;
	Thu, 11 Jun 2026 13:35:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VZcXNv_BjHn; Thu, 11 Jun 2026 13:35:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4F7AD40C3A;
	Thu, 11 Jun 2026 13:35:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 05E5E17EE69; Thu, 11 Jun 2026 09:35:02 -0400 (EDT)
Date: Thu, 11 Jun 2026 09:35:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Antonios Christidis <a-christidis@ti.com>
Cc: reatmon@ti.com, denys@konsulko.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
Message-ID: <20260611133501.GN23325@denix.org>
References: <18B7DA0BBD971E15.267903@lists.yoctoproject.org>
 <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
 <20260610230522.GL23325@denix.org>
 <34825ca9-9b5c-4706-a2ff-6f5311fde8b0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <34825ca9-9b5c-4706-a2ff-6f5311fde8b0@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 13:35:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20023

On Wed, Jun 10, 2026 at 06:10:58PM -0500, Antonios Christidis wrote:
> Dear Denys,
>=20
>=20
> I remembered your previous advice on this and tried this out before
> sending both patches.
>=20
> The diff that is generated is too complex and difficult to read.
> Especially with the way git thinks mesa-pvr-25.inc file was created.
>=20
> To make up for this, I have described the changes for the
> mesa-pvr_25.1.8.bb in the commit message. And the changes on
> mesa-pvr-25.inc can be tracked via oe-core, commit sha:
> 2c0c7c3e5b71.

Hmm, I wasn't expecting version 25 to be very different from 24.
E.g. here's the big update 24 -> 25 in OE-Core:
https://git.openembedded.org/openembedded-core/commit/meta/recipes-graphi=
cs/mesa/mesa.inc?id=3Df9eb0468e45ee5a6a3b3195ef5e78c328c4347c9

In such case, it is recommended to split the changes and have a single=20
commit that copies OE-Core mesa.inc _verbatim_ from commit 2c0c7c3e5b71=20
into mesa-pvr_25.inc in meta-ti without any modifications, making sure=20
the commit message is very clear it's a verbatim copy.

Then in the next commit you modify mesa-pvr_25.inc for your needs and=20
plug it into meta-ti BSP framework.

That way the focus of reviews will be on your changes mostly, not what's=20
already in upstream.


> If this is still of interest, I can send the formatted patch.
>=20
>=20
> Kind Regards,
>=20
> Antonios
>=20
> On 6/10/26 6:05 PM, Denys Dmytriyenko wrote:
> >Please use -C and/or -M options when generating the patch, so there's =
a clear
> >diff between 24 and 25 .inc files. Thanks.
> >
> >
> >On Wed, Jun 10, 2026 at 05:58:44PM -0500, Antonios Christidis via list=
s.yoctoproject.org wrote:
> >>Dear Ryan Denys,
> >>
> >>
> >>Let me know your thoughts on the overall patch. I am particularly
> >>interested on your opinions on the following change:
> >>
> >>On 6/10/26 5:51 PM, Antonios Christidis via lists.yoctoproject.org wr=
ote:
> >>>BSP_MESA_PVR_VERSION:bsp-ti-6_18: =3D "2%"
> >>
> >>I wish there was a way to use syntax like
> >>"BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%|25%" or even
> >>"24.0.1|25.2.8".=A0Is there a better way of enabling this logic ?
> >>
> >>Also already aware of the extra ":" post-pended to the variable, I
> >>can send a v3 if that's all the feedback.
> >>
> >>
> >>Kind Regards,
> >>
> >>Antonios

