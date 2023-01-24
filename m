Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F80C25B4E
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 17:22:21 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.21433.1674580931401869266
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Jan 2023 09:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=krO2TQug;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30OHM6gh104773;
	Tue, 24 Jan 2023 11:22:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674580926;
	bh=nGpE0tzGMW2yeJEAJHLg9svILwhgn4whoe19eSLtk5o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=krO2TQuggrtS8epmRGijCen5GmcvQeoqKtulW/mHoiXpo6BZIk2IHwnYXNyLBzQ3w
	 /3tZ0TJEI/yeZftPVySWYH3cj7eKphAN1iY9rcW1rP+hs0jdyJwEQaMoav/vk6kQm3
	 PAVf0pS3MufsyotRr6FoM8cC41AqN8lmox7XlnHM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30OHM6Wa047177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Jan 2023 11:22:06 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 24
 Jan 2023 11:22:06 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 24 Jan 2023 11:22:06 -0600
Received: from [10.250.32.60] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30OHM5Lw074303;
	Tue, 24 Jan 2023 11:22:05 -0600
Message-ID: <f92142fc-a2a4-221e-f05f-a07303e9fb59@ti.com>
Date: Tue, 24 Jan 2023 11:22:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][dunfell][PATCH v2 2/2] am62xx-evm: Add support for
 AM62xx HS-SE evm
Content-Language: en-US
To: <c-shilwant@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20230124051717.1201571-1-c-shilwant@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230124051717.1201571-1-c-shilwant@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Jan 2023 17:22:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15642

On 1/23/23 11:17 PM, Chirag Shilwant via lists.yoctoproject.org wrote:
> - Add ti-sci-firmware overrides.
> - Add support to sign ATF and OPTEE.

What about DM firmware.. (ti-rtos-firmware.bb)

Andrew

> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb                       | 3 ++-
>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++++
>   recipes-security/optee/optee-os_%.bbappend                   | 4 ++++
>   3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 0fb3a832..7896c366 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -37,7 +37,8 @@ SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
>   SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
>   SYSFW_PREFIX_j784s4-evm-k3r5 = "fs"
>   SYSFW_PREFIX_j784s4-hs-evm-k3r5 = "fs"
> -SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
> +SYSFW_PREFIX_am62xx-evm-k3r5-gp = "fs"
> +SYSFW_PREFIX_am62xx-evm-k3r5-hs-se = "fs"
>   SYSFW_PREFIX_am62xx-lp-evm-k3r5 = "fs"
>   SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se = "fs"
>   SYSFW_PREFIX_am62axx-evm-k3r5 = "fs"
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index a5eb9ff8..920cb737 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -31,6 +31,10 @@ do_compile_append_am64xx-evm() {
>   	tfa_sign_k3hs
>   }
>   
> +do_compile_append_am62xx-evm() {
> +        tfa_sign_k3hs
> +}
> +
>   do_compile_append_am62xx-lp-evm() {
>           tfa_sign_k3hs
>   }
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index 83eb9c6a..91abbcee 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -72,6 +72,10 @@ do_compile_append_am64xx-evm() {
>       optee_sign_k3hs
>   }
>   
> +do_compile_append_am62xx-evm() {
> +    optee_sign_k3hs
> +}
> +
>   do_compile_append_am62xx-lp-evm() {
>       optee_sign_k3hs
>   }
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15639): https://lists.yoctoproject.org/g/meta-ti/message/15639
> Mute This Topic: https://lists.yoctoproject.org/mt/96491909/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

