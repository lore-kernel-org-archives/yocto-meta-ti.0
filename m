Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.865.1607757006980774878
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 23:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CRTrqwe+;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BC7A6qA021789
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 01:10:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607757006;
	bh=fZEd1Sxa45QVODGajjcZkkVuONlc6GNPD15CEx538Wk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=CRTrqwe+9gdR0nMFuh4R+x/sz10t5ceiTAV2MJ73KmMbZTU4vrkpZzf9OOLu91kkJ
	 nborp7qPjcmtcCIOJUPxvspvTzoKgM5iMrvG8iWH5K6ZTfcEhfObNXR0rplfTO5C3d
	 mNmfPUfmfpNb1RnF23zEkQexTgmxk1YPxLuCz/YY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BC7A6KS001244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 01:10:06 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 12
 Dec 2020 01:10:06 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 12 Dec 2020 01:10:05 -0600
Received: from [10.250.64.202] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BC7A5Xu095587;
	Sat, 12 Dec 2020 01:10:05 -0600
Subject: Re: [meta-ti] [PATCH 3/4] u-boot-ti: Update u-boot to pick up AM64 architecture
To: <dmurphy@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20201211133201.10923-1-dmurphy@ti.com>
 <20201211133201.10923-3-dmurphy@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <f1b1145a-9bea-6c46-06cd-07b986614d89@ti.com>
Date: Sat, 12 Dec 2020 01:10:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211133201.10923-3-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/11/20 7:32 AM, Dan Murphy via lists.yoctoproject.org wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
>  recipes-bsp/u-boot/u-boot-ti.inc                | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> index 4028a7a93668..15dd32da66f2 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> @@ -1,7 +1,7 @@
>  require u-boot-ti.inc
>  
> -PR = "r24"
> +PR = "r25"
>  
>  BRANCH = "ti-u-boot-2020.01"
>  
> -SRCREV = "4bd43879837910eaf0bf45af7ec5ddfaca203ff4"
> +SRCREV = "10dad9df6a0eb00f45bed48c9df0c9effb4fbae5"
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index b7fd246aca6c..1770c3a1bda8 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -65,6 +65,7 @@ SPL_UART_BINARY_keystone = ""
>  SPL_UART_BINARY_k3r5 = ""
>  SPL_UART_BINARY_lego-ev3 = ""
>  SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
> +SPL_UART_BINARY_am64xx-evm = ""

Why do we need this? I don't see any for AM65xx.

regards
Suman

>  
>  SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
>  SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
> 
> 
> 
> 
> 

