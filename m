Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2282FC7EE2E
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:20:33 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3479.1686619230458086461
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 18:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Gee573OU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35D1KPEb006789;
	Mon, 12 Jun 2023 20:20:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686619225;
	bh=wByVALbI1I018H0b2oT3G49n/r2D5oBlkdEI4h2WiOs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Gee573OUI7RP2r13f2NEMDToUaMr+UxniWfeObMoyIEAYL8yW2xaaX22OETF53udb
	 QRrCaDG5KEAmLDqx5BccGef9rHc+8LFGmvPDoMbL3Iwf2e057lVDMiGIy3I9Q4Bt/9
	 wU+Io4TxytCyqDgr8gcg/zdYF9OJztJfqItwLe44=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35D1KPe6002395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Jun 2023 20:20:25 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Jun 2023 20:20:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Jun 2023 20:20:24 -0500
Received: from [10.249.33.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35D1KODb006896;
	Mon, 12 Jun 2023 20:20:24 -0500
Message-ID: <cb47bf55-f923-3ce1-39f9-48726531b803@ti.com>
Date: Mon, 12 Jun 2023 20:20:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-ti][master/kirkstone][RFC] ti-extras: Add support for extra
 kernel/u-boot features
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230611195444.6162-1-reatmon@ti.com>
 <20230612194229.GQ9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230612194229.GQ9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Jun 2023 01:20:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16711



On 6/12/2023 2:42 PM, Denys Dmytriyenko wrote:
> Thanks, Ryan, for taking a stab at it after our discussion on Friday - this
> looks very promising!
> 
> I have few minor comments/questions:
> 
> 1. Should COMPATIBLE_MACHINE be a bit broarder and include "am62xx" SoC family
> and not just the EVM? Also, ti-extras only enabled for am62x for now?

Yes.  It should be a little broader.  And yes, as of right now it is 
only enabled for am62x.

> 2. Was there a specific reason to use a weak ??= in KERNEL_GIT_URI? Doesn't
> seem to be needed for UBOOT_GIT_URI...

No.  I was playing around with ??= and thought I had fixed them all.  It 
should be cleaned up as well.

> 3. Naming - TI_EXTRAS vs TI_EXPERIMENTS? Should we check for the proper use
> of "tie-*" namespace before making it a MACHINEOVERRIDES, any safeguards?

I'm not married to the TI_EXTRAS.  That (and the include file names) can 
easily be changed to experiments.

Can you give an example of checking for the tie- before adding it to M 
MACHINEOVERRIDES?  I'm always up for making things more bulletproof.



