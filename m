Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 007FFE006B4
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 09:47:02 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTO002JWMM6DICA@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 26 Oct 2011 11:46:55 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 278EE14AF5D; Wed,
	26 Oct 2011 12:46:54 -0400 (EDT)
Date: Wed, 26 Oct 2011 12:46:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jason Kridner <jkridner@beagleboard.org>
Message-id: <20111026164654.GE15391@denix.org>
References: <1319638719-31001-1-git-send-email-joelagnel@ti.com>
	<CA+T6QPkgA835mxsxdyrVXD=yU3MRMg-cdxEQa8vQ4bN2m3cH=g@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+T6QPkgA835mxsxdyrVXD=yU3MRMg-cdxEQa8vQ4bN2m3cH=g@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org, Joel A Fernandes <joelagnel@ti.com>
Subject: Re: [PATCH v2] linux-ti33x-psp 3.1rc8: Enable	usb-to-serial drivers
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Oct 2011 16:47:03 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Wed, Oct 26, 2011 at 10:55:14AM -0400, Jason Kridner wrote:
> On Wed, Oct 26, 2011 at 10:18 AM, Joel A Fernandes <joelagnel@ti.com> wrote:
> > Enable the PL2303 usb-to-serial driver required for serial output
> > from the beaglebone tester.
> >
> > Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> 
> Acked-by: Jason Kridner <jdk@ti.com>

Applied, thanks.

> > ---
> > v2 Changes: Enabled as a module
> >
> >  .../linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig |    3 ++-
> >  recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb  |    2 +-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
> > index 4b3c21d..4508d22 100644
> > --- a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
> > +++ b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
> > @@ -2558,7 +2558,8 @@ CONFIG_USB_LIBUSUAL=y
> >  # USB port drivers
> >  #
> >  # CONFIG_USB_USS720 is not set
> > -# CONFIG_USB_SERIAL is not set
> > +CONFIG_USB_SERIAL=m
> > +CONFIG_USB_SERIAL_PL2303=m
> >
> >  #
> >  # USB Miscellaneous drivers
> > diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> > index bffebea..fbee01f 100644
> > --- a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> > +++ b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> > @@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
> >
> >  BRANCH = "master"
> >  SRCREV = "1955a86594526e18f03c8d62db81119ffc4ccf0f"
> > -MACHINE_KERNEL_PR_append = "k+gitr${SRCREV}"
> > +MACHINE_KERNEL_PR_append = "l+gitr${SRCREV}"
> >
> >  COMPATIBLE_MACHINE = "(ti33x)"
> >
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

