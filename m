Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6679FE728C4
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 15:55:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.21265.1696002898994935189
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 29 Sep 2023 08:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=o0KDgafi;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38TFsviT032942;
	Fri, 29 Sep 2023 10:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696002897;
	bh=KBmc9UJIdqbzhfANhUOVWWihOF+8uwEPAvG+ONyNe/4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=o0KDgafimQmrIZb1KMiZGi15Z/dWJoacvA70h6FcXon9wqHW6JmeOLAN2pVHAVDiM
	 MSo4iFcgi+p0k7Ewp6U7AbbG/49cl2pQpTvGPewFCtXLSJuwJy13bYAPQy+3jP9Ob6
	 O0sMxSVGAT97O4wcQLEQuVFDEQOdQPwYBRHnn9lw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38TFsvMZ022007
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 29 Sep 2023 10:54:57 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 29
 Sep 2023 10:54:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 29 Sep 2023 10:54:57 -0500
Received: from [10.250.34.24] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38TFsvsZ013280;
	Fri, 29 Sep 2023 10:54:57 -0500
Message-ID: <976e68e9-250e-411f-8bd1-ccdff4f544f5@ti.com>
Date: Fri, 29 Sep 2023 10:54:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][PATCH v2] ti-img-rogue-umlibs: harden handling of
 usrmerge
Content-Language: en-US
To: Max Krummenacher <max.oss.09@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: Max Krummenacher <max.krummenacher@toradex.com>
References: <20230906150551.2362062-1-max.oss.09@gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230906150551.2362062-1-max.oss.09@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 29 Sep 2023 15:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17036



On 9/6/2023 10:05 AM, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Only move directories which haven't already been moved.
> This prevents a build error should a subsequent bitbake execution
> rerun do_install where the sources to 'mv' no longer exist.
> | mv: cannot stat 'ti-img-rogue-umlibs/23.1.6404501/git/targetfs/am62_linux/lws-generic/release/lib/firmware': No such file or directory
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>   .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb        | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> index 9b45a91f..2cf13c60 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> @@ -68,7 +68,9 @@ do_install:prepend() {
>           done
>       fi
>       if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
> -        mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
> +        if [ -e ${S}/lib/firmware ]; then
> +            mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
> +        fi

Sorry it has taken so long to get back to this.  Busy times over here.

I think the better plan is to not move the directory, but use some other 
command to copy the files.  That way there should be no need to put a 
guard around the command.  I'll work the Randoplh to get this updated 
the correct way.

Thank you for pointing out the issue.


>       fi
>   
>       # clean up any empty directories
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16922): https://lists.yoctoproject.org/g/meta-ti/message/16922
> Mute This Topic: https://lists.yoctoproject.org/mt/101194647/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

