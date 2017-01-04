Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B955FE003C1; Wed,  4 Jan 2017 10:12:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FFCEE0030B
	for <meta-ti@yoctoproject.org>; Wed,  4 Jan 2017 10:12:16 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v04ICDZa007870;
	Wed, 4 Jan 2017 12:12:13 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v04ICDSb006771;
	Wed, 4 Jan 2017 12:12:13 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 4 Jan 2017 12:12:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v04ICDQC004340;
	Wed, 4 Jan 2017 12:12:13 -0600
Date: Wed, 4 Jan 2017 13:12:12 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20170104181212.GI28380@edge>
References: <972676697.10149692.1483518767462.ref@mail.yahoo.com>
	<972676697.10149692.1483518767462@mail.yahoo.com>
	<20170104171954.GG28380@edge>
	<009C030982313E4589C6BC55FBF1E82A2532EF30@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A2532EF30@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: ti-sgx-ddk-um / do_install failed / cp: cannot stat './targetfs//etc/*': No such file or directory
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
X-List-Received-Date: Wed, 04 Jan 2017 18:12:18 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jan 04, 2017 at 12:54:07PM -0500, Ruei, Eric wrote:
> 
> Hi, All:
> 
> I try beaglebone and it does work.
> MACHINE=beaglebone bitbake ti-sgx-ddk-um
> 
> Best regards,

Eric,

You are not using Poky, so you won't see this problem.


Benjamin,

You should either change your MACHINE from "beaglebone" to "am335x-evm" (which 
is pretty much the same, a bit more generic), or you make sure you don't have 
meta-yocto-bsp layer in your bblayers.conf.

-- 
Denys


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Wednesday, January 04, 2017 12:20 PM
> To: Benjamin Bimmermann
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] ti-sgx-ddk-um / do_install failed / cp: cannot stat './targetfs//etc/*': No such file or directory
> 
> On Wed, Jan 04, 2017 at 08:32:47AM +0000, Benjamin Bimmermann wrote:
> > Hello,
> > 
> > I'm trying to build the ti-sgx-ddk-for the AM33x.
> > I've tried to build the Krogoth and the morty branch, but both failed.
> > A few months ago I had this error yet. I also do not understand which files he would like to copy, but not find.
> > I have attached an extract from my log.
> 
> Try changing MACHINE from "beaglebone" to "am335x-evm".
> 
> -- 
> Denys
> 
> 
> > Thank you for your attentionBimmermann
> > 
> > 
> > ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
> > log.do_install.19908
> > Log data follows:
> > | DEBUG: Executing shell function do_install
> > | NOTE: make -j7 install DESTDIR=/home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image TARGET_PRODUCT=
> > | mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/etc
> > | mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/usr/bin
> > | mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/usr/include
> > | mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/usr/lib
> > | cp -ar ./targetfs//etc/* /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/etc
> > | cp: cannot stat './targetfs//etc/*': No such file or directory
> > | Makefile:14: recipe for target 'install' failed
> > | make: *** [install] Error 1
> > | ERROR: oe_runmake failed
> > | ERROR: Function failed: do_install (log file is located at /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/temp/log.do_install.19908)
> > NOTE: recipe ti-sgx-ddk-um-1.14.3699939-r19: task do_install: Failed
> > ERROR: Task 843 (/home/bimmermann/poky-krogoth/meta-ti/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb, do_install) failed with exit code '1'
> > NOTE: Running task 2572 of 3217 (ID: 830, /home/bimmermann/poky-krogoth/meta-BBB_QT5_PSS/meta-BBB_QT5_PSS/recipes-extras/thermal-init/thermal-init.bb, do_install)
> > ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> > Build Configuration:
> > BB_VERSION        = "1.30.0"
> > BUILD_SYS         = "x86_64-linux"
> > NATIVELSBSTRING   = "Ubuntu-16.04"
> > TARGET_SYS        = "arm-poky-linux-gnueabi"
> > MACHINE           = "beaglebone"
> > DISTRO            = "poky"
> > DISTRO_VERSION    = "2.1.2"
> > TUNE_FEATURES     = "arm armv7a vfp thumb neon       callconvention-hard"
> > TARGET_FPU        = "hard"
> > meta-ti           = "krogoth:8663e1611ab6c5bfe36d323d9d9db4dada4bd532"
> > meta-qt5          = "krogoth:2b1871f0d139dc3caaa779a32a1931409c245a36"
> > meta-oe            = "krogoth:55c8a76da5dc099a7bc3838495c672140cedb78e"
> > meta              
> > meta-yocto        = "krogoth:ae9b341ecfcc60e970f29cfe04306411ad26c0cf"
> > ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

