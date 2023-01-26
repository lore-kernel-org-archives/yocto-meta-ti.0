Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535AFC61D97
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 22:40:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.88850.1674772855957877634
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 14:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rl9XxShY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30QMetn7119259
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 16:40:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674772855;
	bh=F1ejsBxXvq1A927sfSOthOY6pBkhMCG1jvC1wwxLbz8=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=rl9XxShYKy7mCiQF0O4V2zjRu9+jKhc44zMYI1Nlr3Bf/Kcuwat8BQ9k8KBB6fQw8
	 kd7fyLkFuMJF+sTYsTqxzlw8kdalKQ5+C+xefuv6MN+MmWkerpv2bhKTDHM8f2HRG5
	 VEFB348mZckF/3/GXoLVjYIDK3ErFdbhTlCgwlaI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30QMet8C010520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 16:40:55 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 26
 Jan 2023 16:40:55 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 26 Jan 2023 16:40:55 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30QMesED086697;
	Thu, 26 Jan 2023 16:40:54 -0600
Date: Thu, 26 Jan 2023 16:40:49 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [kirkstone PATCH 2/4] meta-ti-bsp: graphics: Resolve dependency
 chain
To: Andrew Davis <afd@ti.com>
CC: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <k-bhargav@ti.com>
Message-ID: <1074PR.VEHZYO68AVXH3@ti.com>
In-Reply-To: <17b223ed-820b-5391-eead-4c533a421c08@ti.com>
References: <20230126030834.3889448-1-rs@ti.com>
	<20230126030834.3889448-3-rs@ti.com>
	<d9a4cb78-2d78-1d33-d8d9-7ffeb2c8811f@ti.com> <WJY3PR.TPQTGC21E7EJ2@ti.com>
	<17b223ed-820b-5391-eead-4c533a421c08@ti.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Jan 2023 22:40:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15688

On Thu, Jan 26 2023 at 02:12:33 PM -0600, Andrew Davis <afd@ti.com> 
wrote:
> If the binaries depend on a lib then yocto will detect that and set 
> it as a runtime dependency
> for you. If not in the sysroot dir when we install the binaries then 
> yocto will do
> the opposite and complain that it cannot find some libraries that 
> binaries in the package
> link against. We solve both by using DEPENDS here.

Nothing should be building directly against these libs so the sysroot 
point is void. We should let yocto resolve the run-time dependencies 
anyway.



