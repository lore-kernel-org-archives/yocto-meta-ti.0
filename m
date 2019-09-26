Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1ED1EE0098A; Thu, 26 Sep 2019 09:12:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15607E0084E
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 09:12:21 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QGCLjf088133;
	Thu, 26 Sep 2019 11:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569514341;
	bh=Iou0sE9OIR7hVdU9GRJ9URgZsTC6G0BwErb1ds2BD6U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=td4QwqA2yOtZtlWu+jEk2MdB5Vn0hm5rcemxinP7Nk7fsqEIBvvUx/LeSH64dKLfK
	UnF2fqgvZvdhpdvtrEBMZ7l1L0FRtNMIoJJD8lZTiyPjfB0I62R78VN2dsxflD8m3H
	fjRopyPGKTtFfhiZh8ZI3ztahOY2Ic08nvr5I5HE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QGCLmD113467;
	Thu, 26 Sep 2019 11:12:21 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 26 Sep 2019 11:12:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 26 Sep 2019 11:12:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QGCKp6074190;
	Thu, 26 Sep 2019 11:12:21 -0500
Date: Thu, 26 Sep 2019 12:12:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190926161220.GA5386@beryl>
References: <20190926160150.2507778-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190926160150.2507778-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] rwmem: Update to 2.0-rc2+
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
X-List-Received-Date: Thu, 26 Sep 2019 16:12:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! It's been on my todo list lately...

There's pybind11 recipe in meta-openembedded/meta-python that I originally 
submitted back in 2016, but unfortunately meta-ti does not depend on that 
layer and probably shouldn't for now.


On Thu, Sep 26, 2019 at 09:01:50AM -0700, Khem Raj wrote:
> - New versions uses CMake and extra modules
> - Correct detection of nm/ranlib/ar for LTO
> - Fix build with clang/libc++
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...Make-provided-vars-for-ar-and-ranlib.patch | 34 +++++++++++++++++++
>  ....h-Include-cerrno-for-errno-definiti.patch | 24 +++++++++++++
>  recipes-bsp/rwmem/rwmem_1.1.bb                | 13 -------
>  recipes-bsp/rwmem/rwmem_1.2.bb                | 27 +++++++++++++++
>  4 files changed, 85 insertions(+), 13 deletions(-)
>  create mode 100644 recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
>  create mode 100644 recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
>  delete mode 100644 recipes-bsp/rwmem/rwmem_1.1.bb
>  create mode 100644 recipes-bsp/rwmem/rwmem_1.2.bb
> 
> diff --git a/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> new file mode 100644
> index 00000000..79968f32
> --- /dev/null
> +++ b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
> @@ -0,0 +1,34 @@
> +From ee3bbdaae568118b4aad453c8fbb1ec648e8fbf2 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 8 Dec 2018 22:48:23 -0800
> +Subject: [PATCH] Use CMake provided vars for ar and ranlib
> +
> +hardcoding them means we may not be able to cross compile the package
> +reliably as build host may or may not have gcc-ar and gcc-ranlib
> +installed, using the cross tools is the correct thing to do here
> +
> +Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/5]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + CMakeLists.txt | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 5e7f327..e36fca0 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -50,8 +50,8 @@ if (NOT ${U_CMAKE_BUILD_TYPE} MATCHES DEBUG)
> + 	if (HAS_LTO_FLAG)
> + 		set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -flto")
> + 		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
> +-		set(CMAKE_AR gcc-ar)
> +-		set(CMAKE_RANLIB gcc-ranlib)
> ++		set(CMAKE_AR ${CMAKE_CXX_COMPILER_AR})
> ++		set(CMAKE_RANLIB ${CMAKE_CXX_COMPILER_RANLIB})
> + 	endif()
> + endif()
> + 
> +-- 
> +2.19.2
> +
> diff --git a/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch b/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
> new file mode 100644
> index 00000000..9f33fa5e
> --- /dev/null
> +++ b/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
> @@ -0,0 +1,24 @@
> +From 9f1d52590336caeab8038cdd015294df2e5d8c1f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 1 Feb 2019 23:47:04 -0800
> +Subject: [PATCH] librwmem/helpers.h: Include <cerrno> for errno definitions
> +
> +this is found with libc++
> +
> +Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/5]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + librwmem/helpers.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/librwmem/helpers.h b/librwmem/helpers.h
> +index ccc6c9e..686943e 100644
> +--- a/librwmem/helpers.h
> ++++ b/librwmem/helpers.h
> +@@ -1,5 +1,6 @@
> + #pragma once
> + 
> ++#include <cerrno>
> + #include <string>
> + #include <vector>
> + #include <string.h>
> diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
> deleted file mode 100644
> index 2848e1cd..00000000
> --- a/recipes-bsp/rwmem/rwmem_1.1.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SUMMARY = "A small tool to read/write memory"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -
> -SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
> -SRC_URI = "git://github.com/tomba/rwmem.git"
> -
> -S = "${WORKDIR}/git"
> -
> -do_install() {
> -	install -d ${D}${bindir}
> -	install -m 0755 rwmem ${D}${bindir}
> -}
> diff --git a/recipes-bsp/rwmem/rwmem_1.2.bb b/recipes-bsp/rwmem/rwmem_1.2.bb
> new file mode 100644
> index 00000000..c4d2bc49
> --- /dev/null
> +++ b/recipes-bsp/rwmem/rwmem_1.2.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "A small tool to read/write memory"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +PV .= "+git${SRCPV}"
> +
> +SRCREV_rwmem = "7e5ca9802c1b8ff1f6407c19dfd0b9415501bb11"
> +SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
> +SRCREV_pybind11 = "9a19306fbf30642ca331d0ec88e7da54a96860f9"
> +
> +SRCREV_FORMAT = "rwmem_inih_pybind11"
> +
> +SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem \
> +           git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
> +           git://github.com/pybind/pybind11.git;protocol=https;name=pybind11;nobranch=1;destsuffix=git/ext/pybind11 \
> +           file://0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch \
> +           file://0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig python3native
> +
> +do_install() {
> +	install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
> +	install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
> +}
> -- 
> 2.23.0
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

