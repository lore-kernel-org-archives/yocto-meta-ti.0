Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62651E00769; Thu,  4 Sep 2014 19:31:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [173.201.193.231 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from p3plsmtpa09-02.prod.phx3.secureserver.net
	(p3plsmtpa09-02.prod.phx3.secureserver.net [173.201.193.231])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA5A2E004F5
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 19:31:00 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa09-02.prod.phx3.secureserver.net with 
	id nEWy1o00B1mTNtu01EWy0r; Thu, 04 Sep 2014 19:30:59 -0700
Message-ID: <54092062.9060006@pabigot.com>
Date: Thu, 04 Sep 2014 21:30:58 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <mailman.3.1409511601.29045.meta-ti@yoctoproject.org>	<5403809E.3000703@bertux.com>	<CA+gsK-qDoxr2OGk5WUGcJAPJNR5XXXem5U9moqtb2gFgXJKOLw@mail.gmail.com>
	<CA+gsK-pU+dm61c9WXHUXp7diratVD3-ArJbOudXemsiSLLH=4A@mail.gmail.com>
In-Reply-To: <CA+gsK-pU+dm61c9WXHUXp7diratVD3-ArJbOudXemsiSLLH=4A@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 Sep 2014 02:31:04 -0000
Content-Type: multipart/alternative;
	boundary="------------050009090903030308070308"

--------------050009090903030308070308
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

For people from the future searching for clues:

In meta-ti the USB-enabling configuration options come from the 
connectivity.cfg fragment.  From inspection that's added to all the 
boards supported by meta-ti's linux-ti-staging_3.14 recipe, though I 
didn't look to see whether there's a problem with it on beagleboard.  It 
doesn't look like it'd be incorporated into linux-mainline, though, so 
perhaps that's why it wasn't present in the original problem report.

For beaglebone (and presumably beagleboard), you can also get the lsusb 
error -99 because the musb modules that support host USB are not 
installed by default.  Easiest way to get those (along with everything 
else you might need) is to install the kernel-modules roll-up package.  
That's in MACHINE_EXTRA_RRECOMMENDS for beaglebone in meta-yocto-bsp, 
but not in meta-ti.

The 3.14.17-based ti-staging branch has a lot of really neat stuff in 
it; it's going to take quite a while to explore and figure out how to 
use it.

Peter

On 09/01/2014 01:34 AM, Rudolf Streif wrote:
> I found the issue. Configuring CONFIG_USB_EHCI_HCD_OMAP, 
> CONFIG_USB_OHCI_HCD and
> CONFIG_USB_OHCI_HCD_OMAP3 in the kernel configuration finally enabled 
> the USB host controller.
>
> However, I don't exactly understand why that is not the default for a 
> board support package.
>
> :rjs
>
>
>
> On Sun, Aug 31, 2014 at 9:41 PM, Rudolf Streif 
> <rstreif@linuxfoundation.org <mailto:rstreif@linuxfoundation.org>> wrote:
>
>     Thank you, Fabio.
>
>     However, that is not the reason. The modules phy_omap_usb2 and
>     phy_omap_usb3 are built into the kernel but yet the hardware does
>     not seem to be recognized. That is the case we two different
>     BeagleBoard C4 boards.
>
>     :rjs
>
>
>
>     On Sun, Aug 31, 2014 at 1:07 PM, Fabio Berton <fabio@bertux.com
>     <mailto:fabio@bertux.com>> wrote:
>
>         Try to install the packages bellow:
>
>         kernel-modules
>         usbutils
>
>
>         On 08/31/2014 04:00 PM, meta-ti-request@yoctoproject.org
>         <mailto:meta-ti-request@yoctoproject.org> wrote:
>
>             Send meta-ti mailing list submissions to
>             meta-ti@yoctoproject.org <mailto:meta-ti@yoctoproject.org>
>
>             To subscribe or unsubscribe via the World Wide Web, visit
>             https://lists.yoctoproject.org/listinfo/meta-ti
>             or, via email, send a message with subject or body 'help' to
>             meta-ti-request@yoctoproject.org
>             <mailto:meta-ti-request@yoctoproject.org>
>
>             You can reach the person managing the list at
>             meta-ti-owner@yoctoproject.org
>             <mailto:meta-ti-owner@yoctoproject.org>
>
>             When replying, please edit your Subject line so it is more
>             specific
>             than "Re: Contents of meta-ti digest..."
>
>
>             Today's Topics:
>
>                 1. [nightly] Distroless meta-ti/master minimal build
>                    2014-08-30_21-00-30 (Denys Dmytriyenko)
>                 2. BeagleBoard C4 with USB (Rudolf Streif)
>
>
>             ----------------------------------------------------------------------
>
>             Message: 1
>             Date: Sat, 30 Aug 2014 21:58:30 -0400
>             From: Denys Dmytriyenko <denys@ti.com <mailto:denys@ti.com>>
>             To: <meta-ti@yoctoproject.org
>             <mailto:meta-ti@yoctoproject.org>>
>             Subject: [meta-ti] [nightly] Distroless meta-ti/master
>             minimal build
>                     2014-08-30_21-00-30
>             Message-ID:
>             <1330147917.535.1409450310755.JavaMail.jenkins@puget>
>             Content-Type: text/plain; charset="us-ascii"
>
>             An HTML attachment was scrubbed...
>             URL:
>             <http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20140830/406dab3a/attachment-0001.html>
>
>             ------------------------------
>
>             Message: 2
>             Date: Sun, 31 Aug 2014 07:48:09 -0700
>             From: Rudolf Streif <rstreif@linuxfoundation.org
>             <mailto:rstreif@linuxfoundation.org>>
>             To: "meta-ti@yoctoproject.org
>             <mailto:meta-ti@yoctoproject.org>"
>             <meta-ti@yoctoproject.org <mailto:meta-ti@yoctoproject.org>>
>             Subject: [meta-ti] BeagleBoard C4 with USB
>             Message-ID:
>                    
>             <CA+gsK-okuyjWuEp+3bm6++ojWrDfaCPwXtXEOswu7Xikxg8jfA@mail.gmail.com
>             <mailto:CA%2BgsK-okuyjWuEp%2B3bm6%2B%2BojWrDfaCPwXtXEOswu7Xikxg8jfA@mail.gmail.com>>
>             Content-Type: text/plain; charset="utf-8"
>
>
>             I have a BeagleBoard C4 laying around that I want to use
>             for a project that
>             has USB devices connected to it. I built a core-image-base
>             with YP from
>             master and meta-ti from master with this configuration:
>
>             Build Configuration:
>             BB_VERSION        = "1.23.1"
>             BUILD_SYS         = "x86_64-linux"
>             NATIVELSBSTRING   = "Fedora-18"
>             TARGET_SYS        = "arm-poky-linux-gnueabi"
>             MACHINE           = "beagleboard"
>             DISTRO            = "poky"
>             DISTRO_VERSION    = "1.6+snapshot-20140831"
>             TUNE_FEATURES     = "arm armv7a vfp thumb neon
>             callconvention-hard cortexa8"
>             TARGET_FPU        = "vfp-neon"
>             meta
>             meta-yocto
>             meta-yocto-bsp    =
>             "master:c16795477ea7e2159b5d3808268912b572887e2d"
>             meta-ti           =
>             "master:d2c40099cd219493e4a6d9a6218f88f1b9f3f8fb"
>             meta-oe           =
>             "master:1513d0e31f609ffcde9a116a50bfb0360b9e7ecf"
>
>             It builds fine. I am installing u-boot, kernel and the
>             device tree on the
>             SSD card.
>
>             I use this u-boot script to boot the board:
>
>             setenv bootcmd 'mmc init; fatload mmc 0:1 0x80300000
>             uImage; fatload mmc
>             0:1 0x815f0000 beagle.dtb; bootm 0x80300000 - 0x815f0000'
>             setenv bootargs 'console=tty0 console=ttyO2,115200n8
>             root=/dev/mmcblk0p2
>             rootwait rootfstype=ext3 ro'
>             boot
>
>             In the above beagle.dtb =
>             uImage--3.14.8-r0-omap3-beagle-<date>.dtb which
>             I assumed to be the correct one for the C4 because the
>             other dtb created
>             has xM explicitly in its name.
>
>             The system boots fine but USB is not working. None of the
>             typical USB host
>             controller initialization is in the dmesg output and lsusb
>             responds with
>             'unable to initialize libsub: -99'.
>
>             I am not sure if I am doing anything wrong or if there is
>             an actual issue.
>             Help appreciated.
>
>             Cheers,
>             Rudi
>             -------------- next part --------------
>             An HTML attachment was scrubbed...
>             URL:
>             <http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20140831/fc724dcd/attachment-0001.html>
>
>             ------------------------------
>
>
>         -- 
>         _______________________________________________
>         meta-ti mailing list
>         meta-ti@yoctoproject.org <mailto:meta-ti@yoctoproject.org>
>         https://lists.yoctoproject.org/listinfo/meta-ti
>
>
>
>
>
>
>


--------------050009090903030308070308
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">For people from the future searching
      for clues:<br>
      <br>
      In meta-ti the USB-enabling configuration options come from the
      connectivity.cfg fragment.  From inspection that's added to all
      the boards supported by meta-ti's linux-ti-staging_3.14 recipe,
      though I didn't look to see whether there's a problem with it on
      beagleboard.  It doesn't look like it'd be incorporated into
      linux-mainline, though, so perhaps that's why it wasn't present in
      the original problem report.<br>
      <br>
      For beaglebone (and presumably beagleboard), you can also get the
      lsusb error -99 because the musb modules that support host USB are
      not installed by default.  Easiest way to get those (along with
      everything else you might need) is to install the kernel-modules
      roll-up package.  That's in MACHINE_EXTRA_RRECOMMENDS for
      beaglebone in meta-yocto-bsp, but not in meta-ti.<br>
      <br>
      The 3.14.17-based ti-staging branch has a lot of really neat stuff
      in it; it's going to take quite a while to explore and figure out
      how to use it.<br>
      <br>
      Peter<br>
      <br>
      On 09/01/2014 01:34 AM, Rudolf Streif wrote:<br>
    </div>
    <blockquote
cite="mid:CA+gsK-pU+dm61c9WXHUXp7diratVD3-ArJbOudXemsiSLLH=4A@mail.gmail.com"
      type="cite">
      <div dir="ltr">I found the issue.
        Configuring CONFIG_USB_EHCI_HCD_OMAP, CONFIG_USB_OHCI_HCD and
        <div>CONFIG_USB_OHCI_HCD_OMAP3 in the kernel configuration
          finally enabled the USB host controller.</div>
        <div><br>
        </div>
        <div>However, I don't exactly understand why that is not the
          default for a board support package.</div>
        <div><br>
        </div>
        <div>:rjs</div>
        <div><br>
        </div>
        <div class="gmail_extra"><br>
          <br>
          <div class="gmail_quote">On Sun, Aug 31, 2014 at 9:41 PM,
            Rudolf Streif <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:rstreif@linuxfoundation.org"
                target="_blank">rstreif@linuxfoundation.org</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div dir="ltr">Thank you, Fabio.
                <div><br>
                </div>
                <div>However, that is not the reason. The modules
                  phy_omap_usb2 and phy_omap_usb3 are built into the
                  kernel but yet the hardware does not seem to be
                  recognized. That is the case we two different
                  BeagleBoard C4 boards.</div>
                <div><br>
                </div>
                <div>:rjs
                  <div>
                    <div class="h5"><br>
                      <div class="gmail_extra"><br>
                        <br>
                        <div class="gmail_quote">On Sun, Aug 31, 2014 at
                          1:07 PM, Fabio Berton <span dir="ltr">&lt;<a
                              moz-do-not-send="true"
                              href="mailto:fabio@bertux.com"
                              target="_blank">fabio@bertux.com</a>&gt;</span>
                          wrote:<br>
                          <blockquote class="gmail_quote"
                            style="margin:0 0 0 .8ex;border-left:1px
                            #ccc solid;padding-left:1ex">Try to install
                            the packages bellow:<br>
                            <br>
                            kernel-modules<br>
                            usbutils<br>
                            <br>
                            <br>
                            On 08/31/2014 04:00 PM, <a
                              moz-do-not-send="true"
                              href="mailto:meta-ti-request@yoctoproject.org"
                              target="_blank">meta-ti-request@yoctoproject.org</a>
                            wrote:<br>
                            <blockquote class="gmail_quote"
                              style="margin:0 0 0 .8ex;border-left:1px
                              #ccc solid;padding-left:1ex">
                              Send meta-ti mailing list submissions to<br>
                                      <a moz-do-not-send="true"
                                href="mailto:meta-ti@yoctoproject.org"
                                target="_blank">meta-ti@yoctoproject.org</a><br>
                              <br>
                              To subscribe or unsubscribe via the World
                              Wide Web, visit<br>
                                      <a moz-do-not-send="true"
                                href="https://lists.yoctoproject.org/listinfo/meta-ti"
                                target="_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
                              or, via email, send a message with subject
                              or body 'help' to<br>
                                      <a moz-do-not-send="true"
                                href="mailto:meta-ti-request@yoctoproject.org"
                                target="_blank">meta-ti-request@yoctoproject.org</a><br>
                              <br>
                              You can reach the person managing the list
                              at<br>
                                      <a moz-do-not-send="true"
                                href="mailto:meta-ti-owner@yoctoproject.org"
                                target="_blank">meta-ti-owner@yoctoproject.org</a><br>
                              <br>
                              When replying, please edit your Subject
                              line so it is more specific<br>
                              than "Re: Contents of meta-ti digest..."<br>
                              <br>
                              <br>
                              Today's Topics:<br>
                              <br>
                                  1. [nightly] Distroless meta-ti/master
                              minimal build<br>
                                     2014-08-30_21-00-30 (Denys
                              Dmytriyenko)<br>
                                  2. BeagleBoard C4 with USB (Rudolf
                              Streif)<br>
                              <br>
                              <br>
                              ----------------------------------------------------------------------<br>
                              <br>
                              Message: 1<br>
                              Date: Sat, 30 Aug 2014 21:58:30 -0400<br>
                              From: Denys Dmytriyenko &lt;<a
                                moz-do-not-send="true"
                                href="mailto:denys@ti.com"
                                target="_blank">denys@ti.com</a>&gt;<br>
                              To: &lt;<a moz-do-not-send="true"
                                href="mailto:meta-ti@yoctoproject.org"
                                target="_blank">meta-ti@yoctoproject.org</a>&gt;<br>
                              Subject: [meta-ti] [nightly] Distroless
                              meta-ti/master minimal build<br>
                                      2014-08-30_21-00-30<br>
                              Message-ID:
                              &lt;1330147917.535.1409450310755.JavaMail.jenkins@puget&gt;<br>
                              Content-Type: text/plain;
                              charset="us-ascii"<br>
                              <br>
                              An HTML attachment was scrubbed...<br>
                              URL: &lt;<a moz-do-not-send="true"
href="http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20140830/406dab3a/attachment-0001.html"
                                target="_blank">http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20140830/406dab3a/attachment-0001.html</a>&gt;<br>
                              <br>
                              ------------------------------<br>
                              <br>
                              Message: 2<br>
                              Date: Sun, 31 Aug 2014 07:48:09 -0700<br>
                              From: Rudolf Streif &lt;<a
                                moz-do-not-send="true"
                                href="mailto:rstreif@linuxfoundation.org"
                                target="_blank">rstreif@linuxfoundation.org</a>&gt;<br>
                              To: "<a moz-do-not-send="true"
                                href="mailto:meta-ti@yoctoproject.org"
                                target="_blank">meta-ti@yoctoproject.org</a>"
                              &lt;<a moz-do-not-send="true"
                                href="mailto:meta-ti@yoctoproject.org"
                                target="_blank">meta-ti@yoctoproject.org</a>&gt;<br>
                              Subject: [meta-ti] BeagleBoard C4 with USB<br>
                              Message-ID:<br>
                                      &lt;<a moz-do-not-send="true"
href="mailto:CA%2BgsK-okuyjWuEp%2B3bm6%2B%2BojWrDfaCPwXtXEOswu7Xikxg8jfA@mail.gmail.com"
                                target="_blank">CA+gsK-okuyjWuEp+3bm6++ojWrDfaCPwXtXEOswu7Xikxg8jfA@mail.gmail.com</a>&gt;<br>
                              Content-Type: text/plain; charset="utf-8"
                              <div>
                                <div><br>
                                  <br>
                                  I have a BeagleBoard C4 laying around
                                  that I want to use for a project that<br>
                                  has USB devices connected to it. I
                                  built a core-image-base with YP from<br>
                                  master and meta-ti from master with
                                  this configuration:<br>
                                  <br>
                                  Build Configuration:<br>
                                  BB_VERSION        = "1.23.1"<br>
                                  BUILD_SYS         = "x86_64-linux"<br>
                                  NATIVELSBSTRING   = "Fedora-18"<br>
                                  TARGET_SYS        =
                                  "arm-poky-linux-gnueabi"<br>
                                  MACHINE           = "beagleboard"<br>
                                  DISTRO            = "poky"<br>
                                  DISTRO_VERSION    =
                                  "1.6+snapshot-20140831"<br>
                                  TUNE_FEATURES     = "arm armv7a vfp
                                  thumb neon callconvention-hard
                                  cortexa8"<br>
                                  TARGET_FPU        = "vfp-neon"<br>
                                  meta<br>
                                  meta-yocto<br>
                                  meta-yocto-bsp    = "master:c16795477ea7e2159b5d3808268912b572887e2d"<br>
                                  meta-ti           = "master:d2c40099cd219493e4a6d9a6218f88f1b9f3f8fb"<br>
                                  meta-oe           = "master:1513d0e31f609ffcde9a116a50bfb0360b9e7ecf"<br>
                                  <br>
                                  It builds fine. I am installing
                                  u-boot, kernel and the device tree on
                                  the<br>
                                  SSD card.<br>
                                  <br>
                                  I use this u-boot script to boot the
                                  board:<br>
                                  <br>
                                  setenv bootcmd 'mmc init; fatload mmc
                                  0:1 0x80300000 uImage; fatload mmc<br>
                                  0:1 0x815f0000 beagle.dtb; bootm
                                  0x80300000 - 0x815f0000'<br>
                                  setenv bootargs 'console=tty0
                                  console=ttyO2,115200n8
                                  root=/dev/mmcblk0p2<br>
                                  rootwait rootfstype=ext3 ro'<br>
                                  boot<br>
                                  <br>
                                  In the above beagle.dtb = 
                                  uImage--3.14.8-r0-omap3-beagle-&lt;date&gt;.dtb
                                  which<br>
                                  I assumed to be the correct one for
                                  the C4 because the other dtb created<br>
                                  has xM explicitly in its name.<br>
                                  <br>
                                  The system boots fine but USB is not
                                  working. None of the typical USB host<br>
                                  controller initialization is in the
                                  dmesg output and lsusb responds with<br>
                                  'unable to initialize libsub: -99'.<br>
                                  <br>
                                  I am not sure if I am doing anything
                                  wrong or if there is an actual issue.<br>
                                  Help appreciated.<br>
                                  <br>
                                  Cheers,<br>
                                  Rudi<br>
                                </div>
                              </div>
                              -------------- next part --------------<br>
                              An HTML attachment was scrubbed...<br>
                              URL: &lt;<a moz-do-not-send="true"
href="http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20140831/fc724dcd/attachment-0001.html"
                                target="_blank">http://lists.yoctoproject.org/pipermail/meta-ti/attachments/20140831/fc724dcd/attachment-0001.html</a>&gt;<br>
                              <br>
                              ------------------------------<br>
                              <br>
                              <span><font color="#888888">
                                </font></span></blockquote>
                            <span><font color="#888888">
                                <br>
                                -- <br>
                                _______________________________________________<br>
                                meta-ti mailing list<br>
                                <a moz-do-not-send="true"
                                  href="mailto:meta-ti@yoctoproject.org"
                                  target="_blank">meta-ti@yoctoproject.org</a><br>
                                <a moz-do-not-send="true"
                                  href="https://lists.yoctoproject.org/listinfo/meta-ti"
                                  target="_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
                              </font></span></blockquote>
                        </div>
                        <br>
                        <div dir="ltr">
                          <div><font face="garamond, serif"><span
style="border-collapse:collapse;color:rgb(102,102,102);font-family:arial,sans-serif;font-size:13px"><br>
                              </span></font></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <div><br>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------050009090903030308070308--
