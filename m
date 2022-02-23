Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2528.1645581433908745926
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 17:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=w+j9PEEN;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21N1vBil007276;
	Tue, 22 Feb 2022 19:57:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645581431;
	bh=kp+Axat9JDEpH/ZojSi71Jel+CbnOnMHB0tUHyf3Tts=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=w+j9PEENqtsfqMmpiSQBb7b6hgUDmcej815AGmZ6x5pfb5+TrlLtEdH4YCYIIusl7
	 N9XdSKw5iQ2yP+PJ5AI1+LZrPkPNNcbrfId79ag//hHkv422boo4V1QOT3HWaNUXhV
	 +RFwSnZUxUCChqDQIM4PW8H1pdET5HvvwQhzX8vo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21N1vB9n001753
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Feb 2022 19:57:11 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Feb 2022 19:57:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Feb 2022 19:57:11 -0600
Received: from [10.250.220.93] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21N1v9M1037879;
	Tue, 22 Feb 2022 19:57:10 -0600
Message-ID: <29996586-4f11-77af-1215-484270c86933@ti.com>
Date: Tue, 22 Feb 2022 19:57:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [meta-ti] [master][PATCH] meta-ti: add README for meta-ti-extras and update maintainer
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20220222235616.614689-1-denis@denix.org>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20220222235616.614689-1-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 2/22/2022 5:56 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Add README for the newly added meta-ti-extras layer and update the maintainer.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
>   meta-ti-bsp/README                     |  2 +-
>   {meta-ti-bsp => meta-ti-extras}/README | 14 ++++++--------
>   2 files changed, 7 insertions(+), 9 deletions(-)
>   copy {meta-ti-bsp => meta-ti-extras}/README (60%)
> 
> diff --git a/meta-ti-bsp/README b/meta-ti-bsp/README
> index d832609a..c5780531 100644
> --- a/meta-ti-bsp/README
> +++ b/meta-ti-bsp/README
> @@ -29,5 +29,5 @@ Please note - meta-ti mailing list requires subscription for posting:
>   https://lists.yoctoproject.org/g/meta-ti
>   
>   Maintainers:
> -Praneeth Bajjuri <praneeth@ti.com>
> +Ryan Eatmon <reatmon@ti.com>
>   Denys Dmytriyenko <denys@konsulko.com>
> diff --git a/meta-ti-bsp/README b/meta-ti-extras/README
> similarity index 60%
> copy from meta-ti-bsp/README
> copy to meta-ti-extras/README
> index d832609a..1b38921a 100644
> --- a/meta-ti-bsp/README
> +++ b/meta-ti-extras/README
> @@ -1,4 +1,4 @@
> -The official OpenEmbedded/Yocto BSP layer for Texas Instruments platforms.
> +OpenEmbedded/Yocto layer that extends and supplements Texas Instruments BSP layer.
>   
>   It is hosted on http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/ with the
>   source repository at git://git.yoctoproject.org/meta-ti
> @@ -14,12 +14,10 @@ URI: git://git.yoctoproject.org/meta-arm
>   layers: meta-arm
>   branch: master
>   
> -
> -The base BSP part of meta-ti should work with different OpenEmbedded/Yocto
> -distributions and layer stacks, such as:
> -distro-less (only with OE-Core), with Yocto/Poky, with Angstrom or Arago.
> -
> -Please follow the recommended setup procedures of your OE distribution.
> +URI: git://git.yoctoproject.org/meta-ti
> +branch: master
> +revision: HEAD
> +layers: meta-ti-bsp
>   
>   
>   Send pull requests, patches, comments or questions to:
> @@ -29,5 +27,5 @@ Please note - meta-ti mailing list requires subscription for posting:
>   https://lists.yoctoproject.org/g/meta-ti
>   
>   Maintainers:
> -Praneeth Bajjuri <praneeth@ti.com>
> +Ryan Eatmon <reatmon@ti.com>
>   Denys Dmytriyenko <denys@konsulko.com>
> 
> 
> 
> 
> 
