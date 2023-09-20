Return-Path: <anandb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF6ACE79B5
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:04:26 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.34191.1695204256716937358
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 03:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EKvo6NP2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: anandb@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38KA4DLB000933;
	Wed, 20 Sep 2023 05:04:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695204253;
	bh=j8j5ZZtGAAZ0KAU+JiU3XqGMd7r6wir8NUdGLSX8Jwc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=EKvo6NP2Hrvg7ogsPzX+Jev0g+1jLKdP5NvWxID8fCz73HqaLRBHZml57UXgFB5yV
	 CemnRfyOkaFFV2lPAxO7f22/YRS9zL6LYBGcXVarRyCIzQL7tXLT1PQsnD9wxR/Tyn
	 iTJ9U6kJnIlnqLsNOAVkA1u23hZkglRO9HTEZMDg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38KA4Dmc090787
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Sep 2023 05:04:13 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Sep 2023 05:04:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Sep 2023 05:04:13 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38KA4Co3094197;
	Wed, 20 Sep 2023 05:04:13 -0500
Date: Wed, 20 Sep 2023 15:34:12 +0530
From: Anand Balagopalakrishnan <anandb@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "Bajjuri, Praneeth" <praneeth@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>,
        "Eatmon, Ryan" <reatmon@ti.com>,
        "Adivi,
 Sai Sree Kartheek" <s-adivi@ti.com>,
        "Gupta, Gyan" <g-gupta@ti.com>,
        "Khasim,
 Syed Mohammed" <khasim@ti.com>,
        "Pothukuchi, Vijay" <vijayp@ti.com>
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone]
 linux-ti-staging: add config preempt for am335x and am437x
Message-ID: <20230920100412.7xleruzvfsaww4en@uda0876520>
References: <20230914171026.3014887-1-anandb@ti.com>
 <1784DB091C7C28F5.22721@lists.yoctoproject.org>
 <20230914195514.GO3359@denix.org>
 <2cf51220b2cd4976bb8531d3cceced5a@ti.com>
 <b0597336-8bd5-027e-4e96-c86463189e96@ti.com>
 <cfe86ebae4374412817e3c4c2c4fc423@ti.com>
 <20230919181341.GC7013@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919181341.GC7013@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Sep 2023 10:04:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16996

On 14:13-20230919, Denys Dmytriyenko wrote:
> Anand,
> 
> Please check corresponding -next branches (master/kirkstone) - CICD automerges 
> and SRCREV bumps are queued up there and I'm guessing they are going through 
> the build and boot-test cycles now. If everything's green, they should be 
> merged back to main kirkstone and master branches automatically. Ryan can 
> definitely explain the entire CICD process in more detail.
> 
Denys,
Thanks. I am following up with Ryan and other SDK folks on enabling the
kernel patch on kirkstone branch.

Regards,
Anand

