Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4DCECAAD8
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 21:09:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.42684.1661548190087866036
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 14:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hUodnaco;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27QL9nah052107;
	Fri, 26 Aug 2022 16:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661548189;
	bh=2NLpjlBYpJPAm6Fhyzqqssxb/h0PZLTdKX9GhJlOWBw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=hUodnaco1UUWNdRqsMpOPxC26kUi/XUaXIJ+8R0hKDlTuIO03LvQVZaQZRxR28Oqy
	 4GvDf41nN47tHreamz9Q4G3BNBbfjm/VDBefFgHjpnZPYc5a5thdK0uTROG64cTwFG
	 QZCCd5VtoP6fJ25pNA0oH1Z8XbcPj7LArd/pxWOc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27QL9nck021775
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Aug 2022 16:09:49 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 26
 Aug 2022 16:09:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 26 Aug 2022 16:09:49 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27QL9m8u127641;
	Fri, 26 Aug 2022 16:09:48 -0500
Message-ID: <7b4fa969-0df3-f9b6-3be2-04317d16e3c6@ti.com>
Date: Fri, 26 Aug 2022 16:09:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [meta-ti][dunfell][PATCH 0/4] Update to
Content-Language: en-US
To: LCPD Automation Script <lcpdbld@list.ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <1661548051-147832-1-git-send-email-lcpdbld@list.ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1661548051-147832-1-git-send-email-lcpdbld@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Aug 2022 21:09:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14973


I see the bug in the cover letter subject.  The CICD tag is missing.  I 
have fixed it in the script, no need to point it out again.


On 8/26/2022 16:07, LCPD Automation Script wrote:
> Update linux-ti-staging, linux-ti-staging-rt, ti-linux-fw and u-boot-ti-staging to cicd.2022.08.26.12:21:27 tag
> 
> LCPD Automation Script (4):
>    ti-linux-fw: CI/CD Auto-Merger: cicd.2022.08.26.12:21:27
>    u-boot-ti-staging: CI/CD Auto-Merger: cicd.2022.08.26.12:21:27
>    linux-ti-staging-rt: CI/CD Auto-Merger: cicd.2022.08.26.12:21:27
>    linux-ti-staging: CI/CD Auto-Merger: cicd.2022.08.26.12:21:27
> 
>   recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
>   recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 2 +-
>   recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
>   recipes-kernel/linux/linux-ti-staging_5.10.bb    | 4 ++--
>   4 files changed, 7 insertions(+), 7 deletions(-)
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

