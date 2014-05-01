Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24A1BE009C5; Thu,  1 May 2014 07:20:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0713FE009BA
	for <meta-ti@yoctoproject.org>; Thu,  1 May 2014 07:20:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s41EKO0G018333;
	Thu, 1 May 2014 09:20:24 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s41EKONk013898;
	Thu, 1 May 2014 09:20:24 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Thu, 1 May 2014 09:20:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v2 1/2] setup-defconfig.inc: implement config
	fragments by using in-kernel script
Thread-Index: AQHPYN/5s8Gy7dMlG0axO8bseafTt5srzx1Q
Date: Thu, 1 May 2014 14:20:23 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CFE80DC@DLEE11.ent.ti.com>
References: <1398469261-32287-1-git-send-email-denis@denix.org>
In-Reply-To: <1398469261-32287-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] setup-defconfig.inc: implement config fragments by using in-kernel script
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
X-List-Received-Date: Thu, 01 May 2014 14:20:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, April 25, 2014 4:41 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH v2 1/2] setup-defconfig.inc: implement
>config fragments by using in-kernel script
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>* Use in-kernel merge_config.sh script and KERNEL_CONFIG_FRAGMENTS
>list
>* Move copying provided defconfig from own task to do_configure()
>for atomicity
>* Don't use curly brackets for shell variables to avoid conflict
>with Bitbake
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
>v2 - Use recipe variable to list config fragments instead of file
>
> recipes-kernel/linux/setup-defconfig.inc | 26 +++++++++++++++----
>-------
> 1 file changed, 15 insertions(+), 11 deletions(-)
>
>diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-
>kernel/linux/setup-defconfig.inc
>index ed3bce2..4277f26 100644
>--- a/recipes-kernel/linux/setup-defconfig.inc
>+++ b/recipes-kernel/linux/setup-defconfig.inc
>@@ -5,28 +5,32 @@ KERNEL_LOCALVERSION ?=3D ""
> # Check the defconfig file and see if it points to an in kernel
> # defconfig that should be used, or if it is a complete config
>file
>
>-addtask setup_defconfig before do_configure after do_patch
>-do_setup_defconfig() {
>-    # Always copy the defconfig file to .config to keep
>consistency
>-    # between the case where there is a real config and the in
>kernel
>-    # tree config
>-    cp ${WORKDIR}/defconfig ${S}/.config
>-}
>-
> # define our own do_configure that will:
> #   1. Check the .config file and see if string use-kernel-
>config=3D is present
> #   2. If the use-kernel-config string is present parse out the
>config to use
>-#      and run make ${config}
>+#      and run make $config
> #   3. else run yes '' | oe_runmake oldconfig like the default
>do_configure
> #      does
> do_configure() {
>+    # Always copy the defconfig file to .config to keep
>consistency
>+    # between the case where there is a real config and the in
>kernel
>+    # tree config
>+    cp ${WORKDIR}/defconfig ${S}/.config
>+
>     echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
>     echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
>     config=3D`cat ${S}/.config | grep use-kernel-config | cut -d=3D -
>f2`
>-    if [ "x${config}" !=3D "x" ]
>+    if [ ! -z "$config" ]
>     then
>-        oe_runmake ${config}
>+        oe_runmake $config
>     else
>         yes '' | oe_runmake oldconfig
>     fi
>+
>+    # check for fragments
>+    if [ ! -z "${KERNEL_CONFIG_FRAGMENTS}" ]
>+    then
>+        ( cd ${WORKDIR} && ${S}/scripts/kconfig/merge_config.sh -
>m -r -O ${S} ${S}/.config ${KERNEL_CONFIG_FRAGMENTS} 1>&2 )
>+        yes '' | oe_runmake oldconfig
>+    fi
> }
>--
>1.9.2
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

