Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067EFC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 01:40:39 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.14543.1667439631173660329
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Nov 2022 18:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qhZ22spE;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A31eQLo024859;
	Wed, 2 Nov 2022 20:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1667439626;
	bh=L/a6RJZjFtoUJ4/3mBQpUu+UspoibJTrlU5C3n8neIs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qhZ22spEW0Asp76C+6QvVlDp8Azks61mLGja92WoZI6NcUwbkAYoiBp/+jrRnC44y
	 YQKho1nNIij/Mp+wojvYiTSMcye8uacacIPir4Qb5JE2qGCt3VLVAxYxUilruUsaUc
	 f27OjRk+7opyKqXMNUHNLbjivC/9ybBrYvI54gCA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A31eQoI025712
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Nov 2022 20:40:26 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 2 Nov
 2022 20:40:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 2 Nov 2022 20:40:26 -0500
Received: from [10.249.33.217] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A31ePQH018854;
	Wed, 2 Nov 2022 20:40:26 -0500
Message-ID: <43d6897a-0133-186a-68e2-3779fcfa7c3f@ti.com>
Date: Wed, 2 Nov 2022 20:40:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [dunfell][PATCH 1/2] ti-k3-secdev: include ti-paths.inc
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <1667427383-18305-1-git-send-email-denis@denix.org>
 <1667427383-18305-2-git-send-email-denis@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1667427383-18305-2-git-send-email-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 03 Nov 2022 01:40:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15219

On 11/2/22 5:16 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Include ti-paths.inc so TI_K3_SECDEV_INSTALL_DIR_RECIPE gets defined and
> artifacts are installed in the correct location.
> 
> Cc: Andrew Davis <afd@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   recipes-ti/secdev/ti-k3-secdev_git.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-ti/secdev/ti-k3-secdev_git.bb b/recipes-ti/secdev/ti-k3-secdev_git.bb
> index 28dbe9e..7196be9 100644
> --- a/recipes-ti/secdev/ti-k3-secdev_git.bb
> +++ b/recipes-ti/secdev/ti-k3-secdev_git.bb
> @@ -4,6 +4,8 @@ SECTION = "devel"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://manifest/k3-secdev-0.2-manifest.html;md5=f632a78870cc64550078d7b3cbac0892"
>   
> +require recipes-ti/includes/ti-paths.inc
> +

Seems like a rather big missing piece, how was this even working at all before?

I'm feeling there should be a better way to use the contents of -native packages
without putting all their content into some hard-coded directory. I wrote all
this in a hurry and just copied what the TI compilers were doing, might be
good to revisit this whole patch for kirkstone/master..

Acked-by: Andrew Davis <afd@ti.com>

>   # Native host tool only
>   COMPATIBLE_MACHINE = "null"
>   COMPATIBLE_MACHINE_class-native = "(.*)"

