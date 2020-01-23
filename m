Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.214.1579799117403497101
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jan 2020 09:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LevIQ9AS;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00NH5GG7105169
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2020 11:05:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579799116;
	bh=vkHtKW0JuNdekyjTyqMFGqkGEwI9UawDe4xB2WNXN/E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LevIQ9AShkYYEUW3U7RBdg/kkIsaUXjTNaVpq4vKeSXi3ZEcMS94k4ifKocmZ26Lb
	 zJMbFzkW+9jTJakMVj2uc2VzOijwlhM9/kjdeAF+dM4psHBrujDejMw28vLeZoaTmQ
	 A6xdsDgdfmCzF0pqEvXGu9OKVE4LEvE2Mh00haFc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00NH5GGN046867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2020 11:05:16 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 23
 Jan 2020 11:05:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 23 Jan 2020 11:05:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00NH5GCd083227;
	Thu, 23 Jan 2020 11:05:16 -0600
Date: Thu, 23 Jan 2020 12:05:16 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <d-huang@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <ajhernandez@ti.com>
Subject: Re: [meta-ti][thud][PATCH] ti-img-encode-decode: Update SRCREV to latest
Message-ID: <20200123170515.GN3658@beryl>
References: <20200123165856.26907-1-d-huang@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200123165856.26907-1-d-huang@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks!

On Thu, Jan 23, 2020 at 10:58:56AM -0600, David Huang via Lists.Yoctoproject.Org wrote:
> From: David Huang <d-huang@ti.com>
> 
> Pick up latest version of ti-img-encode-decode recipe
> with Makefiles using instead of hard coding

Is this message incomplete? Did you miss "using CROSS_COMPILE"? If that's the 
case and you have tested the recipe update, I can fix the commit message while 
merging. Please let me know. Thanks.

Denys


> aarch64-linux-gnu as the cross compiler.
> 
> Signed-off-by: David Huang <d-huang@ti.com>
> ---
>  .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> index 86d954756600..a1da9585e368 100644
> --- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> +++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> @@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://driver/common/dq.c;beginline=1;endline=16;md5=e015e28
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append = "f"
> +MACHINE_KERNEL_PR_append = "g"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  COMPATIBLE_MACHINE = "j7-evm"
>  
> -SRCREV = "030e50dd0c53ec8e7825c85479ac3208925bb58d"
> +SRCREV = "0eba3678300f649e49f03d92d1b624cf0e008008"
>  
>  EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
>  TARGET_CC_ARCH += "${LDFLAGS}"
> -- 
> 2.17.1
> 

> 

