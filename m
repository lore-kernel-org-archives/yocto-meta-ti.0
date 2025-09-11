Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07133CA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 12:28:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.45528.1757593714761891067
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 05:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Fn/Cz2qP;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BCSYWe801378
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Sep 2025 07:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757593714;
	bh=IzXDY/U4mWJ4mPthRmeevSTtXxCUYO5SoMs/YBJCus4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Fn/Cz2qPlNBwCDEXLEHCMw7Bzkmdrop3+nL9DVZuDDlpf9/PG4CXbj3KyKFiOxtJe
	 6zBZyf48Lq9Zz5JwVEcNKcL0WdP3EUYPE85D9cAba4QVu+4KHSl+2eDhYDpjgO3X1V
	 BnvViJNgyY8FZGaDjLqqETcL8gJeGRkSpdYbvjko=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BCSYvD487980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Sep 2025 07:28:34 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 07:28:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 07:28:33 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BCSX2q1820682;
	Thu, 11 Sep 2025 07:28:33 -0500
Message-ID: <b470b481-adbf-41da-b22e-cc04fa616bc8@ti.com>
Date: Thu, 11 Sep 2025 07:28:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] meta-ti-bsp: recipes-security: optee: Update to 4.7.0
 tag
To: <s-joshi@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>
References: <20250911105736.450595-1-s-joshi@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250911105736.450595-1-s-joshi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Sep 2025 12:28:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18994


There need to need to be two versions of this patch series.  One for 
scarthgap and one for master.  Please do the work needed to make this 
change for both branches and submit a v2.

There is now an extra optee file (optee-ftpm) that is now being 
controlled on the master branch that needs to be updated as well.  The 
patch is on the master-wip and master-next branches waiting for CICD to 
promote them.

Also, please do not include the path down to the recipes in the subject. 
  This could have been:

optee: Update to 4.7.0 tag

We can look at the patch and see where the files live, we do not need 
them in the subject.


On 9/11/2025 5:57 AM, Suhaas Joshi via lists.yoctoproject.org wrote:
> Update optee_client, optee_examples, optee_os and optee_test to the
> newer 4.7.0 tag from the previous 4.6.0 one.
> 
> Further: meta-arm applies 0003-optee-enable-clang-support patch to
> optee_os. However, in a recent upstream commit [0], the line to which
> the patch applies was removed. Therefore the patch is no longer
> required. As a result, tell optee_os.bbappend file to remove it.
> 
> [0] https://github.com/OP-TEE/optee_os/commit/3d5c2dd8b59ae888434b3f86842828131f115d90
> 
> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> ---
>   .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++--
>   .../recipes-security/optee/optee-examples-ti-version.inc      | 4 ++--
>   .../recipes-security/optee/optee-os-tadevkit_%.bbappend       | 4 ++++
>   meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
>   meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend        | 4 ++++
>   meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
>   6 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index 86c92863..289ca5b5 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.6.0+git"
> -SRCREV = "02e7f9213b0d7db9c35ebf1e41e733fc9c5a3f75"
> +PV = "4.7.0+git"
> +SRCREV = "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> index 6c120be2..91dd5e60 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.6.0+git"
> -SRCREV = "5306d2c7c618bb4a91df17a2d5d79ae4701af4a3"
> +PV = "4.7.0+git"
> +SRCREV = "14321a0607db16099d158478b21a2b2e37b3a935"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> index 980f7a4b..407436a9 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> @@ -6,4 +6,8 @@ require ${OPTEE_TI_VERSION}
>   OPTEE_TI_OVERRIDES = ""
>   OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
>   
> +SRC_URI:remove = " \
> +    file://0003-optee-enable-clang-support.patch \
> +"
> +
>   require ${OPTEE_TI_OVERRIDES}
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> index d9705a0b..7b5b3912 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> @@ -1,5 +1,5 @@
> -PV = "4.6.0+git"
> -SRCREV = "71785645fa6ce42db40dbf5a54e0eaedc4f61591"
> +PV = "4.7.0+git"
> +SRCREV = "86846f4fdf14f25b50fd64a87888ca9fe85a9e2b"
>   
>   SRC_URI:remove = " \
>       file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> index 0cee127f..50f87199 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> @@ -6,4 +6,8 @@ require ${OPTEE_TI_VERSION}
>   OPTEE_TI_OVERRIDES = ""
>   OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
>   
> +SRC_URI:remove = " \
> +    file://0003-optee-enable-clang-support.patch \
> +"
> +
>   require ${OPTEE_TI_OVERRIDES}
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> index 35e780b3..d2593cb8 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> @@ -1,7 +1,7 @@
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
>   
> -PV = "4.6.0+git"
> -SRCREV = "a9e9495f4d57b97022008ad11198195e7e044c5d"
> +PV = "4.7.0+git"
> +SRCREV = "a15be9eca1b7e935917d834284726027dffc8cfb"
>   
>   SRC_URI:remove = " \
>       file://0001-xtest-stats-remove-unneeded-stat.h-include.patch \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18992): https://lists.yoctoproject.org/g/meta-ti/message/18992
> Mute This Topic: https://lists.yoctoproject.org/mt/115186606/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

