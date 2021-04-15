Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.8155.1618497958392214430
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 07:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=L4BLm2f8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: lokeshvutla@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13FEjtAn130645;
	Thu, 15 Apr 2021 09:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618497955;
	bh=r2WIhar7/OHJhxD3OvYHmgeiLASxJftU0r1ly3U0sDU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=L4BLm2f8SmSkjOVJr4x0E4EBM2TxUEtvANzWQNLAqCROn3K9PVRlNKlj4VsY6N4EU
	 M6vZlZJyb9/jhNf/TbpCD6VIUqUgahsgB1tbKQknwCQb59FkKp380UlZYQ1dgHh7+U
	 UJxCdpzWGPO6b3F6VJrgDujhmP3lCgcj4dpNw9Lk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13FEjtrh105743
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Apr 2021 09:45:55 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 09:45:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 09:45:55 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13FEjqmM079442;
	Thu, 15 Apr 2021 09:45:53 -0500
Subject: Re: [dunfell/master PATCH] recipes-bsp: u-boot-ti-mainline: Update to v2021.04 release
To: Nishanth Menon <nm@ti.com>, <praneeth@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210415144143.11667-1-nm@ti.com>
From: "Lokesh Vutla" <lokeshvutla@ti.com>
Message-ID: <e978682b-8e16-f3ba-4c9e-62128782ffae@ti.com>
Date: Thu, 15 Apr 2021 20:15:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210415144143.11667-1-nm@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 15/04/21 8:11 pm, Nishanth Menon wrote:
> Update u-boot recipe to be on the bleeding upstream tag.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> index ee0b17640807..ccd2a009ca43 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>  
>  PR = "r0"
>  
> -PV = "2020.10"
> +PV = "2021.04"
>  UBOOT_GIT_URI = "git://gitlab.denx.de/u-boot/u-boot.git"

Can you also update the link to https://source.denx.de/u-boot/u-boot.git ?

Thanks and regards,
Lokesh
