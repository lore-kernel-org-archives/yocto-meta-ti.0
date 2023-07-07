Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B24EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 16:33:45 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1225.1688747619329795679
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Jul 2023 09:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YeriM7Hl;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 367GXXir026475;
	Fri, 7 Jul 2023 11:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688747613;
	bh=sHQQHr6hSD+sAPSixcoQJI6GTaJ5JdbxoaOUJNiJz4k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YeriM7HlGRlaVHkOeGkNyDQRLi+CeSNPr7prjiHY03FqNJyouTCpYKQNrjU8SCUnr
	 ycQPuaYdri58rvA4TZRxpD/MNIUr8ViegPp6iSU5msVzVHAZzJI6togHXlv6rTATva
	 37wnVyE5Vq3ZN0UcQeJl7UlLyI/YPS53wvekffMA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 367GXXXa095788
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jul 2023 11:33:33 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jul 2023 11:33:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jul 2023 11:33:33 -0500
Received: from [10.249.33.12] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 367GXWBT023004;
	Fri, 7 Jul 2023 11:33:33 -0500
Message-ID: <778da68c-e71d-5305-121a-51d0ab704ace@ti.com>
Date: Fri, 7 Jul 2023 11:33:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-ti] [master/kirkstone][PATCH] conf: switch k3r5 multiconfig
 to baremetal
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20230706193122.1891075-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230706193122.1891075-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Jul 2023 16:33:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16832



On 7/6/2023 2:31 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> There are couple of k3r5 components that need to be built for the target
> and they are self-contained and don't use glibc. Moreover, when building
> a cross-compile toolchain for k3r5, there's no need to build glibc and
> all its dependencies. While build-time speed up is nice, the main benefit
> comes when packaging a nativesdk toolchain for distribution, reducing the
> number of packages and the resulting size of the toolchain installer.
> 
> To avoid potential namespace conflict in package feeds between nativesdk
> binary packages of Linux glibc and k3r5 baremetal toolchains, adjust the
> package suffix accordingly.
> 
> This also requires a rather impactful change in the deployment structure,
> which affects CIs and user experience. By default different TCLIBC builds
> (e.g. glibc and baremetal in this case) are built in separate TMPDIRs to
> avoid conflicts, especially on the nativesdk side. Also the default config
> has DEPLOY_DIR residing under corresponding TMPDIR. Of course, this can be
> changed by local.conf or <distro>.conf, which meta-ti-bsp has no control
> over. Unlike multiconfig-image-packager example that can access deployed
> artifacts across multiconfigs to package in an image, we use wic and its
> IMAGE_BOOT_FILES list to package a final image. Unfortunately, wic cannot
> access deployed artifacts across multiconfigs in separate TMPDIRs, as it
> uses DEPLOY_DIR_IMAGE to collect the artifacts. To overcome this, we need
> to set up a "common" deploy directory for images and sdks produced by
> multiconfigs, which is located outside of TMPDIRs, set by TI_COMMON_DEPLOY
> variable that can be changed or adjusted by distros as needed.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-ti-bsp/conf/layer.conf            | 4 ++++
>   meta-ti-bsp/conf/multiconfig/k3r5.conf | 4 +++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index bb286c2b..db6f9de9 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -23,3 +23,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>   "
>   
>   HOSTTOOLS_NONFATAL += "truncate xxd comm"
> +
> +TI_COMMON_DEPLOY ?= "${TOPDIR}/deploy-ti"

During testing, this one threw me for a bit.  None of the build scripts 
were copying anything...  I can deal with that.  But, we pull a few 
things out of the deploy dir.  Images, sdk, ipk...  should we also have 
something that uses this new TI_COMMON_DEPLOY for the ipk and licenses?


> +DEPLOY_DIR_IMAGE:ti-soc = "${TI_COMMON_DEPLOY}/images/${MACHINE}"
> +SDK_DEPLOY:ti-soc = "${TI_COMMON_DEPLOY}/sdk"
> diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> index deb07210..04b9a746 100644
> --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> @@ -1,5 +1,7 @@
>   MAINMACHINE := "${MACHINE}"
>   
> -DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MAINMACHINE}"
> +DEPLOY_DIR_IMAGE:k3r5 = "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}"
>   
>   MACHINE:append = "-k3r5"
> +TCLIBC = "baremetal"
> +SDKPKGSUFFIX = "k3r5-nativesdk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16821): https://lists.yoctoproject.org/g/meta-ti/message/16821
> Mute This Topic: https://lists.yoctoproject.org/mt/99992786/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

