Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5937E007B9
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 15:36:16 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0TNaDHO010896
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 17:36:13 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0TNaDZp000477
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 17:36:13 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 29 Jan 2014 17:36:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0TNaD5d015596;
	Wed, 29 Jan 2014 17:36:13 -0600
Date: Wed, 29 Jan 2014 18:36:12 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20140129233612.GW6814@edge>
References: <1390882969-22545-1-git-send-email-sam.nelson@ti.com>
	<20140128043508.GC6814@edge> <20140129212602.GB6321@denix.org>
	<4F9216F96E5DF9428610502835A9F490549E9975@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F490549E9975@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Wed, 29 Jan 2014 23:36:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 29, 2014 at 06:29:32PM -0500, Nelson, Sam wrote:
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, January 29, 2014 4:26 PM
> > To: Nelson, Sam; meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] linux-keystone: Create recipe for linux-
> > keystone kernel version 3.10
> > 
> > Sam,
> > 
> > Do you need any help with updating this patch? Please let me know if
> > something
> > is not very clear or you just need more time. I don't want to lose momentum
> > :)
> > Thanks.
> > 
> > --
> > Denys
> > 
> > 
> > On Mon, Jan 27, 2014 at 11:35:08PM -0500, Denys Dmytriyenko wrote:
> > > On Mon, Jan 27, 2014 at 11:22:49PM -0500, Sam Nelson wrote:
> > > > - Updated Source URL & version
> > > > - Added device tree file
> > >
> > > Do you need to keep 3.8.4 version around? If not, why not upgrade
> > instead?

> [Sam] You are asking to delete the linux-keystone_3.8.4.bb and the 
> corresponding directory linux-keystone-3.8.4?

If you don't need it anymore. If you do it in a single commit and then git 
format-patch -M (maybe even --find-copies-harder), then it would be recorded 
as an upgrade from 3.8.4 to 3.10.x

BTW, is it really 3.10 and not one of the stable point releases 3.10.x? If 
latter, you also might want to set PV accordingly. As far as I can see, it's 
3.10.10 in git...


> > > Also, I would strongly recommend using linux-ti-kernel_3.12.bb as an
> > example.
> [Sam].
> I could not find a recipe named: linux-ti-kernel_3.12.bb. Appreciate your 
> help. (I can see meta-ti/recipes-kernel/linux-ti-staging_3.12.bb. Is that 
> what you are referring to?)

Yes, indeed. Sorry for the confusion.


> > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > ---
> > > >  recipes-kernel/linux/linux-keystone_3.10.bb |   36
> > +++++++++++++++++++++++++++
> > > >  1 file changed, 36 insertions(+)
> > > >  create mode 100644 recipes-kernel/linux/linux-keystone_3.10.bb
> > > >
> > > > diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-
> > kernel/linux/linux-keystone_3.10.bb
> > > > new file mode 100644
> > > > index 0000000..b37a404
> > > > --- /dev/null
> > > > +++ b/recipes-kernel/linux/linux-keystone_3.10.bb
> > > > @@ -0,0 +1,36 @@
> > > > +SECTION = "kernel"
> > > > +DESCRIPTION = "Linux kernel for TI Keystone devices"
> > > > +LICENSE = "GPLv2"
> > > > +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> > > > +
> > > > +COMPATIBLE_MACHINE = "keystone"
> > > > +
> > > > +inherit kernel
> > > > +
> > > > +do_deploy_append() {
> > > > +    cd ${S}
> > > > +}
> > >
> > > I don't remember if this is still needed...
> [Sam] Not sure either why this is needed. I can remove and check.
> > >
> > >
> > > > +require recipes-kernel/linux/linux-dtb.inc
> > > > +require recipes-kernel/linux/setup-defconfig.inc
> > > > +
> > > > +MACHINE_KERNEL_PR_append = "a"
> > > > +
> > > > +CORTEXA8FIXUP = "no"
> > > > +
> > > > +KERNEL_DEVICETREE_keystone-evm = "arch/${ARCH}/boot/dts/k2hk-
> > evm.dts"
> > >
> > > You can use just "k2hk-evm.dtb" instead.
> > >
> [Sam] Ok.
> > >
> > > > +#This commit corresponds to "K2_LINUX_03.10.10_13.12"
> > > > +SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
> > > > +
> > > > +BRANCH = "master"
> > > > +
> > > > +# for nightly switch the three lines below
> > >
> > > ^^^ ?
> > >
> [Sam]  Missed to remove this line.
> > >
> > > > +SRC_URI = "git://git.ti.com/keystone-
> > linux/linux.git;protocol=git;branch=${BRANCH}\
> > > > +           file://defconfig\
> > > > +           "
> > > > +
> > > > +S = "${WORKDIR}/git"
> > > > +
> > > > +RDEPENDS_kernel-base = ""
> > > > +
> > > > --
> > > > 1.7.9.5
> > > >
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > >

