Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A477DE0043F
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 13:26:27 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N0600DVHM7EB421@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 29 Jan 2014 15:26:03 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AD5FF200E2; Wed,
	29 Jan 2014 16:26:02 -0500 (EST)
Date: Wed, 29 Jan 2014 16:26:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>, meta-ti@yoctoproject.org
Message-id: <20140129212602.GB6321@denix.org>
References: <1390882969-22545-1-git-send-email-sam.nelson@ti.com>
	<20140128043508.GC6814@edge>
MIME-version: 1.0
In-reply-to: <20140128043508.GC6814@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] linux-keystone: Create recipe for linux-keystone kernel version 3.10
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
X-List-Received-Date: Wed, 29 Jan 2014 21:26:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Sam,

Do you need any help with updating this patch? Please let me know if something 
is not very clear or you just need more time. I don't want to lose momentum :)
Thanks.

-- 
Denys


On Mon, Jan 27, 2014 at 11:35:08PM -0500, Denys Dmytriyenko wrote:
> On Mon, Jan 27, 2014 at 11:22:49PM -0500, Sam Nelson wrote:
> > - Updated Source URL & version
> > - Added device tree file
> 
> Do you need to keep 3.8.4 version around? If not, why not upgrade instead?
> Also, I would strongly recommend using linux-ti-kernel_3.12.bb as an example.
> 
> 
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-kernel/linux/linux-keystone_3.10.bb |   36 +++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >  create mode 100644 recipes-kernel/linux/linux-keystone_3.10.bb
> > 
> > diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
> > new file mode 100644
> > index 0000000..b37a404
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-keystone_3.10.bb
> > @@ -0,0 +1,36 @@
> > +SECTION = "kernel"
> > +DESCRIPTION = "Linux kernel for TI Keystone devices"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> > +
> > +COMPATIBLE_MACHINE = "keystone"
> > +
> > +inherit kernel
> > +
> > +do_deploy_append() {
> > +    cd ${S}
> > +}
> 
> I don't remember if this is still needed...
> 
> 
> > +require recipes-kernel/linux/linux-dtb.inc
> > +require recipes-kernel/linux/setup-defconfig.inc
> > +
> > +MACHINE_KERNEL_PR_append = "a"
> > +
> > +CORTEXA8FIXUP = "no"
> > +
> > +KERNEL_DEVICETREE_keystone-evm = "arch/${ARCH}/boot/dts/k2hk-evm.dts"
> 
> You can use just "k2hk-evm.dtb" instead.
> 
> 
> > +#This commit corresponds to "K2_LINUX_03.10.10_13.12"
> > +SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
> > +
> > +BRANCH = "master"
> > +
> > +# for nightly switch the three lines below
> 
> ^^^ ?
> 
> 
> > +SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
> > +           file://defconfig\
> > +           "
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +RDEPENDS_kernel-base = ""
> > +
> > -- 
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

