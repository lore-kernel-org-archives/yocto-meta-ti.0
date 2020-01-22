Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.184.1579729166671091676
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2020 13:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gfGa5Atn;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00MLdP0V046839
	for <meta-ti@lists.yoctoproject.org>; Wed, 22 Jan 2020 15:39:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579729166;
	bh=80eOSkGTgssMzz4zG9t58LQ+LQfUO3+mVhhC1Sj/dYs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gfGa5Atn+cah6lPbIZUrvQ03QE3eq13b0eyYZ5t2K1vefVZJFivkvdoipUzYlQddn
	 Zu0I+0jL51KHi6b4XtJyCaBBWVE461VGfZqYGXVXiFRc9P75LEPRcHACSnU5IdPjgL
	 y8cAMx1hodrkNaVTTgI1pjV7HYASCNAuIDBdEkkg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00MLdPDj049564
	for <meta-ti@lists.yoctoproject.org>; Wed, 22 Jan 2020 15:39:25 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Jan 2020 15:39:25 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Jan 2020 15:39:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00MLdP0X034931;
	Wed, 22 Jan 2020 15:39:25 -0600
Date: Wed, 22 Jan 2020 16:39:25 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <d-huang@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <ajhernandez@ti.com>
Subject: Re: [meta-ti][thud][PATCH] ti-img-encode-decode: Update SRCREV to latest
Message-ID: <20200122213925.GD3658@beryl>
References: <20200121185653.15419-1-d-huang@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200121185653.15419-1-d-huang@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

David,

While at it, could you please remove hardcoding of the toolchain?
https://git.ti.com/cgit/jacinto7_multimedia/ti-img-encode-decode/tree/linux/decoder/Makefile#n167
https://git.ti.com/cgit/jacinto7_multimedia/ti-img-encode-decode/tree/linux/encoder/Makefile#n98

Should use CROSS_COMPILE instead. Thanks.

-- 
Denys


On Tue, Jan 21, 2020 at 12:56:53PM -0600, David Huang via Lists.Yoctoproject.Org wrote:
> From: David Huang <d-huang@ti.com>
> 
> Pick up latest version of ti-img-encode-decode with improvements
> to V4L2 decoder stream restart and slice map calculation, and
> encoder performance profiling options.
> 
> Signed-off-by: David Huang <d-huang@ti.com>
> ---
>  .../ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> index 87ed70a8c48c..86d954756600 100644
> --- a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> +++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> @@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://driver/common/dq.c;beginline=1;endline=16;md5=e015e28
>  
>  inherit module
>  
> -MACHINE_KERNEL_PR_append = "e"
> +MACHINE_KERNEL_PR_append = "f"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  COMPATIBLE_MACHINE = "j7-evm"
>  
> -SRCREV = "fe07667a9405f17f04f5d26de5b0ba0626fec807"
> +SRCREV = "030e50dd0c53ec8e7825c85479ac3208925bb58d"
>  
>  EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
>  TARGET_CC_ARCH += "${LDFLAGS}"
> -- 
> 2.17.1
> 

> 

