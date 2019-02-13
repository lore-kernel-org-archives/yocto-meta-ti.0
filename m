Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9607E00B81; Wed, 13 Feb 2019 13:56:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A55F3E00B43
	for <meta-ti@yoctoproject.org>; Wed, 13 Feb 2019 13:56:23 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1DLuMwo123742;
	Wed, 13 Feb 2019 15:56:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550094982;
	bh=ivS4xq2GkQ5r4CFCv2eW/1tcsn9OJf4uRiuQQNpb0N0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=asVhuV7nFq/hI5XohOtxde+LsJ7pS/bzn+t4Qbzow4qTBlkfcPwidume25F7CisCp
	ZucNUhoEqIF+NjV/8CBONBfg2/KouwGX72yJyLlJHkW9iaIVAvkP2CGndewlomNTG0
	rBTKeexaVneKAgmBXrNOoXzfij/pqsfvvyuSgxOM=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1DLuMH5110273
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Feb 2019 15:56:22 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 13 Feb 2019 15:56:21 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 13 Feb 2019 15:56:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1DLuLZo000817;
	Wed, 13 Feb 2019 15:56:21 -0600
Date: Wed, 13 Feb 2019 16:56:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Madhu B <madhu1313b@gmail.com>
Message-ID: <20190213215621.GB19384@beryl>
References: <CAH5YvUt77u-_wztLrs8rwcHd7CUXZn8nQimEhkQwTHN4TYEooA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH5YvUt77u-_wztLrs8rwcHd7CUXZn8nQimEhkQwTHN4TYEooA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: =?UTF-8?B?UmU6IGNwOiBjYW5ub3Qgc3RhdCDigJguL3RhcmdldGZzLy9ldGMvKuKAmTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ==?=
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
X-List-Received-Date: Wed, 13 Feb 2019 21:56:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Feb 13, 2019 at 11:13:49AM +0530, Madhu B wrote:
> Hello everyone,
>                       I am getting an similar issue like
> https://lists.yoctoproject.org/pipermail/meta-ti/2017-January/009481.html.
> But even after applying the patch specified in the above link I am
> observing the issue and in my case MACHINE = pandaboard.

Not sure which of the 20 layers that you use changes this, but the recipe is 
not compatible with pandaboard and the proper output should be:

ERROR: Nothing PROVIDES 'ti-sgx-ddk-um'
ti-sgx-ddk-um was skipped: incompatible with machine pandaboard (not in COMPATIBLE_MACHINE)

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb#n6

-- 
Denys


