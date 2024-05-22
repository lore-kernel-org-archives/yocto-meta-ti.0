Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00262C25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 08:02:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.4714.1716364926024773401
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 May 2024 01:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XUdYABnd;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44M824kS049471;
	Wed, 22 May 2024 03:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716364924;
	bh=R2OssRB8FgOeqD2Hmal2/Dqim3NPz/Nu3ouyvhBUjlo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XUdYABndzmgBp20G1QKLtp/lJ0TFsTKNbfGobwrJ3elfJbOHkrFDBNQ0p+Wt/WwnS
	 0njkr5mPLrs4yr+JwQw9iLH+kWIM39r6BKplpasMuQYwE2dlWG6x7M1DSn+bVvb09I
	 i6HyjyAh5g9qIOkGRybFCU8bnPuFgtyQHyqIBNWU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44M824D0043676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 May 2024 03:02:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 May 2024 03:02:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 May 2024 03:02:04 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44M821EE111366;
	Wed, 22 May 2024 03:02:01 -0500
Message-ID: <b907b417-61c9-449b-af22-9d9231a98968@ti.com>
Date: Wed, 22 May 2024 13:32:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH [Scarthgap/Master]] optee: Update to upstream 4.2.0
To: Kamlesh Gurudasani <kamlesh@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
        <afd@ti.com>, <m-chawdhry@ti.com>, <denys@konsulko.com>,
        <reatmon@ti.com>, <praneeth@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20240521-sg-optee-4-2-update-v1-1-5433865276a2@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240521-sg-optee-4-2-update-v1-1-5433865276a2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 May 2024 08:02:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17666

Hi Kamlesh,

On 22/05/24 12:13, Kamlesh Gurudasani wrote:
> Update all of the optee components to the upstream 4.2.0 version.
>
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
>   meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc   | 4 ++--
>   meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc | 2 +-
>   meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc       | 4 ++--
>   meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc     | 5 ++---
>   4 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index 16fbd6c5..31d59be8 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.1.0+git"
> -SRCREV = "f7e4ced15d1fefd073bbfc484fe0e1f74afe96c2"
> +PV = "4.2.0+git${SRCPV}"


A change in oe-core has dropped setting SRCPV [1]
Since it's now empty, we shouldn't use it when setting PV.

[1]: 
https://git.openembedded.org/openembedded-core/commit/?id=a8e7b0f932b9ea69b3a218fca18041676c65aba0


> +SRCREV = "3eac340a781c00ccd61b151b0e9c22a8c6e9f9f0"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> index 23cd7580..03e93c3c 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.0.0+git"
> +PV = "4.2.0+git${SRCPV}"
>   SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> index 9db67567..bfafff3c 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> @@ -1,5 +1,5 @@
> -PV = "4.1.0+git"
> -SRCREV = "012cdca49db398693903e05c42a254a3a0c0d8f2"
> +PV = "4.2.0+git${SRCPV}"


Same comment as above


> +SRCREV = "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
>   
>   # Fixes for pointing to 4.0.0 before upstream meta-arm
>   FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-4.0.0:"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> index 16b2dfc3..a7d048f6 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> @@ -1,6 +1,5 @@
> -PV = "4.1.0+git"
> -SRCREV = "2e1e7a9c9d659585566a75fc8802f4758c42bcb2"
> +PV = "4.2.0+git${SRCPV}"



Same comment as above


> +SRCREV = "526d5bac1b65f907f67c05cd07beca72fbab88dd"
>   
>   # Fixes for pointing to 4.0.0 before upstream meta-arm
>   SRC_URI:remove = "file://0001-xtest-regression_1000-remove-unneeded-stat.h-include.patch"
> -
>
> ---
> base-commit: de73fc7fe4e81196d4e4ee9054bb805c967bb73e
> change-id: 20240521-sg-optee-4-2-update-185fd5dc31d0
>
> Best regards,

