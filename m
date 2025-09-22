Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFD3CA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 14:49:40 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.53965.1758552573114923780
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 07:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vGyhZ40G;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MEnWfN804886;
	Mon, 22 Sep 2025 09:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758552572;
	bh=fBpKx5q1rcLCP7JvluTeLEDbx6rypg4XqbVK0RT6EPM=;
	h=Date:Subject:CC:References:From:In-Reply-To;
	b=vGyhZ40GkQYckf+Dcln07dRsVxyzKL7hOuFGgcGwhQ02LrOnMQ8X6gzQb6j5kINqH
	 847B96CBLl95tfmDEpsNHF9E27JMWfUcOeFBUEXUF8f5YTOt8/4NMHhxNzX24chjRG
	 pe73okUS5wA/ljVkBXveu+Hw4ln4hvhWI8bOkNuw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MEnWBJ958370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 09:49:32 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 09:49:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 09:49:31 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MEnVE72688356;
	Mon, 22 Sep 2025 09:49:31 -0500
Message-ID: <7d47894a-43ca-4209-9e20-a7d918653a99@ti.com>
Date: Mon, 22 Sep 2025 09:49:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] u-boot: Moved to named git repo
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250922144016.4131-1-reatmon@ti.com>
 <20250922144514.727160-1-prc@list.ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250922144514.727160-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Sep 2025 14:49:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19055


On 9/22/2025 9:45 AM, PRC Automation wrote:
> meta-ti / na / 20250922144016.4131-1-reatmon
> 
> PRC Results: FAIL
> 
> =========================================================
>    check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> WARN - [meta-ti][master][PATCH] u-boot: Moved to named git repo
>      WARN: Commit message does not include file/recipe name: u-boot: Moved to named git repo. (COMMIT-MESSAGE-2)
>          patch
>      
>      WARN: Commit message should not include directory path to recipe: u-boot: Moved to named git repo.
>                u-boot: (COMMIT-MESSAGE-3)
>          patch
> 
> 
> 
> =========================================================
>    apply-yocto-patch: FAIL
> =========================================================
> master
> =====================
> Summary:
> - Patch Series: [meta-ti][master][PATCH] u-boot: Moved to named git repo
> - Submitter: From: Ryan Eatmon <reatmon@ti.com>
> - Date: Date: Mon, 22 Sep 2025 09:40:16 -0500
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: 5b9d50c689045d1561478d31b261927aa8e36132
> 
> Applied to:
> - Repository: lcpd-prc-meta-ti
> - Base Branch: master
> - Commit Author: Ryan Eatmon <reatmon@ti.com>
> - Commit Subject: mesa-pvr: add PROVIDES for Vulkan and OpenCL ICDs
> - Commit SHA: 1d5ec7bb9e0da9c5715839192d73fedcbd706bf4
> 
> Patches
> ----------------------------------------
> FAIL - [meta-ti][master][PATCH] u-boot: Moved to named git repo
>      error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc:5
>      error: meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc: patch does not apply
>      Applying: u-boot: Moved to named git repo
>      Patch failed at 0001 u-boot: Moved to named git repo
> 

This (and the scarthgap version) requires the previous patch.  I should 
have sent this as a series.  My bad.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


