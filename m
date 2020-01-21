Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.17692.1579635654401353597
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jan 2020 11:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oHFMPmAu;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: ajhernandez@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00LJerff106606
	for <meta-ti@lists.yoctoproject.org>; Tue, 21 Jan 2020 13:40:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579635653;
	bh=alCFF+SVctnZVPE7JEoFAbbI3+ZQ3JYzHU8jldHKoVs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=oHFMPmAuRvB62+zeiWT9l5yPen2M8zEHM/fZ4U7Hsq3ey41Hh8upK/ai9QyCP7Lf2
	 8dQckgvjgDtAWg+Ji6fDsqSoINTkIImms6gb8Az0ouUDDd0SWjU1GgNStywzGE3U7k
	 +j8yp5QorwNnpB3KPPYF+cQq2sabB+ZjlWUkX5yI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00LJerNi023850
	for <meta-ti@lists.yoctoproject.org>; Tue, 21 Jan 2020 13:40:53 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Jan 2020 13:40:53 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Jan 2020 13:40:53 -0600
Received: from [158.218.116.237] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00LJeqXV098316;
	Tue, 21 Jan 2020 13:40:52 -0600
Subject: Re: [meta-ti][thud][PATCH] ti-img-encode-decode: Update SRCREV to latest
To: <d-huang@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <angelabaker@ti.com>, <sunitan@ti.com>
References: <20200121185653.15419-1-d-huang@ti.com>
From: "Alejandro Hernandez" <ajhernandez@ti.com>
Message-ID: <b04580d0-359a-46d9-91d1-55e78bde992c@ti.com>
Date: Tue, 21 Jan 2020 14:40:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200121185653.15419-1-d-huang@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ACK.

Thanks and regards,

Alejandro Hernandez

On 1/21/20 1:56 PM, d-huang@ti.com wrote:
> From: David Huang <d-huang@ti.com>
>
> Pick up latest version of ti-img-encode-decode with improvements
> to V4L2 decoder stream restart and slice map calculation, and
> encoder performance profiling options.
>
> Signed-off-by: David Huang <d-huang@ti.com>
> ---
>   .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb        | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> index 87ed70a8c48c..86d954756600 100644
> --- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> +++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> @@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://driver/common/dq.c;beginline=1;endline=16;md5=e015e28
>   
>   inherit module
>   
> -MACHINE_KERNEL_PR_append = "e"
> +MACHINE_KERNEL_PR_append = "f"
>   PR = "${MACHINE_KERNEL_PR}"
>   
>   COMPATIBLE_MACHINE = "j7-evm"
>   
> -SRCREV = "fe07667a9405f17f04f5d26de5b0ba0626fec807"
> +SRCREV = "030e50dd0c53ec8e7825c85479ac3208925bb58d"
>   
>   EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
>   TARGET_CC_ARCH += "${LDFLAGS}"
