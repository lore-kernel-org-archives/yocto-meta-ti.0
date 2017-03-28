Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D096E00524; Tue, 28 Mar 2017 15:52:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3433E004E5
	for <meta-ti@yoctoproject.org>; Tue, 28 Mar 2017 15:52:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2SMpmNY022108;
	Tue, 28 Mar 2017 17:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490741508;
	bh=Q+ncONaPePjaIb9D7zzbH2yGqqa5s+ZQYuX7I1xI1Cg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LUZql8S/5iYUYpS0KQ/jh7dgrHj494sGdEYkqK+oAplr6yVUsjwUf32GrhPSWrAuO
	zrwva/x63df1TIf1t9lNQ3VwKUD0WaIEZdmOo9NW24NQiDDcSsyju+mszNjnAHtnSE
	PfDqwyx/1qKISD5iA7vyZ9g9ocaAR1kV7nNtgcdc=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2SMphRZ018300;
	Tue, 28 Mar 2017 17:51:43 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 28 Mar 2017 17:51:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2SMpgYo021500;
	Tue, 28 Mar 2017 17:51:43 -0500
Date: Tue, 28 Mar 2017 18:51:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20170328225142.GQ29187@edge>
References: <20170328092842.7327-1-fathi.boudra@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170328092842.7327-1-fathi.boudra@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] kselftests: update to 4.10
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
X-List-Received-Date: Tue, 28 Mar 2017 22:52:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Fathi,

Did you forget to include the individual Makefile patches here?


