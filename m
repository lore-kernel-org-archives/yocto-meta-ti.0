Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06144C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 16:33:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.60.1665592384938245295
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 09:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dS3fY/MW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29CGX1uE008235;
	Wed, 12 Oct 2022 11:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665592381;
	bh=stRO3DMjObUEVifQXy82nixuzFNCiYpGNhOQqN+I66U=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=dS3fY/MWwd4Vxb13W7gDudriTnTuS3Z4XP2wU4Fte/dCJ0/bVlPR79o7sDpFAEvbN
	 1KfA8HXeIEpu52TzaAUXm1VTyBVrtGgepOYKlqIJAsVJj7M/YKYQfTvMi4CfoA9G84
	 ZM/whvMWk7EoWsIvFXhFMDgrLoG1FvQ+A8xWXaLE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29CGX1hj023083
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Oct 2022 11:33:01 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 12
 Oct 2022 11:33:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 12 Oct 2022 11:33:01 -0500
Received: from res.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29CGX0tN089852;
	Wed, 12 Oct 2022 11:33:00 -0500
Date: Wed, 12 Oct 2022 11:32:55 -0500
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [dunfell][PATCH] ti-img-rogue-*: Bump
 the graphics recipes
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Message-ID: <VAFNJR.UICQIQVLHTVW2@ti.com>
In-Reply-To: <20221011231649.GE22689@denix.org>
References: <20221006234108.1696865-1-rs@ti.com>
	<20221011014403.GG30861@denix.org> <7YXLJR.BJWKMOUWUVN01@ti.com>
	<20221011231649.GE22689@denix.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Oct 2022 16:33:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15158

On Tue, Oct 11 2022 at 07:16:49 PM -0400, Denys Dmytriyenko 
<denis@denix.org> wrote:
> Should these be mentioned in the git commit message?

Depends on what we're actually trying to track in these commit 
messages. As far as I'm concerned these commit messages should only 
track changes to the recipes and reasoning, but if you believe they 
should also track upstream change notes then I will modify it 
accordingly.



