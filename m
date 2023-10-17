Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EADCDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:46:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.216090.1697550376984846698
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 06:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f2NtOjbU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39HDkF3A034624
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 08:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697550375;
	bh=CUJdh9uT5SoCe9fc3xe8vLw1wCaF7ZNXxaqAnn38lxI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=f2NtOjbU6faNcP2bSCK1fQxy4lkcpIkyaY9YjHX+SjhjRvg3Eph4VgIHiSZ3rW1fd
	 thBauYijrnXpEPNHuHAsJhusw8d8cb36h/wgKnyJZJBUO62otvKIJO6KwXjlJKnyRc
	 ipuzbB/I/Pq3Px5002sforrq4ixqeAux0yKZMo/g=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39HDkFQA004539
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 08:46:15 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Oct 2023 08:46:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Oct 2023 08:46:15 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39HDkFhg021200;
	Tue, 17 Oct 2023 08:46:15 -0500
Message-ID: <3a112273-5625-4685-96ef-d9ce22e4d388@ti.com>
Date: Tue, 17 Oct 2023 08:46:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH] meta-ti-extras: recipes-ti: Update jailhouse
 SRC_URI to point to ti-jailhouse repo
Content-Language: en-US
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
References: <20231017114107.3791996-1-p-bhagat@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231017114107.3791996-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 13:46:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17133



On 10/17/2023 6:41 AM, Paresh Bhagat wrote:
> The ti-jailhouse repo is synced with the Siemens/jailhouse
> at https://github.com/siemens/jailhouse. Use this for
> development and build for TI devices.

Is this TI repo a perfect clone of the Siemens' repo?  Or is a loose 
copy with patches from TI on top of it?


> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> index 1c63b400..a96a7831 100644
> --- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> @@ -19,7 +19,7 @@ SRCREV = "e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560"
>   BRANCH = "master"
>   
>   SRC_URI = " \
> -    git://github.com/siemens/jailhouse.git;protocol=https;branch=${BRANCH} \
> +    git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
>       file://0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch \
>       file://0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch \
>       file://0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

