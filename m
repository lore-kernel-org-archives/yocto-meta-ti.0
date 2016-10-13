Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C030E00DF0; Thu, 13 Oct 2016 03:29:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35881E00C81
	for <meta-ti@yoctoproject.org>; Thu, 13 Oct 2016 03:29:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9DAT7A4008752;
	Thu, 13 Oct 2016 05:29:07 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9DAT7rj025634;
	Thu, 13 Oct 2016 05:29:07 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Oct 2016 05:29:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9DAT6oT016532;
	Thu, 13 Oct 2016 05:29:06 -0500
Date: Thu, 13 Oct 2016 06:29:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Simon Pelletier-Thibault <simon.pelletiert@gmail.com>
Message-ID: <20161013102905.GT12745@edge>
References: <CAMUfapSLsRQiC=ugzRWLJHqFS-PzV9evCx0CQtWRqzdO=vC6GA@mail.gmail.com>
	<009C030982313E4589C6BC55FBF1E82A142D6938@DFLE09.ent.ti.com>
	<20161010142749.GR12745@edge>
	<CAMUfapRgck57qr2oyGJb02qiUmyU+6nart61uYSQiFtKo6mDcQ@mail.gmail.com>
	<20161011090432.GS12745@edge>
	<CAMUfapT6GW9kZ5X5gJkAnnhuWeqUQnYbmpcNYxXFXCPM8FH9iw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMUfapT6GW9kZ5X5gJkAnnhuWeqUQnYbmpcNYxXFXCPM8FH9iw@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 10:29:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

You are welcome to poke around in meta-arago.

I set preferences in http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/conf/distro/include/arago-prefs.inc;hb=HEAD

PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
PREFERRED_PROVIDER_libgbm = "libgbm"
PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"

And I also change PACKAGECONFIG to remove mesa in http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend;hb=HEAD

PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"


Like I mentioned, second part shouldn't be needed, once upstream separation of 
libgbm from mesa happens, which we discussed on oe-core mailing list some time 
ago...

-- 
Denys


