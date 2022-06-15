Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7D9C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 09:41:34 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.2642.1655286092627382609
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 02:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Fbpyw5Rr;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25F9fUuA021388;
	Wed, 15 Jun 2022 04:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655286091;
	bh=l54Ol1PxV8N9auhlrycfJGFCKTChwB3NH8toTZxs158=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Fbpyw5RryQiBvK0sfdCXOXG9rRC9E9UKKvyAw6Cw/biE3oSfNrMxpMMKY6gkwRLPy
	 TD66HmPD0iMqwbn/DdehWdx2IttKhpUumRwsPfhkb2+V3BtoK6MzCShiQgRY2bIG9D
	 zr13LR+n9thHPThyO8KIMGKr31NLJFhXyY8M4UHI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25F9fURP016939
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Jun 2022 04:41:30 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 15
 Jun 2022 04:41:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 15 Jun 2022 04:41:30 -0500
Received: from [172.24.218.139] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25F9fSHL105669;
	Wed, 15 Jun 2022 04:41:29 -0500
Message-ID: <b04e83c0-fe10-46d2-3990-69bc717440ed@ti.com>
Date: Wed, 15 Jun 2022 15:11:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti][dunfell][PATCH v4 1/2] trusted-firmware-a: Update to
 latest upstream master
Content-Language: en-US
To: <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan Eatmon
	<reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20220615034736.29273-1-afd@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20220615034736.29273-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jun 2022 09:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14818



On 6/15/2022 9:17 AM, Andrew Davis via lists.yoctoproject.org wrote:
> For TF-A we work against upstream first, our fork has only been
> used in the rare cases we need to ship a feature before we can
> get it upstream. This is not currently the case so lets switch
> to upstream repo until there is a need for our fork.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>


> ---
>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 68bfa899..207f3dac 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,8 +1,6 @@
>   PV_k3 = "2.6"
>   LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
> -BRANCH_k3 = "ti-atf"
> -SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
> -SRCREV_tfa_k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
> +SRCREV_tfa_k3 = "453abc80b2eacbf2816c838e47e40f063227d934"
>   COMPATIBLE_MACHINE_k3 = "k3"
>   TFA_BUILD_TARGET_k3 = "all"
>   TFA_INSTALL_TARGET_k3 = "bl31"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14816): https://lists.yoctoproject.org/g/meta-ti/message/14816
> Mute This Topic: https://lists.yoctoproject.org/mt/91770154/2167429
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [praneeth@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

