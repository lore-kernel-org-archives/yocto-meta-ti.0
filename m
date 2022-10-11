Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA89C4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 21:20:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.13203.1665523240960501019
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 14:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oXUpf2YJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29BLKaDf065750;
	Tue, 11 Oct 2022 16:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665523236;
	bh=IbwySY6sd728MbyWGUYrp/OOLhzoHSU5Y4zdU4YLWfc=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=oXUpf2YJOUsdwV+6PoMmLUi6s6vQgo1/HCNdRHEQ/sxy/siWRPZ9DgIQJ0rBpKxjA
	 G/5mZwMoC4XQrpIVjlADVGiIu4JuJG0hyIrsHihl1NGHb2CF+qgrWgNKwdSgpJlNJz
	 q/yPAWN7X9d8DabVK5oHsfqs2P+e97dN9d7zZRFs=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29BLKaL2025476
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Oct 2022 16:20:36 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 16:20:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 16:20:36 -0500
Received: from res.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29BLKanp048883;
	Tue, 11 Oct 2022 16:20:36 -0500
Date: Tue, 11 Oct 2022 16:20:31 -0500
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [dunfell][PATCH] ti-img-rogue-*: Bump
 the graphics recipes
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Message-ID: <7YXLJR.BJWKMOUWUVN01@ti.com>
In-Reply-To: <20221011014403.GG30861@denix.org>
References: <20221006234108.1696865-1-rs@ti.com>
	<20221011014403.GG30861@denix.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Oct 2022 21:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15146

On Mon, Oct 10 2022 at 09:44:03 PM -0400, Denys Dmytriyenko 
<denis@denix.org> wrote:
> Any useful changelog between the 2 SRCREVs, besides removal of BVNC?

Yeah, actually. Two main things. The default precision for GL 
fragmentation shaders was bumped up, which helps with some visual bugs 
in applications like glmark2. In addition to this, a firmware patch was 
added that should help some of the hardware recoveries clients were 
experiencing on am62.

This is roughly the latest commit message for the selected UM version.

KM was really only a Makefile cleanup because I was tired of trying to 
remember what platform had what BVNC and there were a few legacy 
variables being set that had no effect.



