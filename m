Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70467E00D94; Fri, 13 Sep 2019 06:25:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.222.180 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E3BFE00B1A
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 06:25:15 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id q203so28111340qke.1
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 06:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bJ9dZ+cem89UTGQ45SuXc7xSL2VSQrDq69TDekZbqWM=;
	b=f5ajLA9gN+n5z1egpCYSJBgLZr4dAK6CTd4daNEZlxhAghpixbyUh5ligSFdmR4J78
	p+4ypdswolahtkHW3nMGD0Mnl08TMhhM28/8sOS3MzqVvc63ku3TUrMMa5OdxDgi1jGm
	uruwlSPt5VC/aksF3FgGPcYaCf4UwEKraVcDg3MwBM/ApejSqOmG/Q34oE34Utpnpdps
	WjLztyGNeo5/1/7h/megkapQ8n606qjjkImQvWRXg7RnFfX/g6hV2+J/ifnAoeRWdjEy
	oJfh80wc/t7+FeP62fCtILbSkpyydeC+5//gWKUP984NkhBzOnSik39kuv1zLJR5KOsR
	E0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bJ9dZ+cem89UTGQ45SuXc7xSL2VSQrDq69TDekZbqWM=;
	b=UipNV/6y/dD9u0X08/ZzyYjP8invJNrn2EaFC3BEIvjA8ar23NBkJwPtxp4hEPcQOu
	Ptn37vV/It7eOg+xpkdbtb9g1rGTjgFubQTzcPBST78xzqi4ltNyrbXDxj7SvfxYrjG5
	VlTen5fVDUZaerlcPtxczSehDJ+eSFLoBFuKdN+Kdok3z9BqpM4wv6UPVEs55KRWLnAF
	fGqisJiMjjD+5p0RY2LjJei//i6j2jqEcAgeQnSFVDGH6CZ1FzqettHTvQQ/E5gC27Sq
	wwjDnqfjYjFeCqKrO7IMiwqtKH7vfY2yHCzIEF3sl6yjt1XA47TgrAsFHUfxvjOX9QWM
	xrYQ==
X-Gm-Message-State: APjAAAXNPnqu4JaogPzU5kz8Z62wO+P5ab/XaioiUBTKaBKN9zCMxoGZ
	/EAPVIpNLvoGeFE3095EXYFkwTg8WhOVKcTEF0g=
X-Google-Smtp-Source: APXvYqyaPPyUiMgohVhsiCNSJXClngGNehhM7aM6CYIC8w6T+s5lTr40vozLysacdcCUQ1YmyCvZGBAwMIgcHLCGH9M=
X-Received: by 2002:a37:e40b:: with SMTP id y11mr45972052qkf.9.1568381114521; 
	Fri, 13 Sep 2019 06:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <1568344904-32388-1-git-send-email-denys@ti.com>
In-Reply-To: <1568344904-32388-1-git-send-email-denys@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2019 06:24:48 -0700
Message-ID: <CAMKF1sqG2T3e9+swGyyT2J8OAXWqPfedyyr06PWpOyS8A4R4VA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][PATCH] ion: add libion and ion-tests packages for ION support
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
X-List-Received-Date: Fri, 13 Sep 2019 13:25:16 -0000
Content-Type: text/plain; charset="UTF-8"

thai breaks on musl  see

https://errors.yoctoproject.org/Errors/Details/270173/

a patch like meta/recipes-support/attr/attr/dont-use-decl-macros.patch
from oe-core will solve it. Care to fix ?

On Thu, Sep 12, 2019 at 8:22 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> ION Userspace Memory Allocator Library and tests
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...-CMakeLists.txt-disable-phys-addr-for-now.patch | 34 ++++++++++++++++++++++
>  recipes-devtools/ion/ion-tests_git.bb              | 18 ++++++++++++
>  recipes-devtools/ion/libion_git.bb                 | 14 +++++++++
>  3 files changed, 66 insertions(+)
>  create mode 100644 recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
>  create mode 100644 recipes-devtools/ion/ion-tests_git.bb
>  create mode 100644 recipes-devtools/ion/libion_git.bb
>
> diff --git a/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch b/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
> new file mode 100644
> index 0000000..7cf5895
> --- /dev/null
> +++ b/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
> @@ -0,0 +1,34 @@
> +From 85264fc72a261d20107a50ea2fad0258900a132b Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@ti.com>
> +Date: Sat, 20 Apr 2019 16:54:03 +0000
> +Subject: [PATCH] CMakeLists.txt: disable phys-addr for now
> +
> +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + CMakeLists.txt | 13 -------------
> + 1 file changed, 13 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 1d60003..eca6ba7 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -54,16 +54,3 @@ target_link_libraries(ion-print-heaps
> + target_include_directories(ion-print-heaps PUBLIC ${LIBION_INCLUDE_DIRS})
> +
> + install(TARGETS ion-print-heaps RUNTIME DESTINATION bin)
> +-
> +-# phys-addr
> +-
> +-add_executable(phys-addr
> +-      src/phys-addr.c
> +-)
> +-
> +-target_link_libraries(phys-addr
> +-      ${LIBION_LIBRARIES}
> +-)
> +-target_include_directories(phys-addr PUBLIC ${LIBION_INCLUDE_DIRS})
> +-
> +-install(TARGETS phys-addr RUNTIME DESTINATION bin)
> +--
> +2.17.1
> +
> diff --git a/recipes-devtools/ion/ion-tests_git.bb b/recipes-devtools/ion/ion-tests_git.bb
> new file mode 100644
> index 0000000..831f5e8
> --- /dev/null
> +++ b/recipes-devtools/ion/ion-tests_git.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Test cases for ION"
> +HOMEPAGE = "https://github.com/glneo/ion-tests"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://src/ion_test.c;beginline=1;endline=15;md5=b225db900869a4cd31461606e55a3ec5"
> +
> +PV = "1.0"
> +
> +BRANCH = "master"
> +SRC_URI = "git://github.com/glneo/ion-tests.git;protocol=git;branch=${BRANCH} \
> +       file://0001-CMakeLists.txt-disable-phys-addr-for-now.patch \
> +"
> +SRCREV = "70d730cebca29e6fd37b21d9beac82ae645f3900"
> +
> +DEPENDS = "libion gtest"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig
> diff --git a/recipes-devtools/ion/libion_git.bb b/recipes-devtools/ion/libion_git.bb
> new file mode 100644
> index 0000000..7c93ed3
> --- /dev/null
> +++ b/recipes-devtools/ion/libion_git.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "ION Userspace Memory Allocator Library"
> +HOMEPAGE = "https://github.com/glneo/libion"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +PV = "1.0.0"
> +
> +BRANCH = "master"
> +SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "11dad7977ec3ecba37c013da7ec0408c01413000"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

