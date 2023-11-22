Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839B6C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 15:42:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.22811.1700667738291442686
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Nov 2023 07:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yG31K/02;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AMFgHS4093964
	for <meta-ti@lists.yoctoproject.org>; Wed, 22 Nov 2023 09:42:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700667737;
	bh=pp9UMJ/hVGRYO4uxKR8r6fdcNHCJKTlK8bba4MRrpwI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=yG31K/02ZaqORX0Hh9mEksJRomOw+GO4ixmaf0471DQs2x6QUhzJDA/qlRYgnP5GB
	 35bfTcDCMKqKlfuE05LRHxNs7Z2HZ1mYO9W9Br7q9AFYtNepa2k+u+wg5a09c4Ui1a
	 F1BP6fXqXfz+IHR99KI9Au0ayGGMUczk8jG9E/TY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AMFgH10085780
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 22 Nov 2023 09:42:17 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Nov 2023 09:42:17 -0600
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2507.023; Wed, 22 Nov 2023 09:42:17 -0600
From: "Bhagat, Paresh" <p-bhagat@ti.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>, "Eatmon, Ryan" <reatmon@ti.com>
CC: "Shilwant, Chirag" <c-shilwant@ti.com>,
        "Adivi, Sai Sree Kartheek"
	<s-adivi@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>,
        "Gupta, Gyan"
	<g-gupta@ti.com>
Subject: RE: [EXTERNAL] [meta-ti] [kirkstone][PATCH] ti-extras: Add support
 for extra kernel/u-boot features for am62pxx
Thread-Topic: [EXTERNAL] [meta-ti] [kirkstone][PATCH] ti-extras: Add support
 for extra kernel/u-boot features for am62pxx
Thread-Index: AQHaHHEh+sDR7lHQgkWhHlINYmui/bCGeyFg
Date: Wed, 22 Nov 2023 15:42:16 +0000
Message-ID: <96a8ece7a7a94e0b88202a7ff55a9759@ti.com>
References: <1799A1208606740B.7061@lists.yoctoproject.org>
In-Reply-To: <1799A1208606740B.7061@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.136.226]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Nov 2023 15:42:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17329

Will send a v2 of this patch. Do not merge

-----Original Message-----
From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On Be=
half Of Paresh Bhagat via lists.yoctoproject.org
Sent: Tuesday, November 21, 2023 5:21 PM
To: meta-ti@lists.yoctoproject.org; Bajjuri, Praneeth <praneeth@ti.com>; Ea=
tmon, Ryan <reatmon@ti.com>
Cc: Shilwant, Chirag <c-shilwant@ti.com>; Adivi, Sai Sree Kartheek <s-adivi=
@ti.com>; Khasim, Syed Mohammed <khasim@ti.com>; Gupta, Gyan <g-gupta@ti.co=
m>
Subject: [EXTERNAL] [meta-ti] [kirkstone][PATCH] ti-extras: Add support for=
 extra kernel/u-boot features for am62pxx

Add support for ti-extras for am62pxx to control the kernel and u-boot repo=
s, branches, and srcrevs via the TI_EXTRAS variable in the local.conf file.

Also add am62pxx as compatible machine in jailhouse recipe. So the am62pxx =
jailhouse build can be done by adding TI_EXTRAS=3Dtie-jailhouse in local.co=
nf.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf       | 1 +
 meta-ti-bsp/conf/machine/am62pxx-evm.conf            | 1 +
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc         | 2 +-
 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc       | 2 +-
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb | 6 +++++-
 5 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/c=
onf/machine/am62pxx-evm-k3r5.conf
index 33254bf2..36915381 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the TI AM62Px EVM (R5F core)
=20
 require conf/machine/include/k3r5.inc
+require conf/machine/include/ti-extras.inc
=20
 SYSFW_SOC =3D "am62px"
 SYSFW_CONFIG =3D "evm"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62pxx-evm.conf
index 931de953..d7c9f589 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the TI AM62PX EVM
=20
 require conf/machine/include/am62pxx.inc
