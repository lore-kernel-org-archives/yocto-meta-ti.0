Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A968C3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 18:33:46 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.3549.1746729224876187342
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 May 2025 11:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=c2KD0t73;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548IXewG1163688
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 13:33:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746729220;
	bh=56rivkgN/Pbd0TEJs1w5mu9cLf/o90RqrrLxwApOxSQ=;
	h=Date:To:Subject:From:References:In-Reply-To;
	b=c2KD0t73ZjjPGZ6H4x4GfQYWAuoq2siCcv/FN6lffz37FZsUdE63RYWKr7qX1Stlp
	 tiw0ZZVkP+N226SxM+PfRLEhSAuUdWA+vLGVk03/mXmMs8iiOpc0Dqr3IvGqVPQKkP
	 HOWrR6RPAfIwzRef/L53GXBqbNPXBjvFTdFpmGbk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548IXeZx125776
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 13:33:40 -0500
Received: from lewvowa01.ent.ti.com (10.180.75.79) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 13:33:40 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by lewvowa01.ent.ti.com
 (10.180.75.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Thu, 8 May
 2025 13:33:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 13:33:39 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548IXd5E109942;
	Thu, 8 May 2025 13:33:39 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 8 May 2025 13:33:39 -0500
Message-ID: <D9QZTXU4E67C.29PHLX3XMUQG3@ti.com>
To: <sebastian.krahl@lacon.de>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] core-image-sato scarthgap beaglebone x11 startup
 error
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250506225349.GH18383@denix.org>
 <22590.1746596442506452473@lists.yoctoproject.org>
In-Reply-To: <22590.1746596442506452473@lists.yoctoproject.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 May 2025 18:33:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18546

On Wed May 7, 2025 at 12:40 AM CDT, Sebastian via lists.yoctoproject.org wr=
ote:
> The actual target is to deploy a kiosk system running on chromium with a =
touch screen.
>
> At first I've tried to adopt my patches from kirkstone on scarthgap (devi=
ce tree and uBoot) to setup the same configuration but it has failed at som=
e missing libglesX.so.2 (haven't got the log at hand) and I was walking bac=
k to check when the diverge happens. So I've found out it is not specific r=
elated to my introduced chromium but it seems to be related to meta-ti.
>
> I'm not bound to X but I've hoped by using the core targets I'll get a wi=
ndow manager running like in kirkstone.
>
> I've attached the log from the debug output.
>
> Regards,
>
> Sebastian

[    3.524779] tilcdc 4830e000.lcdc: bound 0-0070 (ops 0xc11c332c)
[    3.532676] [drm] Initialized tilcdc 1.0.0 20121205 for 4830e000.lcdc on=
 minor 0
[    3.540717] tilcdc 4830e000.lcdc: [drm] Cannot find any crtc or sizes
[    3.547695] tilcdc 4830e000.lcdc: [drm] Cannot find any crtc or sizes

These logs in particular are showing that tilcdc is loading and initializin=
g the
device but it's unable to detect any display. Nothing GFX related will be a=
ble
to work, aside from offscreen rendering, in this case.

I'd double check overlays or other configurations depending on what connect=
ion
method you are using for your display. You should probably take this to the
beagleboard forums though as it seems to be more related to your particular
setup.

