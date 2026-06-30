Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553DAC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 22:51:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33288.1782859901987621585
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 15:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9659340C79;
	Tue, 30 Jun 2026 22:51:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9EhyVNTTYyQN; Tue, 30 Jun 2026 22:51:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3F12C407DA;
	Tue, 30 Jun 2026 22:51:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4DD1117E347; Tue, 30 Jun 2026 18:51:35 -0400 (EDT)
Date: Tue, 30 Jun 2026 18:51:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: reatmon@ti.com, denys@konsulko.com, afd@ti.com,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/wrynose][PATCH] libsdl2: Build tests with
 dynamically linked library support
Message-ID: <20260630225135.GH10186@denix.org>
References: <20260630174314.1561862-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630174314.1561862-1-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Jun 2026 22:51:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20111

On Tue, Jun 30, 2026 at 12:43:14PM -0500, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Carry upstream-submitted patch that adds SDL_TESTS_SHARED_LIB option,
> enabling test executables to be built with dynamic linking against
> libsdl2.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  .../recipes-graphics/libsdl2/libsdl2-ti.inc   |  9 +++
>  ...TS_SHARED_LIB-option-for-dynamically.patch | 56 +++++++++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch
> 
> diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> index 33ff0632..959818a1 100644
> --- a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> +++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> @@ -1,5 +1,14 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/libsdl2:"
> +
> +SRC_URI:append = " \
> +    file://0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch \
> +"
> +
>  EXTRA_OECMAKE += "-DSDL_TESTS=ON \
>                    -DSDL_INSTALL_TESTS=ON \
> +                  -DSDL_TESTS_SHARED_LIB=ON \
>                   "
> +
>  PACKAGE_BEFORE_PN = "${PN}-tests"
>  FILES:${PN}-tests += "${libexecdir} ${datadir}/installed-tests/SDL2"
> +RDEPENDS:${PN}-tests += "${PN}"

Now that you are no longer linking statically, you should try w/o explicit 
RDEPENDS here, as bitbake is supposed to detect this dependency automatically. 
That's what Andrew was asking last week...


> diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch b/meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch
> new file mode 100644
> index 00000000..cc435b3a
> --- /dev/null
> +++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2/0001-test-New-SDL_TESTS_SHARED_LIB-option-for-dynamically.patch
> @@ -0,0 +1,56 @@
> +From 96512412805f34ac6328290221c7ad83cde342b3 Mon Sep 17 00:00:00 2001
> +From: Antonios Christidis <a-christidis@ti.com>
> +Date: Fri, 26 Jun 2026 13:28:24 -0500
> +Subject: [PATCH] test: New SDL_TESTS_SHARED_LIB option for dynamically linked
> + tests
> +
> +Introduce SDL_TESTS_SHARED_LIB to allow tests that expect dynamic linking
> +to be built.
> +
> +Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/15907]
> +
> +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> +---
> + test/CMakeLists.txt | 19 ++++++++++++++++---
> + 1 file changed, 16 insertions(+), 3 deletions(-)
> +
> +diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
> +index 288645d73..8e5bd68d3 100644
> +--- a/test/CMakeLists.txt
> ++++ b/test/CMakeLists.txt
> +@@ -87,8 +87,17 @@ macro(add_sdl_test_executable TARGET)
> +     endif()
> + endmacro()
> +
> +-if(NOT TARGET SDL2::SDL2-static)
> +-    find_package(SDL2 2.0.23 REQUIRED COMPONENTS SDL2-static SDL2test)
> ++option(SDL_TESTS_SHARED_LIB "Link test executables against the shared SDL2 library" OFF)
> ++
> ++if(SDL_TESTS_SHARED_LIB)
> ++    set(SDL_SHARED ON)
> ++    if(NOT TARGET SDL2::SDL2)
> ++        find_package(SDL2 ${SDL_VERSION} REQUIRED COMPONENTS SDL2 SDL2test)
> ++    endif()
> ++else()
> ++    if(NOT TARGET SDL2::SDL2-static)
> ++        find_package(SDL2 ${SDL_VERSION} REQUIRED COMPONENTS SDL2-static SDL2test)
> ++    endif()
> + endif()
> +
> + enable_testing()
> +@@ -247,7 +256,11 @@ elseif(PS2)
> + elseif(IOS OR TVOS)
> +     sdltest_link_librararies(SDL2::SDL2main SDL2::SDL2test SDL2::SDL2-static)
> + else()
> +-    sdltest_link_librararies(SDL2::SDL2test SDL2::SDL2-static)
> ++    if(SDL_TESTS_SHARED_LIB)
> ++        sdltest_link_librararies(SDL2::SDL2test SDL2::SDL2)
> ++    else()
> ++        sdltest_link_librararies(SDL2::SDL2test SDL2::SDL2-static)
> ++    endif()
> + endif()
> +
> + if(WINDOWS)
> +--
> +2.34.1
> +
> --
> 2.34.1

