Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF594C3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 21:55:33 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.45.1746568530415931341
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 May 2025 14:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ASqNdpbM;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546LtLpt629723
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 16:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746568521;
	bh=wWGia9o4J4fiy9DNrDJ3lTe/yvKYwiLg2laC4frtcgI=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=ASqNdpbM5nAm5eWnP/v4lmZ7yfcuWJ8Gk3tx+j47909fsV4NIAtc5/dbCuONB2B+/
	 YSFENtrbvRVQVfDPwMP55vsJLBgR4kiuCze7MBQYLa66XjSTLX4pJYefOwNYQPYdcV
	 p49PrkKbBuVndB1rJT+EVkdlg1VH4ZfX2PaCoY9A=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546LtLok065403
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 16:55:21 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 16:55:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 16:55:20 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546LtKJJ025764;
	Tue, 6 May 2025 16:55:20 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 6 May 2025 16:55:20 -0500
Message-ID: <D9PEV9NDIIDO.AP7Z9507B59N@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] core-image-sato scarthgap beaglebone x11 startup
 error
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <sebastian.krahl@lacon.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <4weC.1746543468071238638.sYyH@lists.yoctoproject.org>
 <20250506162944.GC18383@denix.org>
In-Reply-To: <20250506162944.GC18383@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 May 2025 21:55:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18537

On Tue May 6, 2025 at 11:29 AM CDT, Denys Dmytriyenko wrote:
> + Randolph
>
> Unlike yocto-bsp, which uses vanilla mainline kernel with unaccelerated=
=20
> framebuffer, meta-ti by default enables accelerated graphics with out-of-=
tree=20
> drivers and user-space GLES libraries - SGX in case of Beaglebone and AM3=
35x.
>
> When meta-ti migrated from 6.1 kernel to 6.6, I believe X11 support was=
=20
> dropped. It should still be possible to fall back to unaccelerated frameb=
uffer=20
> and get X11 working, but that's not something that is configured nor test=
ed in=20
> meta-ti.

This was not a result of a kernel change, it was due to a Yocto lts version
change. A lot of layers use a common PACKAGECONFIG pattern that configures
packages to use Desktop GL instead of GLES when opengl and x11 distro featu=
res
are enabled. Arago took a hard stance that we will disable x11 to avoid
reconfiguring numerous packages for partial acceleration under x11. Users c=
an
try it, but they will need to be careful when configuring things.

> On Tue, May 06, 2025 at 07:57:48AM -0700, Sebastian via lists.yoctoprojec=
t.org wrote:
>> I've tested meta-ti for kirkstone the xserver starts up correctly into a=
n X=20
>> session.
>>=20
>> With meta-ti for scarthgap it fails. As it looks for a /dev/fb device wh=
ich=20
>> is not present.

Can you elaborate on this? Missing framebuffer devices is actually a displa=
y
controller related issue. If you have a splash screen then some fb device i=
s
being registered. What device is this for?
=20
>> Aside of this, with kirkstone and scarthgap in yocto-bsp and=20
>> beaglebone-yocto it works in both cases.
>>=20
>> The framebuffer is filled up by the splash screen also in powering down.
>>=20
>> What am I missing?
>>=20
>> What info to supply?
>>=20
>> Regards,
>>=20
>> Sebastian