On Tue, Mar 28, 2017 at 12:28:42PM +0300, Fathi Boudra wrote:
> * Adjust md5sum/sha256sum for the updated tarball
> * Add new dependencies:
>   - numactl, used by net tests (for libnuma)
>   - util-linux, used by gpio tests (for libmount)
> * Get rid of the TARGETS list, manually maintained. Rely on the top-level
>   Makefile to call all the TARGETS. As a result, TARGETS isn't passed to
>   EXTRA_OEMAKE anymore.
> * Update EXTRA-OEMAKE:
>   - pass V=1 to be more verbose in the logs
>   - pass LD to fix gpio tests and avoid to use native linker causing a
>     build failure in cross-compilation environment.
> * Call headers_install in do_compile() to make sure to install the user
>   space API used by some tests but not properly declared as a build
>   dependency.
> * Add new packages: bpf, gpio and sync tests.
> * Allow empty package for bpf. It fails to build and need to be fixed.
> * Add breakpoints package on Aarch64. An arch specific test has been
>   added, though it is currently broken due to missing TRAP_BRANCH and
>   TRAP_HWBKPT definitions in glibc siginfo.
> * Get rid of do_configure() and convert the Makefiles fixes to patches,
>   easier to upstream.
> * Add patches to fix gpio and net tests. Also add a partial patch for
>   breakpoints on Aarch64, not applied for now because we need the glibc
>   fixes counterpart (see explanation above).
> 
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
> 
> Changes in v2:
>  * Remove the workaround for broken gpio packaging and gpio-mockup-chardev
>    binary installation. Fixed in 0001-selftests-gpio-use-pkg-config.patch
>  * Reported by Denys Dmytriyenko, fix numctl DEPENDS as ARM doesn't support
>    NUMA (not in COMPATIBLE_HOST).
> 
>  .../{kselftests_4.9.bb => kselftests_4.10.bb}      | 90 +++++++++-------------
>  1 file changed, 37 insertions(+), 53 deletions(-)
>  rename recipes-kernel/kselftests/{kselftests_4.9.bb => kselftests_4.10.bb} (66%)
> 
> diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
> similarity index 66%
> rename from recipes-kernel/kselftests/kselftests_4.9.bb
> rename to recipes-kernel/kselftests/kselftests_4.10.bb
> index 9d3f1d73..4ff9e5b9 100644
> --- a/recipes-kernel/kselftests/kselftests_4.9.bb
> +++ b/recipes-kernel/kselftests/kselftests_4.10.bb
> @@ -2,70 +2,36 @@ SUMMARY = "Linux Kernel Selftests"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>  
> -SRC_URI = "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz"
> +SRC_URI = "\
> +    https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz \
> +    file://0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch \
> +    file://0001-selftests-timers-use-LDLIBS-to-link-against-libpthread.patch \
> +    file://0001-selftests-sigaltstack-fix-packaging.patch \
> +    file://0001-selftests-seccomp-use-LDLIBS-to-link-against-libpthread.patch \
> +    file://0001-selftests-gpio-use-pkg-config.patch \
> +    file://0001-selftests-net-use-LDLIBS-to-link-against-libnuma.patch \
> +    file://0001-selftests-breakpoints-allow-to-cross-compile-for-aar.patch;apply=no \
> +"
>  
> -SRC_URI[md5sum] = "0a68ef3615c64bd5ee54a3320e46667d"
> -SRC_URI[sha256sum] = "029098dcffab74875e086ae970e3828456838da6e0ba22ce3f64ef764f3d7f1a"
> +SRC_URI[md5sum] = "b5e7f6b9b2fe1b6cc7bc56a3a0bfc090"
> +SRC_URI[sha256sum] = "3c95d9f049bd085e5c346d2c77f063b8425f191460fcd3ae9fe7e94e0477dc4b"
>  
>  S = "${WORKDIR}/linux-${PV}"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -DEPENDS = "libcap libcap-ng popt rsync-native"
> -
> -inherit kernel-arch
> -
> -# Filter out arch specific tests
> -TARGETS = " \
> -	${@bb.utils.contains_any("TARGET_ARCH", [ "x86", "x86-64" ], "breakpoints", "", d)} \
> -	capabilities \
> -	cpu-hotplug \
> -	efivarfs \
> -	exec \
> -	firmware \
> -	ftrace \
> -	futex \
> -	${@bb.utils.contains_any("TARGET_ARCH", [ "x86", "x86-64" ], "ipc", "", d)} \
> -	kcmp \
> -	lib \
> -	membarrier \
> -	memfd \
> -	memory-hotplug \
> -	mount \
> -	mqueue \
> -	net \
> -	nsfs \
> -	${@bb.utils.contains_any("TARGET_ARCH", [ "powerpc", "powerpc64" ], "powerpc", "", d)} \
> -	pstore \
> -	ptrace \
> -	seccomp \
> -	sigaltstack \
> -	size \
> -	static_keys \
> -	sysctl \
> -	timers \
> -	user \
> -	vm \
> -	${@bb.utils.contains_any("TARGET_ARCH", [ "x86", "x86-64" ], "x86", "", d)} \
> -	zram \
> +DEPENDS = "libcap libcap-ng popt rsync-native util-linux \
> +    ${@bb.utils.contains("TARGET_ARCH", "arm", "", "numactl", d)} \
>  "
>  
> -EXTRA_OEMAKE += "-C tools/testing/selftests TARGETS="${TARGETS}" INSTALL_PATH=${D}${bindir}/kselftests CC="${CC}""
> +inherit kernel-arch
>  
> -# Their Makefiles are so sloppy, let's clean up a bit
> -do_configure () {
> -	sed "s|^CC := .*||g" -i ${S}/tools/testing/selftests/lib.mk
> -	sed "s|^CC = .*||g" -i ${S}/tools/testing/selftests/timers/Makefile
> -	sed "s|^CC = .*||g" -i ${S}/tools/testing/selftests/memfd/Makefile
> -	sed "s|^CC := .*||g" -i ${S}/tools/testing/selftests/powerpc/switch_endian/Makefile
> -	sed "s|gcc|\$(CC)|g" -i ${S}/tools/testing/selftests/breakpoints/Makefile
> -	sed "s|TARGETS|F_TARGETS|g" -i ${S}/tools/testing/selftests/futex/functional/Makefile
> -	sed "s|^LDFLAGS += -lpthread|LDLIBS += -lpthread|g" -i ${S}/tools/testing/selftests/seccomp/Makefile
> -	sed "s|^LDFLAGS += -lrt -lpthread|LDLIBS += -lrt -lpthread|g" -i ${S}/tools/testing/selftests/timers/Makefile
> -	sed "s|BINARIES|TEST_PROGS|g" -i ${S}/tools/testing/selftests/sigaltstack/Makefile
> -}
> +EXTRA_OEMAKE += "V=1 -C ${S}/tools/testing/selftests INSTALL_PATH=${D}${bindir}/kselftests CC="${CC}" LD="${LD}""
>  
>  do_compile () {
> +	# Make sure to install the user space API used by some tests
> +	# but not properly declared as a build dependency
> +	${MAKE} -C ${S} headers_install
>  	oe_runmake
>  }
>  
> @@ -77,6 +43,7 @@ do_install () {
>  }
>  
>  PACKAGE_BEFORE_PN = " \
> +	${PN}-bpf \
>  	${PN}-breakpoints \
>  	${PN}-capabilities \
>  	${PN}-cpu-hotplug \
> @@ -85,6 +52,7 @@ PACKAGE_BEFORE_PN = " \
>  	${PN}-firmware \
>  	${PN}-ftrace \
>  	${PN}-futex \
> +	${PN}-gpio \
>  	${PN}-ipc \
>  	${PN}-kcmp \
>  	${PN}-lib \
> @@ -102,6 +70,7 @@ PACKAGE_BEFORE_PN = " \
>  	${PN}-sigaltstack \
>  	${PN}-size \
>  	${PN}-static-keys \
> +	${PN}-sync \
>  	${PN}-sysctl \
>  	${PN}-timers \
>  	${PN}-user \
> @@ -110,6 +79,7 @@ PACKAGE_BEFORE_PN = " \
>  	${PN}-zram \
>  "
>  
> +FILES_${PN}-bpf = "${bindir}/kselftests/bpf"
>  FILES_${PN}-breakpoints = "${bindir}/kselftests/breakpoints"
>  FILES_${PN}-capabilities = "${bindir}/kselftests/capabilities"
>  FILES_${PN}-cpu-hotplug = "${bindir}/kselftests/cpu-hotplug"
> @@ -118,6 +88,7 @@ FILES_${PN}-exec = "${bindir}/kselftests/exec"
>  FILES_${PN}-firmware = "${bindir}/kselftests/firmware"
>  FILES_${PN}-ftrace = "${bindir}/kselftests/ftrace"
>  FILES_${PN}-futex = "${bindir}/kselftests/futex"
> +FILES_${PN}-gpio = "${bindir}/kselftests/gpio"
>  FILES_${PN}-ipc = "${bindir}/kselftests/ipc"
>  FILES_${PN}-kcmp = "${bindir}/kselftests/kcmp"
>  FILES_${PN}-lib = "${bindir}/kselftests/lib"
> @@ -135,6 +106,7 @@ FILES_${PN}-seccomp = "${bindir}/kselftests/seccomp"
>  FILES_${PN}-sigaltstack = "${bindir}/kselftests/sigaltstack"
>  FILES_${PN}-size = "${bindir}/kselftests/size"
>  FILES_${PN}-static-keys = "${bindir}/kselftests/static_keys"
> +FILES_${PN}-sync = "${bindir}/kselftests/sync"
>  FILES_${PN}-sysctl = "${bindir}/kselftests/sysctl"
>  FILES_${PN}-timers = "${bindir}/kselftests/timers"
>  FILES_${PN}-user = "${bindir}/kselftests/user"
> @@ -143,6 +115,14 @@ FILES_${PN}-x86 = "${bindir}/kselftests/x86"
>  FILES_${PN}-zram = "${bindir}/kselftests/zram"
>  FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
>  
> +# FIXME bpf target is failing to build and need to be fixed:
> +# In file included from test_verifier.c:23:0:
> +# ../../../../usr/include/linux/bpf_perf_event.h:14:17: error: field 'regs' has incomplete type
> +#   struct pt_regs regs;
> +#                  ^~~~
> +# make[1]: *** [test_verifier] Error 1
> +ALLOW_EMPTY_${PN}-bpf = "1"
> +
>  RDEPENDS_${PN}-cpu-hotplug += "bash"
>  RDEPENDS_${PN}-efivarfs += "bash"
>  RDEPENDS_${PN}-futex += "bash ncurses"
> @@ -151,6 +131,7 @@ RDEPENDS_${PN}-net += "bash"
>  RDEPENDS_${PN}-vm += "bash"
>  RDEPENDS_${PN}-zram += "bash"
>  RDEPENDS_${PN} += "bash \
> +	${PN}-bpf \
>  	${PN}-capabilities \
>  	${PN}-cpu-hotplug \
>  	${PN}-efivarfs \
> @@ -158,6 +139,7 @@ RDEPENDS_${PN} += "bash \
>  	${PN}-firmware \
>  	${PN}-ftrace \
>  	${PN}-futex \
> +	${PN}-gpio \
>  	${PN}-kcmp \
>  	${PN}-lib \
>  	${PN}-membarrier \
> @@ -173,6 +155,7 @@ RDEPENDS_${PN} += "bash \
>  	${PN}-sigaltstack \
>  	${PN}-size \
>  	${PN}-static-keys \
> +	${PN}-sync \
>  	${PN}-sysctl \
>  	${PN}-timers \
>  	${PN}-user \
> @@ -180,6 +163,7 @@ RDEPENDS_${PN} += "bash \
>  	${PN}-zram \
>  "
>  
> +RDEPENDS_${PN}_append_aarch64 = " ${PN}-breakpoints"
>  RDEPENDS_${PN}_append_x86 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
>  RDEPENDS_${PN}_append_x86-64 = " ${PN}-breakpoints ${PN}-ipc ${PN}-x86"
>  RDEPENDS_${PN}_append_powerpc = " ${PN}-powerpc"
> -- 
> 2.11.0
> 

