Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99B1AE00848; Fri, 17 Aug 2018 07:54:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F70AE007C9
	for <meta-ti@yoctoproject.org>; Fri, 17 Aug 2018 07:54:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7HEsP9I045612
	for <meta-ti@yoctoproject.org>; Fri, 17 Aug 2018 09:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534517665;
	bh=+MReAIlG3fh5Z7V7e54ijUqvzueFIDF20t/ovKSg7GM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Zt8rMWpT/Kui6vMr7/qC9dRSFzgQQrqUcdDzLveLivlvl9tXfr4ZMBY4Gx5cVsKud
	HinFJOh3mIcGZl1eS6Ccem5Od3wl8BefcVWOO1H0IJMeLPbFCDyimpizKlrFgtw5ml
	ho1LjqDRuooMwGJ13JxJmdeOIzrt+yp1JXFaQ0aQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7HEsPGW020402
	for <meta-ti@yoctoproject.org>; Fri, 17 Aug 2018 09:54:25 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 17 Aug 2018 09:54:25 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 17 Aug 2018 09:54:25 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7HEsLI4024448;
	Fri, 17 Aug 2018 09:54:24 -0500
To: Karthik Ramanan <a0393906@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>,
	"Zhang, Hao" <hzhang@ti.com>
References: <1534257478-36797-1-git-send-email-hzhang@ti.com>
	<20180816052138.GS2547@beryl> <7dbaaa9986314d76b4a3c54b175fc12d@ti.com>
	<e0729faf-8b15-6a0c-805d-eea3585f3f4c@ti.com>
	<07e0e8f6-7e99-65b3-e9d8-297037d01fdb@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <51c4e417-579f-126b-4751-ba970449243d@ti.com>
Date: Fri, 17 Aug 2018 09:54:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <07e0e8f6-7e99-65b3-e9d8-297037d01fdb@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "R,
	Karthik" <karthik.ramanan@ti.com>, "Nadampalli, Sunita" <sunitan@ti.com>
Subject: Re: [rocko][PATCH V3 2/2] recipes-ti: bios: add TI SYSBIOS 6.73.00.12
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
X-List-Received-Date: Fri, 17 Aug 2018 14:54:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

All,
My earlier statements on POSIX in SYS/BIOS need to be revised.
I have got confirmation that POSIX support is still very much a part of
the released SYS/BIOSes. There is a change in the directory structure
where the POSIX related modules and headers are maintained. So, we don't
have any external dependencies. All software would need to adjust for
the new locations when moving to the newer SYS/BIOS if using the POSIX.

Karthik,
You might want to updated the .cfg file as well. Current SYS/BIOS does
find the new module location when using the older module. Please see the
compatibility notes in one of the SYS/BIOS releases prior to 6.70 and
after 6.52.

regards
Suman

