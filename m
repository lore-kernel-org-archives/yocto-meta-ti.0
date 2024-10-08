Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65ACCF0422
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 20:50:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.6656.1728420631817382614
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 13:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RuA6UMg+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 498KoRkm032564;
	Tue, 8 Oct 2024 15:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728420627;
	bh=3+uGAqyux8I7wi+l703Xpqs3KVqxFn4n0O8JC1Q5gHw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RuA6UMg+PTdPAi1KLSXZ8ssfSSx/FfUXdgOylJ09yem7fTz9jfPLaw+syjy1KMP9l
	 y6fEDaAK+w6g+FplxyUjkjCafOF0f38cwqVKx8CxCkQrzBboyzK+t0icAg/R6rQbuZ
	 En0N/9Kf3RlB6t8xO3h/+0JENybNCf20AVouWED4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 498KoRin015138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Oct 2024 15:50:27 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Oct 2024 15:50:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Oct 2024 15:50:27 -0500
Received: from [10.249.35.83] ([10.249.35.83])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498KoQ8P066955;
	Tue, 8 Oct 2024 15:50:26 -0500
Message-ID: <1f0234d6-ed96-4e75-b09f-e8827d54d6ed@ti.com>
Date: Tue, 8 Oct 2024 15:50:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/4] linux-ti-staging: Add
 v6.12 recipe
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20241004151857.24578-1-reatmon@ti.com>
 <20241008195811.GK14676@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20241008195811.GK14676@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 20:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17994



On 10/8/2024 2:58 PM, Denys Dmytriyenko wrote:
> This might have been easier to review with --find-copies-harder flag...
> 
> And I was wondering if setting KERNEL_PATCHES would be cleaner in the
> corresponding recipes, instead of globally in ti-kernel.inc?

It might be.  I'll look into it and send another patch to clean it up if 
it makes sense.


