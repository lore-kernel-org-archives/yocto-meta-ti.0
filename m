Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3284E00998; Fri, 29 May 2015 06:47:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19E1BE0096A
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 06:47:21 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TDlKis018318
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 08:47:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TDlKIC018178
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 08:47:20 -0500
Received: from DLEE09.ent.ti.com ([fe80::d03e:3cf4:73ad:d589]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Fri, 29 May 2015 08:47:19 -0500
From: "Zhang, Hao" <hzhang@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH] linux-keystone: update to new kernel version 3.10.72
Thread-Index: AQHQmVICqyx3RcgNGUqDobLCMUbV452S+Ubw
Date: Fri, 29 May 2015 13:47:19 +0000
Message-ID: <ECA334CFBA16F74DB2C66A2F1181F4D63F9A98F4@DLEE09.ent.ti.com>
References: <1432823060-6595-1-git-send-email-hzhang@ti.com>
In-Reply-To: <1432823060-6595-1-git-send-email-hzhang@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] linux-keystone: update to new kernel version 3.10.72
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
X-List-Received-Date: Fri, 29 May 2015 13:47:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

-----Original Message-----
From: Zhang, Hao=20
Sent: Thursday, May 28, 2015 10:24 AM
To: meta-ti@yoctoproject.org
Cc: Zhang, Hao
Subject: [PATCH] linux-keystone: update to new kernel version 3.10.72

From: Hao Zhang <hzhang@ti.com>

Branch name changed to release specific branch

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 recipes-kernel/linux/linux-keystone-rt_3.10.bb |    8 ++++----
 recipes-kernel/linux/linux-keystone_3.10.bb    |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kerne=
l/linux/linux-keystone-rt_3.10.bb
index 7ce45b5..51e18d3 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -19,11 +19,11 @@ KERNEL_DEVICETREE_k2l-evm =3D "k2l-evm.dtb"
=20
 KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
=20
-#This commit corresponds to "K2_RT_LINUX_03.10.61_15.02"
-SRCREV =3D "e2e31a1d996d2ed8dd06dab1221e159033432b72"
-PV =3D "3.10.61+git${SRCPV}"
+#This commit corresponds to "K2_RT_LINUX_03.10.72_15.##"
+SRCREV =3D "d607d75a2de99b3723cf9a2ba56f839debbee3c8"
+PV =3D "3.10.72+git${SRCPV}"
=20
-BRANCH =3D "v3.10.61/master-rt"
+BRANCH =3D "v3.10.72/master-rt"
 SRC_URI =3D "git://git.ti.com/keystone-linux/linux.git;protocol=3Dgit;bran=
ch=3D${BRANCH}\
            file://defconfig\
            "
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/l=
inux/linux-keystone_3.10.bb
index 78d5a0e..01573ca 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -19,11 +19,11 @@ KERNEL_DEVICETREE_k2l-evm =3D "k2l-evm.dtb"
=20
 KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
=20
-#This commit corresponds to "K2_LINUX_03.10.61_15.02"
-SRCREV =3D "a17b4c3fd6c93f908daf032786f90c0321296957"
-PV =3D "3.10.61+git${SRCPV}"
+#This commit corresponds to "K2_LINUX_03.10.72_15.##"
+SRCREV =3D "b9bad8fccc5f9c6bcd78363982b3249a15f193fb"
+PV =3D "3.10.72+git${SRCPV}"
=20
-BRANCH =3D "v3.10.61/master"
+BRANCH =3D "v3.10.72/master"
 SRC_URI =3D "git://git.ti.com/keystone-linux/linux.git;protocol=3Dgit;bran=
ch=3D${BRANCH}\
            file://defconfig\
            "
--=20
1.7.9.5


