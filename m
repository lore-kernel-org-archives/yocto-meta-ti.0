Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.73551.1597777941645178354
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 12:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PYfh3mJS;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: dmurphy@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21C62E0203E; Tue, 18 Aug 2020 12:12:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_MED autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.9 NICE_REPLY_A Looks like a legit reply (A)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7A17E0200A
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 12:12:18 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07IJCHUR128439
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 14:12:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597777937;
	bh=Mt8xi+YmS7E0MgUyS6BzA1x/QxhTK0NPMTlDn0uo5Yw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=PYfh3mJSga90YmCK4VhakXQFIhE4Wxu1h/JBHsFQoCRTbTqXbQdF/Kup7BBKV/zLp
	 NelHH5TIpgd7uR3PLOrNSRjSKiXCh9LmGfVcuHSKfQ2vodFnhRCgOoeBxGfRIFuh/T
	 igjXIwy+qRqzRn8RxnijifO5uEJ4FmF+AqgGrfvs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07IJCH2a063723
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 14:12:17 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 18
 Aug 2020 14:12:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 18 Aug 2020 14:12:17 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IJCHBJ129821;
	Tue, 18 Aug 2020 14:12:17 -0500
Subject: Re: [meta-ti][dunfell PATCH] recipes-kernel: linux-ti-staging: update SRCREV to latest
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@yoctoproject.org>,
        <denys@ti.com>
References: <20200818185140.31666-1-nikhil.nd@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <394acfd5-a381-f3d8-c9d0-fb59f0477d11@ti.com>
Date: Tue, 18 Aug 2020 14:12:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818185140.31666-1-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Nikhil

On 8/18/20 1:51 PM, Nikhil Devshatwar wrote:
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   recipes-kernel/linux/linux-ti-staging_5.4.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index cf1ecc6e..0e87f7d8 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -61,7 +61,7 @@ S = "${WORKDIR}/git"
>   
>   BRANCH = "ti-linux-5.4.y"
>   
> -SRCREV = "a32d62437eb9f2acd64a124c221de98d6f728bcc"
> +SRCREV = "da26e63e96f403b7415fdf7e0b45eeaba63ddbe0"
>   PV = "5.4.54+git${SRCPV}"
>   
>   # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild

Nack

I just updated the kernel to 5.4.58

Dan

