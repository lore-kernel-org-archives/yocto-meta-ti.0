Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.9793.1603369831270447768
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2020 05:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JeW9nWMk;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09MCUSq7091344;
	Thu, 22 Oct 2020 07:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603369828;
	bh=Ijl8RD4zsqjRcoZSkhYmDEgfXxeSuFbUGzf11eY4AUk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=JeW9nWMkOX4B3t8/lcvyCgvaA5JcKs6TYdGjaEzb3lkepbgqONT8o060L+jOAG04i
	 oznL0HWA3FJahR/TW3Mq9j5a3JB41pybrOQWYM+brxblsWBY2ssbGX8WGT8OFpPM44
	 Y28xsHyT4BiLYcE2WScasWDvSWYLizDOCyrVa9I8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09MCUSGA053984
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Oct 2020 07:30:28 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 22
 Oct 2020 07:30:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 22 Oct 2020 07:30:28 -0500
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09MCUR4a004757;
	Thu, 22 Oct 2020 07:30:28 -0500
Subject: Re: [meta-ti] [master][PATCH 1/3] trusted-firmware-a: adjust ${BUILD_DIR} for meta-arm/master
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
References: <1603317309-52625-1-git-send-email-denis@denix.org>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <0326202d-52c8-114a-8a80-68fc77ed70c7@ti.com>
Date: Thu, 22 Oct 2020 07:30:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1603317309-52625-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello

On 10/21/20 4:55 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> As meta-arm/master now sets ${BUILD_DIR} to also include ${B} and release/debug.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 2dc715c..c3e3c74 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -8,7 +8,7 @@ TFA_SPD_k3 = "opteed"
>   
>   do_compile_append_am65xx-hs-evm() {
>   	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> -	( cd ${B}/${BUILD_DIR}/release/; \
> +	( cd ${BUILD_DIR}; \
>   		mv bl31.bin bl31.bin.unsigned; \
>   		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
>   	)
> @@ -16,7 +16,7 @@ do_compile_append_am65xx-hs-evm() {
>   
>   do_compile_append_j7-hs-evm() {
>   	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> -	( cd ${B}/${BUILD_DIR}/release/; \
> +	( cd ${BUILD_DIR}; \
>   		mv bl31.bin bl31.bin.unsigned; \
>   		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
>   	)
>

All 3 applied to master

Dan

