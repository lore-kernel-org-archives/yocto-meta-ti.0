Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC55C3ABAC
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 18:58:50 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.27209.1746212330055793482
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 May 2025 11:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PvKYeh4E;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542Iwmq3288660
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 13:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746212328;
	bh=VBjPkXhhFZh3BUYfZ+THtHNDG1PrgC7xaTu/E9NTruY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=PvKYeh4EOgWnDpL9GZ9bKrPAvdqShFv8E8bM6nryKnVvXFzTB96vkbYj2XdfdgiCF
	 /eTBKVMt2auReFSOOj0/9y5u7jY8pg7rB9kMU/C8attAJF5Vyw4vrdtNu4NL56W4/4
	 xdopj+aUD4hJImCh5VTB2Ccgp6GDG5KNxFvzTCVk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542IwmEB055753
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 13:58:48 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 13:58:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 13:58:48 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542Iwm2n070936;
	Fri, 2 May 2025 13:58:48 -0500
Message-ID: <ee96ee32-0356-40ad-88a9-420b94ec54e1@ti.com>
Date: Fri, 2 May 2025 13:58:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 2/3] ti-linux-fw: Set
 INHIBIT_DEFAULT_DEPS
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250501142623.351217-1-afd@ti.com>
 <20250501142623.351217-2-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250501142623.351217-2-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 May 2025 18:58:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18528



On 5/1/2025 9:26 AM, Andrew Davis wrote:
> Firmware here are not built, no need for C compiler nor std libs.
> Add INHIBIT_DEFAULT_DEPS=1 and remove the same from all recipes
> that include this file.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb           | 2 --
>   meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb         | 2 --
>   meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc    | 3 +++
>   meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 2 --

Andrew,

Can you send a v2 and rebase this series on scarthgap?  I backported 
your master patch from December that renamed and moved 
meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb to 
meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb.  So this no 
longer applies to scarthgap or master.




>   4 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> index 638138f4..d6dbd402 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
> @@ -7,8 +7,6 @@ COMPATIBLE_MACHINE = "k3"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> -INHIBIT_DEFAULT_DEPS = "1"
> -
>   inherit deploy
>   inherit update-alternatives
>   
> diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> index e4b6d1de..8037ac6c 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
> @@ -7,8 +7,6 @@ COMPATIBLE_MACHINE = "j721e|j7200|j784s4"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> -INHIBIT_DEFAULT_DEPS = "1"
> -
>   inherit update-alternatives
>   
>   require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 2aa07f71..0426e803 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -43,6 +43,9 @@ INHIBIT_SYSROOT_STRIP = "1"
>   # This is used to prevent the build system from splitting out the firmware debug info into a separate file
>   INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>   
> +# Firmware here are prebuilt with no external dependencies
> +INHIBIT_DEFAULT_DEPS = "1"
> +
>   # Disable arch checking as firmware is likely to be a different arch from the Yocto build
>   INSANE_SKIP:${PN} += "arch"
>   
> diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 00112017..15c48e6f 100644
> --- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -7,8 +7,6 @@ COMPATIBLE_MACHINE = "k3"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> -INHIBIT_DEFAULT_DEPS = "1"
> -
>   inherit update-alternatives
>   
>   PLAT_SFX = ""

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

