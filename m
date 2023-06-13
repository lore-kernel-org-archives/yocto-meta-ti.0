Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467FBC7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 10:51:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.10068.1686653509337290257
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 03:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=C+QwRegc;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35DAplK1042514;
	Tue, 13 Jun 2023 05:51:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686653507;
	bh=nAZfm3hKKedRKIRL8F0S9OY8Bfm0Fcm3W2d1t4uSyDY=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=C+QwRegcOfukEgCleDJ6KtSUU9fznLhJavTG7bRxE/uRE2sHcwArU6g+5XmN55hDz
	 wu5Am/yy7gbh2zaPTplFZuMxSLuVJolm2hHBpdGnNthr3MKkqUnrhTuVN4GJlekgT8
	 Z0aIdHnmpt23+HhJ7H3YhDvHRWOTZ7Ln3m1W6UKk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35DApl40052640
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Jun 2023 05:51:47 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Jun 2023 05:51:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Jun 2023 05:51:47 -0500
Received: from [172.24.145.229] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35DApiuB013686;
	Tue, 13 Jun 2023 05:51:45 -0500
Message-ID: <3bbba138-a929-3789-1b4c-ab7d38423810@ti.com>
Date: Tue, 13 Jun 2023 16:21:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] [meta-ti][master/kirkstone][RFC] ti-extras: Add
 support for extra kernel/u-boot features
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230611195444.6162-1-reatmon@ti.com>
CC: <g-gupta@ti.com>, <khasim@ti.com>, "Shilwant, Chirag" <c-shilwant@ti.com>,
        <s-adivi@ti.com>
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <20230611195444.6162-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Jun 2023 10:51:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16712


