Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8704BC433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 13:57:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4487.1652363873236774823
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 May 2022 06:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PTL7swEq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24CDvnPl106548;
	Thu, 12 May 2022 08:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652363869;
	bh=b+bO07aaULm9LxJebgUgbDNS+vqLxg7PVY6mNxVWaM8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PTL7swEqjdwUpE9mAozLjB7xdzyXCvlfVMiH/EywDDm59tO2HTKPKzVuF03I4tWni
	 ky3q5+zdMTlmUsYsDHmPoPoYMtZuaiUavbzaX4HptulG6FTcvQj7uISscdE+S6gUf/
	 wWZXxjYIgjxGr7jiwl1oXM0upQBc8R3Hq/Mw7xZk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24CDvnML003091
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 May 2022 08:57:49 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 08:57:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 08:57:49 -0500
Received: from [172.24.152.130] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24CDvkk7030349;
	Thu, 12 May 2022 08:57:47 -0500
Message-ID: <2e0d6c43-5d99-ea35-7e2f-9c8b4a68da08@ti.com>
Date: Thu, 12 May 2022 19:27:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-ti][dunfell][PATCH] ti-sci-fw: Add DM firmware to deploy
 directory for am62xx-evm
Content-Language: en-US
To: Aparna M <a-m1@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <s-adivi@ti.com>
References: <20220512134657.31238-1-a-m1@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20220512134657.31238-1-a-m1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 May 2022 13:57:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14729


On 12/05/22 19:16, Aparna M wrote:
> Add DM firmware ipc_echo_testb_mcu1_0_release_strip.xer5f to deploy
> directory for am62xx-evm. This is required for building tispl.bin.
>
> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 099473b4..bb88633a 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -186,6 +186,7 @@ do_deploy_am62xx-evm-k3r5() {
>   	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
>   	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
>   	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
> +        install -m 644 ${S}/ti-dm/am62xx/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}/

What is SYSFW_TISCI being used for AM62 ? Any existing macros can't be 
used ?

Also is it changing indentation w.r.t previous line ?

>   }
>   
>   addtask deploy before do_build after do_compile

