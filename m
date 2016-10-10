Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3298E009FD; Mon, 10 Oct 2016 07:27:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F4BEE00546
	for <meta-ti@yoctoproject.org>; Mon, 10 Oct 2016 07:27:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9AERq0O014875;
	Mon, 10 Oct 2016 09:27:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9AERqL7021082;
	Mon, 10 Oct 2016 09:27:52 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Oct 2016 09:27:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9AERpft024105;
	Mon, 10 Oct 2016 09:27:51 -0500
Date: Mon, 10 Oct 2016 10:27:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20161010142749.GR12745@edge>
References: <CAMUfapSLsRQiC=ugzRWLJHqFS-PzV9evCx0CQtWRqzdO=vC6GA@mail.gmail.com>
	<009C030982313E4589C6BC55FBF1E82A142D6938@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A142D6938@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: BeagleBone Black - ti-sgx-ddk not working on yocto Krogoth, what is missing
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
X-List-Received-Date: Mon, 10 Oct 2016 14:27:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

FYI, that is not part of meta-ti - both kmscube and SGX demos are part of 
meta-arago application layer, not meta-ti BSP layer.

-- 
Denys


On Mon, Oct 10, 2016 at 02:19:22PM +0000, Ruei, Eric wrote:
> Hi, Simon:
> 
> Most of the SGX test programs including sgx_init_test will not work anymore because we have switched to DRM-based EGL Window Systems.
> Have you tried other SGX test programs at the file system?
> 
> -          Weston?
> 
> -          QT programs ion top of Weston?
> 
> -          Without Weston
> 
> o   Kmscube
> 
> o   /usr/bin/SGX/demos/Raw/ OGLES2ChameleonMan
> 
> o   …
> 
> Best regards,
> 
> Eric
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Simon Pelletier-Thibault
> Sent: Friday, October 07, 2016 9:49 PM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] BeagleBone Black - ti-sgx-ddk not working on yocto Krogoth, what is missing
> 
> Hi,
> I'm trying to use sgx driver for EGL application on BeagleBone Black. I build a minimal image to test it and it is not working.
> I got this:
> root@beaglebone:~# sgx_init_test
> ----------------------- Start -----------------------
> Try calling PVRSRVConnect with an invalid argument:
> PVR:(Error): PVRSRVConnect: Invalid connection. [0, ]
> PVR:(Error): PVRSRVConnect: Unable to open connection. [0, ]
>  OK
> Call PVRSRVConnect with a valid argument:
>  OK
> Try calling PVRSRVEnumerateDevices with invalid puiNumDevices:
> PVR:(Error): PVRSRVEnumerateDevices: Invalid params [0, ]
>  OK
> Get number of devices from PVRSRVEnumerateDevices:
>  OK
> .... Reported 1 devices
> .... Device Number  | Device Type
>             0000    | PVRSRV_DEVICE_ID_SGX
> Attempt to acquire device 0:
>  OK
> Getting SGX Client info
>  OK
> .... ui32ProcessID:266
> Display Class API: enumerate devices
>  OK
> PVRSRVEnumerateDeviceClass() returns 0 display device(s)
>  FAIL - PVRSRV_ERROR_NO_DC_DEVICES_FOUND
> -----
> Here my configuration:
> bblayes.conf:
> POKY_BBLAYERS_CONF_VERSION = "2"
> 
> BBPATH = "${TOPDIR}"
> BBFILES ?= ""
> 
> BBLAYERS ?= " \
>   /path/poky2.1/meta \
>   /path/poky2.1/meta-poky \
>   /path/meta-ti2 \
>   "
> -----
> 
> local.conf:
> PACKAGECONFIG_append_pn-qemu-native = " sdl"
> PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
> CONF_VERSION = "1"
> 
> PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
> PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
> PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
> 
> IMAGE_INSTALL_append_pn-core-image-minimal = " packagegroup-base-vfat packagegroup-base-usbhost dropbear linux-firmware ti-sgx-ddk-km ti-sgx-ddk-um libdrm"
> 
> -----
> What am I missing?
> 
> I try other configurations, like core-image-weston. After "adjusting" mesa so it won't install gbm, weston won't boot and I still get the previous error.
> Thank you.
> Simon
> 

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


