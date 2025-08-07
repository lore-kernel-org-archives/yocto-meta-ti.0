Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68D7C87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 08:10:28 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.46109.1754554222564821210
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Aug 2025 01:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d+ACuEzT;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-limaye@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5778AL0Y271247;
	Thu, 7 Aug 2025 03:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754554221;
	bh=3i09w6AEPvth2atST/3ELSG+RwhD1I/UZFZhmkkGdF4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=d+ACuEzToBri1gF5F/MXYJRqUiWLZN8cUScaahZ1kMVEZZPBjcP0Y8cMqzqyBragF
	 8q2tFsNSWuSsUML64ou8nUX4mNUJMM/9VOOgx920e1VlKD7swUnSEnff5jER/k7Q5Y
	 6XgZrRI3OFzoUD6nvWhcUHdr5ukSXF1fSVGKZ38Q=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5778ALkf740148
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 7 Aug 2025 03:10:21 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 7
 Aug 2025 03:10:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 7 Aug 2025 03:10:20 -0500
Received: from [172.24.234.127] (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5778AIVF1004429;
	Thu, 7 Aug 2025 03:10:19 -0500
Message-ID: <9ad04067-d4ef-4bd2-852d-cdbc72ee5512@ti.com>
Date: Thu, 7 Aug 2025 13:40:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH v2 1/5] ti-ipc-examples-linux: Add a
 recipe to build messageq app_host
To: Beleswar Padhi <b-padhi@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250806170442.243461-1-b-padhi@ti.com>
 <20250806170442.243461-2-b-padhi@ti.com>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20250806170442.243461-2-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 07 Aug 2025 08:10:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18906

Beleswar,

On 06/08/25 22:34, Beleswar Padhi wrote:
> Add a recipe to build the Application Host (for A15 core) to demonstrate
> IPC with remote processors through messageq firmware. Also package this
> in the /usr/bin directory for testing IPC. This recipe only builds the
> app_host, and the firmwares are available in ti-linux-firmware
> repository.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>   .../ipc/ti-ipc-examples-linux_git.bb          | 68 +++++++++++++++++++
>   1 file changed, 68 insertions(+)
>   create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> 
> diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> new file mode 100644
> index 00000000..3a64409e
> --- /dev/null
> +++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
> @@ -0,0 +1,68 @@
> +DESCRIPTION = "TI Inter Processor Communication (IPC) MessageQ Application for
> +Linux Host"
> +
> +require recipes-ti/ipc/ti-ipc-common.inc
> +require ti-ipc-rtos.inc
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://${S_ipc-examples}/src/makefile;beginline=1;endline=30;md5=a52324bd5033bb49ea07bade1244ac9a"
> +
> +INSANE_SKIP:${PN} += "arch"

I guess this is not required since we are only building linux application?

Regards,
Aniket

> +
> +IPC_INSTALL_DIR = "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
> +INHIBIT_PACKAGE_STRIP = "1"
> +
> +DEPENDS = "ti-ipc ti-ipc-rtos ti-xdctools-native zip-native"
> +
> +EX02_PATH = "examples/DRA7XX_linux_elf/ex02_messageq/host"
> +
> +do_compile() {
> +  cd ${S_ipc-examples}/src
> +  oe_runmake .examples \
> +    IPCTOOLS="${S_ipc-metadata}/src/etc"
> +
> +  for alt_platform in ${ALT_PLATFORM}; do
> +    oe_runmake .examples "PLATFORM=${alt_platform}" \
> +      IPCTOOLS="${S_ipc-metadata}/src/etc"
> +  done
> +
> +  if [  "${PLATFORM}" != "UNKNOWN" ]; then
> +    oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
> +
> +    if [ ! -z ${ALT_PLATFORM} ]; then
> +      oe_runmake extract PLATFORM="${ALT_PLATFORM}" HOSTOS="linux" \
> +         IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
> +    fi
> +    oe_runmake -C ${EX02_PATH} all HOSTOS="linux" \
> +      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
> +      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
> +
> +    if [ ! -z ${ALT_PLATFORM} ]; then
> +      oe_runmake -C ${EX02_PATH} all HOSTOS="linux" \
> +        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
> +        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
> +        PLATFORM="${ALT_PLATFORM}"
> +    fi
> +  fi
> +}
> +
> +do_install() {
> +  cd ${S_ipc-examples}/src
> +
> +  if [  "${PLATFORM}" != "UNKNOWN" ]; then
> +    # Install directory for linux examples
> +    install -d ${D}${bindir}/ipc/examples/ex02_messageq
> +    oe_runmake -C ${EX02_PATH} install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
> +      LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
> +      HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples/ex02_messageq"
> +
> +    if [ ! -z ${ALT_PLATFORM} ]; then
> +      oe_runmake -C ${EX02_PATH} install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
> +        LINUX_SYSROOT_DIR="${STAGING_INCDIR}" \
> +        HOSTOS="linux" EXEC_DIR="${D}/${bindir}/ipc/examples/ex02_messageq" \
> +        PLATFORM="${ALT_PLATFORM}"
> +    fi
> +  fi
> +}
> +
> +FILES:${PN} += "${bindir}/*"


