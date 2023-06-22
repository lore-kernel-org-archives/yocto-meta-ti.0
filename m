Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F61EB64DB
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 11:51:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9200.1687434674258984675
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 04:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wYsqQ/Xx;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MBpCYx008624
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 06:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687434672;
	bh=MEUt3G9Zm33mAPGphoadX5u1eHF76WHwkTU6USzIG5I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wYsqQ/XxiIz2Q7ugHOdTtP+78PuVZaWDXXEYdU9Rku+IKRJB1mE6Ew108EW5qXtKj
	 2k5aSpg8fMOg/vUF906yWNsXxPxubPmGPiQy8Yy0wGIc9Ma2hTodxdnP98WB/I2OWL
	 Ki8Zix26IweIB/o0cBLZ6tg5wVDLNoLhtdkocCKw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MBpCYD113086
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 06:51:12 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 06:51:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 06:51:12 -0500
Received: from [10.249.34.224] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MBpCQU010685;
	Thu, 22 Jun 2023 06:51:12 -0500
Message-ID: <6c34e6f8-d064-775b-806a-799d27a037de@ti.com>
Date: Thu, 22 Jun 2023 06:51:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH master/kirkstone] ti-k3-secdev: update to the latest
 commit
Content-Language: en-US
To: Kamlesh Gurudasani <kamlesh@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>,
        <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20230622-core-sec-dev-bump-v1-1-988dbb925456@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230622-core-sec-dev-bump-v1-1-988dbb925456@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Jun 2023 11:51:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16775



On 6/22/2023 4:27 AM, Kamlesh Gurudasani wrote:
> Update to the latest commit
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
>   meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> index 87987ae0..e3267a23 100644
> --- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> +++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> @@ -15,7 +15,7 @@ COMPATIBLE_MACHINE:class-nativesdk = "(.*)"
>   GIT_URI = "git://git.ti.com/git/security-development-tools/core-secdev-k3.git"
>   GIT_PROTOCOL = "https"
>   GIT_BRANCH = "master"
> -GIT_SRCREV = "bba9cabaeee96f7f287385188ff289b46769a4bf"
> +GIT_SRCREV = "ed6951fd3877c6cac7f1237311f7278ac21634f3"

NAK.  This repo is under CICD control.  It looks like someone pushed 
directly to master and bypassed the master-next branch.  We need to get 
that fixed and then the recipe will be kept up to date automatically.


>   SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${GIT_BRANCH}"
>   SRCREV = "${GIT_SRCREV}"
> 
> ---
> base-commit: e15df9d32c5fb5980e7cc04398396e7d1a380806
> change-id: 20230622-core-sec-dev-bump-68311d9e7248
> 
> Best regards,

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

