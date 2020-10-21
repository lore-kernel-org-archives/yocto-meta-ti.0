Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.15088.1603300071643469737
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 10:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pUF0svZL;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: denys@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id BF83538C13A6
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 10:07:50 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LH7ovA025853
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 12:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603300070;
	bh=PS6qdeC+JrAHYumiQ27Osdsnt8AbnkznQSgd0mSt81s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pUF0svZLzANzHlnSCeXAn0RBRu8fcHwfnHtXfBeaC60jL5W3bCvuDQ6BwTMCfMBq5
	 2dF2DTUyO6jcwjXYbAbHcQKEAVj/U7tARegUybSZNjlam2zTjLrZF3gxsbvtnK/oc3
	 XPXYyoxtUA/gF/ZyVNT3LUqQIV2rUQciwl3Yeddo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LH7oGb111083
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 12:07:50 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 12:07:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 12:07:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LH7noh061424;
	Wed, 21 Oct 2020 12:07:49 -0500
Date: Wed, 21 Oct 2020 13:07:49 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: <s-anna@ti.com>, <praneeth@ti.com>, <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/3] u-boot-ti: Add new firmware to u-boot command line for j7
Message-ID: <20201021170749.GM14852@beryl>
References: <20201021150210.29966-1-dmurphy@ti.com>
 <20201021150210.29966-2-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201021150210.29966-2-dmurphy@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 21, 2020 at 10:02:09AM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-bsp/u-boot/u-boot-ti.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index 2063bac24554..b7fd246aca6c 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -33,10 +33,14 @@ PV_append = "+git${SRCPV}"
>  # u-boot needs devtree compiler to parse dts files
>  DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native"
>  
> +DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"

Since _append_j7 below will affect j721e GP and HS as well as j7200, make sure 
the firmware name is correct for all those platforms.


>  PACKAGECONFIG[atf] = "ATF=${STAGING_DIR_HOST}/firmware/bl31.bin,,trusted-firmware-a"
>  PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl32.bin,,optee-os"
> +PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-ipc/${DM_FIRMWARE},,ti-rtos-firmware"
>  
>  PACKAGECONFIG_append_aarch64 = " atf optee"
> +PACKAGECONFIG_append_j7 = " dm"
>  
>  COMPATIBLE_MACHINE = "(ti-soc)"
>  
> -- 
> 2.17.1
> 
