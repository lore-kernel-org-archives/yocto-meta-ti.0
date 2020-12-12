Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.10465.1607810979854081678
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 12 Dec 2020 14:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WcKn9APB;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-anna@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BCM9dku126211
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 16:09:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607810979;
	bh=L4xJIAGyaFLYZO+FX0hpyRvDTB3M1zRIFwCRtt1aFr8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=WcKn9APB4Sx8qXmkfo2068N3j4qO0oQEYs6J1mBCUBl2WiwDx+C8APFlh8HK4xYPO
	 ZWoMHygO9S9p1hHyI8eEmrgYWtOKa+sGAEKySZoA24/3GpmRvjb2p64DTXSuZ57BXd
	 kQsDfPMZRqg5kWhmfP0/EKhovZYS/Eb80lq/w974=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BCM9dIG037361
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 16:09:39 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 12
 Dec 2020 16:09:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 12 Dec 2020 16:09:38 -0600
Received: from [10.250.64.202] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BCM9blJ013768;
	Sat, 12 Dec 2020 16:09:37 -0600
Subject: Re: [dunfell/master PATCH] trusted-firmware-a: Update SRCREV to pick latest
To: <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: Nishanth Menon <nm@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20201212212332.11836-1-praneeth@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <007b11f6-f4eb-bd23-b60a-b970d3245002@ti.com>
Date: Sat, 12 Dec 2020 16:09:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201212212332.11836-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Praneeth,

On 12/12/20 3:23 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Update SRCREV to pick latest that includes AM64 support

This by itself will not be enough for AM64, but that can be an add-on patch.
Need to account for TARGET_BOARD=lite for AM64x.

regards
Suman

> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 3ca4a204..7821ed3a 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -2,7 +2,7 @@ PV_k3 = "2.4"
>  LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
>  BRANCH_k3 = "ti-atf"
>  SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
> -SRCREV_tfa_k3 = "f0a310d000fd6e8a1ed0ccc365b5931390393db1"
> +SRCREV_tfa_k3 = "65dd16b4ea5032752af62e94ca64cff41733a123"
>  COMPATIBLE_MACHINE_k3 = "k3"
>  TFA_BUILD_TARGET_k3 = "all"
>  TFA_INSTALL_TARGET_k3 = "bl31"
> 