> Here is the log data:
> ******************************************************************************************************
> mbaikana@HYMBAIKANA:~/workspace_agl/build$ bitbake agl-demo-platform
> WARNING: Host distribution "ubuntu-14.04" has not been validated with this
> version of the build system; you may possibly experience unexpected
> failures. It is recommended that you use a tested distribution.
> Parsing recipes: 100%
> |##########################################################################################################|
> Time: 0:01:23
> Parsing of 2571 .bb files complete (0 cached, 2571 parsed). 3474 targets,
> 430 skipped, 0 masked, 0 errors.
> WARNING: No bb files matched BBFILE_PATTERN_agl-distro
> '^/home/mbaikana/workspace_agl/meta-agl/meta-agl-distro/'
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION           = "1.36.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "arm-agl-linux-gnueabi"
> MACHINE              = "pandaboard"
> DISTRO               = "poky-agl"
> DISTRO_VERSION       = "6.0.3"
> TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
> TARGET_FPU           = "hard"
> meta-ti              = "HEAD:ed83a43c6a76875ee5f0388b3b60a28f2a373a10"
> meta-qt5             = "HEAD:682ad61c071a9710e9f9d8a32ab1b5f3c14953d1"
> meta-agl-profile-graphical-qt5
> meta-agl-profile-graphical
> meta-netboot         = "HEAD:0f1bcdcbe367a560dd57270f06cae593101e764b"
> meta-hmi-framework
> meta-audio-4a-framework = "HEAD:85d1e8250e3e36fb02f3143cce767388785348f4"
> meta-agl-demo        = "HEAD:98d6acf7b2805e570008eb513ac4aa73a0fa00c3"
> meta-oe
> meta-multimedia
> meta-networking
> meta-python
> meta-filesystems     = "HEAD:eae996301d9c097bcbeb8046f08041dc82bb62f8"
> meta-agl-profile-core
> meta-agl-distro
> meta-agl-bsp         = "HEAD:0f1bcdcbe367a560dd57270f06cae593101e764b"
> meta-security        = "HEAD:8f6969a775fa6afbf553e72ba83e71197780b2d8"
> meta-perl            = "HEAD:eae996301d9c097bcbeb8046f08041dc82bb62f8"
> meta-security
> meta-app-framework   = "HEAD:0f1bcdcbe367a560dd57270f06cae593101e764b"
> meta
> meta-poky            = "HEAD:e74a1931af9c5b883345345a03a6a9ebf6821cb0"
> 
> Initialising tasks: 100%
> |#######################################################################################################|
> Time: 0:00:13
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: ti-sgx-ddk-um-1.14.3699939-r28 do_install: oe_runmake failed
> ERROR: ti-sgx-ddk-um-1.14.3699939-r28 do_install: Function failed:
> do_install (log file is located at
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103)
> ERROR: Logfile of failure stored in:
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are
> ['/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot',
> '/home/mbaikana/workspace_agl/poky/meta/recipes-graphics/drm/libdrm_2.4.83.bb:do_populate_sysroot',
> '/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/gcc/gcc-cross_7.3.bb:do_populate_sysroot',
> '/home/mbaikana/workspace_agl/poky/meta/recipes-core/systemd/systemd_234.bb:do_populate_sysroot',
> '/home/mbaikana/workspace_agl/poky/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot',
> '/home/mbaikana/workspace_agl/poky/meta/recipes-support/libffi/libffi_3.2.1.bb:do_populate_sysroot',
> '/home/mbaikana/workspace_agl/poky/meta/recipes-core/glibc/glibc_2.26.bb:do_populate_sysroot',
> '/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/gcc/gcc-runtime_7.3.bb:do_populate_sysroot',
> 'virtual:native:/home/mbaikana/workspace_agl/poky/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb:do_populate_sysroot',
> '/home/mbaikana/workspace_agl/poky/meta/recipes-graphics/wayland/wayland_1.13.0.bb:do_populate_sysroot',
> '/home/mbaikana/workspace_agl/meta-ti/recipes-graphics/gbm/libgbm_10.0.0.bb:
> do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['quilt-native', 'libdrm',
> 'gcc-cross-arm', 'systemd', 'systemd-systemctl-native', 'libffi', 'glibc',
> 'gcc-runtime', 'pseudo-native', 'wayland', 'libgbm', 'libpthread-stubs',
> 'libpciaccess', 'libtool-native', 'mpfr-native', 'gnu-config-native',
> 'libmpc-native', 'linux-libc-headers', 'xz-native', 'autoconf-native',
> 'texinfo-dummy-native', 'gmp-native', 'binutils-cross-arm', 'zlib-native',
> 'automake-native', 'shadow', 'kmod', 'xz', 'bash-completion',
> 'base-passwd', 'libcgroup', 'readline', 'libcap', 'shadow-native',
> 'util-linux', 'base-files', 'opkg-utils', 'libpam', 'shadow-sysroot',
> 'acl', 'libgcc', 'expat', 'libxml2', 'util-macros',
> 'gettext-minimal-native', 'm4-native', 'bison-native', 'flex-native',
> 'attr', 'zlib', 'ncurses', 'cracklib', 'flex', 'python3', 'openssl',
> 'bzip2', 'gdbm', 'db', 'sqlite3', 'cryptodev-linux']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install
> | NOTE: make -j 4 install
> DESTDIR=/home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image
> TARGET_PRODUCT=
> | mkdir -p
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image/etc
> | mkdir -p
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image/usr/bin
> | mkdir -p
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image/usr/include
> | mkdir -p
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image/usr/lib
> | cp -ar ./targetfs//etc/*
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/image/etc
> | cp: cannot stat ‘./targetfs//etc/*’: No such file or directory
> | make: *** [install] Error 1
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_install (log file is located at
> /home/mbaikana/workspace_agl/build/tmp/work/pandaboard-agl-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r28/temp/log.do_install.8103)
> ERROR: Task
> (/home/mbaikana/workspace_agl/meta-ti/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb:do_install)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1280 tasks of which 1275 didn't need to be
> rerun and 1 failed.
> 
> Summary: 1 task failed:
> 
> /home/mbaikana/workspace_agl/meta-ti/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb:
> do_install
> Summary: There were 2 WARNING messages shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> 
> ******************************************************************************************************
> 
> Regards,
> -Madhu.

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


