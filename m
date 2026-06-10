Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873BECD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 23:05:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33858.1781132728015460317
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 16:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F2FB740C3A;
	Wed, 10 Jun 2026 23:05:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uAwbDEhRTpvS; Wed, 10 Jun 2026 23:05:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B30FD40BD6;
	Wed, 10 Jun 2026 23:05:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B79D617EDFA; Wed, 10 Jun 2026 19:05:22 -0400 (EDT)
Date: Wed, 10 Jun 2026 19:05:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: reatmon@ti.com, denys@konsulko.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
Message-ID: <20260610230522.GL23325@denix.org>
References: <18B7DA0BBD971E15.267903@lists.yoctoproject.org>
 <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jun 2026 23:05:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20014

Please use -C and/or -M options when generating the patch, so there's a c=
lear=20
diff between 24 and 25 .inc files. Thanks.


On Wed, Jun 10, 2026 at 05:58:44PM -0500, Antonios Christidis via lists.y=
octoproject.org wrote:
> Dear Ryan Denys,
>=20
>=20
> Let me know your thoughts on the overall patch. I am particularly
> interested on your opinions on the following change:
>=20
> On 6/10/26 5:51 PM, Antonios Christidis via lists.yoctoproject.org wrot=
e:
> >BSP_MESA_PVR_VERSION:bsp-ti-6_18: =3D "2%"
>=20
>=20
> I wish there was a way to use syntax like
> "BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%|25%" or even
> "24.0.1|25.2.8".=A0Is there a better way of enabling this logic ?
>=20
> Also already aware of the extra ":" post-pended to the variable, I
> can send a v3 if that's all the feedback.
>=20
>=20
> Kind Regards,
>=20
> Antonios