On Tue, Oct 11, 2016 at 10:40:52PM -0400, Simon Pelletier-Thibault wrote:
> Hi Denys,
> 
> Thank you, for your answer.
> 
> It sound like meta-arago has some of solutions for my problem, I'm going to
> try to add this to my build.
> 
> Do you have a "recommanded way" to get rid of the mesa/libgbm problem?
> For now,
> I add this to my local.conf:
> PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
> PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
> PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
> 
> I remove manually all the reference of gbm in
> meta/recipes-graphics/mesa/mesa.inc. However, it is certainly not the right
> way to do it.
> 
> Simon
> 
> On Tue, Oct 11, 2016 at 5:04 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > Is this what you are looking for?
> > http://arago-project.org/git/?p=meta-arago.git;a=blob;f=
> > meta-arago-distro/recipes-graphics/wayland/weston/0001-
> > udev-seat-restrict-udev-enumeration-to-card0.patch;hb=HEAD
> >
> > BTW, you don't need mesa at all, just libgbm, but it requires some
> > massaging
> > with PREFERRED_PROVIDERs and bbappends to get it going for now, although
> > there's been some discussion to get it fixed upstream in the future...
> >
> > --
> > Denys
> >
> >
> > On Mon, Oct 10, 2016 at 04:26:59PM -0400, Simon Pelletier-Thibault wrote:
> > > Hi Eric, Denys
> > >
> > > Thank you for answering.
> > >
> > > I tried the following:
> > > root@beaglebone:~# gles1test1
> > > PVR:(Error): WSEGL_CreateWindowDrawable: Couldn't set CRTC: Invalid
> > > argument [0, ]
> > > 'eglCreateWindowSurface' returned egl error 'EGL_BAD_ALLOC' (0x3003)
> > > root@beaglebone:~# gles2test1
> > > --------------------- started ---------------------
> > > PVR:(Error): WSEGL_CreateWindowDrawable: Couldn't set CRTC: Invalid
> > > argument [0, ]
> > > 'eglCreateWindowSurface' returned egl error 'EGL_BAD_ALLOC' (0x3003)
> > >
> > > I also try other configurations, like core-image-weston. After
> > "adjusting"
> > > mesa so it won't install gbm, weston won't boot and I still errors.
> > >
> > > here the weston output:
> > > starting with no config
> > > Loding module/usr/lib/weston/drm-backend.so
> > > output repaint windows is 7 ms maximun
> > > initilizing drm backend
> > > using /dev/dri/card0
> > > Loading module /usr/lib/weston/gl-rendered.so
> > > ...
> > > loaded module: found gbm_pvr.so
> > > found valid GBM backend : gbm_pvr.so
> > > warning no EGL_EXT_platform_base support of specific platform; failling
> > > back to eglGetDisplay
> > > failed to choose EGL config
> > > failed to initialize egl
> > > fatal: failed to create compositor backend
> > >
> > >
> > > I think the problem is around the drm thing. I'm not an expert but:
> > > when I look at /dev/dri/*, I see 2 card ( as if there is 2 drm driver)
> > > root@beaglebone:~# ls -lsa /dev/dri/
> > >      0 drwxr-xr-x    2 root     root           120 Jan  1  1970 .
> > >      0 drwxr-xr-x   11 root     root         13160 Oct  6 04:22 ..
> > >      0 crw-rw----    1 root     video     226,   0 Jan  1  1970 card0
> > >      0 crw-rw----    1 root     video     226,   1 Jan  1  1970 card1
> > >      0 crw-rw----    1 root     video     226,  64 Jan  1  1970
> > controlD64
> > >      0 crw-rw----    1 root     video     226, 128 Jan  1  1970
> > renderD128
> > >
> > >
> > > also
> > > root@beaglebone:~# ls -lsa /sys/class/drm/card0/device/driver
> > >      0 lrwxrwxrwx    1 root     root             0 Oct  6 04:31
> > > /sys/class/drm/card0/device/driver ->
> > > ../../../../bus/platform/drivers/tilcdc
> > > root@beaglebone:~# ls -lsa /sys/class/drm/card1/device/driver
> > >      0 lrwxrwxrwx    1 root     root             0 Oct  6 04:35
> > > /sys/class/drm/card1/device/driver ->
> > > ../../../../bus/platform/drivers/pvrsrvkm
> > >
> > > 1. So it sound that there is 2 drm drivers is it normal?
> > > 2. Should I change the device three to remove tilcdc, so the only drm
> > > driver will be pvrsrvkm?
> > > 3. Is there something to do to ensure libdrm use the SGX driver?
> > >
> > >
> > > On Mon, Oct 10, 2016 at 10:27 AM, Denys Dmytriyenko <denys@ti.com>
> > wrote:
> > >
> > > > FYI, that is not part of meta-ti - both kmscube and SGX demos are part
> > of
> > > > meta-arago application layer, not meta-ti BSP layer.
> > > >
> > > > --
> > > > Denys
> > > >
> > > >
> > > > On Mon, Oct 10, 2016 at 02:19:22PM +0000, Ruei, Eric wrote:
> > > > > Hi, Simon:
> > > > >
> > > > > Most of the SGX test programs including sgx_init_test will not work
> > > > anymore because we have switched to DRM-based EGL Window Systems.
> > > > > Have you tried other SGX test programs at the file system?
> > > > >
> > > > > -          Weston?
> > > > >
> > > > > -          QT programs ion top of Weston?
> > > > >
> > > > > -          Without Weston
> > > > >
> > > > > o   Kmscube
> > > > >
> > > > > o   /usr/bin/SGX/demos/Raw/ OGLES2ChameleonMan
> > > > >
> > > > > o   …
> > > > >
> > > > > Best regards,
> > > > >
> > > > > Eric
> > > > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@
> > > > yoctoproject.org] On Behalf Of Simon Pelletier-Thibault
> > > > > Sent: Friday, October 07, 2016 9:49 PM
> > > > > To: meta-ti@yoctoproject.org
> > > > > Subject: [meta-ti] BeagleBone Black - ti-sgx-ddk not working on yocto
> > > > Krogoth, what is missing
> > > > >
> > > > > Hi,
> > > > > I'm trying to use sgx driver for EGL application on BeagleBone
> > Black. I
> > > > build a minimal image to test it and it is not working.
> > > > > I got this:
> > > > > root@beaglebone:~# sgx_init_test
> > > > > ----------------------- Start -----------------------
> > > > > Try calling PVRSRVConnect with an invalid argument:
> > > > > PVR:(Error): PVRSRVConnect: Invalid connection. [0, ]
> > > > > PVR:(Error): PVRSRVConnect: Unable to open connection. [0, ]
> > > > >  OK
> > > > > Call PVRSRVConnect with a valid argument:
> > > > >  OK
> > > > > Try calling PVRSRVEnumerateDevices with invalid puiNumDevices:
> > > > > PVR:(Error): PVRSRVEnumerateDevices: Invalid params [0, ]
> > > > >  OK
> > > > > Get number of devices from PVRSRVEnumerateDevices:
> > > > >  OK
> > > > > .... Reported 1 devices
> > > > > .... Device Number  | Device Type
> > > > >             0000    | PVRSRV_DEVICE_ID_SGX
> > > > > Attempt to acquire device 0:
> > > > >  OK
> > > > > Getting SGX Client info
> > > > >  OK
> > > > > .... ui32ProcessID:266
> > > > > Display Class API: enumerate devices
> > > > >  OK
> > > > > PVRSRVEnumerateDeviceClass() returns 0 display device(s)
> > > > >  FAIL - PVRSRV_ERROR_NO_DC_DEVICES_FOUND
> > > > > -----
> > > > > Here my configuration:
> > > > > bblayes.conf:
> > > > > POKY_BBLAYERS_CONF_VERSION = "2"
> > > > >
> > > > > BBPATH = "${TOPDIR}"
> > > > > BBFILES ?= ""
> > > > >
> > > > > BBLAYERS ?= " \
> > > > >   /path/poky2.1/meta \
> > > > >   /path/poky2.1/meta-poky \
> > > > >   /path/meta-ti2 \
> > > > >   "
> > > > > -----
> > > > >
> > > > > local.conf:
> > > > > PACKAGECONFIG_append_pn-qemu-native = " sdl"
> > > > > PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
> > > > > CONF_VERSION = "1"
> > > > >
> > > > > PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
> > > > > PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
> > > > > PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
> > > > >
> > > > > IMAGE_INSTALL_append_pn-core-image-minimal = "
> > packagegroup-base-vfat
> > > > packagegroup-base-usbhost dropbear linux-firmware ti-sgx-ddk-km
> > > > ti-sgx-ddk-um libdrm"
> > > > >
> > > > > -----
> > > > > What am I missing?
> > > > >
> > > > > I try other configurations, like core-image-weston. After "adjusting"
> > > > mesa so it won't install gbm, weston won't boot and I still get the
> > > > previous error.
> > > > > Thank you.
> > > > > Simon
> > > > >
> > > >
> > > > > --
> > > > > _______________________________________________
> > > > > meta-ti mailing list
> > > > > meta-ti@yoctoproject.org
> > > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > >
> > > >
> >

