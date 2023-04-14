Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598E5C77B73
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 16:13:22 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.14810.1681488792778052399
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Apr 2023 09:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LAkdldmR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33EGDBm6121902
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 11:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681488791;
	bh=tNR/NnatITiv4v0MkJDEwBn/xbcHKCX4ORRLtnXEKcQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=LAkdldmREb5SoxvIYRd4g1lXHPVylk7U82vUZzrOMVjPOqX2n/Tm2e4f44rXKQXc2
	 NFaR02Jt8Lnc1uKMeVTs8A5r2ZGslAem2VoKV2Jz2+/Jahd7spiG3uYCcGNlG5Qf99
	 IwcN3Q/iogFttWiZeeUvsPXNMz45KfXFIPVTKsS8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33EGDB4o089668
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 11:13:11 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 14
 Apr 2023 11:13:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 14 Apr 2023 11:13:12 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33EGDBRo081884
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 11:13:11 -0500
Message-ID: <1904aa52-b60c-e91c-e6c1-138bf05570ff@ti.com>
Date: Fri, 14 Apr 2023 11:13:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [EXTERNAL] [meta-ti] [PATCH][kirkstone 3/3] graphics: upgrade
 rogue graphics to 23.1.6404501
Content-Language: en-US, en-US-large
To: <meta-ti@lists.yoctoproject.org>
References: <20230407005932.322037-1-rs@ti.com>
 <1753813C2F0DECF2.3578@lists.yoctoproject.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <1753813C2F0DECF2.3578@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Apr 2023 16:13:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16392

On 4/6/23 19:59, Randolph Sapp via lists.yoctoproject.org wrote:
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
> similarity index 86%
> rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
> rename to meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
> index 94d14ded..38d0556b 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
> @@ -10,9 +10,9 @@ COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
>   
>   PR = "r2"
>   
> -BRANCH = "linuxws/kirkstone/k5.10/${PV}"
> -SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "51e598919641d51156a631efa5447124a3c0f543"
> +BRANCH = "linuxws/kirkstone/k6.1/${PV}"
> +SRC_URI ="git://git@bitbucket.itg.ti.com/graphics/8xe-ddk-rogue_umlibs.git;protocol=ssh;branch=${BRANCH}"
> +SRCREV = "49958a8e820a321d22ac3c635bd21d4a3118c006"
>   S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
>   
>   TARGET_PRODUCT:j721e = "j721e_linux"

Rats, accidentally committed the SRC_URI of the test repo. Fixed in v2.