+require conf/machine/include/ti-extras.inc
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am62p5 \
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/rec=
ipes-bsp/u-boot/ti-extras.inc
index e0a94ea6..d32c6529 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
@@ -1,7 +1,7 @@
=20
 # This will have priority over generic uboot path
=20
-COMPATIBLE_MACHINE =3D "am62xx"
+COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
=20
 BRANCH =3D "ti-u-boot-2023.04"
 BRANCH:tie-jailhouse =3D "ti-u-boot-2023.04-jailhouse"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/r=
ecipes-kernel/linux/ti-extras.inc
index 076a67db..0b22aca9 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
@@ -2,7 +2,7 @@
 # Use different commit, repo and branch for TI extras build  # This will h=
ave priority over generic rt path
=20
-COMPATIBLE_MACHINE =3D "am62xx"
+COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
=20
 BRANCH =3D "ti-linux-6.1.y"
 BRANCH:tie-jailhouse =3D "ti-linux-6.1.y-jailhouse"
diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti=
-extras/recipes-ti/jailhouse/jailhouse_git.bb
index a96a7831..ca829986 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING;md5=3D9fa7f895f96bde2d47fd5b7d95b6ba4d \  "
=20
-COMPATIBLE_MACHINE =3D "am62xx"
+COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
=20
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
@@ -55,18 +55,21 @@ JH_CELL_FILES:k3 ?=3D "k3-*.cell"
 JH_INMATE_DTB ?=3D ""
 JH_INMATE_DTB:am62xx ?=3D "inmate-k3-am625-sk.dtb"
 JH_INMATE_DTB:am65xx ?=3D "inmate-k3-am654-idk.dtb"
+JH_INMATE_DTB:am62pxx ?=3D "inmate-k3-am62p5-sk.dtb"
 JH_INMATE_DTB:j7 ?=3D "inmate-k3-j721e-evm.dtb"
 JH_INMATE_DTB:j7200-evm ?=3D "inmate-k3-j7200-evm.dtb"
=20
 JH_LINUX_DEMO_CELL ?=3D ""
 JH_LINUX_DEMO_CELL:am62xx ?=3D "k3-am625-sk-linux-demo.cell"
 JH_LINUX_DEMO_CELL:am65xx ?=3D "k3-am654-idk-linux-demo.cell"
+JH_LINUX_DEMO_CELL:am62pxx ?=3D "k3-am62p5-sk-linux-demo.cell"
 JH_LINUX_DEMO_CELL:j7 ?=3D "k3-j721e-evm-linux-demo.cell"
 JH_LINUX_DEMO_CELL:j7200-evm ?=3D "k3-j7200-evm-linux-demo.cell"
=20
 JH_SYSCONFIG_CELL ?=3D ""
 JH_SYSCONFIG_CELL:am62xx ?=3D "k3-am625-sk.cell"
 JH_SYSCONFIG_CELL:am65xx ?=3D "k3-am654-idk.cell"
+JH_SYSCONFIG_CELL:am62pxx ?=3D "k3-am62p5-sk.cell"
 JH_SYSCONFIG_CELL:j7 ?=3D "k3-j721e-evm.cell"
 JH_SYSCONFIG_CELL:j7200-evm ?=3D "k3-j7200-evm.cell"
=20
@@ -75,6 +78,7 @@ JH_RAMFS_IMAGE ?=3D "${INITRAMFS_IMAGE}"
=20
 JH_CMDLINE ?=3D ""
 JH_CMDLINE:am62xx ?=3D "console=3DttyS3,115200n8 earlycon=3Dns16550a,mmio3=
2,0x02810000"
+JH_CMDLINE:am62pxx ?=3D "console=3DttyS1,115200n8"
 JH_CMDLINE:am65xx ?=3D "console=3DttyS1,115200n8"
 JH_CMDLINE:j7 ?=3D "console=3DttyS3,115200n8"
 JH_CMDLINE:j7200-evm ?=3D "console=3DttyS3,115200n8"
--
2.34.1


