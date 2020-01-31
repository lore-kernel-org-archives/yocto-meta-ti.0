Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.477.1580490542744834666
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 09:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RqUrT9ds;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: afd@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A6FEE01671; Fri, 31 Jan 2020 09:09:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1998AE00736
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2020 09:09:00 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VH902b081187
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2020 11:09:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580490540;
	bh=D1B5BzWZE/v4z8hK84EWuYjqgXpWg4RBgK02oXbRCqQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=RqUrT9dsP1PhBl2pmwGtcaktfjQbEdG780T+VrYSR+f7ihrnmyhiXVf2RJIf6FZFu
	 4j4caM2v8JEnB0/Td8qWxmcDALu9Yle0xMKrsILnCOy8MoYjcs0QjIUthat82zEWF+
	 3hQndz9IRUrLv9QmtvHSUOSEmIwCpk4F70atLmIE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00VH90hS097219
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 31 Jan 2020 11:09:00 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 11:09:00 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 11:09:00 -0600
Received: from [10.250.70.160] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VH8xQn007045;
	Fri, 31 Jan 2020 11:08:59 -0600
Subject: Re: [meta-ti][master][PATCH 1/2] omapfbplay: Remove depricated and non-working omapfbplay tool
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@yoctoproject.org>
References: <20200130170155.32038-1-afd@ti.com> <20200131005607.GW3658@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <a6d6c0e8-c267-fad5-6851-427800af37b6@ti.com>
Date: Fri, 31 Jan 2020 12:08:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131005607.GW3658@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/30/20 7:56 PM, Denys Dmytriyenko wrote:
> Andrew,
> 
> Can you please re-send these 2 patches - I don't think they made it to the 
> list. While I can grab them directly from my mailbox, I was wondering what 
> the problem was.
> 


Sure, patches resent.

Andrew


