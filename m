Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9DF2E0076C; Thu,  4 Sep 2014 20:18:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B1C0E006EF
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 20:18:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s853IP04004949;
	Thu, 4 Sep 2014 22:18:25 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s853IPYG031022;
	Thu, 4 Sep 2014 22:18:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 22:18:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s853IOop016937;
	Thu, 4 Sep 2014 22:18:25 -0500
Date: Thu, 4 Sep 2014 23:18:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20140905031824.GW18620@edge>
References: <mailman.3.1409511601.29045.meta-ti@yoctoproject.org>
	<5403809E.3000703@bertux.com>
	<CA+gsK-qDoxr2OGk5WUGcJAPJNR5XXXem5U9moqtb2gFgXJKOLw@mail.gmail.com>
	<CA+gsK-pU+dm61c9WXHUXp7diratVD3-ArJbOudXemsiSLLH=4A@mail.gmail.com>
	<54092062.9060006@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <54092062.9060006@pabigot.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: BeagleBoard C4 with USB
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
X-List-Received-Date: Fri, 05 Sep 2014 03:18:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Heh, I was working on a reply to Rudy with some relevant details, but was 
constantly being preempted with something else...

So, first of all, beagleboard is supported by the mainline kernel, as it is 
OMAP3 based and there's no more active development being done specifically for 
that SOC, i.e. nothing new is brewing inside linux-ti-staging for it. Having 
said that, it shouldn't break existing support, so it should also be safe to 
use linux-ti-staging for beagleboard. Just set the PREFERRED_PROVIDER for your 
virtual/kernel accordingly.

One of the goals for linux-mainline recipe is to track the latest stable 
mainline kernel w/o applying any patches and using the standard config. I 
might consider porting config fragments support to it though, but then I would 
have to maintain a separate set of fragments, for which I don't have any free 
bandwidth...


Enabling CONFIG_USB_EHCI_HCD in omap2plus_defconfig was not accepted upstream 
by Kevin Hilman with the reason that it breaks Low power modes on OMAP [1]. 
This is more due to a hardware limitation (errata) of wakeup signals not 
implemented correctly on all OMAP platforms for the USB Host module. Yes, 
there is a way to get all this working using software workarounds and IO daisy 
chain mechanism but it was never worked on upstream.

[1] http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=06b4ba529528fbf9c24ce37b7618f4b0264750e2

Since then, 2 out of 3 outlined issues were resolved. But the recommendation 
is to use multi_v7_defconfig that enables pretty much everything, instead of 
omap2plus_defconfig. Unfortunately, entire OMAP3 family rather fell out of our 
scope as the current focus is on the latest SOCs being actively developed and 
upstreamed. Thus, I haven't tried multi_v7_defconfig so far. But we would like 
to get the legacy platforms straightened up eventually. And hopefully sooner 
than later... There's some work already being done in the background with the 
new farm of legacy platforms being at least boot-tested against the latest 
kernel versions, etc.


As of the MACHINE_EXTRA_RRECOMMENDS - patches are welcome. We don't use it 
ourselves, as we explicitly install kernel-modules into images in our Arago 
distro.

-- 
Denys


