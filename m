Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14484E0077A
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 05:37:57 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15DbuZx030530
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 07:37:56 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15DbuuK022427
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 07:37:56 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 5 Feb 2014 07:37:56 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v3] linux-keystone: Update to linux kernel
	version	3.10
Thread-Index: AQHPId5yb3ncA1uGq0i91QXFwfc5F5qlsD7AgABunwCAAIxIIA==
Date: Wed, 5 Feb 2014 13:37:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015994AB8D@DLEE11.ent.ti.com>
References: <1391541392-16928-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED10159948C34@DLEE11.ent.ti.com>
	<20140204231536.GJ18784@edge>
In-Reply-To: <20140204231536.GJ18784@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v3] linux-keystone: Update to linux kernel version	3.10
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
X-List-Received-Date: Wed, 05 Feb 2014 13:37:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Tuesday, February 04, 2014 6:16 PM
>To: Maupin, Chase
>Cc: Nelson, Sam; meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCH v3] linux-keystone: Update to linux
>kernel version 3.10
>
>On Tue, Feb 04, 2014 at 10:41:46PM +0000, Maupin, Chase wrote:
>> >-----Original Message-----
>> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> >bounces@yoctoproject.org] On Behalf Of Nelson, Sam
>> >Sent: Tuesday, February 04, 2014 2:17 PM
>> >To: meta-ti@yoctoproject.org
>> >Subject: [meta-ti] [PATCH v3] linux-keystone: Update to linux
>> >kernel version 3.10
>> >
>> >- Updated Source URL & version
>> >- Added device tree file
>> >- Added LOADADDR extra args
>> >
>> >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>> >
>> >---
>> >Changes from last revision of patch
>> >- Added LOADADDR extra args
>> >- Name change to from 3.10.10--> 3.10
>> >---
>> >---
>> > .../defconfig                                      |    0
>> > ...ux-keystone_3.8.4.bb =3D> linux-keystone_3.10.bb} |   26
>> >+++++++++++---------
>> > 2 files changed, 15 insertions(+), 11 deletions(-)
>> > rename recipes-kernel/linux/{linux-keystone-3.8.4 =3D> linux-
>> >keystone-3.10}/defconfig (100%)
>> > rename recipes-kernel/linux/{linux-keystone_3.8.4.bb =3D> linux-
>> >keystone_3.10.bb} (59%)
>> >
>> >diff --git a/recipes-kernel/linux/linux-keystone-
>3.8.4/defconfig
>> >b/recipes-kernel/linux/linux-keystone-3.10/defconfig
>> >similarity index 100%
>> >rename from recipes-kernel/linux/linux-keystone-3.8.4/defconfig
>> >rename to recipes-kernel/linux/linux-keystone-3.10/defconfig
>> >diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb
>> >b/recipes-kernel/linux/linux-keystone_3.10.bb
>> >similarity index 59%
>> >rename from recipes-kernel/linux/linux-keystone_3.8.4.bb
>> >rename to recipes-kernel/linux/linux-keystone_3.10.bb
>> >index d176f14..3ddd195 100644
>> >--- a/recipes-kernel/linux/linux-keystone_3.8.4.bb
>> >+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
>> >@@ -3,26 +3,30 @@ DESCRIPTION =3D "Linux kernel for TI Keystone
>> >devices"
>> > LICENSE =3D "GPLv2"
>> > LIC_FILES_CHKSUM =3D
>> >"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>> >
>> >+COMPATIBLE_MACHINE =3D "keystone"
>> >+
>> > inherit kernel
>> >
>> > require recipes-kernel/linux/linux-dtb.inc
>> > require recipes-kernel/linux/setup-defconfig.inc
>> >
>> >+MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>> >+PR =3D "${MACHINE_KERNEL_PR}"
>> >+
>> > KERNEL_DEVICETREE_keystone-evm =3D "k2hk-evm.dtb"
>> >
>> >-COMPATIBLE_MACHINE =3D "keystone"
>> >+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
>> >
>> >-S =3D "${WORKDIR}/git"
>> >+#This commit corresponds to "K2_LINUX_03.10.10_13.12"
>> >+SRCREV =3D "335d14b1c2ce23585835243126c6acba89067ecf"
>> >
>> >-BRANCH =3D "sept-2013/master"
>> >+BRANCH =3D "master"
>> >
>> >-# This commit corresponds to K2_LINUX_03.08.04_13.09 tag
>> >-SRCREV =3D "20a48dc5309c4434650baef2b6072b5f1016f946"
>> >+SRC_URI =3D "git://git.ti.com/keystone-
>> >linux/linux.git;protocol=3Dgit;branch=3D${BRANCH}\
>> >+           file://defconfig\
>> >+           "
>> >
>> >-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will
>cause
>> >a rebuild
>> >-MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>> >-PR =3D "${MACHINE_KERNEL_PR}"
>> >+S =3D "${WORKDIR}/git"
>> >+
>> >+RDEPENDS_kernel-base =3D ""
>>
>> Why are you blanking the RDEPENDS?  I'm not sure of the issue
>being fixed here.
>
>To not have the huge vmlinux image in /boot directory on the
>rootfs - it's
>only needed for oprofile, kernel profiling and debuging. MCSDK
>instructs
>users to install the image manually from the package, if they need
>it.

OK.  Makes sense.  Thanks and Ack

>
>
>> >-SRC_URI =3D "git://arago-project.org/git/projects/linux-
>> >keystone.git;protocol=3Dgit;branch=3D${BRANCH}\
>> >-           file://defconfig\
>> >-          "
>> >--
>> >1.7.9.5
>> >
>> >_______________________________________________
>> >meta-ti mailing list
>> >meta-ti@yoctoproject.org
>> >https://lists.yoctoproject.org/listinfo/meta-ti
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

