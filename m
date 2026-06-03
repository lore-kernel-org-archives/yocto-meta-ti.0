Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F84CD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 16:38:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24506.1780504728590405870
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 09:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6CD3040B05;
	Wed,  3 Jun 2026 16:38:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XH08AhY7d_wG; Wed,  3 Jun 2026 16:38:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1A07640A3D;
	Wed,  3 Jun 2026 16:38:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1FA9617E790; Wed,  3 Jun 2026 12:38:43 -0400 (EDT)
Date: Wed, 3 Jun 2026 12:38:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: denys@konsulko.com, reatmon@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/wrynose][PATCH v2] ti-img-rogue-*: Migrate
 GPU driver version
Message-ID: <20260603163843.GE23325@denix.org>
References: <20260603154816.3066421-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603154816.3066421-1-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 16:38:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19966

On Wed, Jun 03, 2026 at 10:48:16AM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> New recipes for GPU DDK 26.1. Update BSP configuration files with new
> preferred recipe versions.

Based on your previous patch, 25 and 26 versions only differ in BRANCH and 
SRCREV. Please redo your patch with this option, so it's easier to review:
https://git-scm.com/docs/git-format-patch#Documentation/git-format-patch.txt--Cn


> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
> v2: 
> - No need to delete the old 25.3 DDK recipes as that would break
>   compatibility with previous LTS kernels (6.6, 6.12).
> 
>  meta-ti-bsp/conf/machine/include/ti-bsp.inc   |   2 +-
>  .../ti-img-rogue-driver_26.1.6967606.bb       |  44 +++++
>  .../ti-img-rogue-umlibs_26.1.6967606.bb       | 152 ++++++++++++++++++
>  3 files changed, 197 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb
>  create mode 100644 meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index f7e2710c..a48c4f07 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -43,7 +43,7 @@ BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 = "u-boot-ti-staging"
>  BSP_BOOTLOADER_VERSION:bsp-ti-6_18 = "2026.01%"
>  
>  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 = "ti-img-rogue-driver"
> -BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 = "25%"
> +BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 = "26%"
>  BSP_MESA_PVR_VERSION:bsp-ti-6_18 = "24%"
>  
>  # ==========
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb
> new file mode 100644
> index 00000000..876c3e50
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_26.1.6967606.bb
> @@ -0,0 +1,44 @@
> +SUMMARY =  "Kernel drivers for the PowerVR Rogue GPU found in the TI SoCs"
> +HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
> +LICENSE = "MIT | GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
> +
> +inherit module
> +
> +PROVIDES = "virtual/gpudriver"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
> +
> +DEPENDS = "virtual/kernel"
> +
> +BRANCH = "linuxws/wrynose/k6.18/${PV}"
> +
> +SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
> +
> +SRCREV = "50e14e425cbac240b2da93fac0cfcc987a4959c3"
> +
> +
> +TARGET_PRODUCT:j721e = "j721e_linux"
> +TARGET_PRODUCT:j721s2 = "j721s2_linux"
> +TARGET_PRODUCT:j784s4 = "j784s4_linux"
> +TARGET_PRODUCT:j742s2 = "j784s4_linux"
> +TARGET_PRODUCT:am62xx = "am62_linux"
> +TARGET_PRODUCT:am62pxx = "am62p_linux"
> +TARGET_PRODUCT:j722s = "j722s_linux"
> +PVR_BUILD = "release"
> +PVR_WS = "lws-generic"
> +
> +EXTRA_OEMAKE += 'KERNELDIR="${KBUILD_OUTPUT}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
> +
> +do_compile(){
> +    unset CC
> +    oe_runmake
> +}
> +
> +do_install() {
> +    make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> +}
> +
> +RRECOMMENDS:${PN} += "ti-img-rogue-umlibs"
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb
> new file mode 100644
> index 00000000..ff631c2d
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_26.1.6967606.bb
> @@ -0,0 +1,152 @@
> +SUMMARY = "Userspace libraries for PowerVR Rogue GPU on TI SoCs"
> +HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
> +
> +BRANCH = "linuxws/wrynose/k6.18/${PV}"
> +SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> +SRCREV = "a59e0e6b92dfee7aad046b839cf6ae644355b89d"
> +
> +TARGET_PRODUCT:j721e = "j721e_linux"
> +TARGET_PRODUCT:j721s2 = "j721s2_linux"
> +TARGET_PRODUCT:j784s4 = "j784s4_linux"
> +TARGET_PRODUCT:j742s2 = "j784s4_linux"
> +TARGET_PRODUCT:am62xx = "am62_linux"
> +TARGET_PRODUCT:am62pxx = "am62p_linux"
> +TARGET_PRODUCT:j722s = "j722s_linux"
> +PVR_BUILD = "release"
> +PVR_WS = "lws-generic"
> +
> +RDEPENDS:${PN} = " \
> +    libdrm \
> +    ti-img-rogue-driver \
> +    ${PN}-firmware \
> +"
> +
> +PACKAGECONFIG ?= " \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan wayland', 'vulkan', '', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl opencl', d)} \
> +"
> +
> +PACKAGECONFIG[opengl] = ",,,,${GLES_PACKAGES}"
> +PACKAGECONFIG[vulkan] = ",,,,${VULKAN_PACKAGES}"
> +PACKAGECONFIG[opencl] = ",,,,${OPENCL_PACKAGES}"
> +
> +def get_file_list(package_list_var, d):
> +    file_list = []
> +    package_list = d.getVar(package_list_var)
> +    prefix = f"{d.getVar('D')}/"
> +    if package_list:
> +        for package in package_list.split():
> +            package_file_string = d.getVar(f"FILES:{package}")
> +            if package_file_string:
> +                for package_file in package_file_string.split():
> +                    file_list.append(f"{prefix}{package_file}")
> +    return " ".join(file_list)
> +
> +EXTRA_OEMAKE += 'BUILD=${PVR_BUILD} TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +do_install() {
> +    oe_runmake 'DESTDIR=${D}' install
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'false', 'true', d)}; then
> +        for file in ${@get_file_list('GLES_PACKAGES',  d)}; do
> +            rm -rf ${file}
> +        done
> +    fi
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', 'false', 'true', d)}; then
> +        for file in ${@get_file_list('VULKAN_PACKAGES', d)}; do
> +            rm -rf ${file}
> +        done
> +    fi
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'false', 'true', d)}; then
> +        for file in ${@get_file_list('OPENCL_PACKAGES', d)}; do
> +            rm -rf ${file}
> +        done
> +    fi
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
> +        if [ -e ${D}/lib/firmware ]; then
> +            mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
> +        fi
> +    fi
> +
> +    # clean up any empty directories
> +    find "${D}" -empty -type d -delete
> +
> +    # fix permissions
> +    chown -R root:root "${D}"
> +}
> +
> +GLES_PACKAGES = "libgles1-rogue libgles2-rogue libgles3-rogue"
> +VULKAN_PACKAGES = "libvk-rogue"
> +OPENCL_PACKAGES = "libopencl-rogue libopencl-rogue-tools"
> +
> +PACKAGES = " \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', d.getVar('GLES_PACKAGES'), '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'vulkan', d.getVar('VULKAN_PACKAGES'), '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'opencl', d.getVar('OPENCL_PACKAGES'), '', d)} \
> +    ${PN}-tools \
> +    ${PN}-firmware \
> +    ${PN} \
> +"
> +
> +# Inject variables so that packages don't get Debian-renamed (which would
> +# remove the -rogue suffix), but don't RPROVIDEs/RCONFLICTs on the generic
> +# libgl name to prevent colliding with swrast libs
> +python __anonymous() {
> +    suffix = ""
> +    if "-native" in d.getVar("PN"):
> +        suffix = "-native"
> +    for p in (("vulkan", "libvk",),
> +              ("gles", "libgles1", "libglesv1-cm1"),
> +              ("gles", "libgles2", "libglesv2-2"),
> +              ("gles", "libgles3",),
> +              ("opencl", "libopencl",)):
> +        mlprefix = d.getVar("MLPREFIX")
> +        fullp = mlprefix + p[1] + "-rogue" + suffix
> +        mlprefix = d.getVar("MLPREFIX")
> +        pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
> +        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> +        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
> +        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umlibs" + suffix)
> +}
> +
> +# gles specific shared objects
> +FILES:libgles1-rogue = "${libdir}/libGLESv1*.so*"
> +FILES:libgles2-rogue = "${libdir}/libGLESv2*.so*"
> +RDEPENDS:libgles1-rogue += "mesa-megadriver"
> +RDEPENDS:libgles2-rogue += "mesa-megadriver"
> +
> +# vulkan specific shared objects and configs
> +FILES:libvk-rogue = "${libdir}/libVK_IMG.so* ${datadir}/vulkan"
> +RDEPENDS:libvk-rogue += "vulkan-loader wayland libdrm"
> +
> +# opencl specific shared objects and configs
> +FILES:libopencl-rogue = "${libdir}/libPVROCL.so* ${sysconfdir}/OpenCL"
> +RDEPENDS:libopencl-rogue += "opencl-icd-loader"
> +RRECOMMENDS:libopencl-rogue += "libopencl-rogue-tools"
> +FILES:libopencl-rogue-tools += "${bindir}/ocl*"
> +DEBIAN_NOAUTONAME:libopencl-rogue-tools = "1"
> +INSANE_SKIP:libopencl-rogue-tools = "ldflags"
> +
> +# optional tools and tests
> +FILES:${PN}-tools = "${bindir}/"
> +RDEPENDS:${PN}-tools = "python3-core libdrm ${PN}"
> +INSANE_SKIP:${PN}-tools = "ldflags"
> +
> +# required firmware
> +FILES:${PN}-firmware = "${base_libdir}/firmware/*"
> +INSANE_SKIP:${PN}-firmware += "arch"
> +
> +# common libraries
> +FILES:${PN} = "${libdir}"
> +
> +RRECOMMENDS:${PN} += " \
> +    ${PN}-tools \
> +"
> +
> +INSANE_SKIP:${PN} += "already-stripped dev-so ldflags"
> -- 
> 2.34.1