On 08/17/2018 07:27 AM, Karthik Ramanan wrote:
> Denys, Suman,
> 
> We looked into this further and the below patch seems to resolve the
> build issue.
> 
> The generated binary hasn't been validated yet, but we can give you
> feedback on Monday when we get some time to test this ipumm-fw.
> 
> Regards
> 
> Karthik
> 
> 
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
> 
> 
> On 16-Aug-18 6:33 PM, Suman Anna wrote:
>> Hi Denys,
>>
>> I have taken a quick look at this, and looks like the POSIX support in
>> SYS/BIOS is moved out into its own project. However, I couldn't find a
>> GA version of that tool released. All users will have to move to the
>> newer ti.posix.tirtos package. So, this might be a bigger blocker.
>>
>> regards
>> Suman
>>
>> On 08/16/2018 06:50 AM, Anna, Suman wrote:
>>> + Sunita as well.
>>>
>>>> Ok, this breaks ipumm-fw build:
>>>>
>>>> | NOTE: make -j 56 XDCDIST_TREE=/OE/arago-rocko-next/build/arago-tmp-
>>>> external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-
>>>> fw/3.00.15.00-r1/recipe-sysroot-native/usr/share/ti/ti-xdctools-tree
>>>> | export XDCARGS="profile=release trace_level=0 hw_type=VAYU
>>>> hw_version=ES10 BIOS_type=SMP prof_type=DISABLE"; \
>>>> | /OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-r1/recipe-
>>>>
>>>> sysroot-native/usr/share/ti/ti-xdctools-tree/xdc --jobs=1 -PD
>>>> /OE/arago-rocko-
>>>> next/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-
>>>>
>>>> gnueabi/ipumm-fw/3.00.15.00-r1/git/platform/ti/dce/baselib/.; \
>>>> | /OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-r1/recipe-
>>>>
>>>> sysroot-native/usr/share/ti/ti-xdctools-tree/xdc --jobs=1 -PD
>>>> /OE/arago-rocko-
>>>> next/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-
>>>>
>>>> gnueabi/ipumm-fw/3.00.15.00-r1/git/platform/ti/dce/baseimage/.
>>>> | making all: Thu Aug 16 02:48:21 UTC 2018 ...
>>>> | ======== .interfaces
>>>> [/OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-
>>>> r1/git/src/ti/framework/dce] ========
>>>> | making package.mak (because of package.bld) ...
>>>> | Selected Vayu for ES10
>>>> | generating interfaces for package ti.framework.dce (because
>>>> package/package.xdc.inc is older than package.xdc) ...
>>>> | ======== .interfaces
>>>> [/OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-
>>>> r1/git/src/ti/utils] ========
>>>> | making package.mak (because of package.bld) ...
>>>> | Selected Vayu for ES10
>>>> | generating interfaces for package src.ti.utils (because
>>>> package/package.xdc.inc
>>>> is older than package.xdc) ...
>>>> | ======== .interfaces
>>>> [/OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-
>>>> r1/git/platform/ti/dce/baselib] ========
>>>> | making package.mak (because of package.bld) ...
>>>> | Selected Vayu for ES10
>>>> | config file: dce_ipu.cfg
>>>> |
>>>> | profile: release
>>>> |
>>>> |  -D_DM270  -D_DM290_IMX_MCFIX_   -DDRIVERCOMPONENTS=1 -
>>>> DISSCOMPONENTS=1 -DVIDEOCOMPONENTS=1 -DTESTCOMPONENTS=1
>>>> |
>>>> | HwType = 2
>>>> | HwVer = 1
>>>> | generating interfaces for package platform.ti.dce.baselib (because
>>>> package/package.xdc.inc is older than package.xdc) ...
>>>> |     translating BASELIB
>>>> | .interfaces files complete: Thu Aug 16 02:48:34 UTC 2018.
>>>> | ======== .libraries
>>>> [/OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-
>>>> r1/git/src/ti/framework/dce] ========
>>>> | clem4 package/package_ti.framework.dce.c ...
>>>> | clem4 dce.c ...
>>>> | "dce.c", line 53: fatal error #1965: cannot open source file
>>>> "ti/sysbios/posix/pthread.h"
>>>> | 1 catastrophic error detected in the compilation of "dce.c".
>>>> | Compilation terminated.
>>>> |
>>>> | >> Compilation failure
>>>> | lib/ipu/release/ti.framework.dce.aem4.mak:44: recipe for target
>>>> 'package/lib/lib/ipu/release/ti.framework.dce/dce.oem4' failed
>>>> | make[1]: ***
>>>> [package/lib/lib/ipu/release/ti.framework.dce/dce.oem4] Error
>>>> 1
>>>> | gmake: *** [/OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-
>>>> r1/git/src/ti/framework/dce,.libraries] Error 2
>>>> | making all: Thu Aug 16 02:48:35 UTC 2018 ...
>>>> | ======== .interfaces
>>>> [/OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-
>>>> r1/git/platform/ti/dce/baseimage] ========
>>>> | making package.mak (because of package.bld) ...
>>>> | Selected Vayu for ES10
>>>> | config file: dce_ipu.cfg
>>>> |
>>>> | profile: release
>>>> |
>>>> |  -D_DM270  -D_DM290_IMX_MCFIX_   -DDRIVERCOMPONENTS=1 -
>>>> DISSCOMPONENTS=1 -DVIDEOCOMPONENTS=1 -DTESTCOMPONENTS=1
>>>> |
>>>> | HwType = 2
>>>> | HwVer = 1
>>>> | generating interfaces for package platform.ti.dce.baseimage (because
>>>> package/package.xdc.inc is older than package.xdc) ...
>>>> | .interfaces files complete: Thu Aug 16 02:48:39 UTC 2018.
>>>> | ======== .libraries
>>>> [/OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-
>>>> r1/git/platform/ti/dce/baseimage] ========
>>>> | .libraries files complete: Thu Aug 16 02:48:39 UTC 2018.
>>>> | ======== .dlls [/OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-
>>>> r1/git/platform/ti/dce/baseimage] ========
>>>> | configuring out/ipu/release/ipu.xem4 from
>>>> package/cfg/out/ipu/release/ipu_pem4.cfg ...
>>>> | HwType = 2
>>>> | HwVer = 1
>>>> | IPUMM commit 035ba25 version MMIP 3_00_15_00  IPC 3_47_01_00
>>>> | Benelli Vayu: Setting PRCM Addresses ES1.0
>>>> | loading: ivahd_mpeg4dec
>>>> | loading: ivahd_h264dec
>>>> | loading: ivahd_jpegvdec
>>>> | loading: ivahd_jpegvenc
>>>> | loading: ivahd_vc1vdec
>>>> | loading: ivahd_mpeg2vdec
>>>> | loading: ivahd_h264enc
>>>> | loading: ivahd_mpeg4enc
>>>> | SMP Enabled BIOS
>>>> | warning: ti.sysbios.posix.Settings:
>>>> "/OE/arago-rocko-next/build/arago-tmp-
>>>> external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-
>>>> fw/3.00.15.00-r1/recipe-sysroot/usr/share/ti/ti-sysbios-
>>>> tree/packages/ti/sysbios/posix/Settings.xs", line 80:
>>>> ti.sysbios.posix.Settings :
>>>> This module is deprecated, it has been replaced by
>>>> ti.posix.tirtos.Settings.
>>>> Please update your config script. Loading and configuring the new
>>>> module on
>>>> behalf of this module.
>>>> | generating custom ti.sysbios library makefile ...
>>>> | generating custom ti.sdo.utils library makefile ...
>>>> | generating custom ti.sdo.ipc library makefile ...
>>>> | Auto-registering resource manager for HDVICP2
>>>> | manageIpc = true
>>>> | Heap: ti.sysbios.heaps.HeapMem
>>>> | Default lib not found: lib/ipu/release/ipu.aem4
>>>> | looking for release lib
>>>> | js: "/OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-
>>>> r1/git/platform/ti/dce/baselib/package.xs", line 92: Error: Library
>>>> not found:
>>>> lib/ipu/release/ipu.aem4
>>>> | package.mak:265: recipe for target
>>>> 'package/cfg/out/ipu/release/ipu_pem4.xdl' failed
>>>> | make[1]: *** [package/cfg/out/ipu/release/ipu_pem4.xdl] Error 1
>>>> | make[1]: *** Deleting file 'package/cfg/out/ipu/release/ipu_pem4.xdl'
>>>> | make[1]: *** [package/cfg/out/ipu/release/ipu_pem4.xdl] Deleting file
>>>> 'package/cfg/out/ipu/release/ipu_pem4.h'
>>>> | make[1]: *** [package/cfg/out/ipu/release/ipu_pem4.xdl] Deleting file
>>>> 'package/cfg/out/ipu/release/ipu_pem4.c'
>>>> | gmake: *** [/OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-
>>>> r1/git/platform/ti/dce/baseimage,.dlls] Error 2
>>>> | Makefile:166: recipe for target 'build' failed
>>>> | make: *** [build] Error 2
>>>> | ERROR: oe_runmake failed
>>>> | WARNING: /OE/arago-rocko-next/build/arago-tmp-external-linaro-
>>>> toolchain/work/armv7ahf-neon-linux-gnueabi/ipumm-fw/3.00.15.00-
>>>> r1/temp/run.do_compile.6164:1 exit 1 from 'exit 1'
>>>> | ERROR: Function failed: do_compile (log file is located at
>>>> /OE/arago-rocko-
>>>> next/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-
>>>>
>>>> gnueabi/ipumm-fw/3.00.15.00-r1/temp/log.do_compile.6164)
>>>>
>>>>
>>>> On Tue, Aug 14, 2018 at 10:37:58AM -0400, hzhang@ti.com wrote:
>>>>> From: Hao Zhang <hzhang@ti.com>
>>>>>
>>>>> Signed-off-by: Hao Zhang <hzhang@ti.com>
>>>>>
>>>>> ---
>>>>> Changes from previous version of patch
>>>>> Remove old version of tools
>>>>> ---
>>>>> ---
>>>>>   recipes-ti/bios/ti-dspbios_5.41.11.38.bb                     |  9
>>>>> ---------
>>>>>   recipes-ti/bios/ti-sysbios_6.33.00.19.bb                     |  9
>>>>> ---------
>>>>>   recipes-ti/bios/ti-sysbios_6.46.05.55.bb                     | 12
>>>>> ------------
>>>>>   .../{ti-sysbios_6.52.00.12.bb => ti-sysbios_6.73.00.12.bb}   |  8
>>>>> ++++----
>>>>>   4 files changed, 4 insertions(+), 34 deletions(-)
>>>>>   delete mode 100644 recipes-ti/bios/ti-dspbios_5.41.11.38.bb
>>>>>   delete mode 100644 recipes-ti/bios/ti-sysbios_6.33.00.19.bb
>>>>>   delete mode 100644 recipes-ti/bios/ti-sysbios_6.46.05.55.bb
>>>>>   rename recipes-ti/bios/{ti-sysbios_6.52.00.12.bb => ti-
>>>> sysbios_6.73.00.12.bb} (52%)
>>>>> diff --git a/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
>>>>> b/recipes-ti/bios/ti-
>>>> dspbios_5.41.11.38.bb
>>>>> deleted file mode 100644
>>>>> index f60f6c0..0000000
>>>>> --- a/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
>>>>> +++ /dev/null
>>>>> @@ -1,9 +0,0 @@
>>>>> -require ti-dspbios.inc
>>>>> -
>>>>> -PV = "5_41_11_38"
>>>>> -
>>>>> -SRC_URI[biosbin.md5sum] = "7fab13740c25f5b34b331bcdc759536e"
>>>>> -SRC_URI[biosbin.sha256sum] =
>>>> "96b8e090f79420a4c11d9c0c10d182d1d3b4afb48f11ec375c97b4c91970d0a0
>>>> "
>>>>> -
>>>>> -
>>>>> -INSANE_SKIP_${PN} = "installed-vs-shipped"
>>>>> diff --git a/recipes-ti/bios/ti-sysbios_6.33.00.19.bb
>>>>> b/recipes-ti/bios/ti-
>>>> sysbios_6.33.00.19.bb
>>>>> deleted file mode 100644
>>>>> index 4e2b445..0000000
>>>>> --- a/recipes-ti/bios/ti-sysbios_6.33.00.19.bb
>>>>> +++ /dev/null
>>>>> @@ -1,9 +0,0 @@
>>>>> -require ti-sysbios.inc
>>>>> -
>>>>> -PV = "6_33_00_19"
>>>>> -LIC_FILES_CHKSUM =
>>>> "file://sysbios_${PV}_manifest.html;md5=94136ca9815f76603b7202a41f1d6f
>>>> 5e"
>>>>> -
>>>>> -SRC_URI[sysbiosbin.md5sum] = "e1a2f28a8b3087896bbd986696e1a908"
>>>>> -SRC_URI[sysbiosbin.sha256sum] =
>>>> "b7e096662f5d928eb818bbb14474deb1e3e038fea34b516b248de637835121e
>>>> c"
>>>>> -
>>>>> -S = "${WORKDIR}/ti/bios_${PV}"
>>>>> diff --git a/recipes-ti/bios/ti-sysbios_6.46.05.55.bb
>>>>> b/recipes-ti/bios/ti-
>>>> sysbios_6.46.05.55.bb
>>>>> deleted file mode 100644
>>>>> index e910d53..0000000
>>>>> --- a/recipes-ti/bios/ti-sysbios_6.46.05.55.bb
>>>>> +++ /dev/null
>>>>> @@ -1,12 +0,0 @@
>>>>> -require recipes-ti/bios/ti-sysbios.inc
>>>>> -
>>>>> -PV = "6_46_05_55"
>>>>> -PR = "r0"
>>>>> -
>>>>> -LIC_FILES_CHKSUM =
>>>> "file://manifest_bios_${PV}.html;md5=1c88b63f0ce751d88354de0727623eba
>>>> "
>>>>> -
>>>>> -SRC_URI[sysbiosbin.md5sum] = "8182effcbeea90778e393818ec4d65e8"
>>>>> -SRC_URI[sysbiosbin.sha256sum] =
>>>> "2ad3432cafd1a93dd8cd1e56b722c979852d5c72f5defc29843d507cdd7b667a
>>>> "
>>>>> -
>>>>> -TI_BIN_UNPK_CMDS=""
>>>>> -TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
>>>>> diff --git a/recipes-ti/bios/ti-sysbios_6.52.00.12.bb
>>>>> b/recipes-ti/bios/ti-
>>>> sysbios_6.73.00.12.bb
>>>>> similarity index 52%
>>>>> rename from recipes-ti/bios/ti-sysbios_6.52.00.12.bb
>>>>> rename to recipes-ti/bios/ti-sysbios_6.73.00.12.bb
>>>>> index ebdb135..b727673 100644
>>>>> --- a/recipes-ti/bios/ti-sysbios_6.52.00.12.bb
>>>>> +++ b/recipes-ti/bios/ti-sysbios_6.73.00.12.bb
>>>>> @@ -1,12 +1,12 @@
>>>>>   require recipes-ti/bios/ti-sysbios.inc
>>>>>
>>>>> -PV = "6_52_00_12"
>>>>> +PV = "6_73_00_12"
>>>>>   PR = "r0"
>>>>>
>>>>> -LIC_FILES_CHKSUM =
>>>> "file://manifest_bios_${PV}.html;md5=ca549c223d732e6f69efc449795c4eeb"
>>>>> +LIC_FILES_CHKSUM =
>>>> "file://manifest_bios_${PV}.html;md5=99771475f3621a6bf690df10327eaaa9"
>>>>> -SRC_URI[sysbiosbin.md5sum] = "3c16af0843b5b6c5ff10512d1b586665"
>>>>> -SRC_URI[sysbiosbin.sha256sum] =
>>>> "4a2b9b76f52a57f02725337db9361787eae4c917d7cf989a697ed41eb4a1e701
>>>> "
>>>>> +SRC_URI[sysbiosbin.md5sum] = "f8ff74bf0cfebdd5689fba843272ac61"
>>>>> +SRC_URI[sysbiosbin.sha256sum] =
>>>> "4fdf76696fb43984a9cae739fd2ee091ca9d031ad0277d2bb94dbb26eae63f43"
>>>>>   TI_BIN_UNPK_CMDS = ""
>>>>>   TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
>>>>> -- 
>>>>> 2.7.4
>>>>>
>>>>> -- 
>>>>> _______________________________________________
>>>>> meta-ti mailing list
>>>>> meta-ti@yoctoproject.org
>>>>> https://lists.yoctoproject.org/listinfo/meta-ti
> 


