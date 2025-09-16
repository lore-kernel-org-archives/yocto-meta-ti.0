Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63D7CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 10:10:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.15502.1758017442910591240
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 03:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=viAiK7sD;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: s-joshi@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58GAAg2F1701613
	for <meta-ti@lists.yoctoproject.org>; Tue, 16 Sep 2025 05:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758017442;
	bh=5aXYKn5noX+EM0BnFn8fO4jQQt7y/2RU2CtROR7Jbzg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=viAiK7sDPaglr76EP7S+m2eJj2sfzhLk4HwUBPZsBn1zjVn11bY0uTDHyFdJ3v4lo
	 gKjYynHpC6ZTwCEYHSXZ+hTiJBnYaPyOom+VU/VjO1gqz7qVTlPtZGZYcaLO68/MNY
	 DBiyCqYnxScGED+yMxl4X0vRM5O7/gLIvyxtRcoI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58GAAg95640354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 16 Sep 2025 05:10:42 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 16
 Sep 2025 05:10:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Sep 2025 05:10:41 -0500
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.173])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58GAAeO51152507;
	Tue, 16 Sep 2025 05:10:41 -0500
Date: Tue, 16 Sep 2025 15:40:40 +0530
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v3] optee: Update to 4.7.0 tag
Message-ID: <20250916101040.idydn7bq2w2rg4cp@ula0507357>
References: <20250912122406.523659-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250912122406.523659-1-s-joshi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Sep 2025 10:10:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19012

On 17:54-20250912, Suhaas Joshi wrote:
> Update optee_client, optee_examples, optee_os and optee_test to the
> newer 4.7.0 tag from the previous 4.6.0 one.
> 
> Further: meta-arm applies 0003-optee-enable-clang-support patch to
> optee_os. However, in a recent upstream commit [0], the line to which
> the patch applies was removed. Therefore the patch is no longer
> required. As a result, tell optee_os.bbappend file to remove it.
> 
> [0] https://github.com/OP-TEE/optee_os/commit/3d5c2dd8b59ae888434b3f86842828131f115d90
> 
> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> ---
> changes from v2:
> - Updated SRCREV, so that the TRNG commit is included.
> ---
>  .../recipes-security/optee/optee-client-ti-version.inc       | 4 ++--
>  .../recipes-security/optee/optee-examples-ti-version.inc     | 4 ++--
>  .../recipes-security/optee/optee-os-tadevkit_%.bbappend      | 4 ++++
>  meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc   | 5 ++---
>  meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend       | 4 ++++
>  meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc | 4 ++--
>  6 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index 86c92863..289ca5b5 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.6.0+git"
> -SRCREV = "02e7f9213b0d7db9c35ebf1e41e733fc9c5a3f75"
> +PV = "4.7.0+git"
> +SRCREV = "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> index 6c120be2..91dd5e60 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.6.0+git"
> -SRCREV = "5306d2c7c618bb4a91df17a2d5d79ae4701af4a3"
> +PV = "4.7.0+git"
> +SRCREV = "14321a0607db16099d158478b21a2b2e37b3a935"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> index 980f7a4b..407436a9 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
> @@ -6,4 +6,8 @@ require ${OPTEE_TI_VERSION}
>  OPTEE_TI_OVERRIDES = ""
>  OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
>  
> +SRC_URI:remove = " \
> +    file://0003-optee-enable-clang-support.patch \
> +"
> +
>  require ${OPTEE_TI_OVERRIDES}
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> index d9705a0b..0f040e6e 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> @@ -1,6 +1,5 @@
> -PV = "4.6.0+git"
> -SRCREV = "71785645fa6ce42db40dbf5a54e0eaedc4f61591"
> -
> +PV = "4.7.0+git"
> +SRCREV = "a9690ae39995af36a31b7a4f446f27ea0787e3a4"
>  SRC_URI:remove = " \
>      file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
>      file://0001-arm64.h-fix-compile-error-with-Clang.patch \
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> index 0cee127f..50f87199 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> @@ -6,4 +6,8 @@ require ${OPTEE_TI_VERSION}
>  OPTEE_TI_OVERRIDES = ""
>  OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
>  
> +SRC_URI:remove = " \
> +    file://0003-optee-enable-clang-support.patch \
> +"
> +
>  require ${OPTEE_TI_OVERRIDES}
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> index 35e780b3..d2593cb8 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> @@ -1,7 +1,7 @@
>  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
>  
> -PV = "4.6.0+git"
> -SRCREV = "a9e9495f4d57b97022008ad11198195e7e044c5d"
> +PV = "4.7.0+git"
> +SRCREV = "a15be9eca1b7e935917d834284726027dffc8cfb"
>  
>  SRC_URI:remove = " \
>      file://0001-xtest-stats-remove-unneeded-stat.h-include.patch \

Tested these changes on AM62P. Logs:
https://gist.github.com/jsuhaas22/67792bfda3f43146a6b8928f40fb72c7

Thanks
Suhaas

> -- 
> 2.40.0
> 