On 12/06/23 01:24, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Paresh Bhagat <p-bhagat@ti.com>
>
> There are some features that will either never be accepted into the
> upstream kernel, or are not ready to be accepted.  ti-extras allows for
> controlling the kernel and u-boot repos, breanches, and srcrevs to gain
> access to those features via the TI_EXTRAS variable in the local.conf
> file.
>
> Initial support for TI_EXTRAS=tie-jailhouse is being added by this
> patch.
>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>
> RFC
>
> This is a pass at reworking the logic for adding support for jailhouse
> behind a more extensible TI_EXTRAS system.  Please comment on it.
>
Acked-by: Paresh Bhagat <p-bhagat@ti.com>
>
>
>   meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf      |  1 +
>   meta-ti-bsp/conf/machine/am62xx-evm.conf           |  1 +
>   meta-ti-bsp/conf/machine/include/ti-extras.inc     |  5 +++++
>   meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc       | 11 +++++++++++
>   .../u-boot/u-boot-ti-staging_2023.04.bb            |  2 ++
>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc       |  2 +-
>   .../recipes-kernel/linux/linux-ti-staging_6.1.bb   |  7 ++++---
>   meta-ti-bsp/recipes-kernel/linux/ti-extras.inc     | 14 ++++++++++++++
>   .../recipes-ti/jailhouse/jailhouse_git.bb          |  2 ++
>   9 files changed, 41 insertions(+), 4 deletions(-)
>   create mode 100644 meta-ti-bsp/conf/machine/include/ti-extras.inc
>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
>
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> index 9889ae38..548369ca 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> @@ -3,6 +3,7 @@
>   #@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
>   
>   require conf/machine/include/k3r5.inc
> +require conf/machine/include/ti-extras.inc
>   
>   SYSFW_SOC = "am62x"
>   SYSFW_CONFIG = "evm"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> index c4357be3..082a1ae7 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> @@ -3,6 +3,7 @@
>   #@DESCRIPTION: Machine configuration for the TI AM62XX EVM
>   
>   require conf/machine/include/am62xx.inc
> +require conf/machine/include/ti-extras.inc
>   
>   KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
>   
> diff --git a/meta-ti-bsp/conf/machine/include/ti-extras.inc b/meta-ti-bsp/conf/machine/include/ti-extras.inc
> new file mode 100644
> index 00000000..59eef952
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/include/ti-extras.inc
> @@ -0,0 +1,5 @@
> +# Add TI_EXTRAS to machine overrides so we get access to e.g. 'jailhouse'
> +
> +TI_EXTRAS ??= ""
> +MACHINEOVERRIDES =. "${@['', '${TI_EXTRAS}:']['${TI_EXTRAS}' != '']}"
> +
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
> new file mode 100644
> index 00000000..e5e1cc10
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
> @@ -0,0 +1,11 @@
> +
> +# This will have priority over generic uboot path
> +
> +BRANCH = "ti-u-boot-2023.04"
> +BRANCH:tie-jailhouse = "ti-u-boot-2023.04-jailhouse"
> +
> +SRCREV = "010afc1fe7a1412f92363c8af69c848d76a53e42"
> +SRCREV:tie-jailhouse = "79615e1c99b9aa73948f811f5f866cff2e34dc37"
> +
> +UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
> +
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> index f4c5e88c..4bde0256 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> @@ -1,5 +1,7 @@
>   require u-boot-ti.inc
>   
> +include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
> +
>   LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
>   
>   PR = "r0"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index f29b089e..f3285c23 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -16,7 +16,7 @@ LICENSE = "GPL-2.0-or-later"
>   LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
>   
>   BRANCH ?= "master"
> -UBOOT_GIT_URI = "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
> +UBOOT_GIT_URI ?= "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
>   UBOOT_GIT_PROTOCOL = "https"
>   SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
>   
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> index 0b36575b..2b84b6b5 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
> @@ -9,6 +9,7 @@ require recipes-kernel/linux/setup-defconfig.inc
>   require recipes-kernel/linux/kernel-rdepends.inc
>   require recipes-kernel/linux/ti-kernel.inc
>   include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
> +include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
>   
>   DEPENDS += "gmp-native libmpc-native"
>   
> @@ -20,16 +21,16 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
>   
>   S = "${WORKDIR}/git"
>   
> -BRANCH = "ti-linux-6.1.y"
> +BRANCH ?= "ti-linux-6.1.y"
>   
> -SRCREV = "7124dee9779a40c52c52331c3ba6ccc84f357380"
> +SRCREV ?= "7124dee9779a40c52c52331c3ba6ccc84f357380"
>   PV = "6.1.26+git${SRCPV}"
>   
>   # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>   MACHINE_KERNEL_PR:append = "b"
>   PR = "${MACHINE_KERNEL_PR}"
>   
> -KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
> +KERNEL_GIT_URI ??= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
>   KERNEL_GIT_PROTOCOL = "https"
>   SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>               file://defconfig"
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
> new file mode 100644
> index 00000000..f9fdd57a
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
> @@ -0,0 +1,14 @@
> +
> +# Use different commit, repo and branch for TI extras build
> +# This will have priority over generic rt path
> +
> +COMPATIBLE_MACHINE = "am62xx-evm"
> +
> +BRANCH = "ti-linux-6.1.y"
> +BRANCH:tie-jailhouse = "ti-linux-6.1.y-jailhouse"
> +
> +SRCREV = "30bcc25e7cb1b25667db88d61828728f0f0b5f4b"
> +SRCREV:tie-jailhouse = "0ed0dec2462b805b0188fe080895adc437871549"
> +
> +KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
> +
> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> index 05cc21b3..eb4a98f7 100644
> --- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> @@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = " \
>       file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
>   "
>   
> +COMPATIBLE_MACHINE = "am62xx-evm"
> +
>   TARGET_CC_ARCH += "${LDFLAGS}"
>   
>   PV = "0.12+git${SRCPV}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16707): https://lists.yoctoproject.org/g/meta-ti/message/16707
> Mute This Topic: https://lists.yoctoproject.org/mt/99469820/7067447
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/11872989/7067447/425310138/xyzzy [p-bhagat@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