> 
> On Fri, Oct 04, 2024 at 10:18:54AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Adding needed recipes for initial testing and development of the 6.12
>> kernel for the next LTS.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../linux/linux-ti-staging-6.12/defconfig     |  2 +
>>   .../linux/linux-ti-staging-6.12/k3/defconfig  |  2 +
>>   .../linux-ti-staging-6.12/omapl138/defconfig  |  1 +
>>   .../linux-ti-staging-6.12/ti33x/defconfig     |  2 +
>>   .../linux-ti-staging-6.12/ti43x/defconfig     |  2 +
>>   .../linux/linux-ti-staging-rt-6.12/defconfig  |  2 +
>>   .../linux-ti-staging-rt-6.12/k3/defconfig     |  2 +
>>   .../omapl138/defconfig                        |  2 +
>>   .../linux-ti-staging-rt-6.12/ti33x/defconfig  |  2 +
>>   .../linux-ti-staging-rt-6.12/ti43x/defconfig  |  2 +
>>   .../linux/linux-ti-staging-rt_6.12.bb         |  9 +++++
>>   .../linux-ti-staging-systest-6.12/defconfig   |  2 +
>>   .../k3/defconfig                              |  2 +
>>   .../omapl138/defconfig                        |  1 +
>>   .../linux/linux-ti-staging-systest_6.12.bb    |  7 ++++
>>   .../linux/linux-ti-staging_6.12.bb            | 40 +++++++++++++++++++
>>   .../recipes-kernel/linux/ti-kernel.inc        |  4 ++
>>   17 files changed, 84 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/omapl138/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/omapl138/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/k3/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/omapl138/defconfig
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
>> new file mode 100644
>> index 00000000..9d579e41
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=multi_v7_defconfig
>> +config-fragment=
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
>> new file mode 100644
>> index 00000000..fd07b34e
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=defconfig
>> +config-fragment=
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/omapl138/defconfig
>> new file mode 100644
>> index 00000000..099493af
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/omapl138/defconfig
>> @@ -0,0 +1 @@
>> +use-kernel-config=davinci_all_defconfig
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
>> new file mode 100644
>> index 00000000..9d579e41
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti33x/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=multi_v7_defconfig
>> +config-fragment=
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
>> new file mode 100644
>> index 00000000..9d579e41
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/ti43x/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=multi_v7_defconfig
>> +config-fragment=
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
>> new file mode 100644
>> index 00000000..9d579e41
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=multi_v7_defconfig
>> +config-fragment=
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig
>> new file mode 100644
>> index 00000000..fd07b34e
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=defconfig
>> +config-fragment=
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/omapl138/defconfig
>> new file mode 100644
>> index 00000000..3d890b6e
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/omapl138/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=davinci_all_defconfig
>> +config-fragment=
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
>> new file mode 100644
>> index 00000000..9d579e41
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti33x/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=multi_v7_defconfig
>> +config-fragment=
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
>> new file mode 100644
>> index 00000000..9d579e41
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/ti43x/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=multi_v7_defconfig
>> +config-fragment=
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
>> new file mode 100644
>> index 00000000..9e5c4ee4
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
>> @@ -0,0 +1,9 @@
>> +require linux-ti-staging_6.12.bb
>> +
>> +KERNEL_LOCALVERSION:append = "-rt"
>> +
>> +# Look in the generic major.minor directory for files
>> +# This will have priority over generic non-rt path
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
>> +
>> +include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/defconfig
>> new file mode 100644
>> index 00000000..9d579e41
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=multi_v7_defconfig
>> +config-fragment=
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/k3/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/k3/defconfig
>> new file mode 100644
>> index 00000000..fd07b34e
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/k3/defconfig
>> @@ -0,0 +1,2 @@
>> +use-kernel-config=defconfig
>> +config-fragment=
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/omapl138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/omapl138/defconfig
>> new file mode 100644
>> index 00000000..099493af
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest-6.12/omapl138/defconfig
>> @@ -0,0 +1 @@
>> +use-kernel-config=davinci_all_defconfig
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
>> new file mode 100644
>> index 00000000..8ce23368
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
>> @@ -0,0 +1,7 @@
>> +require linux-ti-staging_6.12.bb
>> +
>> +DEFAULT_PREFERENCE = "-1"
>> +
>> +# Look in the generic major.minor directory for files
>> +# This will have priority over generic non-rt path
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
>> new file mode 100644
>> index 00000000..f6f8732b
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
>> @@ -0,0 +1,40 @@
>> +SECTION = "kernel"
>> +SUMMARY = "Linux kernel for TI devices"
>> +LICENSE = "GPL-2.0-only"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>> +
>> +inherit ti-secdev
>> +inherit kernel
>> +
>> +DEFAULT_PREFERENCE = "-1"
>> +
>> +require recipes-kernel/linux/setup-defconfig.inc
>> +require recipes-kernel/linux/ti-kernel.inc
>> +include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>> +include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
>> +
>> +DEPENDS += "gmp-native libmpc-native"
>> +
>> +# Look in the generic major.minor directory for files
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
>> +
>> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>> +		      ${EXTRA_DTC_ARGS}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +BRANCH ?= "ti-linux-6.12.y"
>> +
>> +SRCREV ?= "9852d85ec9d492ebef56dc5f229416c925758edc"
>> +PV = "6.12-rc1+git"
>> +
>> +KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>> +KERNEL_GIT_PROTOCOL = "https"
>> +SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>> +            file://defconfig"
>> +
>> +# Special configuration for remoteproc/rpmsg IPC modules
>> +module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
>> +module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
>> +module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
>> +KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>> index 4bcbc27e..09cfdb12 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>> @@ -20,6 +20,10 @@ KERNEL_PATCHES:bsp-mainline = " \
>>       file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
>>   "
>>   
>> +KERNEL_PATCHES:bsp-ti-6_12 = " \
>> +    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
>> +"
>> +
>>   KERNEL_PATCHES:bsp-ti-6_6 = " \
>>       file://0001-vt-conmakehash-improve-reproducibility.patch \
>>   "
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

