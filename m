Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08836C5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 19:53:46 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.61218.1724702022759388745
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 12:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gNUYKWD3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47QJrbml103590;
	Mon, 26 Aug 2024 14:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724702017;
	bh=khrQGbJsvFYIQwxSfTbvCgmKGocbGiT744d2lHWhrjA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gNUYKWD3y1lkIZV3z1fPns615+n+B+TBa+wDXyv/2/r0OvUkbW9khOBlyC7G/2BxU
	 fUBgb6uCBv41bEd+Q02PVmhkVc6c1DAlEu/Y+cvJexaPUym4x6m7RXx2d2bdUNIhZb
	 cvjRIjLYfl4wCeQpNcSB59StlQfWoqL7t+jyi6m0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47QJrbm5024261
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Aug 2024 14:53:37 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Aug 2024 14:53:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Aug 2024 14:53:36 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47QJraOI021384;
	Mon, 26 Aug 2024 14:53:36 -0500
Message-ID: <03c012be-9684-4a7d-8c9e-98d081fb5b9d@ti.com>
Date: Mon, 26 Aug 2024 14:53:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][RFC PATCH] openmp-rtos: deprecate
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
References: <20240805043654.172479-1-denis@denix.org>
 <56b01c2b-80f2-46b0-b3bd-794591c69177@ti.com>
 <20240826184625.GA17572@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240826184625.GA17572@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 26 Aug 2024 19:53:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17950

On 8/26/24 1:46 PM, Denys Dmytriyenko wrote:
> On Thu, Aug 08, 2024 at 12:17:45PM -0500, Andrew Davis wrote:
>> On 8/4/24 11:36 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> Remove openmp-rtos component as deprecated and not maintained.
>>>
>>> This used to provide OpenMP DSP runtime components for legacy devices.
>>>
>>
>> With all the OpenCL stuff gone from meta-arago, dsplib/mathlib/imglib/swtools
>> can also be dropped.
> 
> None of those use OpenCL and are rather self-contained (either prebuilt
> binaries, or use existing components from meta-ti, like CGT).
> 

Other way around, they were only used by OpenCL. While there could be some other
users out of tree users we don't know about, I highly doubt it at this point.

> But they are in the same bucket of deprecated DSP-programming enablement in
> TI-SDK. Moreover, we are seeing deeper issues with old CGT versions generating
> non-reproducible code, so this class of components was pending a second round
> of clean ups...
> 
> 
>> On the side, dspdce-fw and ipumm-fw should be updated
>> to be shipped as binaries, same as we do with all other sysbios/ti-rtos firmware.
>> Then we could also drop out all the remaining sysbios/xdc bits.
> 
> Yes, that was the thinking. Someone needs to add prebuilt FW binaries to
> ti-linux-firmware repo before the rest of dependencies can finally be dropped
> from meta-ti.
> 

If we want to put a timeline in place for dropping the sysbios/xdc parts,
I could add those firmware to right now. If we think this will be many
years out, then we can take our time on that. Doesn't matter much either
way to me.

Andrew

> 
>> Andrew
>>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> ---
>>>   .../recipes-ti/openmp-rtos/openmp-rtos_git.bb | 62 -------------------
>>>   1 file changed, 62 deletions(-)
>>>   delete mode 100644 meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
>>>
>>> diff --git a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
>>> deleted file mode 100644
>>> index aa4bc6cd..00000000
>>> --- a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
>>> +++ /dev/null
>>> @@ -1,62 +0,0 @@
>>> -DESCRIPTION = "TI OpenMP RTOS"
>>> -HOMEPAGE = "git://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
>>> -LICENSE = "BSD-3-Clause"
>>> -
>>> -require recipes-ti/includes/ti-paths.inc
>>> -
>>> -inherit features_check
>>> -
>>> -REQUIRED_MACHINE_FEATURES = "dsp"
>>> -REQUIRED_DISTRO_FEATURES = "openmp"
>>> -
>>> -PV = "2_06_03_00"
>>> -PR = "r0"
>>> -
>>> -OPENMP_RTOS_GIT_URI = "git://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
>>> -OPENMP_RTOS_GIT_PROTOCOL = "https"
>>> -OPENMP_RTOS_GIT_BRANCH = "master"
>>> -
>>> -BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
>>> -SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH}"
>>> -
>>> -SRCREV = "c090eb664d9815a36ead0e14f31e102590680fb8"
>>> -
>>> -LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
>>> -
>>> -DEPENDS = "common-csl-ip-rtos doxygen-native libulm ti-xdctools-native ti-ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
>>> -
>>> -COMPATIBLE_MACHINE = "omap-a15"
>>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>>> -
>>> -S = "${WORKDIR}/git"
>>> -export IPC_DIR = "${IPC_INSTALL_DIR}"
>>> -export XDC_DIR = "${XDC_INSTALL_DIR}"
>>> -export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
>>> -export ULM_DIR ="${STAGING_DIR_TARGET}/usr/share/ti/ulm"
>>> -export C6636_PDK_DIR ="${PDK_INSTALL_DIR}"
>>> -export AM572_PDK_DIR ="${PDK_INSTALL_DIR}"
>>> -export XDCCGROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
>>> -
>>> -export BUILD_AM572 = "0"
>>> -
>>> -BUILD_AM572:omap-a15 = "1"
>>> -
>>> -RELEASE_TARGET = ""
>>> -RELEASE_TARGET:omap-a15 = "am57xx"
>>> -
>>> -do_compile() {
>>> -    make -f utils/product/Makefile .zipfile
>>> -}
>>> -
>>> -do_install() {
>>> -    install -d ${D}${OMP_INSTALL_DIR_RECIPE}
>>> -    cp -r ${S}/exports/openmp_dsp_${RELEASE_TARGET}_*/. -d  ${D}${OMP_INSTALL_DIR_RECIPE}
>>> -}
>>> -
>>> -ALLOW_EMPTY:${PN} = "1"
>>> -
>>> -FILES:${PN}-dev += " \
>>> -    ${OMP_INSTALL_DIR_RECIPE}/ \
>>> -"
>>> -
>>> -INSANE_SKIP:${PN}-dev = "arch"

