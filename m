Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C315C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 21:45:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.418.1674855897432474201
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 13:44:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tvCdiWNO;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30RLiueO069695
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 15:44:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674855896;
	bh=bg2l1sZhkWU/zfgI/QMovsqbh6XscRPuraf5bk/NO6o=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=tvCdiWNOqj/aAEv/TJjb1zK9gOS2pqILUgU4UPOKdCJivPbAumKwo8RBy+/mkWn/F
	 wUhHZLTeg+ay6T2Q/HwHpnoL9tDRuu1EQE8DV8pHulGrLFj7sALUzFU5R/aF04l8dT
	 zeWWRGZES6MzChuQvfcPToiJ0V1mkr76ncFMcyVY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30RLiuX1002275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 15:44:56 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 27
 Jan 2023 15:44:56 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 27 Jan 2023 15:44:56 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30RLitDt007259;
	Fri, 27 Jan 2023 15:44:55 -0600
Date: Fri, 27 Jan 2023 15:44:50 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [PATCH] meta-ti-extras: ti-unpack: Drop update_data call
To: Ryan Eatmon <reatmon@ti.com>
CC: <denys@ti.com>, <afd@ti.com>, <meta-ti@lists.yoctoproject.org>
Message-ID: <Q2Z5PR.AUJI9LV2CCA42@ti.com>
In-Reply-To: <b0f1c107-cc8f-9ec1-d6fa-6b8dda3402a3@ti.com>
References: <20230127180217.1760815-1-rs@ti.com>
	<b0f1c107-cc8f-9ec1-d6fa-6b8dda3402a3@ti.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 21:45:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15693

On Fri, Jan 27 2023 at 12:12:55 PM -0600, Ryan Eatmon <reatmon@ti.com> 
wrote:
> This change was already made on the master branch back in November to 
> address this issue.  Are you seeing this on other branches?  I do not 
> believe that this patch needs to be applied to dunfell or kirkstone 
> unless you are seeing an issue.

I saw this issue under kirkstone with the latest version of my GPU 
patch for meta-ti and meta-arago.



