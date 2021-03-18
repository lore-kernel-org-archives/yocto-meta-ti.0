Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2365.1616027267808478805
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Mar 2021 17:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oSnuzlYf;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12I0RkVo053941;
	Wed, 17 Mar 2021 19:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616027266;
	bh=nTsdq1gugSz4fzOEbnAsHXz6uXnCp1grl5dwpQad0m8=;
	h=Subject:CC:References:To:From:Date:In-Reply-To;
	b=oSnuzlYfzkGd9GWNqfDfwOlkSeTdj4WSiEkZvNxn3rLCge6DPUDEeXjpXB5sQ/RaE
	 1eU2zw/XmHHXw7Ticsr4tGh2QnfBxXmK2Yqkd5cFWNelKKSSrDmwAwbZEWwZ7P/gWh
	 84HBS0Ft4cGhjtOiHNP5+t3PwOEFGQGTDj37WHB0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12I0RkI4013327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Mar 2021 19:27:46 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 17
 Mar 2021 19:27:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 17 Mar 2021 19:27:46 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12I0RkX7127031;
	Wed, 17 Mar 2021 19:27:46 -0500
Subject: Re: [meta-ti] [PATCH] ti-uboot-staging: Update to the latest commit
CC: <denys@konsulko.com>
References: <166D482830B809A8.29795@lists.yoctoproject.org>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <85fec66f-8aec-ea24-136a-d4c9b97530e6@ti.com>
Date: Wed, 17 Mar 2021 19:27:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <166D482830B809A8.29795@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/17/2021 7:26 PM, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>

This is for dunfell and master branch update.
was not clear in the subject header.

> 
> ti-uboot-staging: Update to the latest commit
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> index 688eb131..c066eb8f 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> @@ -1,7 +1,7 @@
>   require u-boot-ti.inc
>   
> -PR = "r34"
> +PR = "r35"
>   
>   BRANCH = "ti-u-boot-2020.01"
>   
> -SRCREV = "8c49d316a4283299c9b2d193aac38a25ba8f8709"
> +SRCREV = "654d73f8725db340ccb470d5d130df3fcf7ce482"
> 
> 
> 
> 
> 
