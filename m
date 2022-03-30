Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01B4C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 13:02:31 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.6978.1648645350252763771
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Mar 2022 06:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=I7UjWZiR;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22UD2OE6058513;
	Wed, 30 Mar 2022 08:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648645344;
	bh=Y5ore7qSiHdk91kxug78zGc7Pat5lbJDzFsYstuq+b4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=I7UjWZiRGzNbExAdDiQCyUKFl/UEnie5n7dzERYQoqLOYvlQdzXd6VP8lyOtkd/8i
	 MWLSIT1Tl1LWHJcK/+PDbhLC2dRMWt+1Q9ymDbIvRyb4rblfMJIBaPagdj8Z3IyOBU
	 As5Co3z+BOZclTCggc8zCVEcnMRymRH47gKCs1o0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22UD2O7A001134
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Mar 2022 08:02:24 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 30
 Mar 2022 08:02:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 30 Mar 2022 08:02:23 -0500
Received: from [128.247.81.69] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22UD2NBg108026;
	Wed, 30 Mar 2022 08:02:23 -0500
Message-ID: <cdfe0adb-7e51-27b0-2193-8d9f4e2aaf5d@ti.com>
Date: Wed, 30 Mar 2022 08:02:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-ti] [master][PATCH] ti-cgt-pru: Update to version 2.3.3
To: Alessio Igor Bogani <alessio.bogani@elettra.eu>,
        <meta-ti@lists.yoctoproject.org>
References: <20220330104416.29250-1-alessio.bogani@elettra.eu>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220330104416.29250-1-alessio.bogani@elettra.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Mar 2022 13:02:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14584



On 3/30/2022 5:44 AM, Alessio Igor Bogani wrote:
> Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
> ---
>   .../recipes-ti/devtools/ti-cgt-pru_2.3.2.bb   | 49 -------------------
>   1 file changed, 49 deletions(-)
>   delete mode 100644 meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb

How does this patch update to 2.3.3 if all it does is delete the only 
recipe for ti-cgt-pru?  Are you missing the addition of the new receipe 
for 2.3.3?



> diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb b/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
> deleted file mode 100644
> index 8b3e2a07..00000000
> --- a/meta-ti-extras/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -DESCRIPTION = "TI PRU Code Generation Tools"
> -HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> -LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
> -
> -LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
> -LIC_FILES_CHKSUM:class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
> -
> -require recipes-ti/includes/ti-paths.inc
> -require recipes-ti/includes/ti-unpack.inc
> -
> -BINFILE = "ti_cgt_pru_${PV}_linux_installer_x86.bin"
> -BINFILE_NAME = "cgt-pru-x86"
> -TI_BIN_UNPK_ARGS = "--prefix ${S}"
> -TI_BIN_UNPK_CMDS = ""
> -
> -BINFILE:class-target = "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.sh"
> -BINFILE_NAME:class-target = "cgt-pru-arm"
> -
> -SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
> -
> -SRC_URI[cgt-pru-x86.md5sum] = "270a0ecca383f66cad3a0e2a738c6ab0"
> -SRC_URI[cgt-pru-x86.sha256sum] = "af1178a059d46d67d5672df053dd2fbebb0b89a513b17b8739dbe915b4a5d71a"
> -
> -SRC_URI[cgt-pru-arm.md5sum] = "fbf10083af1b0e5d69b018126603bb58"
> -SRC_URI[cgt-pru-arm.sha256sum] = "75ac84775a5624ea7e4fad4efc1acb7e869c79160550d48ba780068a3dce879c"
> -
> -do_install() {
> -    install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
> -    cp -r ${S}/ti-cgt-pru_${PV}/. \
> -          ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}/
> -}
> -
> -do_install:class-target() {
> -    ${WORKDIR}/${BINFILE} --prefix ${D}
> -}
> -
> -FILES:${PN} += "${datadir}/ti/*"
> -
> -FILES:${PN}-dbg = "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
> -                   ${TI_CGT_PRU_INSTALL_DIR_RECIPE}/lib/.debug \
> -"
> -
> -INHIBIT_PACKAGE_STRIP = "1"
> -INHIBIT_SYSROOT_STRIP = "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -
> -INSANE_SKIP:${PN} += "arch staticdev already-stripped file-rdeps"
> -
> -BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14581): https://lists.yoctoproject.org/g/meta-ti/message/14581
> Mute This Topic: https://lists.yoctoproject.org/mt/90128483/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

