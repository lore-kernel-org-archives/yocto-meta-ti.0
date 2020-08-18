Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.72101.1597776028454844832
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 11:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Bc/Nd7U8;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51494E0203E; Tue, 18 Aug 2020 11:40:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44F73E0200A
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 11:40:27 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07IIeRiW022100
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 13:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597776027;
	bh=rPFAZHvKEHv+38OLsxYnjcHtCMbNBcPmRIMQP+s+QkM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Bc/Nd7U8MWwM2nXV6UL8u7hOjO43LIuDHIbelMyRWjgBNE9v2EC5lSc1Q3610wI5m
	 /xH9CJwoFa7rmsPwH8GwzUMlBh51GZPpCceqOGmCjWd1aQAFaLRTxT9pvUGIlqJNxD
	 l/J+Lb9BD9cQP+HOwa8vDjWoP+YXJjLYZaqEF16k=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07IIeQ2W019693
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 13:40:26 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 18
 Aug 2020 13:40:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 18 Aug 2020 13:40:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IIeQqR031071;
	Tue, 18 Aug 2020 13:40:26 -0500
Date: Tue, 18 Aug 2020 14:40:26 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
CC: <meta-ti@yoctoproject.org>, <dmurphy@ti.com>
Subject: Re: [meta-ti][dunfell PATCH] conf: machine: j7200-evm: Add Jailhouse overlay
Message-ID: <20200818184026.GJ10642@beryl>
References: <20200818183314.6089-1-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200818183314.6089-1-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This needs kernel update.

On Wed, Aug 19, 2020 at 12:03:14AM +0530, Nikhil Devshatwar wrote:
> j7200-evm supports virtualization with Jailhouse hypervisor.
> To use Jailhouse, kernel needs to boot with an additional
> DTB overlay. Include this in the list of DTBs for the machine.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  conf/machine/j7200-evm.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
> index d2a81771..dab6d8cb 100644
> --- a/conf/machine/j7200-evm.conf
> +++ b/conf/machine/j7200-evm.conf
> @@ -9,6 +9,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
>  KERNEL_DEVICETREE = " \
>      ti/k3-j7200-common-proc-board.dtb \
> +    ti/k3-j7200-common-proc-board-jailhouse.dtbo \
>  "
>  
>  UBOOT_MACHINE = "j7200_evm_a72_config"
> -- 
> 2.17.1
> 
