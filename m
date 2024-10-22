Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2607CDD0F8
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 21:20:12 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5365.1729632006940298933
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 14:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=et7vYnfA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49MLK53h043864;
	Tue, 22 Oct 2024 16:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729632005;
	bh=DIUIfOawfnA9bkrcHpv8H8+KUrRrpEJSm64erW8dfuc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=et7vYnfABMbDDESQQKMg0hRyXfbBae+wnGDMlsP3gzrKA3Ok7zs2R5v/cCK9NzqWz
	 42mI+AKFOuwLJnsQMmQ7FPlsdTgeBISnQyRPYSMyELA3RoFrHzo4vcRup8Q2VkNF4b
	 AWZEhMJe2Q4gDRh+VPI4ptUeCtSz7pVxYWVoHNNs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49MLK5Qq123159
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Oct 2024 16:20:05 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Oct 2024 16:20:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Oct 2024 16:20:05 -0500
Received: from [10.249.35.83] ([10.249.35.83])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49MLK5DM013820;
	Tue, 22 Oct 2024 16:20:05 -0500
Message-ID: <394e2f4f-463b-4d3b-a11c-53de9d9c60ae@ti.com>
Date: Tue, 22 Oct 2024 16:20:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] optee: Update to v4.4.0
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <1800E02EA4226EC2.11329@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1800E02EA4226EC2.11329@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Oct 2024 21:20:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18027


This series will not apply to scarthgap.  I'll have to send out another 
series tomorrow.


On 10/22/2024 3:25 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> Update all of the components to the upstream 4.4.0 version.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Remove some patches from the upstram recipe that are no longer
>      needed for 4.4.0.
> 
>   .../optee/optee-client-ti-version.inc                 |  4 ++--
>   .../optee/optee-examples-ti-version.inc               |  2 +-
>   .../recipes-security/optee/optee-os-ti-version.inc    | 11 +++++++++--
>   .../recipes-security/optee/optee-test-ti-version.inc  |  4 ++--
>   4 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index 5f06fa03..2c8977dd 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.3.0+git"
> -SRCREV = "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"
> +PV = "4.4.0+git"
> +SRCREV = "d221676a58b305bddbf97db00395205b3038de8e"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> index 4d9897a7..8c21bc75 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.3.0+git"
> +PV = "4.4.0+git"
>   SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> index a79e5702..375c1a7e 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> @@ -1,2 +1,9 @@
> -PV = "4.3.0+git"
> -SRCREV = "1c0d52ace3c237ca6276cafb5c73f699a75c1d40"
> +PV = "4.4.0+git"
> +SRCREV = "8f645256efc0dc66bd5c118778b0b50c44469ae1"
> +
> +SRC_URI:remove = " \
> +    file://0001-mk-compile.mk-remove-absolute-build-time-paths.patch \
> +    file://0001-compile.mk-use-CFLAGS-from-environment.patch \
> +    file://0002-link.mk-use-CFLAGS-with-version.o.patch \
> +    file://0003-link.mk-generate-version.o-in-link-out-dir.patch \
> +"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> index 0b902d69..3c1fedc9 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.3.0+git"
> -SRCREV = "9d4c4fb9638fb533211037016b6da12fbbcc4bb6"
> +PV = "4.4.0+git"
> +SRCREV = "695231ef8987866663a9ed5afd8f77d1bae3dc08"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18026): https://lists.yoctoproject.org/g/meta-ti/message/18026
> Mute This Topic: https://lists.yoctoproject.org/mt/109159365/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

