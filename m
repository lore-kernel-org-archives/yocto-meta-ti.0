Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D22C04FFE
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 19:45:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3942.1714679124953407028
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 May 2024 12:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C379540C79;
	Thu,  2 May 2024 19:45:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDYM_V8FJ2ku; Thu,  2 May 2024 19:45:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 74A8240AB7;
	Thu,  2 May 2024 19:45:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1A505163F5A; Thu,  2 May 2024 15:45:18 -0400 (EDT)
Date: Thu, 2 May 2024 15:45:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, meta-ti@lists.yoctoproject.org, detheridge@ti.com
Subject: Re: [meta-ti][master/scarthgap][PATCHv2 1/3] ti-img-rogue-*: add
 ddk 24.1 recipes for ltsprep
Message-ID: <20240502194518.GW28791@denix.org>
References: <20240502191843.2380555-1-rs@ti.com>
 <20240502191843.2380555-2-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240502191843.2380555-2-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 May 2024 19:45:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17640

Can you make it a diff please? As shown previously, that helps with revie=
w and=20
allows spotting issues much easier.


-M[<n>]
--find-renames[=3D<n>]

Detect renames. If n is specified, it is a threshold on the similarity in=
dex=20
(i.e. amount of addition/deletions compared to the file=E2=80=99s size). =
For example,=20
-M90% means Git should consider a delete/add pair to be a rename if more =
than=20
90% of the file hasn=E2=80=99t changed. Without a % sign, the number is t=
o be read as=20
a fraction, with a decimal point before it. I.e., -M5 becomes 0.5, and is=
 thus=20
the same as -M50%. Similarly, -M05 is the same as -M5%. To limit detectio=
n to=20
exact renames, use -M100%. The default similarity index is 50%.

-C[<n>]
--find-copies[=3D<n>]

Detect copies as well as renames. See also --find-copies-harder. If n is=20
specified, it has the same meaning as for -M<n>.


--find-copies-harder

For performance reasons, by default, -C option finds copies only if the=20
original file of the copy was modified in the same changeset. This flag m=
akes=20
the command inspect unmodified files as candidates for the source of copy=
.=20
This is a very expensive operation for large projects, so use it with cau=
tion.=20
Giving more than one -C option has the same effect.



