Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1356.1614020388346374577
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Feb 2021 10:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TJL76lV+;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: praneeth@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id ABE8B38C07D7
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2021 18:59:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11MIxldP045564
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2021 12:59:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614020387;
	bh=bWnGuQgsDeMBIsQ8NFAxtzOyPBMckyOUDyZJqLgPEb0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=TJL76lV+IaTSInEuaDKsS285gEfE8MBf3vh6R2MyhKhQkMzKywI90qnTJhwWnYPXP
	 bUwDMOB9g9ESuB2vPUv1CM2AbPUsnKCK3YWyZQL6F8t1CG9LsY3ShTJLinT9W6JVfU
	 kNxoAqyrueK/n2Jk37a/gKCGFQ4MlsuGShGwknQo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11MIxlsI016356
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2021 12:59:47 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 22
 Feb 2021 12:59:46 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 22 Feb 2021 12:59:46 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11MIxkTc055438;
	Mon, 22 Feb 2021 12:59:46 -0600
Subject: Re: [meta-ti][master/dunfell][PATCH 2/2] ti-img-rogue-umlibs: Update artifacts to 1.13.5776728
To: Gowtham Tammana <g-tammana@ti.com>, <meta-ti@yoctoproject.org>
References: <20210222185312.22981-1-g-tammana@ti.com>
 <20210222185312.22981-2-g-tammana@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <b3c43225-2483-9320-549f-b368db470465@ti.com>
Date: Mon, 22 Feb 2021 12:59:45 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222185312.22981-2-g-tammana@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/22/2021 12:53 PM, Gowtham Tammana wrote:
> Update GLES binary artifacts to latest version 1.13.5776728.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>   ..._1.10.5371573.bb => ti-img-rogue-umlibs_1.13.5776728.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename recipes-graphics/libgles/{ti-img-rogue-umlibs_1.10.5371573.bb => ti-img-rogue-umlibs_1.13.5776728.bb} (95%)
> 
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> similarity index 95%
> rename from recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
> rename to recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> index f9d5ed9c..f76977ba 100644
> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
> @@ -10,13 +10,13 @@ REQUIRED_MACHINE_FEATURES = "gpu"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   COMPATIBLE_MACHINE = "j7"
>   
> -PR = "r9"
> +PR = "r1"

r10?


>   
> -BRANCH = "linuxws/zeus/k5.4/${PV}"
> +BRANCH = "linuxws/dunfell/k5.4/${PV}"
>   
>   SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
>   
> -SRCREV = "8d3d1891186ed3f397bb90f4f8c518c6c9970479"
> +SRCREV = "2bdcab52eecbbef4c70e3b58c5f3854660abb8d4"
>   
>   PVR_SOC ?= "j721e_linux"
>   PVR_BUILD ?= "release"
> 
