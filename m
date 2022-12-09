Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8D2C4167B
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 22:18:38 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1215.1670624309425767843
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 14:18:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ukRdJ1ow;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B9MISNt028263
	for <meta-ti@lists.yoctoproject.org>; Fri, 9 Dec 2022 16:18:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670624308;
	bh=KF6xDWiJA5KDl91X9XizQmkxem3D7ajPvacdfLRJpzM=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=ukRdJ1owP2Q7y8oNJGQgaeO6L6AD1HNQB72zRwn2mS9DoLGtNqrtk/8y32E4UPNGa
	 XiQz94alV2Cu+OCQafcRLOo5dQUHcaI3XB+13dpcPBlyNqWJw6Sbi3j6emfNNgrnc9
	 s3KP5W2v2kjxgXRR3e2I0Kj5lUUtG04KiKBfnpdU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B9MISxk118542
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 9 Dec 2022 16:18:28 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 9
 Dec 2022 16:18:28 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 9 Dec 2022 16:18:28 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B9MISqi089611;
	Fri, 9 Dec 2022 16:18:28 -0600
Date: Fri, 9 Dec 2022 16:18:22 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [meta-ti] [master][PATCH v2] meta-ti-bsp: Graphics recipe
 overhaul
To: Andrew Davis <afd@ti.com>
CC: <reatmon@ti.com>, <denys@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Message-ID: <MY9NMR.KA5B9Y124SPL2@ti.com>
In-Reply-To: <18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com>
References: <20221206174553.2391187-1-rs@ti.com>
	<18ac8055-de7f-77fe-1b1b-36c5de4ef8d2@ti.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Dec 2022 22:18:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15439

On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis <afd@ti.com> 
wrote:
> Since the UM driver now RDEPENDS on the KM, could we also drop this
> last line everywhere?

Nope, we still need the one preferred provider line to indicate that 
rogue graphics are present. Now this could be replaced by a 
rogue-graphics machine feature instead if that's preferable, but 
something will need to signal the mesa switch.

On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis <afd@ti.com> 
wrote:
> Bash? Are we sure we need that?

Yes. The System V init script still needs it. Now could we look at 
removing that init script? Sure, so long as the device probe still 
works. What is actually taking care of that right now? It's not udev is 
it?

On Wed, Dec 7 2022 at 12:48:00 PM -0600, Andrew Davis <afd@ti.com> 
wrote:
> "ldflags already-stripped" should be the only skips we still need.

Dev-so is required because of some of the symbolic links that are 
shipped. I'm fine dropping arch unless that breaks something.



