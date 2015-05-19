Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6FE34E0051B; Tue, 19 May 2015 10:32:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B637E0027F
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 10:32:49 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4JHWmOY018960
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 12:32:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4JHWmfQ015421
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 12:32:48 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 May 2015 12:32:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4JHWmEd012075;
	Tue, 19 May 2015 12:32:48 -0500
Date: Tue, 19 May 2015 13:32:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150519173247.GS31845@edge>
References: <1431951659-9935-1-git-send-email-j-stiffler@ti.com>
	<20150518181119.GG31845@edge> <555A3776.8090705@ti.com>
	<20150518191317.GN31845@edge> <555B717A.3010202@ti.com>
	<20150519172525.GR31845@edge> <555B722D.9090502@ti.com>
MIME-Version: 1.0
In-Reply-To: <555B722D.9090502@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] linux/cmem.inc: Support reserving memory for CMEM.
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
X-List-Received-Date: Tue, 19 May 2015 17:32:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 19, 2015 at 01:26:05PM -0400, Jacob Stiffler wrote:
> 
> 
> On 5/19/2015 1:25 PM, Denys Dmytriyenko wrote:
> >On Tue, May 19, 2015 at 01:23:06PM -0400, Jacob Stiffler wrote:
> >>
> >>On 5/18/2015 3:13 PM, Denys Dmytriyenko wrote:
> >>>On Mon, May 18, 2015 at 03:03:18PM -0400, Jacob Stiffler wrote:
> >>>>On 5/18/2015 2:11 PM, Denys Dmytriyenko wrote:
> >>>>>On Mon, May 18, 2015 at 08:20:58AM -0400, Jacob Stiffler wrote:
> >>>>>>To reserve contiguous memory for CMEM:
> >>>>>>* include the "recipes-kernel/linux/cmem.inc"
> >>>>>>* Set CMEM_BASE and CMEM_SIZE to the physical memory address and size,
> >>>>>>   respectively, to reserve for CMEM.
> >>>>>>
> >>>>>>Currently limited to reserving a single memory region used to create
> >>>>>>a single buffer pool of a single buffer.
> >>>>>Looks good. 2 comments below.
> >>>>>
> >>>>>
> >>>>>>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>>>>>---
> >>>>>>  recipes-kernel/linux/cmem.inc        |   22 ++++++++++++++++++++++
> >>>>>>  recipes-kernel/linux/linux/cmem.dtsi |   24 ++++++++++++++++++++++++
> >>>>>>  2 files changed, 46 insertions(+)
> >>>>>>  create mode 100644 recipes-kernel/linux/cmem.inc
> >>>>>>  create mode 100644 recipes-kernel/linux/linux/cmem.dtsi
> >>>>>>
> >>>>>>diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
> >>>>>>new file mode 100644
> >>>>>>index 0000000..207bdc6
> >>>>>>--- /dev/null
> >>>>>>+++ b/recipes-kernel/linux/cmem.inc
> >>>>>>@@ -0,0 +1,22 @@
> >>>>>>+FILESEXTRAPATHS_append := ":${THISDIR}/linux"
> >>>>>Move the file into standard "files" directory and drop above line.
> >>>>>
> >>>>Ok.
> >>>>
> >>>>>>+SRC_URI += "file://cmem.dtsi"
> >>>>>>+
> >>>>>>+CMEM_BASE ?= ""
> >>>>>>+CMEM_SIZE ?= ""
> >>>>>>+
> >>>>>>+do_compileconfigs_prepend() {
> >>>>>Should this be do_configure_append() instead? It would probably be safer, as
> >>>>>do_compileconfigs() is specific to multi-kernel.inc and some kernel recipes
> >>>>>may not include it...
> >>>>>
> >>>>I had noticed that do_configure() gets invoked multiple times.
> >>>>
> >>>>I'll try it as a do_configure_append() and make sure it will work.
> >>>Ah, you are right. Then you'd need to call this function uniquely like
> >>>do_setup_cmem() and then addtask it after do_patch before do_configure. It
> >>>looks like it should be safe to do it even before do_configure. It would be
> >>>nice to do it after do_configure, but it needs to be before do_compile and
> >>>also do_compileconfigs, while the latter one is only defined by multi-kernel
> >>>
> >>This should be called before do_create_srcipk(). But I suppose it
> >>should not be assumed that do_create_srcipk() will be run for a
> >>general kernel recipe.
> >>
> >>Should do_setup_cmem() be a postfunc of do_configure()? For example:
> >>
> >>do_configure[postfuncs] += "do_setup_cmem"
> >Will it be called multiple times after each do_configure?
> >
> 
> Sorry, I had meant do_patch().

BTW, are you sure you want it before create_srcipk? It won't package the 
changes then...


> >>>>>>+    if [ ! -z "${CMEM_BASE}" ]
> >>>>>>+    then
> >>>>>>+        cp ${WORKDIR}/cmem.dtsi ${S}/arch/arm/boot/dts/${MACHINE}-cmem.dtsi
> >>>>>>+
> >>>>>>+        sed -i -e "s|__CMEM_BASE__|${CMEM_BASE}|g" \
> >>>>>>+               -e "s|__CMEM_SIZE__|${CMEM_SIZE}|g" \
> >>>>>>+               ${S}/arch/arm/boot/dts/${MACHINE}-cmem.dtsi
> >>>>>>+
> >>>>>>+        for dts in ${KERNEL_DEVICETREE}
> >>>>>>+        do
> >>>>>>+            echo "#include \"${MACHINE}-cmem.dtsi\"" >> ${S}/arch/arm/boot/dts/${dts%.dtb}.dts
> >>>>>>+        done
> >>>>>>+    fi
> >>>>>>+}
> >>>>>>diff --git a/recipes-kernel/linux/linux/cmem.dtsi b/recipes-kernel/linux/linux/cmem.dtsi
> >>>>>>new file mode 100644
> >>>>>>index 0000000..6b1da99
> >>>>>>--- /dev/null
> >>>>>>+++ b/recipes-kernel/linux/linux/cmem.dtsi
> >>>>>>@@ -0,0 +1,24 @@
> >>>>>>+/ {
> >>>>>>+        reserved-memory {
> >>>>>>+                cmem_block_mem_0: cmem_block_mem@__CMEM_BASE__ {
> >>>>>>+                        reg = <0x__CMEM_BASE__ 0x__CMEM_SIZE__>;
> >>>>>>+                        no-map;
> >>>>>>+                        status = "okay";
> >>>>>>+                };
> >>>>>>+        };
> >>>>>>+
> >>>>>>+        cmem {
> >>>>>>+                compatible = "ti,cmem";
> >>>>>>+                #address-cells = <1>;
> >>>>>>+                #size-cells = <0>;
> >>>>>>+
> >>>>>>+                status = "okay";
> >>>>>>+
> >>>>>>+                cmem_block_0: cmem_block@0 {
> >>>>>>+                        reg = <0>;
> >>>>>>+                        memory-region = <&cmem_block_mem_0>;
> >>>>>>+                        cmem-buf-pools = <1 0x__CMEM_SIZE__>;
> >>>>>>+                };
> >>>>>>+        };
> >>>>>>+
> >>>>>>+};
> >>>>>>-- 
> >>>>>>1.7.9.5
> >>>>>>
> >>>>>>-- 
> >>>>>>_______________________________________________
> >>>>>>meta-ti mailing list
> >>>>>>meta-ti@yoctoproject.org
> >>>>>>https://lists.yoctoproject.org/listinfo/meta-ti
> 

