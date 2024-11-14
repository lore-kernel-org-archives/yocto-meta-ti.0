Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63124D6A22D
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 20:41:27 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.4531.1731616886729859071
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Nov 2024 12:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yeuKflf6;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AEKfQjH2692713
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Nov 2024 14:41:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731616886;
	bh=CZBa/q+Z8X5rCisvanVEVNyDt6XjM0RGwjmHK1IROJg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yeuKflf6GgxFy2WbA+taYIcZ3K0gjS89g21J0+GqGB2yN4xGzU9Tr0xZZS1VwsXgw
	 vAEu2Wney6tMLqBzEHUFcfb45s8O6plInu70lv13ZAF1ctNhUnhq5YABUpjLhx/Vye
	 ldfoZp0io6PNl9HzAwlpMZOI1QxpSob2Ztv+QN6k=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AEKfQEo007716
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Nov 2024 14:41:26 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Nov 2024 14:41:25 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Nov 2024 14:41:25 -0600
Received: from [10.249.32.170] ([10.249.32.170])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AEKfPia051367;
	Thu, 14 Nov 2024 14:41:25 -0600
Message-ID: <1d44a9a7-3142-4215-8506-69a3ad735df4@ti.com>
Date: Thu, 14 Nov 2024 14:41:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v1] meta-ti: Linux configs:
 Bring selinux related configs
To: Aashvij Shenai <a-shenai@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <c-shilwant@ti.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <kamlesh@ti.com>
References: <20241114054808.2945905-1-a-shenai@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241114054808.2945905-1-a-shenai@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Nov 2024 20:41:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18068



On 11/13/2024 11:48 PM, Aashvij Shenai wrote:
> Kernel configs that are important for SELinux to be included in the
> Linux kernel are present in the meta-selinux layer.
> 
> Ideally, we wouldn't want to be calling a file from another
> layer since it would become messy. However, bringing those configs
> into meta-ti layer would hit maintainbility issues.
> 
> The root cause of this problem lies in the recipe name. While
> meta-selinux names their bbapend as linux_yocto_%.bbappend, TI has their
> recipe named as linux-ti-staging_%.bb
> 
> Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
> ---
>   .../linux/linux-ti-staging_%.bbappend             | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
> new file mode 100644
> index 00000000..460df5de
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
> @@ -0,0 +1,15 @@
> +# The meta-selinux layer includes an selinux.cfg file containing
> +# configs necessary for the Linux kernel to enable SELinux
> +
> +# In order to reduce maintainability issues, the file will
> +# be retained in meta-selinux layer
> +
> +FILESEXTRAPATHS:prepend := "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', '${TOPDIR}/../sources/meta-selinux/recipes-kernel/linux/files:', '', d)}"

NAK.  We cannot hard code paths like this.  This assumes several things 
about our layer-config and directory structure that is not present in 
all use cases of the meta-ti layer for all customers.  We cannot accept 
this patch as is.

I just tested the following:

require ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 
'recipes-kernel/linux/linux-yocto_selinux.inc', '', d)}

And it works fine.  It pulls in the file from meta-selinux without 
needing a bunch of other fluff.


> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'file://selinux.cfg', '', d)}"
> +
> +do_configure:append() {
> +    if echo "${DISTRO_FEATURES}" | grep -q "selinux"; then
> +        cat ${WORKDIR}/selinux.cfg >> ${B}/.config
> +    fi
> +}
> \ No newline at end of file

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

