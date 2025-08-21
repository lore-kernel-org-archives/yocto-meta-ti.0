Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E303CCA0EFC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:25:34 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.893.1755793528865901101
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 09:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zTpdTF2L;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LGPSCY526982
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 11:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755793528;
	bh=qOE7ozTPOaTNu6Im822BW28SdyZAoqIwC5MUgs6JkUY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=zTpdTF2L/9Y142qcDiGLS7ODk1MUZGgkwGZFPoU6B925v7lldyHPQdWqlmLT5cC76
	 cH8mX6Xw4n9SYWgC+JC3E67xI+bSqxMVzscW4PenTiAtmH7wThHhliOh4OtzDCPFhh
	 ndo2A2cF28qJFz4UyNgrkRc4dpyravXMM1RYyZFg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LGPSIs2651777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 11:25:28 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 11:25:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 11:25:27 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LGPRAb2146787;
	Thu, 21 Aug 2025 11:25:27 -0500
Message-ID: <0a802807-777d-4a0b-bdd9-6c1bfff166ab@ti.com>
Date: Thu, 21 Aug 2025 11:25:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v2] ti-bsp: recipes-multimedia: Add udev
 rules for VPU and JPEG encoder symlinks
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>, <detheridge@ti.com>,
        <rs@ti.com>, <b-brnich@ti.com>
References: <20250821160944.845890-1-t-lannynd@ti.com>
 <20250821161511.2202128-1-prc@list.ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250821161511.2202128-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 16:25:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18955



On 8/21/2025 11:15 AM, PRC Automation wrote:
> meta-ti / na / 20250821160944.845890-1-t-lannynd
> 
> PRC Results: FAIL
> 
> =========================================================
>    check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> All patches passed
> 
> 
> 
> =========================================================
>    apply-yocto-patch: PASS
> =========================================================
> master
> =====================
> Summary:
> - Patch Series: [meta-ti][master][PATCH v2] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
> - Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
> - Date: Date: Thu, 21 Aug 2025 11:09:44 -0500
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: d61d95cd5fb1eaf5701735e40824b9fa77fccc2b
> 
> Applied to:
> - Repository: lcpd-prc-meta-ti
> - Base Branch: master-wip
> - Commit Author: Bryan Brattlof <bb@ti.com>
> - Commit Subject: conf: machine: add optee-os into am62lxx-evm builds
> - Commit SHA: 5f428c58a52b4c08139809327ba223212f986a86
> 
> Patches
> ----------------------------------------
> All patches applied
> 
> 
> 
> =========================================================
>    check-yocto-repo: FAIL
> =========================================================
> master
> =====================
> FAIL
>      ERROR: You must have a SUMMARY = "...". (SUMMARY-1)
>          meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
>      
>      
>      Code Summary
>      ============
>      
>      SUMMARY-1
>      -------------------------------------------
>        All recipes require a SUMMARY.
> 


Don't worry about this.  This is due to a different patch.  I need to 
see why this slipped through that patch check, and why I accepted it.




-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

