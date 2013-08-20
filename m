Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8D83E013DF
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 12:47:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KJlBRR017128
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 14:47:11 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KJlBRp013759
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 14:47:11 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 20 Aug 2013 14:47:10 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [master][PATCH 1/2 v2] kernel.bbclass: Pull in
	kernel.bbclass from oe-core master
Thread-Index: AQHOndX6Lg8cgoktB0eMPe9Wg5D2Ypme0tkA//+sX4A=
Date: Tue, 20 Aug 2013 19:47:10 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C526905@DFLE08.ent.ti.com>
References: <1377026431-5185-1-git-send-email-fcooper@ti.com>
	<20130820194206.GG8481@edge>
In-Reply-To: <20130820194206.GG8481@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [master][PATCH 1/2 v2] kernel.bbclass: Pull in kernel.bbclass from oe-core master
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
X-List-Received-Date: Tue, 20 Aug 2013 19:47:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The issue this patch set is fixing isn't an Arago distro only problem but r=
ather a problem faced by anyone using a newer version of u-boot.

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, August 20, 2013 2:42 PM
> To: Cooper Jr., Franklin
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [master][PATCH 1/2 v2] kernel.bbclass: Pull in
> kernel.bbclass from oe-core master
>=20
> Why meta-ti and not meta-arago where we've overlayed kernel.bbclass sever=
al
> times in the past?
>=20
> --
> Denys
>=20
>=20
> On Tue, Aug 20, 2013 at 02:20:31PM -0500, Franklin S. Cooper Jr wrote:
> > * Pull in kernel.bbclass from oe-core master to allow patching of the l=
ocal
> >   version of kernel.bbclass until upstream patch is accepted and pulled=
 into
