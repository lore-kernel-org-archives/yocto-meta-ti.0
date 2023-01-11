Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DE5C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 23:35:13 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.40938.1673480107964366884
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 15:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=R7fAyxWs;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30BNZ2Tn050245;
	Wed, 11 Jan 2023 17:35:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673480102;
	bh=GLf0QeVukBqDJZPP+V88X2ORO5xEVJ0FZSWumJEM0go=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=R7fAyxWsstSY/spDDycusnF4CUJjkkF6vF86cZriDazRWNhQmYQsSzBq6mxiD4zPC
	 S8aluH2NDLxAFevhg5OHzCY8An5ohYScKXPttsv/gxCTy2smajPcp54YTE9TnEs0hH
	 agibgges7yaTRiq1D75UbnQuZ8xcL2ogZQ16+e+U=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30BNZ2Qh088995
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Jan 2023 17:35:02 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 11
 Jan 2023 17:35:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 11 Jan 2023 17:35:02 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30BNZ2p6032437;
	Wed, 11 Jan 2023 17:35:02 -0600
Date: Wed, 11 Jan 2023 17:34:56 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [dunfell][PATCH v2] ti-img-rogue-driver:
 AM62 Active power management
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
Message-ID: <8IHCOR.GF30PD08UQID2@ti.com>
In-Reply-To: <20230111223349.GV22689@denix.org>
References: <20230111221434.2399898-1-rs@ti.com>
	<20230111223349.GV22689@denix.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Jan 2023 23:35:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15552

On Wed, Jan 11 2023 at 05:33:49 PM -0500, Denys Dmytriyenko 
<denis@denix.org> wrote:
> On Wed, Jan 11, 2023 at 04:14:34PM -0600, Randolph Sapp via 
> lists.yoctoproject.org wrote:
>>  Bump source revision. Changelog from source:
>>    - Cleanup the device initialization routine for all platforms
>>    - Add a power safeguard for multicore initialization
>>    - Enable active power management for AM62 devices
>> 
>>  v2: This revision actually uses the correct commit hash. Not sure 
>> where
>>  I got the old one from.
> 
> Thanks, but patch revision changes are usually listed after the --- 
> cut line
> below to not get into the commit log history.
> 
> 
>>  Signed-off-by: Randolph Sapp <rs@ti.com>
>>  ---
> 
> Here.

Ah, thanks. I'll keep that in mind. Do you want me to resubmit this 
patch?



