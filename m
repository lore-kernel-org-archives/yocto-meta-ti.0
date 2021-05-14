Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13432.1621020215823496128
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 May 2021 12:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qNeXc+iD;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14EJNYf1070460;
	Fri, 14 May 2021 14:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621020214;
	bh=pxriS3bzQnq0J5DpDKeQdb5O4u0LERiyinmbaIctL8I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qNeXc+iD6uSUfDwGI6FLLGoNXR0dQtiypwr+W3PUmJ7yUefLgvuYKzbsJmVuWYflu
	 jik8TfxZQjk2mFNpO9kNq/fqzHyVQCWZXJcJyy0A1JS0P2+tk2RZXmowqSzobamx1u
	 C5Ec09OevWtCmY7qy8rx+wN0JH8pfFNt0pLQdKMk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14EJNYav007827
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 May 2021 14:23:34 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 14
 May 2021 14:23:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 14 May 2021 14:23:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14EJNXOO001802;
	Fri, 14 May 2021 14:23:33 -0500
Date: Fri, 14 May 2021 14:23:33 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
Message-ID: <20210514192333.oj5jo7h7kjc2cbip@smoky>
References: <20210507050149.8672-1-praneeth@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210507050149.8672-1-praneeth@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 00:01-20210507, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Update to the latest commit of ti-u-boot-2021.01
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> index 015cd028..b911042c 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
> @@ -2,8 +2,8 @@ require u-boot-ti.inc
>  
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>  
> -PR = "r4"
> +PR = "r5"
>  
>  BRANCH = "ti-u-boot-2021.01"
>  
> -SRCREV = "51a19c4274ca897cec279d1b2d883957ab4705c5"
> +SRCREV = "fbbc964a3514d99430f66600603b7ae348b64cd4"
> -- 
> 2.17.1


Dont we need to fix up am64x- build?


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