> >   oe-core master.
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> > Version 2 changes:
> > Fix commit message that mentioned dylan instead of master
> >
> >  classes/kernel.bbclass |  389
> ++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 files changed, 389 insertions(+), 0 deletions(-)
> >  create mode 100644 classes/kernel.bbclass
> >
> > diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> > new file mode 100644
> > index 0000000..e039dfc
> > --- /dev/null
> > +++ b/classes/kernel.bbclass
> > @@ -0,0 +1,389 @@
> > +inherit linux-kernel-base module_strip kernel-module-split
> > +
> > +PROVIDES +=3D "virtual/kernel"
> > +DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils
> virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross"
> > +
> > +# we include gcc above, we dont need virtual/libc
> > +INHIBIT_DEFAULT_DEPS =3D "1"
> > +
> > +KERNEL_IMAGETYPE ?=3D "zImage"
> > +INITRAMFS_IMAGE ?=3D ""
> > +INITRAMFS_TASK ?=3D ""
> > +
> > +python __anonymous () {
> > +    kerneltype =3D d.getVar('KERNEL_IMAGETYPE', True) or ''
> > +    if kerneltype =3D=3D 'uImage':
> > +        depends =3D d.getVar("DEPENDS", True)
> > +        depends =3D "%s u-boot-mkimage-native" % depends
> > +        d.setVar("DEPENDS", depends)
> > +
> > +    image =3D d.getVar('INITRAMFS_IMAGE', True)
> > +    if image:
> > +        d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
> > +}
> > +
> > +inherit kernel-arch deploy
> > +
> > +PACKAGES_DYNAMIC +=3D "^kernel-module-.*"
> > +PACKAGES_DYNAMIC +=3D "^kernel-image-.*"
> > +PACKAGES_DYNAMIC +=3D "^kernel-firmware-.*"
> > +
> > +export OS =3D "${TARGET_OS}"
> > +export CROSS_COMPILE =3D "${TARGET_PREFIX}"
> > +
> > +KERNEL_PRIORITY ?=3D "${@int(d.getVar('PV',1).split('-
> ')[0].split('+')[0].split('.')[0]) * 10000 + \
> > +                       int(d.getVar('PV',1).split('-')[0].split('+')[0=
].split('.')[1]) * 100 + \
> > +                       int(d.getVar('PV',1).split('-')[0].split('+')[0=
].split('.')[-1])}"
> > +
> > +KERNEL_RELEASE ?=3D "${KERNEL_VERSION}"
> > +
> > +# Where built kernel lies in the kernel tree
> > +KERNEL_OUTPUT ?=3D "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
> > +KERNEL_IMAGEDEST =3D "boot"
> > +
> > +#
> > +# configuration
> > +#
> > +export CMDLINE_CONSOLE =3D "console=3D${@d.getVar("KERNEL_CONSOLE",1)
> or "ttyS0"}"
> > +
> > +KERNEL_VERSION =3D "${@get_kernelversion('${B}')}"
> > +
> > +KERNEL_LOCALVERSION ?=3D ""
> > +
> > +# kernels are generally machine specific
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +# U-Boot support
> > +UBOOT_ENTRYPOINT ?=3D "20008000"
> > +UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
> > +
> > +# Some Linux kernel configurations need additional parameters on the
> command line
> > +KERNEL_EXTRA_ARGS ?=3D ""
> > +
> > +# For the kernel, we don't want the '-e MAKEFLAGS=3D' in EXTRA_OEMAKE.
> > +# We don't want to override kernel Makefile variables from the environ=
ment
> > +EXTRA_OEMAKE =3D ""
> > +
> > +KERNEL_ALT_IMAGETYPE ??=3D ""
> > +
> > +# Define where the kernel headers are installed on the target as well =
as
> where
> > +# they are staged.
> > +KERNEL_SRC_PATH =3D "/usr/src/kernel"
> > +
> > +KERNEL_IMAGETYPE_FOR_MAKE =3D "${@(lambda s: s[:-3] if s[-3:] =3D=3D "=
.gz"
> else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
> > +
> > +kernel_do_compile() {
> > +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> > +	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE}
> ${KERNEL_ALT_IMAGETYPE} CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
> ${KERNEL_EXTRA_ARGS}
> > +	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" =3D
> "${KERNEL_IMAGETYPE}"; then
> > +		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" >
> "${KERNEL_OUTPUT}"
> > +	fi
> > +}
> > +
> > +do_compile_kernelmodules() {
> > +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> > +	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> > +		oe_runmake ${PARALLEL_MAKE} modules CC=3D"${KERNEL_CC}"
> LD=3D"${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> > +	else
> > +		bbnote "no modules to compile"
> > +	fi
> > +}
> > +addtask compile_kernelmodules after do_compile before do_strip
> > +
> > +kernel_do_install() {
> > +	#
> > +	# First install the modules
> > +	#
> > +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> > +	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> > +		oe_runmake DEPMOD=3Decho INSTALL_MOD_PATH=3D"${D}"
> modules_install
> > +		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
> > +		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
> > +	else
> > +		bbnote "no modules to install"
> > +	fi
> > +
> > +	#
> > +	# Install various kernel output (zImage, map file, config, module sup=
port
> files)
> > +	#
> > +	install -d ${D}/${KERNEL_IMAGEDEST}
> > +	install -d ${D}/boot
> > +	install -m 0644 ${KERNEL_OUTPUT}
> ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> > +	install -m 0644 System.map ${D}/boot/System.map-
> ${KERNEL_VERSION}
> > +	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
> > +	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> > +	[ -e Module.symvers ] && install -m 0644 Module.symvers
> ${D}/boot/Module.symvers-${KERNEL_VERSION}
> > +	install -d ${D}${sysconfdir}/modules-load.d
> > +	install -d ${D}${sysconfdir}/modprobe.d
> > +
> > +	#
> > +	# Support for external module building - create a minimal copy of the
> > +	# kernel source tree.
> > +	#
> > +	kerneldir=3D${D}${KERNEL_SRC_PATH}
> > +	install -d $kerneldir
> > +
> > +	#
> > +	# Store the kernel version in sysroots for module-base.bbclass
> > +	#
> > +
> > +	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
> > +
> > +	#
> > +	# Store kernel image name to allow use during image generation
> > +	#
> > +
> > +	echo "${KERNEL_IMAGE_BASE_NAME}" >$kerneldir/kernel-image-
> name
> > +
> > +	#
> > +	# Copy the entire source tree. In case an external build directory is
> > +	# used, copy the build directory over first, then copy over the sourc=
e
> > +	# dir. This ensures the original Makefiles are used and not the
> > +	# redirecting Makefiles in the build directory.
> > +	#
> > +	# work and sysroots can be on different partitions, so we can't rely =
on
> > +	# hardlinking, unfortunately.
> > +	#
> > +	find . -depth -not -name "*.cmd" -not -name "*.o" -not -path "./.*" -
> print0 | cpio --null -pdu $kerneldir
> > +	cp .config $kerneldir
> > +	if [ "${S}" !=3D "${B}" ]; then
> > +		pwd=3D"$PWD"
> > +		cd "${S}"
> > +		find . -depth -not -path "./.*" -print0 | cpio --null -pdu
> $kerneldir
> > +		cd "$pwd"
> > +	fi
> > +	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
> > +	install -m 0644 System.map $kerneldir/System.map-
> ${KERNEL_VERSION}
> > +
> > +	#
> > +	# Clean and remove files not needed for building modules.
> > +	# Some distributions go through a lot more trouble to strip out
> > +	# unecessary headers, for now, we just prune the obvious bits.
> > +	#
> > +	# We don't want to leave host-arch binaries in /sysroots, so
> > +	# we clean the scripts dir while leaving the generated config
> > +	# and include files.
> > +	#
> > +	oe_runmake -C $kerneldir CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
> clean
> > +	make -C $kerneldir _mrproper_scripts
> > +	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools=
 -
> prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}'=
 \;
> > +	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
> > +
> > +	# As of Linux kernel version 3.0.1, the clean target removes
> > +	# arch/powerpc/lib/crtsavres.o which is present in
> > +	# KBUILD_LDFLAGS_MODULE, making it required to build external
> modules.
> > +	if [ ${ARCH} =3D "powerpc" ]; then
> > +		cp arch/powerpc/lib/crtsavres.o
> $kerneldir/arch/powerpc/lib/crtsavres.o
> > +	fi
> > +
> > +	# Necessary for building modules like compat-wireless.
> > +	if [ -f include/generated/bounds.h ]; then
> > +		cp include/generated/bounds.h
> $kerneldir/include/generated/bounds.h
> > +	fi
> > +	if [ -d arch/${ARCH}/include/generated ]; then
> > +		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
> > +		cp -fR arch/${ARCH}/include/generated/*
> $kerneldir/arch/${ARCH}/include/generated/
> > +	fi
> > +
> > +	# Remove the following binaries which cause strip or arch QA errors
> > +	# during do_package for cross-compiled platforms
> > +	bin_files=3D"arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff
> \
> > +	           arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
> > +		   scripts/kconfig/conf.o scripts/kconfig/kxgettext.o"
> > +	for entry in $bin_files; do
> > +		rm -f $kerneldir/$entry
> > +	done
> > +
> > +	# kernels <2.6.30 don't have $kerneldir/tools directory so we check i=
f it
> exists before calling sed
> > +	if [ -f $kerneldir/tools/perf/Makefile ]; then
> > +		# Fix SLANG_INC for slang.h
> > +		sed -i 's#-I/usr/include/slang#-I=3D/usr/include/slang#g'
> $kerneldir/tools/perf/Makefile
> > +	fi
> > +}
> > +do_install[prefuncs] +=3D "package_get_auto_pr"
> > +
> > +sysroot_stage_all_append() {
> > +	sysroot_stage_dir ${D}${KERNEL_SRC_PATH}
> ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
> > +}
> > +
> > +kernel_do_configure() {
> > +	# fixes extra + in /lib/modules/2.6.37+
> > +	# $ scripts/setlocalversion . =3D> +
> > +	# $ make kernelversion =3D> 2.6.37
> > +	# $ make kernelrelease =3D> 2.6.37+
> > +	touch ${B}/.scmversion ${S}/.scmversion
> > +
> > +	# Copy defconfig to .config if .config does not exist. This allows
> > +	# recipes to manage the .config themselves in do_configure_prepend().
> > +	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
> > +		cp "${WORKDIR}/defconfig" "${B}/.config"
> > +	fi
> > +	yes '' | oe_runmake oldconfig
> > +
> > +	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
> > +		for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
> > +		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-
> ${MACHINE}.$img" ]; then
> > +			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-
> ${MACHINE}.$img" initramfs.$img
> > +		fi
> > +		done
> > +	fi
> > +}
> > +
> > +do_configure[depends] +=3D "${INITRAMFS_TASK}"
> > +
> > +do_savedefconfig() {
> > +	oe_runmake savedefconfig
> > +}
> > +do_savedefconfig[nostamp] =3D "1"
> > +addtask savedefconfig after do_configure
> > +
> > +inherit cml1
> > +
> > +EXPORT_FUNCTIONS do_compile do_install do_configure
> > +
> > +# kernel-base becomes kernel-${KERNEL_VERSION}
> > +# kernel-image becomes kernel-image-${KERNEL_VERISON}
> > +PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-de=
v
> kernel-modules"
> > +FILES_${PN} =3D ""
> > +FILES_kernel-base =3D "/lib/modules/${KERNEL_VERSION}/modules.order
> /lib/modules/${KERNEL_VERSION}/modules.builtin"
> > +FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
> > +FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers*
> /boot/config* ${KERNEL_SRC_PATH}"
> > +FILES_kernel-vmlinux =3D "/boot/vmlinux*"
> > +FILES_kernel-modules =3D ""
> > +RDEPENDS_kernel =3D "kernel-base"
> > +# Allow machines to override this dependency if kernel image files are
> > +# not wanted in images as standard
> > +RDEPENDS_kernel-base ?=3D "kernel-image"
> > +PKG_kernel-image =3D "kernel-image-
> ${@legitimize_package_name('${KERNEL_VERSION}')}"
> > +PKG_kernel-base =3D "kernel-
> ${@legitimize_package_name('${KERNEL_VERSION}')}"
> > +RPROVIDES_kernel-base +=3D "kernel-${KERNEL_VERSION}"
> > +ALLOW_EMPTY_kernel =3D "1"
> > +ALLOW_EMPTY_kernel-base =3D "1"
> > +ALLOW_EMPTY_kernel-image =3D "1"
> > +ALLOW_EMPTY_kernel-modules =3D "1"
> > +DESCRIPTION_kernel-modules =3D "Kernel modules meta package"
> > +
> > +pkg_postinst_kernel-image () {
> > +	update-alternatives --install
> /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}
> ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
> > +	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> > +		mkdir -p $D/lib/modules/${KERNEL_VERSION}
> > +	fi
> > +	if [ -n "$D" ]; then
> > +		depmodwrapper -a -b $D ${KERNEL_VERSION}
> > +	else
> > +		depmod -a ${KERNEL_VERSION}
> > +	fi
> > +}
> > +
> > +pkg_postrm_kernel-image () {
> > +	update-alternatives --remove ${KERNEL_IMAGETYPE}
> ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
> > +}
> > +
> > +PACKAGESPLITFUNCS_prepend =3D "split_kernel_packages "
> > +
> > +python split_kernel_packages () {
> > +    do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\.=
bin$',
> output_pattern=3D'kernel-firmware-%s', description=3D'Firmware for %s',
> recursive=3DTrue, extra_depends=3D'')
> > +    do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\.=
fw$',
> output_pattern=3D'kernel-firmware-%s', description=3D'Firmware for %s',
> recursive=3DTrue, extra_depends=3D'')
> > +    do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\.=
cis$',
> output_pattern=3D'kernel-firmware-%s', description=3D'Firmware for %s',
> recursive=3DTrue, extra_depends=3D'')
> > +}
> > +
> > +do_strip() {
> > +	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
> > +		if [[ "${KERNEL_IMAGETYPE}" !=3D "vmlinux" ]]; then
> > +			bbwarn "image type will not be stripped (not
> supported): ${KERNEL_IMAGETYPE}"
> > +			return
> > +		fi
> > +
> > +		cd ${B}
> > +		headers=3D`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT} |
> \
> > +			  grep "^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]" | \
> > +			  sed "s/^ \{1,\}\[[0-9 ]\{1,\}\] //" | \
> > +			  gawk '{print $1}'`
> > +
> > +		for str in ${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}; do {
> > +			if [[ "$headers" !=3D *"$str"* ]]; then
> > +				bbwarn "Section not found: $str";
> > +			fi
> > +
> > +			"$CROSS_COMPILE"strip -s -R $str ${KERNEL_OUTPUT}
> > +		}; done
> > +
> > +		bbnote "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set,
> stripping sections:" \
> > +			"${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}"
> > +	fi;
> > +}
> > +do_strip[dirs] =3D "${B}"
> > +
> > +addtask do_strip before do_sizecheck after do_kernel_link_vmlinux
> > +
> > +# Support checking the kernel size since some kernels need to reside i=
n
> partitions
> > +# with a fixed length or there is a limit in transferring the kernel t=
o memory
> > +do_sizecheck() {
> > +	if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
> > +		cd ${B}
> > +		size=3D`ls -lL ${KERNEL_OUTPUT} | awk '{ print $5}'`
> > +		if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
> > +			die "This kernel (size=3D$size >
> ${KERNEL_IMAGE_MAXSIZE}) is too big for your device. Please reduce the si=
ze
> of the kernel by making more of it modular."
> > +		fi
> > +	fi
> > +}
> > +do_sizecheck[dirs] =3D "${B}"
> > +
> > +addtask sizecheck before do_install after do_strip
> > +
> > +KERNEL_IMAGE_BASE_NAME ?=3D "${KERNEL_IMAGETYPE}-${PKGE}-
> ${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
> > +# Don't include the DATETIME variable in the sstate package signatures
> > +KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
> > +KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE}-${MACHINE}"
> > +MODULE_IMAGE_BASE_NAME ?=3D "modules-${PKGE}-${PKGV}-${PKGR}-
> ${MACHINE}-${DATETIME}"
> > +MODULE_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
> > +MODULE_TARBALL_BASE_NAME ?=3D "${MODULE_IMAGE_BASE_NAME}.tgz"
> > +# Don't include the DATETIME variable in the sstate package signatures
> > +MODULE_TARBALL_SYMLINK_NAME ?=3D "modules-${MACHINE}.tgz"
> > +MODULE_TARBALL_DEPLOY ?=3D "1"
> > +
> > +do_uboot_mkimage() {
> > +	if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; then
> > +		if test "x${KEEPUIMAGE}" !=3D "xyes" ; then
> > +			ENTRYPOINT=3D${UBOOT_ENTRYPOINT}
> > +			if test -n "${UBOOT_ENTRYSYMBOL}"; then
> > +				ENTRYPOINT=3D`${HOST_PREFIX}nm
> ${S}/vmlinux | \
> > +					awk
> '$3=3D=3D"${UBOOT_ENTRYSYMBOL}" {print $1}'`
> > +			fi
> > +			if test -e arch/${ARCH}/boot/compressed/vmlinux ;
> then
> > +				${OBJCOPY} -O binary -R .note -R .comment -S
> arch/${ARCH}/boot/compressed/vmlinux linux.bin
> > +				uboot-mkimage -A ${UBOOT_ARCH} -O linux -
> T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n
> "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin
> arch/${ARCH}/boot/uImage
> > +				rm -f linux.bin
> > +			else
> > +				${OBJCOPY} -O binary -R .note -R .comment -S
> vmlinux linux.bin
> > +				rm -f linux.bin.gz
> > +				gzip -9 linux.bin
> > +				uboot-mkimage -A ${UBOOT_ARCH} -O linux -
> T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n
> "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz
> arch/${ARCH}/boot/uImage
> > +				rm -f linux.bin.gz
> > +			fi
> > +		fi
> > +	fi
> > +}
> > +
> > +addtask uboot_mkimage before do_install after do_compile
> > +
> > +kernel_do_deploy() {
> > +	install -m 0644 ${KERNEL_OUTPUT}
> ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> > +	if [ ${MODULE_TARBALL_DEPLOY} =3D "1" ] && (grep -q -i -e
> '^CONFIG_MODULES=3Dy$' .config); then
> > +		mkdir -p ${D}/lib
> > +		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C
> ${D} lib
> > +		ln -sf ${MODULE_TARBALL_BASE_NAME}
> ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
> > +	fi
> > +
> > +	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin
> ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
> > +	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin
> ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
> > +
> > +	cp ${COREBASE}/meta/files/deploydir_readme.txt
> ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> > +}
> > +do_deploy[dirs] =3D "${DEPLOYDIR} ${B}"
> > +do_deploy[prefuncs] +=3D "package_get_auto_pr"
> > +
> > +addtask deploy before do_build after do_install
> > +
> > +EXPORT_FUNCTIONS do_deploy
> > +
> > --
> > 1.7.0.4
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

