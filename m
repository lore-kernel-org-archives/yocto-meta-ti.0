Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C715EB64D7
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 01:48:12 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.216.1688003287968734082
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 18:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Dji2BVDR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35T1m57N100464;
	Wed, 28 Jun 2023 20:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688003285;
	bh=Vj8JXNrc2HiNpD+tcUfK5GGzAt0ekp1h+tf7FETp97U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Dji2BVDR7HVJF4jj1XZZQr3hrxlJiZjItT8YVlLKCPjv7P6o3msoczrTbBG0Ftitr
	 e4hYQ8bbV6wAgXo9pDE2CB+Zal18JVLX2R+WGui+ptNdqbIjWVxOwpRe14/46vKcBl
	 hmIVHFVsjiP4eBETLlPZ4xcFbxAq0VSqepqGTfqI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35T1m5FX003430
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Jun 2023 20:48:05 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Jun 2023 20:48:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Jun 2023 20:48:04 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35T1m4pO030492;
	Wed, 28 Jun 2023 20:48:04 -0500
Message-ID: <f601ff40-4022-7a7a-cc3a-d0744bbd471f@ti.com>
Date: Wed, 28 Jun 2023 20:48:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXTERNAL] [PATCH] ti-img-rogue-umlibs: use image path to avoid
 local path expansion
Content-Language: en-US, en-US-large
To: Ricardo Salveti <ricardo@foundries.io>, <meta-ti@lists.yoctoproject.org>
CC: <jose.quaresma@foundries.io>
References: <20230629012145.407276-1-ricardo@foundries.io>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230629012145.407276-1-ricardo@foundries.io>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 Jun 2023 01:48:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16799

On 6/28/23 20:21, Ricardo Salveti wrote:
> Provide a package file list based on the image path to avoid it later be
> expanded by using the host system path.
> 
> Fixes a package QA error when files named similarly are provided by the
> host system (e.g. /usr/bin/oclock is a match for /usr/bin/ocl*).
> 
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> ---
>   .../ti-img-rogue-umlibs_23.1.6404501.bb       | 21 ++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> index c012859f..229fc081 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> @@ -38,32 +38,39 @@ PACKAGECONFIG[vulkan] = ",,,${VULKAN_LIB_PACKAGES}"
>   PACKAGECONFIG[opencl] = ",,,${OPENCL_LIB_PACKAGES},libopencl-rogue-tools"
>   
>   def get_file_list(package_list_var, d):
> +    import os
> +    image_dir = d.getVar("D")
>       file_list = []
>       package_list = d.getVar(package_list_var)
>       if package_list:
>           for package in package_list.split():
>               package_files = d.getVar(f"FILES:{package}")
>               if package_files:
> -                file_list.append(package_files)
> +                for f in package_files.split():
> +                    if os.path.isabs(f):
> +                        f = '.' + f
> +                    if not f.startswith("./"):
> +                        f = './' + f
> +                    file_list.append(os.path.join(image_dir, f))
>       return " ".join(file_list)
>   
>   do_install:append() {
>       if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)}; then
>           for file in ${@get_file_list('GLES_PACKAGES', d)}; do
> -            rm -rf ${D}/${file}
> -            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
> +            rm -rf ${file}
> +            rmdir --ignore-fail-on-non-empty $(dirname ${file})
>           done
>       fi
>       if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true', d)}; then
>           for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
> -            rm -rf ${D}/${file}
> -            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
> +            rm -rf ${file}
> +            rmdir --ignore-fail-on-non-empty $(dirname ${file})
>           done
>       fi
>       if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true', d)}; then
>           for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
> -            rm -rf ${D}/${file}
> -            rmdir --ignore-fail-on-non-empty $(dirname ${D}/${file})
> +            rm -rf ${file}
> +            rmdir --ignore-fail-on-non-empty $(dirname ${file})
>           done
>       fi
>       if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then


Hey, thanks for the patch. I believe this patch I submitted earlier 
should also solve the issue you were facing. It's still in the -next 
branches though.

https://lists.yoctoproject.org/g/meta-ti/message/16790

Randolph

