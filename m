Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6C2CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 14:05:41 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.8531.1759500333875188228
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Oct 2025 07:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IC2auUjl;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: bb@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 593E5U4k3103447;
	Fri, 3 Oct 2025 09:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759500330;
	bh=yswxEIruTFWAbxAo0gOi/qX5l2Srdyw/c+kQgrxdFD8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IC2auUjl479oNKzUjyoKzXHOap7UAZe2fjD34B+KvdEdjqt6ZdAVtLM4S6mscaT5w
	 6UWzz8h/uAycywAlsRnduvPtzwCiH3AkKujTbumOCr5mmvrQWn3WBpHFbHHCsx1VTd
	 Qm1qKWvtvvy+IywP81K6hWQjPZHbOCZAhvXjkntI=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 593E5UTb191903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Oct 2025 09:05:30 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Oct
 2025 09:05:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 3 Oct 2025 09:05:30 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 593E5U7j3735896;
	Fri, 3 Oct 2025 09:05:30 -0500
Date: Fri, 3 Oct 2025 09:05:30 -0500
From: Bryan Brattlof <bb@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Meta-TI <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH RFC] optee: use software PRNG for real-time
 kernel builds
Message-ID: <20251003140530.43ervhgyxuer4pfj@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20251002-rtl-optee-hack-v1-1-efe08f733059@ti.com>
 <20251002191853.GE3125@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251002191853.GE3125@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Oct 2025 14:05:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19104

On October  2, 2025 thus sayeth Denys Dmytriyenko:
> On Thu, Oct 02, 2025 at 07:28:27AM -0500, Bryan Brattlof via lists.yoctoproject.org wrote:
> > The 4.7.0 release of OP-TEE is causing unacceptable latency issues with
> > the real-time kernel. Migrate to software PRNG until they can be
> > resolved in a later release.
> > 
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> > Debugging a +30us latency regression has lead us to the hardware
> > accelerated RNG drivers in OP-TEE. Falling back to software PRNG
> > restores the context switch latency back to acceptable levels.
> > 
> > Because this only affects real-time kernels this is more an RFC
> > until we can fix the firmware or find an alternative for the
> > builds where latency is prioritized over random number generation
> 
> I don't see the change being specific to real-time kernel, which the commit 
> message above imlies several times - is it intended?

I need to talk to the security people if disabling the true RNG drivers 
is acceptable. But you're right, if it is deemed acceptable, I can add a 
switch to append the pseudo RNG flag to the real-time kernel only. I'm 
just not sure I fully understand the consequences moving to a PRNG 
driver has for the security focused team

~Bryan

