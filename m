Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.12.1601919393446891425
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 10:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=i1xpMOYz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095HaWAk002175
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 12:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601919392;
	bh=u85H8ZZ5gphtJvSTn8OLR2aV9XSsYtRfOm0DC6by4xM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=i1xpMOYzVzJ7MUnuZdAr2ONKPbZci/yI1woRUapdkKPcAQajBXrdyXyAyB81dAish
	 xP72wOj+UVuZugkkp/HyUmQW3HQZuelmFyUNGEqQOpS0eiSiXj15GkyKITpfDc17X2
	 LA11GxFB+pBMZ/cUC2oW0Vg8EqM2GZ6K2CttmkCw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095HaWbU114979
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 12:36:32 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 12:36:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 12:36:32 -0500
Received: from [10.250.37.2] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095HaVCY128276;
	Mon, 5 Oct 2020 12:36:31 -0500
Subject: Re: [meta-ti][master][patch][v2] ti-sci-fw: update imggen SRCREV to the latest
To: <prao@ti.com>, <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: <nikhil.nd@ti.com>, <vigneshr@ti.com>, <shyam.jagannathan@ti.com>,
        <piyali_g@ti.com>, <l-weaver@ti.com>
References: <20201005144611.31380-1-prao@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <00b5a4c7-4ad5-19f0-d502-54820e145e11@ti.com>
Date: Mon, 5 Oct 2020 12:36:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005144611.31380-1-prao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Praveen

On 10/5/20 9:46 AM, prao@ti.com wrote:
> From: Praveen Rao <prao@ti.com>
>
> Signed-off-by: Praveen Rao <prao@ti.com>
> ---
>   recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 183ac8a7..7d278815 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -7,7 +7,7 @@ PV = "2020.07-rc3"
>   
>   SRCREV = "f5438e998a7a8d23722fa4dcd1cdb62dec7a41d2"
>   BRANCH ?= "ti-linux-firmware"
> -SRCREV_imggen = "5b4d37b9bf41d58ff8c2f8dc98e5dac25e69ec56"
> +SRCREV_imggen = "09256d5c21e6281d224646c1d4163d4dd0925238"
>   SRCREV_FORMAT = "imggen"
>   
>   SRC_URI = " \

This failed to build for am65evm

http://lcpd.gt.design.ti.com/builds/arago-dunfell-next/prod/am65xx-evm/145408/logs/am65xx-evm-error-logs/ti-sci-fw_2020.07-rc3-r1_do_compile.log

Dan