> Denys
> 
> 
> On Thu, Jan 30, 2020 at 12:01:54PM -0500, Andrew F. Davis wrote:
>> This program uses many software components that are not recommended
>> anymore making it a bad example. The original source repo is gone.
>> It has dependencies on very old kernel versions. Lastly it doesn't
>> look to have been built by anyone in a long time. Lets remove this.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>  ...h-CODEC_TYPE_VIDEO-to-AVMEDIA_TYPE_V.patch | 26 -------------
>>  .../files/omapfbplay-errorhandling.patch      | 34 -----------------
>>  .../omapfbplay/omapfbplay-cmem_git.bb         | 16 --------
>>  .../omapfbplay/omapfbplay-dce_git.bb          |  7 ----
>>  .../omapfbplay/omapfbplay-xv_git.bb           |  3 --
>>  recipes-graphics/omapfbplay/omapfbplay.inc    | 37 -------------------
>>  recipes-graphics/omapfbplay/omapfbplay_git.bb |  3 --
>>  7 files changed, 126 deletions(-)
>>  delete mode 100644 recipes-graphics/omapfbplay/files/0001-omapfbplay-switch-CODEC_TYPE_VIDEO-to-AVMEDIA_TYPE_V.patch
>>  delete mode 100644 recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
>>  delete mode 100644 recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
>>  delete mode 100644 recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
>>  delete mode 100644 recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
>>  delete mode 100644 recipes-graphics/omapfbplay/omapfbplay.inc
>>  delete mode 100644 recipes-graphics/omapfbplay/omapfbplay_git.bb
>>
>> diff --git a/recipes-graphics/omapfbplay/files/0001-omapfbplay-switch-CODEC_TYPE_VIDEO-to-AVMEDIA_TYPE_V.patch b/recipes-graphics/omapfbplay/files/0001-omapfbplay-switch-CODEC_TYPE_VIDEO-to-AVMEDIA_TYPE_V.patch
>> deleted file mode 100644
>> index e01fddbf..00000000
>> --- a/recipes-graphics/omapfbplay/files/0001-omapfbplay-switch-CODEC_TYPE_VIDEO-to-AVMEDIA_TYPE_V.patch
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -From 71670f4a067efc169018a9ec9321ccc9af3bbd59 Mon Sep 17 00:00:00 2001
>> -From: Roger Monk <r-monk@ti.com>
>> -Date: Thu, 10 May 2012 14:50:11 +0100
>> -Subject: [PATCH] omapfbplay:  switch CODEC_TYPE_VIDEO to AVMEDIA_TYPE_VIDEO
>> -
>> -Signed-off-by: Roger Monk <r-monk@ti.com>
>> ----
>> - omapfbplay.c |    2 +-
>> - 1 files changed, 1 insertions(+), 1 deletions(-)
>> -
>> -diff --git a/omapfbplay.c b/omapfbplay.c
>> -index ad35bd5..818cf2c 100644
>> ---- a/omapfbplay.c
>> -+++ b/omapfbplay.c
>> -@@ -74,7 +74,7 @@ find_stream(AVFormatContext *afc)
>> -     int i;
>> - 
>> -     for (i = 0; i < afc->nb_streams; i++) {
>> --        if (afc->streams[i]->codec->codec_type == CODEC_TYPE_VIDEO && !st)
>> -+        if (afc->streams[i]->codec->codec_type == AVMEDIA_TYPE_VIDEO && !st)
>> -             st = afc->streams[i];
>> -         else
>> -             afc->streams[i]->discard = AVDISCARD_ALL;
>> --- 
>> -1.7.0.4
>> -
>> diff --git a/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch b/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
>> deleted file mode 100644
>> index 7dd544f8..00000000
>> --- a/recipes-graphics/omapfbplay/files/omapfbplay-errorhandling.patch
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -From e321ae7df57ada9ecc8c155fa4e5511c96ef5db3 Mon Sep 17 00:00:00 2001
>> -From: Rob Clark <rob@ti.com>
>> -Date: Fri, 18 Mar 2011 12:40:51 -0500
>> -Subject: [PATCH] dce: differentiate between fatal and non-fatal errors
>> -
>> -For streams with errors, the codec will throw back an error. But not
>> -all errors are fatal.
>> ----
>> - dce.c |   10 ++++++++--
>> - 1 files changed, 8 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/dce.c b/dce.c
>> -index ab7ad0a..88f175e 100644
>> ---- a/dce.c
>> -+++ b/dce.c
>> -@@ -270,8 +270,14 @@ static int dce_decode(AVPacket *p)
>> - 
>> -     err = VIDDEC3_process(codec, inbufs, outbufs, in_args, out_args);
>> -     if (err) {
>> --        fprintf(stderr, "VIDDEC3_process() error %d\n", err);
>> --        return -1;
>> -+        fprintf(stderr, "VIDDEC3_process() error %d %08x\n", err,
>> -+                    out_args->extendedError);
>> -+        /* for non-fatal errors, keep going.. a non-fatal error could
>> -+         * just indicate an error in the input stream which the codec
>> -+         * was able to conceal
>> -+         */
>> -+        if (XDM_ISFATALERROR(out_args->extendedError))
>> -+            return -1;
>> -     }
>> - 
>> -     for (i = 0; i < out_args->outputID[i]; i++) {
>> --- 
>> -1.7.1
>> diff --git a/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb b/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
>> deleted file mode 100644
>> index a0392f6c..00000000
>> --- a/recipes-graphics/omapfbplay/omapfbplay-cmem_git.bb
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -require omapfbplay.inc
>> -
>> -DEPENDS += "ti-linuxutils"
>> -
>> -require recipes-ti/includes/ti-paths.inc
>> -
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -
>> -SDMA_CFLAGS = " -I${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/sdma/include/"
>> -CMEM_CFLAGS = " -I${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/cmem/include/"
>> -CFLAGS += " -I. -I${STAGING_KERNEL_DIR}/include ${SDMA_CFLAGS} ${CMEM_CFLAGS}"
>> -
>> -export SDMA_LIBS = "-L${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/sdma/lib -l:sdma.a470MV"
>> -export CMEM_LIBS = "-L${LINUXUTILS_INSTALL_DIR}/packages/ti/sdo/linuxutils/cmem/lib -l:cmem.a470MV"
>> -
>> -OMAPFBPLAYOPTS = "V4L2=y OMAPFB=y NETSYNC=y CMEM=y SDMA=y"
>> diff --git a/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb b/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
>> deleted file mode 100644
>> index e70ac729..00000000
>> --- a/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
>> +++ /dev/null
>> @@ -1,7 +0,0 @@
>> -require omapfbplay.inc
>> -
>> -DEPENDS += "libdce"
>> -
>> -CFLAGS += " -I. -I${STAGING_INCDIR}/dce -I${STAGING_KERNEL_DIR}/include "
>> -
>> -OMAPFBPLAYOPTS = "V4L2=y OMAPFB=y NETSYNC=y DCE=y"
>> diff --git a/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb b/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
>> deleted file mode 100644
>> index cadf6d8e..00000000
>> --- a/recipes-graphics/omapfbplay/omapfbplay-xv_git.bb
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -require omapfbplay.inc
>> -
>> -OMAPFBPLAYOPTS = "V4L2=y NETSYNC=y XV=y"
>> diff --git a/recipes-graphics/omapfbplay/omapfbplay.inc b/recipes-graphics/omapfbplay/omapfbplay.inc
>> deleted file mode 100644
>> index 744eb8f7..00000000
>> --- a/recipes-graphics/omapfbplay/omapfbplay.inc
>> +++ /dev/null
>> @@ -1,37 +0,0 @@
>> -DESCRIPTION = "Simple libav-based player that uses the omapfb overlays"
>> -DEPENDS = "bzip2 lame libav virtual/kernel"
>> -LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://omapfbplay.c;beginline=2;endline=22;md5=05d3789ab362e6f4a9682e98100ea0fa"
>> -
>> -PV = "0.0+${PR}+gitr${SRCREV}"
>> -
>> -SRCREV = "34293052c5a2ae328eac6903512e6b4ce19b5639"
>> -SRC_URI = "git://git.mansr.com/omapfbplay;protocol=git \
>> -           file://omapfbplay-errorhandling.patch \
>> -           file://0001-omapfbplay-switch-CODEC_TYPE_VIDEO-to-AVMEDIA_TYPE_V.patch \
>> -          "
>> -
>> -S = "${WORKDIR}/git"
>> -
>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -COMPATIBLE_HOST ?= "null"
>> -COMPATIBLE_HOST_ti-soc = "(.*)"
>> -
>> -# We want a kernel header for armv7a, but we don't want to make mplayer machine specific for that
>> -STAGING_KERNEL_DIR = "${STAGING_DIR}/${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/kernel"
>> -CFLAGS += " -I. -I${STAGING_KERNEL_DIR}/include "
>> -
>> -OMAPFBPLAYVARIANT ?= "${PN}"
>> -OMAPFBPLAYOPTS ?= "V4L2=y NETSYNC=y"
>> -
>> -do_compile() {
>> -	cp ${STAGING_KERNEL_DIR}/arch/arm/plat-omap/include/mach/omapfb.h ${S} || true
>> -	cp ${STAGING_KERNEL_DIR}/include/asm-arm/arch-omap/omapfb.h ${S} || true
>> -	cp ${STAGING_KERNEL_DIR}/include/linux/omapfb.h ${S} || true
>> -	oe_runmake ${TARGET_ARCH}=y ${OMAPFBPLAYOPTS} -e
>> -}
>> -
>> -do_install() {
>> -	install -d ${D}/${bindir}
>> -	install -m 0755 ${S}/omapfbplay ${D}/${bindir}/${OMAPFBPLAYVARIANT}
>> -}
>> diff --git a/recipes-graphics/omapfbplay/omapfbplay_git.bb b/recipes-graphics/omapfbplay/omapfbplay_git.bb
>> deleted file mode 100644
>> index 0d3956f1..00000000
>> --- a/recipes-graphics/omapfbplay/omapfbplay_git.bb
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -require omapfbplay.inc
>> -
>> -OMAPFBPLAYOPTS = "V4L2=y OMAPFB=y NETSYNC=y"
>> -- 
>> 2.17.1
>>