> 
> On Sun, Jun 11, 2023 at 02:54:44PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> From: Paresh Bhagat <p-bhagat@ti.com>
>>
>> There are some features that will either never be accepted into the
>> upstream kernel, or are not ready to be accepted.  ti-extras allows for
>> controlling the kernel and u-boot repos, breanches, and srcrevs to gain
>> access to those features via the TI_EXTRAS variable in the local.conf
>> file.
>>
>> Initial support for TI_EXTRAS=tie-jailhouse is being added by this
>> patch.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>
>> RFC
>>
>> This is a pass at reworking the logic for adding support for jailhouse
>> behind a more extensible TI_EXTRAS system.  Please comment on it.
>>
>>
>>
>>
>>   meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf      |  1 +
>>   meta-ti-bsp/conf/machine/am62xx-evm.conf           |  1 +
>>   meta-ti-bsp/conf/machine/include/ti-extras.inc     |  5 +++++
>>   meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc       | 11 +++++++++++
>>   .../u-boot/u-boot-ti-staging_2023.04.bb            |  2 ++
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc       |  2 +-
>>   .../recipes-kernel/linux/linux-ti-staging_6.1.bb   |  7 ++++---
>>   meta-ti-bsp/recipes-kernel/linux/ti-extras.inc     | 14 ++++++++++++++
>>   .../recipes-ti/jailhouse/jailhouse_git.bb          |  2 ++
>>   9 files changed, 41 insertions(+), 4 deletions(-)
>>   create mode 100644 meta-ti-bsp/conf/machine/include/ti-extras.inc
>>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>> index 9889ae38..548369ca 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
>>   
>>   require conf/machine/include/k3r5.inc
>> +require conf/machine/include/ti-extras.inc
>>   
>>   SYSFW_SOC = "am62x"
>>   SYSFW_CONFIG = "evm"
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> index c4357be3..082a1ae7 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> @@ -3,6 +3,7 @@
>>   #@DESCRIPTION: Machine configuration for the TI AM62XX EVM
>>   
>>   require conf/machine/include/am62xx.inc
>> +require conf/machine/include/ti-extras.inc
>>   
>>   KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
>>   
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-extras.inc b/meta-ti-bsp/conf/machine/include/ti-extras.inc
>> new file mode 100644
>> index 00000000..59eef952
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/include/ti-extras.inc
>> @@ -0,0 +1,5 @@
>> +# Add TI_EXTRAS to machine overrides so we get access to e.g. 'jailhouse'
>> +
>> +TI_EXTRAS ??= ""
>> +MACHINEOVERRIDES =. "${@['', '${TI_EXTRAS}:']['${TI_EXTRAS}' != '']}"
>> +
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
>> new file mode 100644
>> index 00000000..e5e1cc10
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
>> @@ -0,0 +1,11 @@
>> +
>> +# This will have priority over generic uboot path
>> +
>> +BRANCH = "ti-u-boot-2023.04"
>> +BRANCH:tie-jailhouse = "ti-u-boot-2023.04-jailhouse"
>> +
>> +SRCREV = "010afc1fe7a1412f92363c8af69c848d76a53e42"
>> +SRCREV:tie-jailhouse = "79615e1c99b9aa73948f811f5f866cff2e34dc37"
>> +
>> +UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
>> +
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> index f4c5e88c..4bde0256 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
>> @@ -1,5 +1,7 @@
>>   require u-boot-ti.inc
>>   
>> +include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
>> +
>>   LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
>>   
>>   PR = "r0"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index f29b089e..f3285c23 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -16,7 +16,7 @@ LICENSE = "GPL-2.0-or-later"
>>   LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
>>   
>>   BRANCH ?= "master"
>> -UBOOT_GIT_URI = "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
>> +UBOOT_GIT_URI ?= "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
>>   UBOOT_GIT_PROTOCOL = "https"
>>   SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
>>   
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> index 0b36575b..2b84b6b5 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> @@ -9,6 +9,7 @@ require recipes-kernel/linux/setup-defconfig.inc
>>   require recipes-kernel/linux/kernel-rdepends.inc
>>   require recipes-kernel/linux/ti-kernel.inc
>>   include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>> +include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
>>   
>>   DEPENDS += "gmp-native libmpc-native"
>>   
>> @@ -20,16 +21,16 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>>   
>>   S = "${WORKDIR}/git"
>>   
>> -BRANCH = "ti-linux-6.1.y"
>> +BRANCH ?= "ti-linux-6.1.y"
>>   
>> -SRCREV = "7124dee9779a40c52c52331c3ba6ccc84f357380"
>> +SRCREV ?= "7124dee9779a40c52c52331c3ba6ccc84f357380"
>>   PV = "6.1.26+git${SRCPV}"
>>   
>>   # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>>   MACHINE_KERNEL_PR:append = "b"
>>   PR = "${MACHINE_KERNEL_PR}"
>>   
>> -KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>> +KERNEL_GIT_URI ??= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>>   KERNEL_GIT_PROTOCOL = "https"
>>   SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>>               file://defconfig"
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
>> new file mode 100644
>> index 00000000..f9fdd57a
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
>> @@ -0,0 +1,14 @@
>> +
>> +# Use different commit, repo and branch for TI extras build
>> +# This will have priority over generic rt path
>> +
>> +COMPATIBLE_MACHINE = "am62xx-evm"
>> +
>> +BRANCH = "ti-linux-6.1.y"
>> +BRANCH:tie-jailhouse = "ti-linux-6.1.y-jailhouse"
>> +
>> +SRCREV = "30bcc25e7cb1b25667db88d61828728f0f0b5f4b"
>> +SRCREV:tie-jailhouse = "0ed0dec2462b805b0188fe080895adc437871549"
>> +
>> +KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
>> +
>> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>> index 05cc21b3..eb4a98f7 100644
>> --- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
>> @@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = " \
>>       file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
>>   "
>>   
>> +COMPATIBLE_MACHINE = "am62xx-evm"
>> +
>>   TARGET_CC_ARCH += "${LDFLAGS}"
>>   
>>   PV = "0.12+git${SRCPV}"
>> -- 
>> 2.17.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

