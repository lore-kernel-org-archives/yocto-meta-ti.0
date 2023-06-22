Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE56BEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 20:07:09 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.21589.1687464427172255226
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 13:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Eoa07TDa;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MK73lO127663;
	Thu, 22 Jun 2023 15:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687464423;
	bh=OOS2kK7WOT3iZ4pMXRQnh6ugwCv/RQews6Ltvp6t75A=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Eoa07TDa8Vc/lM4mK1YybTx4b86dLFTyHSARzUbQeiq2oPXpRuz1oyc1Iwby99qBc
	 i0c7lgvrZkEpzok6hOYpRK8cFbp6ZBO15ObO7dc4ibY5hHUVqzgJGXnCI8Q0erfAqK
	 U/2Ws2rxQ21u6SuujfdmZh8A+Z26h+BSVlgSVObY=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MK73BB020616
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 15:07:03 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 15:07:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 15:07:02 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MK72bB127572;
	Thu, 22 Jun 2023 15:07:02 -0500
Message-ID: <df72c061-543a-9bee-a4bc-fc8d975f66d5@ti.com>
Date: Thu, 22 Jun 2023 15:07:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXTERNAL] [meta-ti][master/kirkstone][PATCH]
 ti-img-rogue-umlibs: make all components optional
To: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denis@denix.org>
References: <176ABFE0C4405DCC.15842@lists.yoctoproject.org>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <176ABFE0C4405DCC.15842@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 20:07:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16776

On 6/21/23 13:26, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Bumping into the limitations of the binary_package class. This change
> allows all rogue components to be optionally packaged without blowing
> out the dependency chain.
> 
> Add a python function to fetch file paths from the FILE vars for each
> component so we don't end up double tracking files. Add variables to
> track component packages if things split up more later. Add a package
> config string to set runtime dependencies and recommendations. Change
> all logic to revolve around the PACKAGECONFIG instead of distro
> features.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   .../ti-img-rogue-umlibs_23.1.6404501.bb       | 58 ++++++++++++++++---
>   1 file changed, 49 insertions(+), 9 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> index b166736c..c012859f 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> @@ -28,20 +28,63 @@ RDEPENDS:${PN} = " \
>       ${PN}-firmware \
>   "
>   
> +PACKAGECONFIG ?= " \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan x11 wayland', 'vulkan', '', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
> +"
> +
> +PACKAGECONFIG[opengl] = ",,,${GLES_LIB_PACKAGES}"
> +PACKAGECONFIG[vulkan] = ",,,${VULKAN_LIB_PACKAGES}"
> +PACKAGECONFIG[opencl] = ",,,${OPENCL_LIB_PACKAGES},libopencl-rogue-tools"
> +
> +def get_file_list(package_list_var, d):
> +    file_list = []
> +    package_list = d.getVar(package_list_var)
> +    if package_list:
> +        for package in package_list.split():
> +            package_files = d.getVar(f"FILES:{package}")
> +            if package_files:
> +                file_list.append(package_files)
> +    return " ".join(file_list)
> +
>   do_install:append() {
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)}; then
> +        for file in ${@get_file_list('GLES_PACKAGES', d)}; do
> +            rm -rf ${D}/${file}
> +            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
> +        done
> +    fi
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true', d)}; then
> +        for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
> +            rm -rf ${D}/${file}
> +            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
> +        done
> +    fi
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true', d)}; then
> +        for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
> +            rm -rf ${D}/${file}
> +            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
> +        done
> +    fi
>       if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
>           mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
>           rmdir ${D}/lib
>       fi
>   }
>   
> +GLES_LIB_PACKAGES = "libgles1-rogue libgles2-rogue libgles3-rogue"
> +GLES_PACKAGES = "${GLES_LIB_PACKAGES}"
> +
> +VULKAN_LIB_PACKAGES = "libvk-rogue"
> +VULKAN_PACKAGES = "${VULKAN_LIB_PACKAGES}"
> +
> +OPENCL_LIB_PACKAGES = "libopencl-rogue"
> +OPENCL_PACKAGES = "${OPENCL_LIB_PACKAGES} libopencl-rogue-tools"
> +
>   PACKAGES = " \
> -    libgles1-rogue \
> -    libgles2-rogue \
> -    libgles3-rogue \
> -    libvk-rogue \
> -    libopencl-rogue \
> -    libopencl-rogue-tools \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', d.getVar('GLES_PACKAGES'), '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', d.getVar('VULKAN_PACKAGES'), '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'opencl', d.getVar('OPENCL_PACKAGES'), '', d)} \
>       ${PN}-tools \
>       ${PN}-firmware \
>       ${PN} \
> @@ -94,9 +137,6 @@ FILES:${PN}-firmware = "${base_libdir}/firmware/*"
>   INSANE_SKIP:${PN}-firmware += "arch"
>   
>   RRECOMMENDS:${PN} += " \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libgles1-rogue libgles2-rogue", "", d)} \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan x11 wayland", "libvk-rogue", "", d)} \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "opencl", "libopencl-rogue", "", d)} \
>       ${PN}-tools \
>   "
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16764): https://lists.yoctoproject.org/g/meta-ti/message/16764
> Mute This Topic: https://lists.yoctoproject.org/mt/99682421/7094281
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [rs@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

Wait, don't merge this. Just realized it introduces a weird issue with 
Yocto's caching system. Changing the package config won't always update 
the package contents when you are directly modifying the recipe's deploy 
directory if there is a cached build.

Oddly enough, if you make it do_install:prepend and edit the source 
directory it seems to correctly reevaluate the cache. Denys, any idea 
why this is?

