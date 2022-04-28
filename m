Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE956C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 12:15:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.9435.1651148106825935129
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 05:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mB0p7QRN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23SCF44Z124638;
	Thu, 28 Apr 2022 07:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651148104;
	bh=AUpKdrbzagA0L3xOGlIxBfDVG1erIxhBdU3spHSnE/I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mB0p7QRNfk09y3XnprDZz6QzH1Vep2kV6v6XL0oYWtEPfyvXqlYtTqCMuetTM9m/r
	 83emv8eImgui/5PH9xTQnsUiy7SMSLAZh/e8QNddnYjy+L8L2urNnZ+ONAA0yVmxZW
	 lqScn1FBiaQxVXApOVpepKfEfSRWeBxsL8yC5qQA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23SCF4Pt075485
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Apr 2022 07:15:04 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 07:15:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 07:15:04 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23SCF3r7047345;
	Thu, 28 Apr 2022 07:15:03 -0500
Message-ID: <dc52c197-06b7-8a9f-3eb0-6725fa968fdd@ti.com>
Date: Thu, 28 Apr 2022 07:15:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [dunfell PATCH V2] recipes-kernel: setup-defconfig: Use SRCPV to
 update KERNEL_LOCALVERSION
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <devarsht@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <nikhil.nd@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>, <a-m1@ti.com>
References: <20220428031443.21064-1-nm@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220428031443.21064-1-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Apr 2022 12:15:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14633


Patch applied to dunfell-wip.


On 4/27/2022 22:14, Nishanth Menon wrote:
> Due to recent security update[1] in git, a subprocess will be unable
> to run git rev-parse to fetch revision.
> 
> So instead, use the SRCPV to parse the short commit ID and set the
> KERNEL_LOCALVERSION variable.
> 
> [1] https://github.blog/2022-04-12-git-security-vulnerability-announced/
> 
> Inspired-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Changes since V1:
> * Update to commit message and subjectline.
> 
> V1: https://lore.kernel.org/all/20220428030805.18623-1-nm@ti.com/
> 
>   recipes-kernel/linux/setup-defconfig.inc | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
> index 850a1dd8d613..1e97acc0ee63 100644
> --- a/recipes-kernel/linux/setup-defconfig.inc
> +++ b/recipes-kernel/linux/setup-defconfig.inc
> @@ -1,14 +1,6 @@
>   # KERNEL_LOCALVERSION can be set to add a tag to the end of the
>   # kernel version string.  such as the commit id
> -def get_git_revision(p):
> -    import subprocess
> -
> -    try:
> -        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE, universal_newlines=True).communicate()[0].rstrip()
> -    except OSError:
> -        return None
> -
> -KERNEL_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
> +KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
>   
>   # Check the defconfig file and see if it points to an in kernel
>   # defconfig that should be used, or if it is a complete config file

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

