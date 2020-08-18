Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.72084.1597775979424916198
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 11:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vOyUtTl1;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: nikhil.nd@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A727CE0203E; Tue, 18 Aug 2020 11:39:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_MED autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.9 NICE_REPLY_A Looks like a legit reply (A)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D01EAE0200A
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 11:39:36 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07IIdZRf021853
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 13:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597775975;
	bh=qB5gkT8A3FWBqY/QwUYGjkaf/rdGUQlSauAFII8Gszw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=vOyUtTl1jgd72CBLudsz1TCfEfOkgiB7tU16ENDCvdKm/9VBBlh4FWjpzR0D2/myX
	 4/wkpAUAywfOa9cKUTGduuzgk91c80uqxH1PJu2NhOt6zfbdMqUqmtFD43Z8G7I+11
	 QLE1wWV/qDF2WKV9UY+PG38d8FWN0Yl+9bjQSqN0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07IIdZre018028
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 13:39:35 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 18
 Aug 2020 13:39:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 18 Aug 2020 13:39:35 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IIdXYj115103;
	Tue, 18 Aug 2020 13:39:34 -0500
Subject: Re: [meta-ti][dunfell PATCH] conf: machine: j7200-evm: Add Jailhouse overlay
To: <meta-ti@yoctoproject.org>, <denys@ti.com>, <dmurphy@ti.com>
References: <20200818183314.6089-1-nikhil.nd@ti.com>
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
Message-ID: <a3f96a66-0037-76cf-fe22-9dd364c6569e@ti.com>
Date: Wed, 19 Aug 2020 00:09:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818183314.6089-1-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 19/08/20 12:03 am, Nikhil Devshatwar wrote:
> j7200-evm supports virtualization with Jailhouse hypervisor.
> To use Jailhouse, kernel needs to boot with an additional
> DTB overlay. Include this in the list of DTBs for the machine.
> 
Apply this after the kernel recipe is updated to latest.
I assume Dan will send you the updated kernel recipe for rc1, that's why 
I am not sending one.

Regards,
Nikhil D

> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   conf/machine/j7200-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
> index d2a81771..dab6d8cb 100644
> --- a/conf/machine/j7200-evm.conf
> +++ b/conf/machine/j7200-evm.conf
> @@ -9,6 +9,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>   
>   KERNEL_DEVICETREE = " \
>       ti/k3-j7200-common-proc-board.dtb \
> +    ti/k3-j7200-common-proc-board-jailhouse.dtbo \
>   "
>   
>   UBOOT_MACHINE = "j7200_evm_a72_config"
> 