On Thu, Sep 04, 2014 at 09:30:58PM -0500, Peter A. Bigot wrote:
> For people from the future searching for clues:
> 
> In meta-ti the USB-enabling configuration options come from the
> connectivity.cfg fragment.  From inspection that's added to all the
> boards supported by meta-ti's linux-ti-staging_3.14 recipe, though I
> didn't look to see whether there's a problem with it on beagleboard.
> It doesn't look like it'd be incorporated into linux-mainline,
> though, so perhaps that's why it wasn't present in the original
> problem report.
> 
> For beaglebone (and presumably beagleboard), you can also get the
> lsusb error -99 because the musb modules that support host USB are
> not installed by default.  Easiest way to get those (along with
> everything else you might need) is to install the kernel-modules
> roll-up package.  That's in MACHINE_EXTRA_RRECOMMENDS for beaglebone
> in meta-yocto-bsp, but not in meta-ti.
> 
> The 3.14.17-based ti-staging branch has a lot of really neat stuff
> in it; it's going to take quite a while to explore and figure out
> how to use it.
> 
> Peter
> 
> On 09/01/2014 01:34 AM, Rudolf Streif wrote:
> >I found the issue. Configuring CONFIG_USB_EHCI_HCD_OMAP,
> >CONFIG_USB_OHCI_HCD and
> >CONFIG_USB_OHCI_HCD_OMAP3 in the kernel configuration finally
> >enabled the USB host controller.
> >
> >However, I don't exactly understand why that is not the default
> >for a board support package.
> >
> >:rjs
> >
> >
> >
> >On Sun, Aug 31, 2014 at 9:41 PM, Rudolf Streif
> ><rstreif@linuxfoundation.org <mailto:rstreif@linuxfoundation.org>>
> >wrote:
> >
> >    Thank you, Fabio.
> >
> >    However, that is not the reason. The modules phy_omap_usb2 and
> >    phy_omap_usb3 are built into the kernel but yet the hardware does
> >    not seem to be recognized. That is the case we two different
> >    BeagleBoard C4 boards.
> >
> >    :rjs
> >
> >
> >
> >    On Sun, Aug 31, 2014 at 1:07 PM, Fabio Berton <fabio@bertux.com
> >    <mailto:fabio@bertux.com>> wrote:
> >
> >        Try to install the packages bellow:
> >
> >        kernel-modules
> >        usbutils
> >
> >
> >        On 08/31/2014 04:00 PM, meta-ti-request@yoctoproject.org
> >        <mailto:meta-ti-request@yoctoproject.org> wrote:
> >
> >            Send meta-ti mailing list submissions to
> >            meta-ti@yoctoproject.org <mailto:meta-ti@yoctoproject.org>
> >
> >            To subscribe or unsubscribe via the World Wide Web, visit
> >            https://lists.yoctoproject.org/listinfo/meta-ti
> >            or, via email, send a message with subject or body 'help' to
> >            meta-ti-request@yoctoproject.org
> >            <mailto:meta-ti-request@yoctoproject.org>
> >
> >            You can reach the person managing the list at
> >            meta-ti-owner@yoctoproject.org
> >            <mailto:meta-ti-owner@yoctoproject.org>
> >
> >            When replying, please edit your Subject line so it is more
> >            specific
> >            than "Re: Contents of meta-ti digest..."
> >
> >
> >            Today's Topics:
> >
> >                1. [nightly] Distroless meta-ti/master minimal build
> >                   2014-08-30_21-00-30 (Denys Dmytriyenko)
> >                2. BeagleBoard C4 with USB (Rudolf Streif)
> >
> >
> >            ----------------------------------------------------------------------
> >
> >            Message: 1
> >            Date: Sat, 30 Aug 2014 21:58:30 -0400
> >            From: Denys Dmytriyenko <denys@ti.com <mailto:denys@ti.com>>
> >            To: <meta-ti@yoctoproject.org
> >            <mailto:meta-ti@yoctoproject.org>>
> >            Subject: [meta-ti] [nightly] Distroless meta-ti/master
> >            minimal build
> >                    2014-08-30_21-00-30
> >            Message-ID:
> >            <1330147917.535.1409450310755.JavaMail.jenkins@puget>
> >            Content-Type: text/plain; charset="us-ascii"
> >
> >            An HTML attachment was scrubbed...
> >            URL:
> >            <http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20140830/406dab3a/attachment-0001.html>
> >
> >            ------------------------------
> >
> >            Message: 2
> >            Date: Sun, 31 Aug 2014 07:48:09 -0700
> >            From: Rudolf Streif <rstreif@linuxfoundation.org
> >            <mailto:rstreif@linuxfoundation.org>>
> >            To: "meta-ti@yoctoproject.org
> >            <mailto:meta-ti@yoctoproject.org>"
> >            <meta-ti@yoctoproject.org <mailto:meta-ti@yoctoproject.org>>
> >            Subject: [meta-ti] BeagleBoard C4 with USB
> >            Message-ID:
> >            <CA+gsK-okuyjWuEp+3bm6++ojWrDfaCPwXtXEOswu7Xikxg8jfA@mail.gmail.com
> >            <mailto:CA%2BgsK-okuyjWuEp%2B3bm6%2B%2BojWrDfaCPwXtXEOswu7Xikxg8jfA@mail.gmail.com>>
> >            Content-Type: text/plain; charset="utf-8"
> >
> >
> >            I have a BeagleBoard C4 laying around that I want to use
> >            for a project that
> >            has USB devices connected to it. I built a core-image-base
> >            with YP from
> >            master and meta-ti from master with this configuration:
> >
> >            Build Configuration:
> >            BB_VERSION        = "1.23.1"
> >            BUILD_SYS         = "x86_64-linux"
> >            NATIVELSBSTRING   = "Fedora-18"
> >            TARGET_SYS        = "arm-poky-linux-gnueabi"
> >            MACHINE           = "beagleboard"
> >            DISTRO            = "poky"
> >            DISTRO_VERSION    = "1.6+snapshot-20140831"
> >            TUNE_FEATURES     = "arm armv7a vfp thumb neon
> >            callconvention-hard cortexa8"
> >            TARGET_FPU        = "vfp-neon"
> >            meta
> >            meta-yocto
> >            meta-yocto-bsp    =
> >            "master:c16795477ea7e2159b5d3808268912b572887e2d"
> >            meta-ti           =
> >            "master:d2c40099cd219493e4a6d9a6218f88f1b9f3f8fb"
> >            meta-oe           =
> >            "master:1513d0e31f609ffcde9a116a50bfb0360b9e7ecf"
> >
> >            It builds fine. I am installing u-boot, kernel and the
> >            device tree on the
> >            SSD card.
> >
> >            I use this u-boot script to boot the board:
> >
> >            setenv bootcmd 'mmc init; fatload mmc 0:1 0x80300000
> >            uImage; fatload mmc
> >            0:1 0x815f0000 beagle.dtb; bootm 0x80300000 - 0x815f0000'
> >            setenv bootargs 'console=tty0 console=ttyO2,115200n8
> >            root=/dev/mmcblk0p2
> >            rootwait rootfstype=ext3 ro'
> >            boot
> >
> >            In the above beagle.dtb =
> >            uImage--3.14.8-r0-omap3-beagle-<date>.dtb which
> >            I assumed to be the correct one for the C4 because the
> >            other dtb created
> >            has xM explicitly in its name.
> >
> >            The system boots fine but USB is not working. None of the
> >            typical USB host
> >            controller initialization is in the dmesg output and lsusb
> >            responds with
> >            'unable to initialize libsub: -99'.
> >
> >            I am not sure if I am doing anything wrong or if there is
> >            an actual issue.
> >            Help appreciated.
> >
> >            Cheers,
> >            Rudi
> >            -------------- next part --------------
> >            An HTML attachment was scrubbed...
> >            URL:
> >            <http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20140831/fc724dcd/attachment-0001.html>
> >
> >            ------------------------------
> >
> >
> >        --         _______________________________________________
> >        meta-ti mailing list
> >        meta-ti@yoctoproject.org <mailto:meta-ti@yoctoproject.org>
> >        https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >
> >
> >
> >
> >
> >
> 

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


