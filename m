Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.858.1607756634855498719
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 23:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Fwm8onlF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BC73svI020104
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 01:03:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607756634;
	bh=V8zvRlJJFfyj0xoJeMa3+ta0EEf21+FaRw8SMp1hoLY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Fwm8onlFHNYg8O5JSfiEwweTIcYgEZtl0vinogy7IZSo7at4XWwQesc7b6J6G09Iq
	 FZfO8O065F49kLE49wV2ZGYaIhMJLVcJPNhBCR8Za+DPAdbwDq8mR5cdoRFUuoh5Fq
	 /d0CDfV1X7sKHLsmAMi2+uHvULxHLUsrChVLQM5I=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BC73sI4091697
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 01:03:54 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 12
 Dec 2020 01:03:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 12 Dec 2020 01:03:53 -0600
Received: from [10.250.64.202] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BC73rfB030169;
	Sat, 12 Dec 2020 01:03:54 -0600
Subject: Re: [meta-ti] [PATCH 2/4] linux-ti-staging: Update kernel to pick up AM64 platform
To: <dmurphy@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20201211133201.10923-1-dmurphy@ti.com>
 <20201211133201.10923-2-dmurphy@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <1ce70d24-32c3-37dc-e0e5-315e52e39026@ti.com>
Date: Sat, 12 Dec 2020 01:03:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211133201.10923-2-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/11/20 7:31 AM, Dan Murphy via lists.yoctoproject.org wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging_5.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index 0e7fa2dff29c..8275988bb1a7 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-5.4.y"
>  
> -SRCREV = "673043a513673aaddded01f52124c37d0e28f4f9"
> +SRCREV = "7a5e2e57a39a097b4dde09bad8f72a2d31dc09c4"

You can probably merge this patch first in preparation. Also, the SHA is already
stale, might just pick the latest, even 5.4.82..

regards
Suman

>  PV = "5.4.78+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> 
> 
> 
> 
> 

