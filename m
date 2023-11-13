Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE90C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 23:59:37 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1898.1699919971721357143
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 15:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nVfEnYpB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ADNxBbV064260;
	Mon, 13 Nov 2023 17:59:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699919951;
	bh=/beb3vg4z28WVqk8pbkhrzk5kqQflnIpv7fXsyqP7Zg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nVfEnYpB9n7iEwISvrk59U6KmYZIbFAQ9nwmjqQUoqSlr6ToNotZxVNo5oY+otS8w
	 RHNcVr98bf7/5kALcUuPO7HH4vq/N0SW5KukCq3/jEpBdDoQLyUuNxES8l9h+H2BoA
	 r2gzqfCB/FJlc4cgP2nNMudQ0heNMsv36gBmQDvo=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ADNxBw3092062
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Nov 2023 17:59:11 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Nov 2023 17:59:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Nov 2023 17:59:11 -0600
Received: from [10.247.22.64] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ADNxBLL014955;
	Mon, 13 Nov 2023 17:59:11 -0600
Message-ID: <7695386c-11e6-463d-8f99-26b660e0cf50@ti.com>
Date: Mon, 13 Nov 2023 17:59:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] optee-os: Enable OP-TEE TRNG in AM62X and AM62PX
Content-Language: en-US
To: Kamlesh Gurudasani <kamlesh@ti.com>, <vigneshr@ti.com>, <afd@ti.com>,
        <m-chawdhry@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <vibhore@ti.com>, <vishalm@ti.com>
References: <20231108-wip-enable-trng-v4-1-69499e0cd53a@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20231108-wip-enable-trng-v4-1-69499e0cd53a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Nov 2023 23:59:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17295



On 11/8/2023 9:17 AM, Kamlesh Gurudasani wrote:
> Enable TRNG in AM62X and AM62PX, as bugs related to TRNG has been fixed now.
> 
> TF-A fix:
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=d7a7135d32a8c7da004c0c19b75bd4e2813f9759
> 
> OP-TEE fix:
> https://github.com/OP-TEE/optee_os/commit/e313f4765fd0478bb66985827441411793433773

Kamlesh,

AM62Px boot failed (data abort) with this change.

Can you verify and submit along with what else is missing.

Error snip:
E/TC:0 0 Core data-abort at address 0x9b510010
E/TC:0 0  esr 0x96000210  ttbr0 0x9e8a0000   ttbr1 0x00000000   cidr 0x0
E/TC:0 0  cpu #0          cpsr 0x800003c4
E/TC:0 0  x0  000000009b510010 x1  0000000000000001
E/TC:0 0  x2  000000009b510000 x3  0000000000000000
E/TC:0 0  x4  000000009e874000 x5  0000000000ffffff
E/TC:0 0  x6  0000000000000002 x7  000000000000fd20
E/TC:0 0  x8  000000009e890f80 x9  000000009e881000
E/TC:0 0  x10 000000000000000a x11 0000000000000002
E/TC:0 0  x12 0000000000000042 x13 0000000000000000
E/TC:0 0  x14 0000000000000000 x15 0000000000000000
E/TC:0 0  x16 000000009e83b8cc x17 0000000000000000
E/TC:0 0  x18 0000000000000000 x19 000000009e8a83d0
E/TC:0 0  x20 000000009e8a83d8 x21 0000000000000007
E/TC:0 0  x22 000000009e880000 x23 000000009e880fa8
E/TC:0 0  x24 0000000100000000 x25 0000000000000000
E/TC:0 0  x26 0000000000000000 x27 0000000000000000
E/TC:0 0  x28 0000000000000000 x29 000000009e8a8350
E/TC:0 0  x30 000000009e816fbc elr 000000009e816fdc
E/TC:0 0  sp_el0 000000009e8a8350
E/TC:0 0



> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
> Changes in V4:
> -rebase on kirkstone-wip
> 
> Changes in V3:
> -updated commit title and message
> 
> Changes in V2:
> -updated commit message
> -included changes for AM62p
> ---
>   meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> index b1846cad..a3dd7239 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
> @@ -3,8 +3,8 @@ inherit ti-secdev
>   
>   EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   
> -EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> -EXTRA_OEMAKE:append:am62pxx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62xx = " CFG_TEE_CORE_LOG_LEVEL=1"
> +EXTRA_OEMAKE:append:am62pxx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   EXTRA_OEMAKE:append:am62axx = " CFG_TEE_CORE_LOG_LEVEL=1"
>   
>   do_compile:append:k3() {
> 
> ---
> base-commit: 578823721ebf23485e7cfaaebc6146145996faa2
> change-id: 20231108-wip-enable-trng-e93bf6831e47
> 
> Best regards,

