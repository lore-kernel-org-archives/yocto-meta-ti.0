Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 002B9E00BB7
	for <meta-ti@yoctoproject.org>; Mon, 14 Apr 2014 06:59:22 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3EDxLCO018445;
	Mon, 14 Apr 2014 08:59:21 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3EDxL33018387;
	Mon, 14 Apr 2014 08:59:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 14 Apr 2014 08:59:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3EDxK5N020946;
	Mon, 14 Apr 2014 08:59:21 -0500
Date: Mon, 14 Apr 2014 09:59:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140414135920.GA12929@edge>
References: <1397447422-6936-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015CF90E45@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CF90E45@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [RFC][PATCH 1/2] setup-defconfig.inc: implement config fragments by using in-kernel script
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
X-List-Received-Date: Mon, 14 Apr 2014 13:59:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 14, 2014 at 12:01:16PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> >Sent: Sunday, April 13, 2014 10:50 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [RFC][PATCH 1/2] setup-defconfig.inc: implement
> >config fragments by using in-kernel script
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > recipes-kernel/linux/setup-defconfig.inc | 27 ++++++++++++++++---
> >--------
> > 1 file changed, 16 insertions(+), 11 deletions(-)
> >
> >diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-
> >kernel/linux/setup-defconfig.inc
> >index ed3bce2..d6e5557 100644
> >--- a/recipes-kernel/linux/setup-defconfig.inc
> >+++ b/recipes-kernel/linux/setup-defconfig.inc
> >@@ -5,27 +5,32 @@ KERNEL_LOCALVERSION ?= ""
> > # Check the defconfig file and see if it points to an in kernel
> > # defconfig that should be used, or if it is a complete config
> >file
> >
> >-addtask setup_defconfig before do_configure after do_patch
> >-do_setup_defconfig() {
> >-    # Always copy the defconfig file to .config to keep
> >consistency
> >-    # between the case where there is a real config and the in
> >kernel
> >-    # tree config
> >-    cp ${WORKDIR}/defconfig ${S}/.config
> >-}
> >-
> > # define our own do_configure that will:
> > #   1. Check the .config file and see if string use-kernel-
> >config= is present
> > #   2. If the use-kernel-config string is present parse out the
> >config to use
> >-#      and run make ${config}
> >+#      and run make $config
> > #   3. else run yes '' | oe_runmake oldconfig like the default
> >do_configure
> > #      does
> > do_configure() {
> >+    # Always copy the defconfig file to .config to keep
> >consistency
> >+    # between the case where there is a real config and the in
> >kernel
> >+    # tree config
> >+    cp ${WORKDIR}/defconfig ${S}/.config
> >+
> >     echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> >     echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> >     config=`cat ${S}/.config | grep use-kernel-config | cut -d= -
> >f2`
> >-    if [ "x${config}" != "x" ]
> >+    if [ "x$config" != "x" ]
> >     then
> >-        oe_runmake ${config}
> >+        # check for fragments
> >+        fragments=`cat ${S}/.config | grep config-fragment | cut
> >-d= -f2`
> 
> Implementation question here.  Would it be easier to instead list the 
> fragments you want to merge in the recipe?  My reasoning is this:
> 
> 1. You already have a list of all the fragments to pull down in the recipe, 
> so why make it require updating two spots to add a fragment.  For example to 
> add a new fragment you would add it to the SRC_URI in the recipe and then 
> have to modify the defconfig to use it.
> 2. If we keep the list in the recipe we avoid having to store defconfigs 
> based on machine or build type.  For example on the AM335x we could use the 
> same defconfig file as the dra7xx but just specify that we want to add a 
> no-SMP config fragment.  That way as we add new fragments we are not 
> updating each defconfig.
> 3. For things like system test builds where they want to enable options that 
> might hurt performance but are good for debug having the recipe control this 
> would make it easier to add these through a bbappend or an environment 
> variable.  The current way they would have to overlay the entire defconfig 
> which means keeping them in sync rather than appending the recipe to add 
> another config fragment to the list.

Good questions. My primary goal was to keep the syntax the same with Dan's 
kernel integration Jenkins job, so it is just a drop-in replacement. Moving 
the fragment definition from defconfig to the recipe would certainly change 
the syntax and require one to learn another way of doing things...


> >+        oe_runmake $config
> >+        if [ "x$fragments" != "x" ]
> >+        then
> >+            fragnames=`basename -a $fragments`
> >+            ( cd ${WORKDIR} &&
> >${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config
> >$fragnames 1>&2 )
> >+            yes '' | oe_runmake oldconfig
> >+        fi
> >     else
> >         yes '' | oe_runmake oldconfig
> >     fi
> >--
> >1.9.2
> >
> >--
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

