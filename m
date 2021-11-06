Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.13477.1636156901264242594
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 17:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MM7Zl/aU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1A601b5l001751;
	Fri, 5 Nov 2021 19:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636156897;
	bh=JpAFAYMpLmXGJQeriVxwOZe8TkuK7xFWl7MuY4kuRuQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=MM7Zl/aUzlt3Ka3icwqOEthl8xGGoTSQQSAXIH7+b5BrWC/guNIyFpYtKGrOXS34J
	 BXzQE17QGF/ld7BYVSmN65lSsXJk9xyygQlmTqfuy2gJZxRPghRPJAKFibDK1nQ6Ck
	 aZtNAAwcPOdKpxTDlVpNiVkoMklq6hVg1+njhQU4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1A601bRG072713
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Nov 2021 19:01:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 5
 Nov 2021 19:01:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 5 Nov 2021 19:01:36 -0500
Received: from [10.250.38.249] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1A601afX064193;
	Fri, 5 Nov 2021 19:01:36 -0500
Message-ID: <9e6f0d08-5bde-441e-96ef-edcd10076a1a@ti.com>
Date: Fri, 5 Nov 2021 19:01:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [meta-ti] [master][PATCH 11/22] powervr-drivers: teach modules_install to respect "usrmerge" distro feature
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <1635795192-43144-1-git-send-email-denis@denix.org>
 <1635795192-43144-12-git-send-email-denis@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <1635795192-43144-12-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,
This was already posted by you 
https://lists.yoctoproject.org/g/meta-ti/message/14063 and has already 
been merged.

Thanks
Yogesh

On 11/1/2021 2:33 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> https://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/
> 
> When "usrmerge" distro feature is enabled, root directories /bin, /sbin, /lib
> are simply symlinks pointing to their counterparts in /usr. Hence, modules
> should be installed accordingly into /usr/lib/modules/...
> 
> Since IMG Makefiles don't take the direct target directory, such as
> ${nonarch_base_libdir}/modules/, adjust the top-level rootfs path instead.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> Reported-by: Vivien Didelot <vdidelot@pbsc.com>
> Tested-by: Vivien Didelot <vdidelot@pbsc.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb | 2 +-
>   recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb       | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> index c3524e9..09f6f03 100644
> --- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> +++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776728.bb
> @@ -36,5 +36,5 @@ PVR_WS = "wayland"
>   EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" RGX_BVNC=${PVR_BVNC} BUILD=${PVR_BUILD} PVR_BUILD_DIR=${PVR_SOC} WINDOW_SYSTEM=${PVR_WS}'
>   
>   do_install() {
> -    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
> +    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${PVR_SOC}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
>   }
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index ff420cd..3848e84 100644
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -42,9 +42,9 @@ do_compile:prepend() {
>   }
>   
>   do_install() {
> -    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
> +    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
>   }
>   
>   do_install:k3() {
> -    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
> +    make -C ${STAGING_KERNEL_DIR} M=${B}/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
>   }
> 
> 
> 
> 
> 
