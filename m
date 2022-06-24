Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1713C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 11:13:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.6393.1656069201455568636
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Jun 2022 04:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=G+Xmln8S;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-choudhary@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25OBDK1X035167;
	Fri, 24 Jun 2022 06:13:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656069200;
	bh=mrSTZXUig4A3yX1rBeHPjchc6bawwQe+lqZAoApMKG4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=G+Xmln8S6Afd/Q7ImQM5eQD6Fs7+YVdvSc8ZNGWnlU5LCaSjPEVyC4Bp0xfr3z9GX
	 td00RmF0muALm5wlk6PO5YkKjcwFe28Cyzb4fa0Yc4V9Zzw8L5uPLQogBGYwgkZSFQ
	 C0lQ4ktFNEiX1PzyxBhFDMhPwdsAueRl9HF3BxSY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25OBDK6b118263
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jun 2022 06:13:20 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 24
 Jun 2022 06:13:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 24 Jun 2022 06:13:19 -0500
Received: from [172.24.147.118] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25OBDHCU108962;
	Fri, 24 Jun 2022 06:13:18 -0500
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: wic: Fix j721s2-hs-evm
 image boot partition
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220623181047.28818-1-reatmon@ti.com>
From: Jayesh Choudhary <j-choudhary@ti.com>
Message-ID: <45b381c8-e509-6ac0-0b08-63e5d82ddfc4@ti.com>
Date: Fri, 24 Jun 2022 16:43:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220623181047.28818-1-reatmon@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Jun 2022 11:13:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14843



On 23/06/22 11:40 pm, Ryan Eatmon via lists.yoctoproject.org wrote:
> This patch is to align with a recent change to how the HS platforms
> are setup in the /boot partition.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Reviewed-by: Jayesh Choudhary <j-choudhary@ti.com>

> ---
>  conf/machine/j721s2-hs-evm.conf | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/conf/machine/j721s2-hs-evm.conf b/conf/machine/j721s2-hs-evm.conf
> index 43fb2ebc..7ffad45a 100644
> --- a/conf/machine/j721s2-hs-evm.conf
> +++ b/conf/machine/j721s2-hs-evm.conf
> @@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
>  UBOOT_DTBO_OFFSET =      "0x00010000"
>  
>  SPL_BINARY = "tispl.bin_HS"
> -SPL_BINARYNAME = "tispl.bin"
>  UBOOT_BINARY = "u-boot.img_HS"
> -IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +UBOOT_SYMLINK = "u-boot.img"
>  
>  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14842): https://lists.yoctoproject.org/g/meta-ti/message/14842
> Mute This Topic: https://lists.yoctoproject.org/mt/91949309/6958728
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [j-choudhary@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

