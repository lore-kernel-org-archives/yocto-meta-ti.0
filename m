Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C66BCA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 14:31:22 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.11162.1755786678692978981
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 07:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hmjP1HjO;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LEVItQ030620
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 09:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755786678;
	bh=U2t8D9PNz/bLMfMFUZtDqYvijjft3KXjrN4eiF83BYk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hmjP1HjOsEZcBcEBCC3q27semXYytJhMquEQjnZl9yYaoy75G5SpVBgmbTuUL51TE
	 xT1d4BRWJJpM1MnoYJk21kkwk6HJ43RenNrc2jacnV2kVQghS+osbLiWz4gLui9PVo
	 XJAzeizSfTACanSxHm6n2aqzSggd23w25eWHaaAg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LEVIjr2886328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 09:31:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 09:31:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 09:31:17 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LEVHMQ2303293;
	Thu, 21 Aug 2025 09:31:17 -0500
Message-ID: <b847ff8d-e2ad-4695-a164-d6c2b0a4f29a@ti.com>
Date: Thu, 21 Aug 2025 09:31:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-bsp: recipes-multimedia:
 Add udev rules for VPU and JPEG encoder symlinks
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <afd@ti.com>, <detheridge@ti.com>,
        <rs@ti.com>, <b-brnich@ti.com>
References: <20250821032055.388954-1-t-lannynd@ti.com>
 <20250821142514.384847-1-prc@list.ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250821142514.384847-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Aug 2025 14:31:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18950


Does not apply to master.  You will need two patches.



On 8/21/2025 9:25 AM, PRC Automation via lists.yoctoproject.org wrote:
> meta-ti / na / 20250821032055.388954-1-t-lannynd
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
>    apply-yocto-patch: FAIL
> =========================================================
> master
> =====================
> Summary:
> - Patch Series: [meta-ti][master/scarthgap][PATCH] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
> - Submitter: From: "Thorsten Lannynd" <t-lannynd@ti.com>
> - Date: Date: Wed, 20 Aug 2025 22:20:55 -0500
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: 3e0bb1caa6ceac39d7a010cf216f72ca24e9a4dd
> 
> Applied to:
> - Repository: lcpd-prc-meta-ti
> - Base Branch: master
> - Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
> - Commit Subject: CI/CD Auto-Merger: cicd.master.202508210100
> - Commit SHA: cd2a61edf64076dd8f2e6887e3dd4f6ad66f9fa9
> 
> Patches
> ----------------------------------------
> FAIL - [meta-ti][master/scarthgap][PATCH] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
>      error: patch failed: meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb:21
>      error: meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb: patch does not apply
>      Applying: ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
>      Patch failed at 0001 ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
> 
> scarthgap
> =====================
> Summary:
> - Patch Series: [meta-ti][master/scarthgap][PATCH] ti-bsp: recipes-multimedia: Add udev rules for VPU and JPEG encoder symlinks
> - Submitter: From: "Thorsten Lannynd" <t-lannynd@ti.com>
> - Date: Date: Wed, 20 Aug 2025 22:20:55 -0500
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: 3e0bb1caa6ceac39d7a010cf216f72ca24e9a4dd
> 
> Applied to:
> - Repository: lcpd-prc-meta-ti
> - Base Branch: scarthgap-wip
> - Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
> - Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202508201111
> - Commit SHA: 76f78bab9b6cd7d28bf28411783acfce0d746aca
> 
> Patches
> ----------------------------------------
> All patches applied
> 
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18949): https://lists.yoctoproject.org/g/meta-ti/message/18949
> Mute This Topic: https://lists.yoctoproject.org/mt/114817859/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