On Thu, May 02, 2024 at 02:18:41PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
>=20
> Recipes for DDK 24.1, but lock them behind ltsprep tags because they
> require device tree changes that do not work on the current default
> kernel for this layer.
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../ti-img-rogue-driver_24.1.6554834.bb       |  44 ++++++
>  .../ti-img-rogue-umlibs_24.1.6554834.bb       | 148 ++++++++++++++++++
>  2 files changed, 192 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogu=
e-driver_24.1.6554834.bb
>  create mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-=
rogue-umlibs_24.1.6554834.bb
>=20
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-drive=
r_24.1.6554834.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-=
driver_24.1.6554834.bb
> new file mode 100644
> index 00000000..a1b76d27
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.=
6554834.bb
> @@ -0,0 +1,44 @@
> +DESCRIPTION =3D  "Kernel drivers for the PowerVR Rogue GPU found in th=
e TI SoCs"
> +HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-driver"
> +LICENSE =3D "MIT | GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D14;endline=3D19;md5=3D=
0403c7dea01a2b8232261e805325fac2"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +inherit module
> +
> +PROVIDES =3D "virtual/gpudriver"
> +
> +MACHINE_KERNEL_PR:append =3D "b"
> +PR =3D "${MACHINE_KERNEL_PR}"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
> +
> +DEPENDS =3D "virtual/kernel"
> +
> +BRANCH =3D "linuxws/scarthgap/k6.6/${PV}"
> +
> +SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +SRCREV =3D "e2dfdfee991dadc18175f27fe9e8676e910a2f8d"
> +
> +TARGET_PRODUCT:j721e =3D "j721e_linux"
> +TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> +TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
> +TARGET_PRODUCT:am62xx =3D "am62_linux"
> +TARGET_PRODUCT:am62pxx =3D "am62p_linux"
> +TARGET_PRODUCT:j722s =3D "j722s_linux"
> +PVR_BUILD =3D "release"
> +PVR_WS =3D "lws-generic"
> +
> +EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR_B=
UILD} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
> +
> +do_install() {
> +    make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUCT}_${=
PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_=
prefix} PREFIX=3D${STAGING_DIR_HOST} modules_install
> +}
> +
> +RRECOMMENDS:${PN} +=3D "ti-img-rogue-umlibs"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-u=
mlibs_24.1.6554834.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-im=
g-rogue-umlibs_24.1.6554834.bb
> new file mode 100644
> index 00000000..d43d1635
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_2=
4.1.6554834.bb
> @@ -0,0 +1,148 @@
> +DESCRIPTION =3D "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
> +HOMEPAGE =3D "http://git.ti.com/graphics/ti-img-rogue-umlibs"
> +LICENSE =3D "TI-TFL"
> +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/LICENSE;md5=3D7232b98c1c58=
f99e3baa03de5207e76f"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +inherit bin_package
> +
> +INHIBIT_DEFAULT_DEPS =3D ""
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
> +
> +PR =3D "r3"
> +
> +BRANCH =3D "linuxws/scarthgap/k6.6/${PV}"
> +SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}"
> +SRCREV =3D "e473234158c736248cf71a60080b7faf76fca561"
> +S =3D "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD=
}"
> +
> +TARGET_PRODUCT:j721e =3D "j721e_linux"
> +TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
> +TARGET_PRODUCT:j784s4 =3D "j784s4_linux"
> +TARGET_PRODUCT:am62xx =3D "am62_linux"
> +TARGET_PRODUCT:am62pxx =3D "am62p_linux"
> +TARGET_PRODUCT:j722s =3D "j722s_linux"
> +PVR_BUILD =3D "release"
> +PVR_WS =3D "lws-generic"
> +
> +RDEPENDS:${PN} =3D " \
> +    libdrm \
> +    ti-img-rogue-driver \
> +    ${PN}-firmware \
> +"
> +
> +PACKAGECONFIG ?=3D " \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan wayland', 'vulkan'=
, '', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
> +"
> +
> +PACKAGECONFIG[opengl] =3D ",,,,${GLES_PACKAGES}"
> +PACKAGECONFIG[vulkan] =3D ",,,,${VULKAN_PACKAGES}"
> +PACKAGECONFIG[opencl] =3D ",,,,${OPENCL_PACKAGES}"
> +
> +def get_file_list(package_list_var, d):
> +    file_list =3D []
> +    package_list =3D d.getVar(package_list_var)
> +    prefix =3D f"{d.getVar('S')}/"
> +    if package_list:
> +        for package in package_list.split():
> +            package_file_string =3D d.getVar(f"FILES:{package}")
> +            if package_file_string:
> +                for package_file in package_file_string.split():
> +                    file_list.append(f"{prefix}{package_file}")
> +    return " ".join(file_list)
> +
> +do_install:prepend() {
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true'=
, d)}; then
> +        for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
> +            rm -rf ${file}
> +        done
> +    fi
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true'=
, d)}; then
> +        for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
> +            rm -rf ${file}
> +        done
> +    fi
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true'=
, d)}; then
> +        for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
> +            rm -rf ${file}
> +        done
> +    fi
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'fa=
lse', d)}; then
> +        if [ -e ${S}/lib/firmware ]; then
> +            mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
> +        fi
> +    fi
> +
> +    # clean up any empty directories
> +    find "${S}" -empty -type d -delete
> +}
> +
> +GLES_PACKAGES =3D "libgles1-rogue libgles2-rogue libgles3-rogue"
> +VULKAN_PACKAGES =3D "libvk-rogue"
> +OPENCL_PACKAGES =3D "libopencl-rogue libopencl-rogue-tools"
> +
> +PACKAGES =3D " \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', d.getVar('GLES_PAC=
KAGES'), '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', d.getVar('VULKAN_P=
ACKAGES'), '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'opencl', d.getVar('OPENCL_P=
ACKAGES'), '', d)} \
> +    ${PN}-tools \
> +    ${PN}-firmware \
> +    ${PN} \
> +"
> +
> +# Inject variables so that packages don't get Debian-renamed (which wo=
uld
> +# remove the -rogue suffix), but don't RPROVIDEs/RCONFLICTs on the gen=
eric
> +# libgl name to prevent colliding with swrast libs
> +python __anonymous() {
> +    suffix =3D ""
> +    if "-native" in d.getVar("PN"):
> +        suffix =3D "-native"
> +    for p in (("vulkan", "libvk",),
> +              ("gles", "libgles1", "libglesv1-cm1"),
> +              ("gles", "libgles2", "libglesv2-2"),
> +              ("gles", "libgles3",),
> +              ("opencl", "libopencl",)):
> +        mlprefix =3D d.getVar("MLPREFIX")
> +        fullp =3D mlprefix + p[1] + "-rogue" + suffix
> +        mlprefix =3D d.getVar("MLPREFIX")
> +        pkgs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:])
> +        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> +        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
> +        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-=
umlibs" + suffix)
> +}
> +
> +# gles specific shared objects
> +FILES:libgles1-rogue =3D "${libdir}/libGLESv1*.so*"
> +FILES:libgles2-rogue =3D "${libdir}/libGLESv2*.so*"
> +RDEPENDS:libgles1-rogue +=3D "mesa-megadriver"
> +RDEPENDS:libgles2-rogue +=3D "mesa-megadriver"
> +
> +# vulkan specific shared objects and configs
> +FILES:libvk-rogue =3D "${libdir}/libVK_IMG.so* ${datadir}/vulkan"
> +RDEPENDS:libvk-rogue +=3D "vulkan-loader wayland libdrm"
> +
> +# opencl specific shared objects and configs
> +FILES:libopencl-rogue =3D "${libdir}/libPVROCL.so* ${sysconfdir}/OpenC=
L"
> +RDEPENDS:libopencl-rogue +=3D "opencl-icd-loader"
> +RRECOMMENDS:libopencl-rogue +=3D "libopencl-rogue-tools"
> +FILES:libopencl-rogue-tools +=3D "${bindir}/ocl*"
> +DEBIAN_NOAUTONAME:libopencl-rogue-tools =3D "1"
> +
> +# optional tools and tests
> +FILES:${PN}-tools =3D "${bindir}/"
> +RDEPENDS:${PN}-tools =3D "python3-core libdrm ${PN}"
> +INSANE_SKIP:${PN}-tools =3D "ldflags"
> +
> +# required firmware
> +FILES:${PN}-firmware =3D "${base_libdir}/firmware/*"
> +INSANE_SKIP:${PN}-firmware +=3D "arch"
> +
> +RRECOMMENDS:${PN} +=3D " \
> +    ${PN}-tools \
> +"
> +
> +INSANE_SKIP:${PN} +=3D "already-stripped dev-so ldflags"
> --=20
> 2.44.0
>=20

