Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ED0C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 03:12:32 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5604.1651115544225483370
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 20:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tgCZl6iQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23S3CMVD090535;
	Wed, 27 Apr 2022 22:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651115542;
	bh=OFY3EV6EbsQnSrcR90TC+Mr93smHwtDSGFtyr3lC6Bw=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=tgCZl6iQSQG6H7QLoavUFHNc/jmXGcKJ6bUtbHajB0xdDs98DePy9MMcTPc40rLUu
	 bW3ADe07YE2SKpp2A95F368xAQgpWHJq+4pjKISWwR48HkdCPzww2yG6JxgGNZA6ta
	 WyXN60yaAOMR/ohOS6vBH+Sk5sP8HB7FXhDPIifY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23S3CLuX091752
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Apr 2022 22:12:22 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 22:12:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 22:12:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23S3CL7R069513;
	Wed, 27 Apr 2022 22:12:21 -0500
Date: Wed, 27 Apr 2022 22:12:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <devarsht@ti.com>, <meta-ti@lists.yoctoproject.org>,
 <praneeth@ti.com>,
        <nikhil.nd@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>, <a-m1@ti.com>
Subject: Re: [meta-ti] [PATCH] recipes-kernel: setup-defconfig: Use SRCPV to
 update KERNEL_LOCALVERSION
Message-ID: <20220428031221.w4ow42zaxpt5iun7@uneasily>
References: <16E9F09DC8AE3E46.18966@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <16E9F09DC8AE3E46.18966@lists.yoctoproject.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Apr 2022 03:12:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14629

On 22:08-20220427, Nishanth Menon via lists.yoctoproject.org wrote:
> Due to recent security update[1] in git, a subprocess will be unable
> to not able to run git rev-parse to fetch revision.
> 

That went all haywire... will post a V2.. Sorry for the noise.

I also realized i forgot (yet again)  to indicate via $subject which
branch is the patch for.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

