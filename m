Return-Path: <dv@pseudoterminal.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4563DE00781; Thu, 14 Aug 2014 06:52:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D521E0074B
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 06:52:45 -0700 (PDT)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 4CB2633413
	for <meta-ti@yoctoproject.org>; Thu, 14 Aug 2014 15:52:44 +0200 (CEST)
Message-ID: <53ECBF31.1050708@pseudoterminal.org>
Date: Thu, 14 Aug 2014 15:52:49 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <53ECBC66.4070509@pseudoterminal.org>
In-Reply-To: <53ECBC66.4070509@pseudoterminal.org>
Subject: Re: Beaglebone Black and libgles-omap3 : build problem
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
X-List-Received-Date: Thu, 14 Aug 2014 13:52:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-08-14 15:40, Carlos Rafael Giani wrote:
> Hello,
>
> I have a BeagleBone black here, and want to build a rootfs for it with 
> Yocto. It shall include support for the SGX GPU.
>
> But when I try to build this, I get:
>
> ERROR: Nothing PROVIDES 'libgles-omap3'
> ERROR: libgles-omap3 was skipped: incompatible with machine beaglebone 
> (not in COMPATIBLE_MACHINE)
> ERROR: libgles-omap3 was skipped: incompatible with machine beaglebone 
> (not in COMPATIBLE_MACHINE)
> ERROR: libgles-omap3-x11 PROVIDES libgles-omap3 but was skipped: 
> incompatible with machine beaglebone (not in COMPATIBLE_MACHINE)
> ERROR: libgles-omap3 was skipped: incompatible with machine beaglebone 
> (not in COMPATIBLE_MACHINE)
>
> However, this is incorrect. The BeagleBone Black has an AM3359 SoC, 
> which does have the SGX, so it is compatible. Looking into the recipe, 
> it lists ti33x as being compatible, yet the build breaks. I fixed this 
> locally by adding "beaglebone" to the list of compatible machines, but 
> of course this is a hack.
>
> Does anybody have some insight into this? Is "beaglebone" perhaps the 
> wrong machine for the BeagleBone black? I didn't find any machine 
> config called "bblack" or "beagleboneblack" or similar.
>
> cheers



In addition to the libgles-omap3 problems, I also cannot build 
omap3-sgx-modules . Yocto version is daisy, meta-ti daisy branch, HEAD 
of meta-ti is at a817ad5826b1c35084a6abb093b89a3916ecb283 .


This is what I get when building omap3-sgx-modules:


/home/test/yocto-ti/build/.build-yocto/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c: 
In function 'OMAPLFBWaitForVSync':
/home/test/yocto-ti/build/.build-yocto/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:180:92: 
error: 'struct omap_dss_device' has no member named 'output'
  #define OMAP_DSS_MANAGER(man, dev) struct omap_overlay_manager *man = 
(dev) != NULL ? (dev)->output->manager : NULL
^
/home/test/yocto-ti/build/.build-yocto/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:821:2: 
note: in expansion of macro 'OMAP_DSS_MANAGER'
   OMAP_DSS_MANAGER(psDSSMan, psDSSDev);
   ^
make[3]: *** 
[/home/test/yocto-ti/build/.build-yocto/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.o] 
Error 1



I apply the patch at 
http://git.buildroot.net/buildroot/tree/package/ti-gfx/ti-gfx-0001-fix-build-omaplfb-linux.patch 
. This helps, but there is another error:


In file included from 
/home/test/yocto-ti/build/.build-yocto/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/include/services_headers.h:55:0,
                  from 
/home/test/yocto-ti/build/.build-yocto/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/common/queue.c:42:
/home/test/yocto-ti/build/.build-yocto/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/include/servicesint.h:51:21: 
fatal error: sysinfo.h: No such file or directory
  #include "sysinfo.h"
                      ^
compilation terminated.
make[2]: *** 
[/home/test/yocto-ti/build/.build-yocto/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.01-c/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/srvkm/common/queue.o] 
Fehler 1


Now I do not know where this omnious sysinfo.h is. I cannot find it 
anywhere.

What can I do?

