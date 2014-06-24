Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBD5BE003C1; Tue, 24 Jun 2014 16:04:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B9DAE0027B
	for <meta-ti@yoctoproject.org>; Tue, 24 Jun 2014 16:04:45 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5ON4iS9005041;
	Tue, 24 Jun 2014 18:04:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5ON4ils016580;
	Tue, 24 Jun 2014 18:04:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 24 Jun 2014 18:04:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5ON4hwc018475;
	Tue, 24 Jun 2014 18:04:43 -0500
Date: Tue, 24 Jun 2014 19:04:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20140624230443.GP6700@edge>
References: <CAMCfZKH23Ow_q1MQPi3Hu3oGjTGqpJ=CyO5kXYXoK3uoE-55qA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKH23Ow_q1MQPi3Hu3oGjTGqpJ=CyO5kXYXoK3uoE-55qA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: omap3-sgx-modules fails on do_compile
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
X-List-Received-Date: Tue, 24 Jun 2014 23:04:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Graphics SDK 5.01.01.01 doesn't work with kernel 3.14 yet.

The last tested kernel version to work with Graphics SDK was 3.12; and 3.14 
has changed some APIs, hence the breakage.

-- 
Denys


On Tue, Jun 24, 2014 at 06:04:52PM -0300, Diego Sueiro wrote:
> Folks,
> 
> I'm using both yocto and meta-ti on daisy branch and removed meta-yocto-bsp
> from bblayers.conf.
> 
> Doing a bitbake omap3-sgx-modules I'm receiving the following error:
> 
> 
> DEBUG: Executing shell function do_compile
> NOTE: make -j 8 -e MAKEFLAGS=
> KERNEL_PATH=/<snip>/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel
> KERNEL_SRC=/<snip>/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel
> KERNEL_VERSION=3.14.8 CC=arm-qubit-linux-gnueabi-gcc  -mno-thumb-interwork
> -marm LD=arm-qubit-linux-gnueabi-ld.bfd   AR=arm-qubit-linux-gnueabi-ar
>  BUILD=release TI_PLATFORM=ti335x SUPPORT_XORG=
> make -C /<snip>/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel
> M=`pwd`
> make[1]: Entering directory
> `/<snip>/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel'
>       CC [M]
>  /<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.o
> /<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:
> In function 'OMAPLFBWaitForVSync':
> /<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:710:7:
> error: implicit declaration of function 'register_vsync_cb'
> [-Werror=implicit-function-declaration]
>        if (register_vsync_cb((vsync_callback_t)grpx_irq_wait_handler,
> &completion, psDevInfo->uiFBDevID) != 0)
>        ^
> /<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:710:30:
> error: 'vsync_callback_t' undeclared (first use in this function)
>        if (register_vsync_cb((vsync_callback_t)grpx_irq_wait_handler,
> &completion, psDevInfo->uiFBDevID) != 0)
>                               ^
> /<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:710:30:
> note: each undeclared identifier is reported only once for each function it
> appears in
> /<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:710:47:
> error: expected ')' before 'grpx_irq_wait_handler'
>        if (register_vsync_cb((vsync_callback_t)grpx_irq_wait_handler,
> &completion, psDevInfo->uiFBDevID) != 0)
>                                                ^
> /<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:716:7:
> error: implicit declaration of function 'unregister_vsync_cb'
> [-Werror=implicit-function-declaration]
>        if (unregister_vsync_cb((vsync_callback_t)grpx_irq_wait_handler ,
> &completion, psDevInfo->uiFBDevID) != 0)
>        ^
> /<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.c:716:49:
> error: expected ')' before 'grpx_irq_wait_handler'
>        if (unregister_vsync_cb((vsync_callback_t)grpx_irq_wait_handler ,
> &completion, psDevInfo->uiFBDevID) != 0)
>                                                  ^
> cc1: some warnings being treated as errors
> make[3]: ***
> [/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux/omaplfb_linux.o]
> Error 1
> make[2]: ***
> [/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM/services4/3rdparty/dc_ti335x_linux]
> Error 2
> make[1]: ***
> [_module_/<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/Graphics_SDK_5_01_01_01/GFX_Linux_KM]
> Error 2
> make[1]: Leaving directory
> `/<snip>/build-daisy/tmp-eglibc/sysroots/beaglebone/usr/src/kernel'
> make: *** [all] Error 2
> ERROR: oe_runmake failed
> WARNING: exit code 1 from a shell command.
> ERROR: Function failed: do_compile (log file is located at
> /<snip>/build-daisy/tmp-eglibc/work/beaglebone-qubit-linux-gnueabi/omap3-sgx-modules/5.01.01.01-r22a/temp/log.do_compile.3405)
> 
> I'm I missing something?
> 
> Regards,
> 
> --
> *dS
> Diego Sueiro
> 
> Administrador do Embarcados
> www.embarcados.com.br
> <http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
> 
> /*long live rock 'n roll*/

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


