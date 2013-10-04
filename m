Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F3F3E01654
	for <meta-ti@yoctoproject.org>; Thu,  3 Oct 2013 22:42:16 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MU400J27QHMCP10@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 04 Oct 2013 00:41:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C944F2018B; Fri,
	04 Oct 2013 01:41:46 -0400 (EDT)
Date: Fri, 04 Oct 2013 01:41:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Rudolf Streif <rstreif@linuxfoundation.org>, meta-ti@yoctoproject.org
Message-id: <20131004054146.GD12173@denix.org>
References: <CA+gsK-r2ve9es_X1OAOp5jd5w-zWzqWUBNxH0AhkvW55uGwM2A@mail.gmail.com>
	<20131004053354.GB2673@edge>
MIME-version: 1.0
In-reply-to: <20131004053354.GB2673@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Buidling for am335x_evm
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
X-List-Received-Date: Fri, 04 Oct 2013 05:42:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

BTW, here's our latest nightly build and test report:

http://article.gmane.org/gmane.linux.embedded.yocto.meta-arago/1062

It's not exactly the same config, as it has few other layers configured and 
it's Arago distribution, not Poky, but for the most part it's similar and uses 
the same latest meta-ti BSP layer, hence loads the same build of the kernel 
and u-boot...

-- 
Denys


On Fri, Oct 04, 2013 at 01:33:54AM -0400, Denys Dmytriyenko wrote:
> Rudi,
> 
> On Thu, Oct 03, 2013 at 09:41:38PM -0700, Rudolf Streif wrote:
> > I tried to build a system for the AM335x_EVM board using the meta-ti layer
> > with YP 1.4.2 Dylan. Here are the steps:
> > 
> >    1. Clone meta-ti layer
> >    2. Check out dylan branch
> >    3. Set up build environment, add meta-ti layer
> >    4. Set MACHINE = "am335x_evm"
> 
> It should be dash in there, not underscore. Although it gets converted 
> internally anyway...
> 
> 
> >    5. bitbake -k core-image-minimal
> > 
> > Everything builds, put on target, u-boot comes up, hangs at "Starting Linux
> > kernel...". Most likely machine type mismatch. Start digging around:
> 
> Most likely u-boot couldn't find your DTB - did you put one in the /boot of 
> rootfs? Didn't u-boot complain about it? Should have been an error message.
> 
> 
> >    1. The am335x_evm.conf machine configuration includes the ti33x.inc file.
> >    2. ti33x.inc sets
> >    PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
> >    PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
> >    PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
> 
> BTW, if you are not comfortable with 3.12-rc being unstable, you can also add 
> to your config:
> 
> PREFERRED_VERSION_linux-ti-staging = "3.8%"
> 
> 
> >    3. The build process uses linux-ti-staging_git.bb and configures the
> >    kernel using the defconfig found in the llnux-ti-staging subdir.
> >    Content: use-kernel-config=omap2plus_defconfig. Why would I want to
> >    configure the Sitara SOC with an OMAP defconfig?
> 
> It's called OMAP2+ and that's how kernel folks decided to call a consolidated 
> config for most if not all TI platforms. Gone are the times when each platform 
> had it's own config file - kernel folks don't allow that anymore. Anyway, 
> omap2plus is the right defconfig.
> 
> 
> >    4. Checking kernel build environment
> >    in tmp/work/am335x_evm-poky-linux-gnueabi/linux-ti-staging/3.11+3.12-rc3-r19a+gitrAUTOINC+f7579525de9f1d6086c407a6980f4f1c1c574256/git.
> >    From SRCREV it seems to be a 3.11/3.12 kernel:
> 
> Yes, it's 3.12-rc3
> 
> 
> >       1. Check arm/arch/tools/mach-types: found:
> >       tam335x                 MACH_TAM335X            TAM335X
> >         4116
> >       Expected to find
> >       am335xevm               MACH_AM335XEVM          AM335XEVM
> >         3589 as it was for the 3.2.32 kernel.
> 
> I'm not sure what you are looking for, but there are many differences between 
> 3.2, 3.8 and 3.12
> 
> 
> >       2. Check arm/arch/configs for am335x_evm_defconfig which does not
> >       exist. Expected to see an am335x_evm_defconfig as found it in a 3.2.32
> >       kernel.
> 
> See above - you won't find it any more, as it's not allowed any more by kernel 
> policies to have million different defconfigs. As you can see, the entire 
> arch/arm/configs directory is very scarce these days - all omaps were 
> consolidated and new SOCs are added to existing defconfigs, where applicable.
> 
> 
> >    5. Checking u-boot build environment which uses, as expected, the
> >    am335c_evm configuration which sets the machine type to 3589.
> > 
> > I may be missing something but it looks to me as if the layer is broken for
> > building for the AM335X_EVM target machine.
> 
> No, it's not broken, it's just quite different from 3.2 days.
> 
> -- 
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

