Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86F37E0059A
	for <meta-ti@yoctoproject.org>; Fri,  6 Apr 2012 07:11:40 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D8CB7F8124F; Fri,  6 Apr 2012 08:11:39 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 46E45F81249;
	Fri,  6 Apr 2012 08:11:38 -0600 (MDT)
Message-ID: <4F7EF99A.7040700@mlbassoc.com>
Date: Fri, 06 Apr 2012 08:11:38 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <86pqbmm4oe.fsf@coulee.tdb.com>
	<CAFZh4h9hFiRTRhVK_BfxfhFWhmZSinKjC5NJBq=ncubqboyvBg@mail.gmail.com>
In-Reply-To: <CAFZh4h9hFiRTRhVK_BfxfhFWhmZSinKjC5NJBq=ncubqboyvBg@mail.gmail.com>
Subject: Re: building meta-ti + poky HOWTO?
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
X-List-Received-Date: Fri, 06 Apr 2012 14:11:40 -0000
X-Groupsio-MsgNum: 914
Content-Type: multipart/mixed; boundary="------------080208060905070408010500"

--------------080208060905070408010500
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-04-05 12:36, Brian Hutchinson wrote:
> I may be out of the loop but if you follow the yocto way of doing
> things .... poky will produce a BeagleBoard image without having to
> use meta-ti and I think you can use that on beaglebone.  Some one
> correct me if I'm sending Russell in the weeds.
>
> I've been able to build yocto images for BeagleBoard but haven't tried
> them on the bone yet.
>
> Last I checked meta-ti with poky still had some issues.

Yes, there are some issues, but they can be worked around.  I have successfully
built core-image-minimal for both beagleboard and beaglebone with this configuration:

OE Build Configuration:
BB_VERSION        = "1.15.1"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "poky"
DISTRO_VERSION    = "1.1+snapshot-20120406"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "(nobranch):723c91297d833f989b762c661d05eef6a5e2fe5c"
meta-ti           = "master:246cb75a970e9aab0a3974a55e72c6d90f1df151"

Simply add the meta-ti to your conf/bblayers.conf

Workarounds:
* There is still one recipe in meta-ti that causes a parse error
     ERROR: ParseError at /home/local/poky-multi/meta-ti/recipes-misc/payload/bonescript.bb:5: Could not inherit file classes/systemd.bbclass
   To work around this, add this to your conf/local.conf
     BBMASK ?= ".*/meta-ti/recipes-misc/payload/bonescript*"
* The beaglebone kernel can't be built with its default configuration using the
   GCC-4.6.x/BINUTILS-2.22.  It will build with the attached patch which disables
   THUMB2_KERNEL mode.  Simply apply it to your local copy of meta-ti
* If you want to build the TI kernel for the beagleboard, add this to conf/local.conf
     PREFERRED_PROVIDER_virtual/kernel ?= "linux-omap-psp"

That said, I've only tested the bare minimum builds.  Depending on what you need to
accomplish, this may or may not be the way to go.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------080208060905070408010500
Content-Type: text/x-patch;
 name="beaglebone-no-thumb2-kernel-mode.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="beaglebone-no-thumb2-kernel-mode.patch"

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index 782f52d..179c568 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -420,8 +420,8 @@ CONFIG_PREEMPT_NONE=y
 # CONFIG_PREEMPT_VOLUNTARY is not set
 # CONFIG_PREEMPT is not set
 CONFIG_HZ=100
-CONFIG_THUMB2_KERNEL=y
-CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11=y
+# CONFIG_THUMB2_KERNEL is not set
+# CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11 is not set
 CONFIG_ARM_ASM_UNIFIED=y
 CONFIG_AEABI=y
 CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y

--------------080208060905070408010500--
