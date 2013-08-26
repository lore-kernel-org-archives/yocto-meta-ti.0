Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F3A9E01358
	for <meta-ti@yoctoproject.org>; Mon, 26 Aug 2013 11:53:45 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7QIrgss025277;
	Mon, 26 Aug 2013 13:53:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7QIrgLO008120;
	Mon, 26 Aug 2013 13:53:42 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 26 Aug 2013 13:53:42 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [dylan][PATCH 1/2] linux-dtb.inc: overlay the latest
	version from oe-core/master
Thread-Index: AQHOonk2cF7IN+apCEqwDS3i2FJO/pmn1g6w
Date: Mon, 26 Aug 2013 18:53:41 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596E8C9F@DLEE11.ent.ti.com>
References: <1377534425-14198-1-git-send-email-denis@denix.org>
In-Reply-To: <1377534425-14198-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [dylan][PATCH 1/2] linux-dtb.inc: overlay the latest version from oe-core/master
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
X-List-Received-Date: Mon, 26 Aug 2013 18:53:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, August 26, 2013 11:27 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [dylan][PATCH 1/2] linux-dtb.inc: overlay the
>latest version from oe-core/master
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>With recent kernel versions now using CPP and kernel headers, it's
>better
>to use kernel's in-tree DTB compilation instead of building and
>using our
>own DTC compiler externally. This overlays the changed approach
>from latest
>oe-core/master into Dylan.

Do we need to worry about this not working for older DT kernels like the ti=
-linux-staging_3.8 kernel?

>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-kernel/linux/linux-dtb.inc | 69
>++++++++++++++++++++++++++++++++++++++
> 1 file changed, 69 insertions(+)
> create mode 100644 recipes-kernel/linux/linux-dtb.inc
>
>diff --git a/recipes-kernel/linux/linux-dtb.inc b/recipes-
>kernel/linux/linux-dtb.inc
>new file mode 100644
>index 0000000..6b8f1a5
>--- /dev/null
>+++ b/recipes-kernel/linux/linux-dtb.inc
>@@ -0,0 +1,69 @@
>+# Support for device tree generation
>+FILES_kernel-devicetree =3D "/${KERNEL_IMAGEDEST}/devicetree*"
>+
>+python __anonymous () {
>+    d.appendVar("PACKAGES", " kernel-devicetree")
>+}
>+
>+do_install_append() {
>+	if test -n "${KERNEL_DEVICETREE}"; then
>+		for DTB in ${KERNEL_DEVICETREE}; do
>+			if echo ${DTB} | grep -q '/dts/'; then
>+				bbwarn "${DTB} contains the full path to
>the the dts file, but only the dtb name should be used."
>+				DTB=3D`basename ${DTB} | sed
>'s,\.dts$,.dtb,g'`
>+			fi
>+			DTB_BASE_NAME=3D`basename ${DTB} .dtb`
>+			DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed
>"s/${MACHINE}/${DTB_BASE_NAME}/g"`
>+			DTB_SYMLINK_NAME=3D`echo
>${KERNEL_IMAGE_SYMLINK_NAME} | sed
>"s/${MACHINE}/${DTB_BASE_NAME}/g"`
>+			DTB_PATH=3D"${B}/arch/${ARCH}/boot/dts/${DTB}"
>+			oe_runmake ${DTB}
>+			if [ ! -e "${DTB_PATH}" ]; then
>+				DTB_PATH=3D"${B}/arch/${ARCH}/boot/${DTB}"
>+			fi
>+			install -m 0644 ${DTB_PATH}
>${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
>+		done
>+	fi
>+}
>+
>+do_deploy_append() {
>+	if test -n "${KERNEL_DEVICETREE}"; then
>+		for DTB in ${KERNEL_DEVICETREE}; do
>+			if echo ${DTB} | grep -q '/dts/'; then
>+				bbwarn "${DTB} contains the full path to
>the the dts file, but only the dtb name should be used."
>+				DTB=3D`basename ${DTB} | sed
>'s,\.dts$,.dtb,g'`
>+			fi
>+			DTB_BASE_NAME=3D`basename ${DTB} .dtb`
>+			DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed
>"s/${MACHINE}/${DTB_BASE_NAME}/g"`
>+			DTB_SYMLINK_NAME=3D`echo
>${KERNEL_IMAGE_SYMLINK_NAME} | sed
>"s/${MACHINE}/${DTB_BASE_NAME}/g"`
>+			DTB_PATH=3D"${B}/arch/${ARCH}/boot/dts/${DTB}"
>+			if [ ! -e "${DTB_PATH}" ]; then
>+				DTB_PATH=3D"${B}/arch/${ARCH}/boot/${DTB}"
>+			fi
>+			install -d ${DEPLOYDIR}
>+			install -m 0644 ${DTB_PATH}
>${DEPLOYDIR}/${DTB_NAME}.dtb
>+			cd ${DEPLOYDIR}
>+			ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
>+			cd -
>+		done
>+	fi
>+}
>+
>+pkg_postinst_kernel-devicetree () {
>+	cd /${KERNEL_IMAGEDEST}
>+	for DTB_FILE in ${KERNEL_DEVICETREE}
>+	do
>+		DTB_BASE_NAME=3D`basename ${DTB_FILE} | awk -F "."
>'{print $1}'`
>+		DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} |
>sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>+		update-alternatives --install
>/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb
>devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
>+	done
>+}
>+
>+pkg_postrm_kernel-devicetree () {
>+	cd /${KERNEL_IMAGEDEST}
>+	for DTB_FILE in ${KERNEL_DEVICETREE}
>+	do
>+		DTB_BASE_NAME=3D`basename ${DTB_FILE} | awk -F "."
>'{print $1}'`
>+		DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} |
>sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>+		update-alternatives --remove ${DTB_BASE_NAME}.dtb
>devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
>+	done
>+}
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

