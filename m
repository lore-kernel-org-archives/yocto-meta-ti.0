Return-Path: <eballetbo@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F557E016AC
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 08:16:11 -0700 (PDT)
Received: by mail-we0-f173.google.com with SMTP id u57so4011308wes.32
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 08:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kBhITnIu0xC5JXMQT1bgSZ0CfgfcHSfhZLVFmO+y1TA=;
	b=G8OSBmPRdpPQ43ygd8Mqv1nWoQAUVCXRRKrZvVfaycH1T3K67R+GrVZLcNqKKjEaXq
	bZNW97myBMWjS3n4ArTPT4aLMXAE1CosRzag/o5kVMxIT23LBNKWVc5cOxzchNSVXFMy
	96q83kTuf9zuccRzLYwMvnx4zda613c+ZXc9Jj5k0BgI+1PFtSWVOcWZEm/UYa5EFRyF
	jO8wRjfCIPS5eliHm4dY8AmlEDhraQ9IG3TPSILIeZxMEgNfn6W5y1quMa5xpvoAWC33
	pi+4AeYrnz7vw1IhCZDLPqpLVgN4SKvfeTtaEviW5MKpbcb/hI/9C5tofvpLfniJZIck
	/ZqA==
MIME-Version: 1.0
X-Received: by 10.194.5.7 with SMTP id o7mr7830604wjo.17.1382714169938; Fri,
	25 Oct 2013 08:16:09 -0700 (PDT)
Received: by 10.194.59.84 with HTTP; Fri, 25 Oct 2013 08:16:09 -0700 (PDT)
In-Reply-To: <20130723171141.GO31158@edge>
References: <20130701123138.GA16101@ti.com>
	<7D46E86EC0A8354091174257B2FED1015962B49B@DLEE11.ent.ti.com>
	<20130723171141.GO31158@edge>
Date: Fri, 25 Oct 2013 17:16:09 +0200
Message-ID: <CAFqH_52Jz+ehVen+vs3NL7bc6FPmoXmyA4MxiGb9WKoHESVbkw@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] recipes-bsp: Add recipe for PowerVR SGX544MP2 kernel drivers
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
X-List-Received-Date: Fri, 25 Oct 2013 15:16:14 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

2013/7/23 Denys Dmytriyenko <denys@ti.com>:
> Ping for addressing Chase's comments?
>
> On Mon, Jul 01, 2013 at 01:41:43PM +0000, Maupin, Chase wrote:
>> >-----Original Message-----
>> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> >bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>> >Sent: Monday, July 01, 2013 7:32 AM
>> >To: meta-ti@yoctoproject.org
>> >Subject: [meta-ti] [PATCH 1/2] recipes-bsp: Add recipe for PowerVR
>> >SGX544MP2 kernel drivers
>> >
>> >* The PowerVR SGX544MP2 is found on omap5 and dra7xx devices. This
>> >  recipe adds support for the PowerVR graphics subsystem.
>> >
>> >Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>> >Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> >---
>> > .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |   42
>> >++++++++++++++++++++
>> > 1 files changed, 42 insertions(+), 0 deletions(-)
>> > create mode 100644 recipes-bsp/powervr-drivers/omapdrm-
>> >pvr_1.9.2253347.bb
>> >
>> >diff --git a/recipes-bsp/powervr-drivers/omapdrm-
>> >pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-
>> >pvr_1.9.2253347.bb
>> >new file mode 100644
>> >index 0000000..edb2682
>> >--- /dev/null
>> >+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
>> >@@ -0,0 +1,42 @@
>> >+DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found
>> >in the omap5 SoCs"
>> >+HOMEPAGE = "http://git.ti.com"
>> >+LICENSE = "GPLv2"
>> >+
>> >+LIC_FILES_CHKSUM = "file://MIT-
>> >COPYING;md5=8c2810fa6bfdc5ae5c15a0c1ade34054"
>>
>> I see an issue with you setting the LICENSE to GPLv2 but having the file you
>> are checking be MIT-COPYING.  This seems wrong.
>>
>> >+
>> >+inherit module
>> >+
>> >+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-
>> >linux.git;protocol=git"
>> >+S = "${WORKDIR}/git"
>> >+
>> >+SRCREV = "6668f4ea0bbf7e3df7f72dc2230ab8da1e748b2d"
>> >+PR = "${MACHINE_KERNEL_PR}"
>> >+
>> >+do_compile() {
>> >+    cd ${S}/eurasiacon/build/linux2/omap5430_linux
>> >+    oe_runmake KERNELDIR="${STAGING_KERNEL_DIR}"
>> >+}
>>
>> I think you could do a do_compile_prepend here to perform the cd command and
>> set EXTRA_OEMAKE to include the KERNELDIR setting.  That way you don't have
>> to override the entire do_compile function.
>>
>> >+
>> >+do_install() {
>> >+    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/extra/
>> >+    cp
>> >${S}/eurasiacon/binary2_omap5430_linux_release/target/kbuild/omapd
>> >rm_pvr.ko \
>> >+    ${D}/lib/modules/${KERNEL_VERSION}/extra/
>> >+}
>>
>> Can you not use the default do_install in the module.bbclass?  As long as
>> your makefile can handle modules_install you should be fine here.
>>
>> >+
>> >+FILES_omapdrm-pvr =
>> >"/lib/modules/${KERNEL_VERSION}/extra/omapdrm_pvr.ko"
>>
>> The FILES setting in module.bbclass should pick this us out of /lib/modules
>>
>> >+RDEPENDS_omapdrm-pvr += "update-modules"
>>
>> This RDEPENDS is already part of module.bbclass
>>
>> >+
>> >+pkg_postinst_omapdrm-pvr () {
>> >+#!/bin/sh
>> >+if [ -n "$D" ]; then
>> >+        exit 1
>> >+fi
>> >+
>> >+depmod -a
>> >+update-modules || true
>> >+}
>> >+
>> >+pkg_postrm_omapdrm-pvr () {
>> >+#!/bin/sh
>> >+update-modules || true
>>
>> Why did you need to define these functions?  The module.bbclass that you
>> inherit already has:
>>
>> pkg_postinst_append () {
>> if [ -z "$D" ]; then
>>     depmod -a
>>     update-modules || true
>> fi
>> }
>>
>> pkg_postrm_append () {
>> update-modules || true
>> }
>>
>> Won't these work for you?
>>
>> >+}
>> >--
>> >1.7.0.4
>> >

Against which kernel is expected that this driver builds successfully ?

I'm trying to build this driver against 3.8 from git.ti.com and seems
is not working.

eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:466:2:
error: implicit declaration of function 'omap_gem_new_ext'
[-Werror=implicit-function-declaration]
  return omap_gem_new_ext(dev, gsize, flags, paddr, pages, &gem_ops);
  ^

eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1423:15:
error: variable 'gem_ops' has initializer but incomplete type
 static struct omap_gem_vm_ops gem_ops = {
               ^
eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1424:3:
error: unknown field 'open' specified in initializer
   .open  = MMapVOpenExt,
   ^

Best regards,
    Enric

