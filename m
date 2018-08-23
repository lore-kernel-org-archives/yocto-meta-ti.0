Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CFF2E00474; Thu, 23 Aug 2018 03:46:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DD3AE003C1
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 03:46:15 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7NAkF1E011613
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 05:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535021175;
	bh=nPKC8wFdMkVEUpbRfhuOpnHeT124cmcmh4i+2lU8PCk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=sJQYRyzX3xZNk9IlZMD7kMn+gy8/U+CTVcWo/HfEObwJXGvecaEA63kyACLqpEMoo
	Z4ZlHewEsiaaMDUxyr4xQrmACZ0hNB8LN79sZVH5AJ2jJ8DhAPe4QURaWNyTW5Gsgk
	PxPQUt9ruvWOxZVfdMBiHyvfsLFGR4KxFQHtleBM=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NAkFXc019250
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 05:46:15 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 23 Aug 2018 05:46:15 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 23 Aug 2018 05:46:15 -0500
Received: from [172.24.158.83] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NAkDf6019046;
	Thu, 23 Aug 2018 05:46:14 -0500
To: Ramprasad N <x0038811@ti.com>, <meta-ti@yoctoproject.org>
References: <1535020270-15662-1-git-send-email-x0038811@ti.com>
	<1535020270-15662-2-git-send-email-x0038811@ti.com>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <c91c52e8-1899-e60c-8aec-ccba18a9e08e@ti.com>
Date: Thu, 23 Aug 2018 16:16:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1535020270-15662-2-git-send-email-x0038811@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko 1/1] ipumm: Integration with latest IPC, BIOS and XDC tools
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2018 10:46:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Acked-by: Karthik Ramanan <a0393906@ti.com>


On 23-Aug-18 4:01 PM, Ramprasad N wrote:
>      This patch is to integrate IPUMM with
>      IPC: 3.50.01.00
>      BIOS: 6.73.00.12
>      XDC: 3.50.07.20
>
> Signed-off-by: Ramprasad N <x0038811@ti.com>
> ---
>   ...egration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch | 79 ++++++++++++++++++++++
>   recipes-bsp/ipumm-fw/ipumm-fw_git.bb               |  5 +-
>   2 files changed, 83 insertions(+), 1 deletion(-)
>   create mode 100644 recipes-bsp/ipumm-fw/files/0001-Integration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch
>
> diff --git a/recipes-bsp/ipumm-fw/files/0001-Integration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch b/recipes-bsp/ipumm-fw/files/0001-Integration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch
> new file mode 100644
> index 0000000..22e1a43
> --- /dev/null
> +++ b/recipes-bsp/ipumm-fw/files/0001-Integration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch
> @@ -0,0 +1,79 @@
> +From 19b01da6f9cd02c4869229e46d5cfeefa9d5a5c6 Mon Sep 17 00:00:00 2001
> +From: Ramprasad N <x0038811@ti.com>
> +Date: Fri, 17 Aug 2018 17:12:14 +0530
> +Subject: [ipumm PATCH] Integration with IPC 3.50, BIOS 6.73, XDC 3.50
> +
> +    Integrating IPUMM with
> +    IPC: 3.50.01.00
> +    BIOS: 6.73.00.12
> +    XDC: 3.50.07.20
> +
> +Signed-off-by: Ramprasad N <x0038811@ti.com>
> +---
> + Makefile                              | 6 +++---
> + build/common.bld                      | 2 +-
> + platform/ti/dce/baseimage/dce_ipu.cfg | 4 ++--
> + src/ti/framework/dce/dce.c            | 2 +-
> + 4 files changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 929a2a3..87e1b10 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -36,9 +36,9 @@ REPO		:= $(BIOSTOOLSROOT)
> +
> + # Different tool versions can easily be programmed by defining below variables
> + # in your environment.
> +-XDCVERSION	?= xdctools_3_50_03_33_core
> +-BIOSVERSION	?= bios_6_52_00_12
> +-IPCVERSION	?= ipc_3_47_01_00
> ++XDCVERSION	?= xdctools_3_50_07_20_core
> ++BIOSVERSION	?= bios_6_73_00_12
> ++IPCVERSION	?= ipc_3_50_01_00
> + CEVERSION	?= codec_engine_3_24_00_08
> + FCVERSION	?= framework_components_3_40_02_07
> + XDAISVERSION	?= xdais_7_24_00_04
> +diff --git a/build/common.bld b/build/common.bld
> +index eacc2b7..ecc7de1 100644
> +--- a/build/common.bld
> ++++ b/build/common.bld
> +@@ -417,7 +417,7 @@ function GetVersionTag()
> +   status = {};
> +   var verInfo;
> +   var git_cmd = "git ";
> +-  var ipc_ver = " IPC 3_47_01_00 ";
> ++  var ipc_ver = " IPC 3_50_01_00 ";
> +   var ipumm_ver = " MMIP 3_00_15_00 ";
> +
> +   var type_cmd = "type ";
> +diff --git a/platform/ti/dce/baseimage/dce_ipu.cfg b/platform/ti/dce/baseimage/dce_ipu.cfg
> +index 5bc1139..c81af98 100644
> +--- a/platform/ti/dce/baseimage/dce_ipu.cfg
> ++++ b/platform/ti/dce/baseimage/dce_ipu.cfg
> +@@ -248,8 +248,8 @@ else
> +     BIOS.smpEnabled = false;
> + }
> +
> +-var Settings = xdc.useModule('ti.sysbios.posix.Settings');
> +-Settings.supportsMutexPriority = true;
> ++var Settings = xdc.useModule('ti.posix.tirtos.Settings');
> ++Settings.enableMutexPriority = true;
> +
> + var Timer = xdc.useModule('ti.sysbios.timers.dmtimer.Timer');
> + if(Program.global.HwType == hw_OMAP5)
> +diff --git a/src/ti/framework/dce/dce.c b/src/ti/framework/dce/dce.c
> +index 62bea8c..01dbcce 100644
> +--- a/src/ti/framework/dce/dce.c
> ++++ b/src/ti/framework/dce/dce.c
> +@@ -50,7 +50,7 @@
> + #include <ti/sysbios/hal/Cache.h>
> + #include <ti/sysbios/knl/Task.h>
> + #include <ti/sysbios/knl/Semaphore.h>
> +-#include <ti/sysbios/posix/pthread.h>
> ++#include <ti/posix/ccs/pthread.h>
> + #include <xdc/cfg/global.h>
> + #include <xdc/runtime/System.h>
> + #include <xdc/runtime/Diags.h>
> +--
> +1.9.1
> +
> diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> index 22a8c4f..cee72a8 100644
> --- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> +++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
> @@ -19,10 +19,13 @@ SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
>   
>   SRCREV = "035ba2571a273162fde75a31decadc6534d17eca"
>   
> +SRC_URI += " \
> +      file://0001-Integration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch \
> +"
>   S = "${WORKDIR}/git"
>   
>   PV = "3.00.15.00"
> -PR = "r1"
> +PR = "r2"
>   
>   require recipes-ti/includes/ti-paths.inc
>   


