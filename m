Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33A20E0156D
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 06:34:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RDYTvw001113
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 08:34:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RDYTUJ006742
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 08:34:29 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 08:34:29 -0500
Received: from [172.24.158.133] (a0875592lt01.apr.dhcp.ti.com
	[172.24.158.133])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r5RDYRWo017189;	Thu, 27 Jun 2013 08:34:28 -0500
Message-ID: <51CC3F63.9030601@ti.com>
Date: Thu, 27 Jun 2013 19:04:27 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <20130627101300.GA6299@ti.com>
	<7D46E86EC0A8354091174257B2FED1015961B7AF@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015961B7AF@DLEE11.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] recipes-kernel: Add GLSDK specific kernel tree for omap-a15
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
X-List-Received-Date: Thu, 27 Jun 2013 13:34:34 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 6/27/2013 5:44 PM, Maupin, Chase wrote:
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> bounces@yoctoproject.org] On Behalf Of Heroor, Siddharth
>> Sent: Thursday, June 27, 2013 5:13 AM
>> To: meta-ti@yoctoproject.org
>> Subject: [meta-ti] [PATCH] recipes-kernel: Add GLSDK specific
>> kernel tree for omap-a15
>>
>> * Machine compatible with only omap-a15 devices.
>> * The TI Staging tree will not be used to maintain K3.8. Instead,
>>  this new tree is set up as a production tree. Pending features
>>  for 3.8 will be implemented on this tree.
>>  - Backported features from linux mainline
>>  - Backported bug-fixes from linux mainline and linux-stable.
>>  - Features implemented by the GLSDK team which maybe product
>>    specific.
>>  This is the tree on which GLSDK kernel releases will be made.
>> * This recipe is based off the Core SDK 2013.04.02 released kernel
>>  recipe - recipes-kernel/linux/linux-ti-staging_3.8.bb
>>
> 
> Can you try using --find-copies-harder when making this patch or I think Denys likes -m.  That will help to minimize the actual patch difference in cases like this where you are based on an existing recipe.

Right. I'll send a v2 with --find-copies-harder -M.

> 
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
>> ---
>> recipes-kernel/linux/linux-ti-glsdk/defconfig |    1 +
>> recipes-kernel/linux/linux-ti-glsdk_3.8.bb    |   30
>> +++++++++++++++++++++++++
>> 2 files changed, 31 insertions(+), 0 deletions(-)
>> create mode 100644 recipes-kernel/linux/linux-ti-glsdk/defconfig
>> create mode 100644 recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>>
>> diff --git a/recipes-kernel/linux/linux-ti-glsdk/defconfig
>> b/recipes-kernel/linux/linux-ti-glsdk/defconfig
>> new file mode 100644
>> index 0000000..926b35a
>> --- /dev/null
>> +++ b/recipes-kernel/linux/linux-ti-glsdk/defconfig
>> @@ -0,0 +1 @@
>> +use-kernel-config=omap2plus_defconfig
>> diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-
>> kernel/linux/linux-ti-glsdk_3.8.bb
>> new file mode 100644
>> index 0000000..8d66f84
>> --- /dev/null
>> +++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>> @@ -0,0 +1,30 @@
>> +SECTION = "kernel"
>> +DESCRIPTION = "Linux kernel for TI devices supported by the GLSDK
>> product"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>> +KERNEL_IMAGETYPE = "uImage"
>> +
>> +inherit kernel
>> +
>> +require recipes-kernel/linux/linux-dtb.inc
>> +require recipes-kernel/linux/setup-defconfig.inc
>> +
>> +KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts
>> arch/arm/boot/dts/omap5-uevm.dts"
>> +KERNEL_DEVICETREE_dra7xx-evm = "arch/arm/boot/dts/dra7-evm.dts"
>> +
>> +COMPATIBLE_MACHINE = "omap-a15"
> 
> I think you might want to set a DEFAULT_PREFERRENCE = -1 here.  Since you are going to use your branding config to select this kernel vs. the linux-ti-staging kernel this should be no issue.  That way there isn't a confusion about with basic meta-ti what kernel is being picked up.
> 
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +BRANCH = "master"
>> +
>> +# This commit corresponds to ti2013.04.02 release tag
> 
> Sorry to nit-pick here, but any reason to re-use the tag name from the linux-ti-staging tree?  The reason I ask is back to it being confusing if I have two trees with the same tag name (including version) it becomes kind of confusing.  Especially since this tree is part of the same git.ti.com project as the other one.  Thoughts?
> 
>> +SRCREV = "f3cb62a800ae37f17a3382b10d155ee02dbc83fc"
>> +PV = "3.8.13"
>> +
>> +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
>> a rebuild
>> +MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
> 
> Go ahead and reset your append here to a+ gitr${SRCPV}.  No need to start from f.
> 
> Thanks for the submission.  Overall looks pretty good, just a few things to fix up.
> 
>> +
>> +SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-
>> kernel.git;protocol=git;branch=${BRANCH} \
>> +           file://defconfig \
>> +          "
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


