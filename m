Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2C9CE00B9E
	for <meta-ti@yoctoproject.org>; Mon, 14 Apr 2014 05:01:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3EC1H0C024992;
	Mon, 14 Apr 2014 07:01:17 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3EC1HGi023863;
	Mon, 14 Apr 2014 07:01:17 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Mon, 14 Apr 2014 07:01:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [RFC][PATCH 1/2] setup-defconfig.inc: implement
	config fragments by using in-kernel script
Thread-Index: AQHPV5TVr/nuOWdpD0SFj91OWoSLkZsRAdaQ
Date: Mon, 14 Apr 2014 12:01:16 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CF90E45@DLEE11.ent.ti.com>
References: <1397447422-6936-1-git-send-email-denis@denix.org>
In-Reply-To: <1397447422-6936-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 14 Apr 2014 12:01:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Sunday, April 13, 2014 10:50 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [RFC][PATCH 1/2] setup-defconfig.inc: implement
>config fragments by using in-kernel script
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-kernel/linux/setup-defconfig.inc | 27 ++++++++++++++++---
>--------
> 1 file changed, 16 insertions(+), 11 deletions(-)
>
>diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-
>kernel/linux/setup-defconfig.inc
>index ed3bce2..d6e5557 100644
>--- a/recipes-kernel/linux/setup-defconfig.inc
>+++ b/recipes-kernel/linux/setup-defconfig.inc
>@@ -5,27 +5,32 @@ KERNEL_LOCALVERSION ?=3D ""
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
>+    if [ "x$config" !=3D "x" ]
>     then
>-        oe_runmake ${config}
>+        # check for fragments
>+        fragments=3D`cat ${S}/.config | grep config-fragment | cut
>-d=3D -f2`

Implementation question here.  Would it be easier to instead list the fragm=
ents you want to merge in the recipe?  My reasoning is this:

1. You already have a list of all the fragments to pull down in the recipe,=
 so why make it require updating two spots to add a fragment.  For example =
to add a new fragment you would add it to the SRC_URI in the recipe and the=
n have to modify the defconfig to use it.
2. If we keep the list in the recipe we avoid having to store defconfigs ba=
sed on machine or build type.  For example on the AM335x we could use the s=
ame defconfig file as the dra7xx but just specify that we want to add a no-=
SMP config fragment.  That way as we add new fragments we are not updating =
each defconfig.
3. For things like system test builds where they want to enable options tha=
t might hurt performance but are good for debug having the recipe control t=
his would make it easier to add these through a bbappend or an environment =
variable.  The current way they would have to overlay the entire defconfig =
which means keeping them in sync rather than appending the recipe to add an=
other config fragment to the list.

>+        oe_runmake $config
>+        if [ "x$fragments" !=3D "x" ]
>+        then
>+            fragnames=3D`basename -a $fragments`
>+            ( cd ${WORKDIR} &&
>${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config
>$fragnames 1>&2 )
>+            yes '' | oe_runmake oldconfig
>+        fi
>     else
>         yes '' | oe_runmake oldconfig
>     fi
>--
>1.9.2
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

