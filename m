Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C121D6A22E
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 20:41:37 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.4532.1731616891906061009
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Nov 2024 12:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qhQzVDg2;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AEKfTGE2692722
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 14 Nov 2024 14:41:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731616889;
	bh=FvE2aGpJ226pl8UbUD0+ErQuXbsB3MtiTLFACfTX+iQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qhQzVDg2kBZl3GzaqQiK97WdqxQxKN6Zz2whNobcni2zKi0cmdDaLXXek5I6hN/q3
	 mcGnODChO9emZGAFtiYp/Q4Agd2l4+ucPO8n7Kqh//0Rrid9P3VtFkXhVd9HohEqq8
	 feRysMJfpvogWMZofFybnfS1Nl1fxLhC5MDRDRRY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AEKfT3Z008254;
	Thu, 14 Nov 2024 14:41:29 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Nov 2024 14:41:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Nov 2024 14:41:28 -0600
Received: from [10.249.32.170] ([10.249.32.170])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AEKfPib051367;
	Thu, 14 Nov 2024 14:41:28 -0600
Message-ID: <1825b1b0-b0b7-459e-8639-8b67a18bc144@ti.com>
Date: Thu, 14 Nov 2024 14:41:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v1] meta-ti: Linux configs:
 Bring selinux related configs
To: Denys Dmytriyenko <denis@denix.org>, <a-shenai@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <c-shilwant@ti.com>, <praneeth@ti.com>,
        <vigneshr@ti.com>, <kamlesh@ti.com>
References: <20241114054808.2945905-1-a-shenai@ti.com>
 <20241114191741.GS20070@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241114191741.GS20070@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Nov 2024 20:41:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18069



On 11/14/2024 1:17 PM, Denys Dmytriyenko wrote:
> There are several issues with the patch itself, but that is secondary.
> 
> The primary issue is that this adds a new layer dependency to meta-ti-bsp
> (which is also not explicitly configured in layer.conf) - that is a very
> undesirable thing for a BSP layer.

That is a very good point.  I just sent my own reply to this patch 
listing the issues with it.  But this is a very very good point.

Question though... if the inclusion of the setup files in meta-selinux 
are hidden behind a DISTRO_FEATURES then are we really adding a 
dependency on meta-selinux?  Or are we adding a conditional dependency 
that assumes that if you are turning on "selinux" then meta-selinux must 
be in the bblayers.conf?




> This should be done in a Distro or Product layer (I'm not even shure
> meta-arago-distro should have this by default, to be honest).
> 
> 
> On Thu, Nov 14, 2024 at 11:18:08AM +0530, Aashvij Shenai via lists.yoctoproject.org wrote:
>> Kernel configs that are important for SELinux to be included in the
>> Linux kernel are present in the meta-selinux layer.
>>
>> Ideally, we wouldn't want to be calling a file from another
>> layer since it would become messy. However, bringing those configs
>> into meta-ti layer would hit maintainbility issues.
>>
>> The root cause of this problem lies in the recipe name. While
>> meta-selinux names their bbapend as linux_yocto_%.bbappend, TI has their
>> recipe named as linux-ti-staging_%.bb
>>
>> Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
>> ---
>>   .../linux/linux-ti-staging_%.bbappend             | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
>> new file mode 100644
>> index 00000000..460df5de
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_%.bbappend
>> @@ -0,0 +1,15 @@
>> +# The meta-selinux layer includes an selinux.cfg file containing
>> +# configs necessary for the Linux kernel to enable SELinux
>> +
>> +# In order to reduce maintainability issues, the file will
>> +# be retained in meta-selinux layer
>> +
>> +FILESEXTRAPATHS:prepend := "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', '${TOPDIR}/../sources/meta-selinux/recipes-kernel/linux/files:', '', d)}"
>> +
>> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'file://selinux.cfg', '', d)}"
>> +
>> +do_configure:append() {
>> +    if echo "${DISTRO_FEATURES}" | grep -q "selinux"; then
>> +        cat ${WORKDIR}/selinux.cfg >> ${B}/.config
>> +    fi
>> +}
>> \ No newline at end of file
>> -- 
>> 2.34.1
>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

