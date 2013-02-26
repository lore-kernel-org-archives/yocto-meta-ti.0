Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA093E00312
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:28:04 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIT00DCMDYRWTU6@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 26 Feb 2013 00:28:04 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A022C20120; Tue,
	26 Feb 2013 01:28:03 -0500 (EST)
Date: Tue, 26 Feb 2013 01:28:03 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20130226062803.GH6725@denix.org>
References: <1361853748-24166-1-git-send-email-denis@denix.org>
	<CAMKF1soyC8T4jau0jWrEHoGD_+OcpUBV3KtUeh5tT1OaHONemA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1soyC8T4jau0jWrEHoGD_+OcpUBV3KtUeh5tT1OaHONemA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCHv2] linux-omap-psp: fix alignment issue of 2.6.37 kernel with gcc-4.7
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
X-List-Received-Date: Tue, 26 Feb 2013 06:28:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 25, 2013 at 10:18:15PM -0800, Khem Raj wrote:
> On Mon, Feb 25, 2013 at 8:42 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Patch by Steve Sakoman
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > v2 - move patch to a common location
> 
> btw. this wont be needed in kernels released after
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=8428e84d42179c2a00f5f6450866e70d802d1d05

Yes, I know. That's why I was clear to mention the specific version in the 
commit.

> so probably its better stay in specific kernel dirs which need it.

We have at least 3 kernel recipes of 2.6.37 version, hence the common location 
for this patch. I don't plan on updating older kernels to work with gcc-4.7.

-- 
Denys

> >  .../files/0001-arm-fix-builds-with-gcc-4.7.patch   | 26 ++++++++++++++++++++++
> >  recipes-kernel/linux/linux-omap-psp_2.6.37.bb      |  9 ++++++++
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch
> >
> > diff --git a/recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch b/recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch
> > new file mode 100644
> > index 0000000..db701e2
> > --- /dev/null
> > +++ b/recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch
> > @@ -0,0 +1,26 @@
> > +From 0d12debe917269a013f8eddd42da8d3de5e3174e Mon Sep 17 00:00:00 2001
> > +From: Steve Sakoman <steve@sakoman.com>
> > +Date: Thu, 24 Jan 2013 15:42:01 -0800
> > +Subject: [PATCH] arm: fix builds with gcc 4.7
> > +
> > +new unaligned access support in GCC was triggering an alignment fault at boot
> > +---
> > + arch/arm/kernel/head.S | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
> > +index 6bd82d2..56b02cd 100644
> > +--- a/arch/arm/kernel/head.S
> > ++++ b/arch/arm/kernel/head.S
> > +@@ -336,7 +336,7 @@ __secondary_data:
> > +  *  r13 = *virtual* address to jump to upon completion
> > +  */
> > + __enable_mmu:
> > +-#ifdef CONFIG_ALIGNMENT_TRAP
> > ++#if defined(CONFIG_ALIGNMENT_TRAP) && __LINUX_ARM_ARCH__ < 6
> > +       orr     r0, r0, #CR_A
> > + #else
> > +       bic     r0, r0, #CR_A
> > +--
> > +1.8.1.2
> > +
> > diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
> > index bafeba5..9eacfc9 100644
> > --- a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
> > +++ b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
> > @@ -6,6 +6,10 @@ COMPATIBLE_MACHINE = "omap3"
> >
> >  SRCREV= "20c003f2f024d9f50f59edf9f1b8f5f035fb15b8"
> >
> > +# The main PR is now using MACHINE_KERNEL_PR, for omap3 devices
> > +# see conf/machine/include/omap3.inc
> > +MACHINE_KERNEL_PR_append = "a"
> > +
> >  SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=git \
> >             file://defconfig"
> >
> > @@ -83,6 +87,11 @@ SRC_URI += " \
> >      file://0002-usb-musb-am35x-fix-role-switching-issue.patch \
> >  "
> >
> > +# Fix alignment issue with gcc-4.7
> > +SRC_URI += " \
> > +    file://0001-arm-fix-builds-with-gcc-4.7.patch \
> > +"
> > +
> >  # Updated PIO mode for MUSB help description
> >  SRC_URI_append_am3517-evm = " file://0001-musb-update-PIO-mode-help-information-in-Kconfig.patch"
> >
> > --
> > 1.8.1.4
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> 

