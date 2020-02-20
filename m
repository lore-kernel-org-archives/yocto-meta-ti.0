Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.366.1582224955277390563
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 10:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ORTG0IMI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KItrir069929;
	Thu, 20 Feb 2020 12:55:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582224953;
	bh=63jhBUqxb31GGIVziJPXhTYgnpNiGzh5o3G2PIx4TpQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ORTG0IMI2I7SmDoRE5dUZ2hphmsUfeUYoeLfwfltcx6IzhiI9o/djohXM/1IqlMWN
	 mHXKYeuCrFxEalpA3c3YUz3eP1IO8rrnEDv9JQ0kQ+8ohbpDNOm+FLUFsqlgDKllB8
	 zV6puQFVEOOyHCxA1Z++fgdWnlHgLvxRkqsKQVNI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KItr7h042377
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Feb 2020 12:55:53 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 12:55:52 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 12:55:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KItqrP109665;
	Thu, 20 Feb 2020 12:55:52 -0600
Date: Thu, 20 Feb 2020 13:55:52 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] am437x-evm zeus image
Message-ID: <20200220185552.GA22205@beryl>
References: <8c9b4eef-4998-8859-fa66-e26f7f649223@bytesatwork.ch>
 <20200219190052.GS720@beryl>
 <b7af4338-6409-457d-5bf4-173ebcb92b38@bytesatwork.ch>
MIME-Version: 1.0
In-Reply-To: <b7af4338-6409-457d-5bf4-173ebcb92b38@bytesatwork.ch>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 20, 2020 at 11:21:46AM +0100, Daniel Ammann wrote:
> Hi Denys
> 
> Thanks for the answer.
> 
> My build configuration looks like this:
> 
> Build Configuration:
> BB_VERSION           = "1.44.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "arm-poky-linux-gnueabi"

Ah, "poky" toolchain, which doesn't use "gnueabihf" suffix... Probably need 
the same hack as for the generic "oe" toolchain - I'll take a look.


> MACHINE              = "am437x-evm"
> DISTRO               = "poky"
> DISTRO_VERSION       = "3.0.2"
> TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
> TARGET_FPU           = "hard"
> meta
> meta-poky
> meta-yocto-bsp       = "zeus:5e1f52edb7a9f790fb6cb5d96502f3690267c1b1"
> meta-oe
> meta-networking
> meta-python          = "zeus:bb65c27a772723dfe2c15b5e1b27bcc1a1ed884c"
> meta-ti              = "zeus:19a73c96bd05a74711a36a61077e8a7b88b55c63"
> 
> See below for the error messgage.
> 
> Thanks and kind regards
> 
> Daniel
> 
> 
> ERROR: ti-sgx-ddk-km-1.17.4948957-r3v do_compile: oe_runmake failed
> ERROR: ti-sgx-ddk-km-1.17.4948957-r3v do_compile: Execution of '/home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r3v/temp/run.do_compile.19460' failed with exit code 1:
> grep: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source/include/linux/amba: Is a directory
> grep: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source/include/linux/avf: Is a directory
> grep: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source/include/linux/bcma: Is a directory
> .
> .
> .
> grep: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source/include/linux/unaligned: Is a directory
> grep: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source/include/linux/usb: Is a directory
> grep: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source/include/linux/wimax: Is a directory
> ../config/compiler.mk:96: host gcc
> ../config/compiler.mk:185: target arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm -fuse-ld=bfd -fmacro-prefix-map=/home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r3v=/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r3v                      -fdebug-prefix-map=/home/daniel/workspace/reference/am335x-evm-poky
> /build/tmp/work/am437x_evm-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r3v=/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r3v                      -fdebug-prefix-map=/home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r3v/recipe-sysroot=                      -fdebug-prefix-map=/home/daniel/workspace/reference/am3
> 35x-evm-poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r3v/recipe-sysroot-native=  -fdebug-prefix-map=/home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source=/usr/src/kernel
> ******* Multiarch build: no
> ******* Primary arch:    target_armel
> ******* Secondary arch:  none
> ../config/core.mk:513: $(KERNELDIR)/vmlinux does not exist. Kbuild may fail.
> eurasiacon/build/linux2/toplevel.mk:230: eurasiacon/build/linux2/moduledefs/target_armel.mk: No such file or directory
> make[1]: *** No rule to make target 'eurasiacon/build/linux2/moduledefs/target_armel.mk'.  Stop.
> make: *** [../config/core.mk:789: build] Error 2
> WARNING: exit code 1 from a shell command.
> 
> ERROR: Logfile of failure stored in: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r3v/temp/log.do_compile.19460
> 
> 
> 
> On 2/19/20 8:00 PM, Denys Dmytriyenko wrote:
> >Daniel,
> >
> >You are not providing any useful info, such as error messages or logs.
> >
> >In general, yes, am437x-evm on Zeus is ready and has been building fine in
> >many different configurations.
> >
> >Denys
> >
> >
> >On Wed, Feb 19, 2020 at 11:27:55AM +0100, Daniel Ammann wrote:
> >>Hi all
> >>
> >>I'm trying to build a zeus image for am437x-evm. How do I go about that? Is
> >>meta-ti branch zeus ready yet?
> >>
> >>First, I tried a simple poky build with meta-openembedded and meta-ti, building
> >>core-image-base. But compiling of ti-sgx-ddk-km fails.
> >>
> >>Then I followed the instructions in the arago wiki [1], but the build fails
> >>with qtbase because qtbase doesn't run configure successfully.
> >>
> >>What is the recommended way to compile a development image? The goal is to compile
> >>a qt5 application with qtwebengine that needs eglfs support.
> >>
> >>[1] http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> >>
> >>Thanks and kind regards
> >>
> >>Daniel
> 
> -- 
> bytes at work
> Technoparkstrasse 7
> CH-8406 Winterthur
> Switzerland
> 
> phone: +41 52 550 50 67
