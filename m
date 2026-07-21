Return-Path: <antoine.gouby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31C3C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:09 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17586.1784620437596411846
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 00:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qHRrI6cG;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: antoine.gouby@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e50a650a0so655754085a.1
        for <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 00:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784620436; cv=none;
        d=google.com; s=arc-20260327;
        b=ZSmDqUK9eiLJSwOKAgsM0PE9whCP82dvuTX2YbydeDI/FY5KwKP96qGVRiVXET1Ep0
         pXeGtYsMgz+3VFVl3uBolXh05ikDtDt0TV4lLIlxZC+jbmJJ771ZXI3QlDupUgkSjETJ
         DX3lf5S94uGMtuK8v2jAdPVh5QcvFdw/xjt2ozZO3oA4t9TRnKUEqgC/yp8jDylono12
         galJoNSn0I+RLX0zbv2C4My2n17+uuH5d6gbJ6T1T/QqR3qz8R488SLQCF5e0fTBXu9Q
         xf4GOWEOM1eiG9xowMpRpS806h2vXAXIVPcZeaJLIMeTCNkj4b9SKG0TvH5+CJtvkakt
         i0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wvXl/dsfcnhli+4wTs+wHn6EBcOJZYHE5Sw+S0Xb95g=;
        fh=R92fSrxRXEQO5ja0NBkwHwv2dTU6ZNLK+zT7M5ddYGQ=;
        b=mpsekiv++Bqt6PA/nqsMi7vK4xmdytfbTqsFLbThsXj2Ort2zzl2iPl/gpB5GCBM0j
         k/ZTwpT9IQEdqtq5KC9UrqDbmfNfyYABO2kOuxY01hToSEAim6ySIoVirYXTV+cOHZcC
         gK6FisgTmU7pWWLA2le6Q415qyqng3fKb2lBMKE9PGXKkXWdIXiPGZcoaFEt9iJQDX/9
         jjjBHfMQ7QI2wAAQf8ngxxWqiqN3IHBv7K6foYLiUykvHHykCk0TCKYGJ9Ro/+RMxdxE
         l/ErlsZTNMKkuvxRmgbrntC11o3B/YtZ6bPybdDxqEI38WWG+OQZG8/3diaXa1hLbRhf
         7TnA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784620436; x=1785225236; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvXl/dsfcnhli+4wTs+wHn6EBcOJZYHE5Sw+S0Xb95g=;
        b=qHRrI6cGWbHtF9tqCJVWvTw0+gUWr3wET9MfIz7f2SGUHbOLJg0pQu+10boQPiobyl
         0wSRwFnkcbCopB+htWMhyOa5A7NmmlrJpyauQMZl6my7BhbiJ9XMVdhfo5h+1Eo8t5B3
         qkzJ9eIs7eJh9ZLLNi1A9awvdzrRCd3SzIpL2TTGgU4CIgxMPpA3HIMl/McIWgGtgAs+
         F0GSdZdzseLUlDOwQXbqKRJE8a89D7jyqJGuKSeJGq5lDEDHoOjlGPX9YKgSU+xvcuLw
         SdVr4sjqef2tPcmDtDuLcnPhATM7GUPu+SojFPJ/2DMs6yliaB4GFL1CtRCp1mzgi7Ku
         7knQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620436; x=1785225236;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wvXl/dsfcnhli+4wTs+wHn6EBcOJZYHE5Sw+S0Xb95g=;
        b=EAkziYdLrT8orL38l/HcYujD8g/K74JoMok2XxFl1NkILekacUEFc2OmhoCiXihskn
         yROuWCec30NlcHDL2jqU/w/anermqJOVr8+iH4iey4FYz6wAP8KENVlNrhfaV0BVEm2n
         LFIC9+4CZFvW5rP1+ULKnWIIYGuNgIiXk06K11prqedNfly76ZoRoZj5SY5zm0/5tu4u
         BOen67AvyvfzI8nm7tEx5RcdbECDFJAiR5Nl8/B+h1sB4xmN2sWSiGHy/Kwac3FAX1Zn
         Pc1we9mqLOb5WaIDgWmjUj5cCGqlpO80Lo6fFC8EEM4Dyvz2pdGeLSrPttiR1zGZsVyE
         B7Tw==
X-Gm-Message-State: AOJu0YzbktXmnnYZ7+AouVnFxagSJ0PnX9twCyC01hQZT5R1XC32BxF6
	OhEgBtoY5sjdsbN0W0ExtgJ7BizQz2rsepJKu9CDM/EbdRDIWLJaEAz42yt+Byy0Et2RAspwlSI
	gfTS73Hyl7Xis+p8RberundDFJUUebleU9oH3
X-Gm-Gg: AfdE7ckXXIE5w5jTbvGDDn/lCfCGC6ly0XkMmI+12BIBQ481tsER3Ipo61Fjx/WD1H7
	gLEA/b/yff+kZlsjZreWiBnRxuBiznGFO0YY88+kfwCzMjZ/UgmOZ7UtfePbhb1wseOamvK6XrL
	3qOJYw7aJp4tOAbcmmA3/WmWS+ywJmRoxznTKZ8ka/d22eyPIOHDOvbo4I1QwhpRw50BWWQflH1
	yahkMkD99J2xF/sVDlLcNQxP1LlB8vsy3DjRWiSfjXmnhpYDR4D2Q7V8SirZclVYLxjxR0O4s6X
	lAAB2ROHlmb4ZSDuVg0=
X-Received: by 2002:a05:620a:1b87:b0:930:987d:9cd7 with SMTP id
 af79cd13be357-930b3e8aa4bmr1548633285a.11.1784620436304; Tue, 21 Jul 2026
 00:53:56 -0700 (PDT)
MIME-Version: 1.0
From: Antoine <antoine.gouby@gmail.com>
Date: Tue, 21 Jul 2026 09:53:45 +0200
X-Gm-Features: AUfX_mzxXse1BCTuCeFCnCplbGHqB1RVfwCLnZEwr-_c-WMkJ8eRMBkhR8zQukg
Message-ID: <CAL2HtgxQHThnmV=HfXAFAC0_52BHw73sPsym_AebCXM5Z_tvZA@mail.gmail.com>
Subject: [meta-ti][master] build issue on mesa-pvr
To: meta-ti@lists.yoctoproject.org
Cc: francesco@dolcini.it
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 07:54:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20171

Hello,

Since couple of days we have a build issue on master with mesa-pvr.
It seems to be a race condition, is this a known error or any ideas about it?

07-20:04:08:10  | FAILED: [code=1]
src/gallium/drivers/pvr/libpvr.a.p/pvr_mesa_dispatch.c.o
07-20:04:08:10  | aarch64-tdx-linux-gcc -mbranch-protection=standard
-fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security
--sysroot=/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.2.8/recipe-sysroot
-Isrc/gallium/drivers/pvr/libpvr.a.p -Isrc/gallium/drivers/pvr
-I../sources/mesa-pvr-25.2.8/src/gallium/drivers/pvr -Isrc/mapi
-I../sources/mesa-pvr-25.2.8/src/mapi -Isrc/mesa
-I../sources/mesa-pvr-25.2.8/src/mesa
-I../sources/mesa-pvr-25.2.8/src/gallium/include
-Isrc/gallium/auxiliary
-I../sources/mesa-pvr-25.2.8/src/gallium/auxiliary
-Isrc/gallium/winsys -I../sources/mesa-pvr-25.2.8/src/gallium/winsys
-Iinclude -I../sources/mesa-pvr-25.2.8/include -Isrc
-I../sources/mesa-pvr-25.2.8/src -Isrc/util/format
-I/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.2.8/recipe-sysroot/usr/include/libdrm
-fvisibility=hidden -fdiagnostics-color=always -DNDEBUG
-D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -std=c11
-D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
'-DPACKAGE_VERSION="25.2.8"'
'-DPACKAGE_BUGREPORT="https://gitlab.freedesktop.org/mesa/mesa/-/issues"'
-DHAVE_OPENGL=1 -DHAVE_OPENGL_ES_1=1 -DHAVE_OPENGL_ES_2=1
-DHAVE_LLVMPIPE -DHAVE_SOFTPIPE -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_PVR
-DHAVE_SWRAST -DVIDEO_CODEC_VC1DEC=0 -DVIDEO_CODEC_H264DEC=0
-DVIDEO_CODEC_H264ENC=0 -DVIDEO_CODEC_H265DEC=0
-DVIDEO_CODEC_H265ENC=0 -DVIDEO_CODEC_AV1DEC=1 -DVIDEO_CODEC_AV1ENC=1
-DVIDEO_CODEC_VP9DEC=1 -DEGL_WITH_OPENGL -DHAVE_WAYLAND_PLATFORM
-DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM
-DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=0 -DGLX_INDIRECT_RENDERING
-DGLX_DIRECT_RENDERING -DGLX_USE_DRM
-DGLAPI_EXPORT_PROTO_ENTRY_POINTS=0 -DALLOW_KCMP -DMESA_DEBUG=0
-DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32
-DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL
-DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS
-DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT
-DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE
-DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE_FUNC_ATTRIBUTE_CONST
-DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC
-DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED
-DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK
-DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED
-DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS
-DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE
-DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY
-DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_GCC_ATOMIC_BUILTINS
-DUSE_AARCH64_ASM -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H
-DHAS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H
-DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_SYS_INOTIFY_H
-DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEMP
-DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R
-DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV
-DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC
-DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING
-DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L
-DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_ZLIB -DHAVE_ZSTD
-DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY
-DHAVE_LIBDRM '-DMESA_LLVM_VERSION_STRING="22.1.8"' -DLLVM_IS_SHARED=1
-DLLVM_AVAILABLE=1 -DDRAW_LLVM_AVAILABLE=1 -DAMD_LLVM_AVAILABLE=1
-DGALLIVM_USE_ORCJIT=0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF
-DTHREAD_SANITIZER=0 -DWL_HIDE_DEPRECATED
-DHAVE_WL_DISPATCH_QUEUE_TIMEOUT -DHAVE_WL_CREATE_QUEUE_WITH_NAME
-DHAVE_X11_DRM -DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC
-DHAVE_DRISW_KMS -mtls-dialect=desc
-Werror=implicit-function-declaration -Werror=missing-prototypes
-Werror=return-type -Werror=empty-body
-Werror=incompatible-pointer-types -Werror=int-conversion
-Wimplicit-fallthrough -Wmisleading-indentation
-Wno-missing-field-initializers -Wno-format-truncation
-Wno-nonnull-compare -fno-math-errno -fno-trapping-math -fno-common
-Wno-unknown-pragmas -Wno-unused-function -Werror=format
-Wformat-security -ffunction-sections -fdata-sections -O2 -g
-fno-omit-frame-pointer
-ffile-prefix-map=/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.2.8/sources/mesa-pvr-25.2.8=/usr/src/debug/mesa-pvr/25.2.8
-ffile-prefix-map=/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.2.8/build=/usr/src/debug/mesa-pvr/25.2.8
-ffile-prefix-map=/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.2.8/recipe-sysroot=
-ffile-prefix-map=/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.2.8/recipe-sysroot-native=
-pipe -fPIC -pthread -DGALLIUM_PVR -MD -MQ
src/gallium/drivers/pvr/libpvr.a.p/pvr_mesa_dispatch.c.o -MF
src/gallium/drivers/pvr/libpvr.a.p/pvr_mesa_dispatch.c.o.d -o
src/gallium/drivers/pvr/libpvr.a.p/pvr_mesa_dispatch.c.o -c
../sources/mesa-pvr-25.2.8/src/gallium/drivers/pvr/pvr_mesa_dispatch.c
07-20:04:08:10  |
../sources/mesa-pvr-25.2.8/src/gallium/drivers/pvr/pvr_mesa_dispatch.c:31:10:
fatal error: glapi/gen/dispatch.h: No such file or directory
07-20:04:08:10  |    31 | #include "glapi/gen/dispatch.h"
07-20:04:08:10  |       |          ^~~~~~~~~~~~~~~~~~~~~~
07-20:04:08:10  | compilation terminated.

A quick ChatGPT inquiry suggests this fix, but I don't have the time
to look into it.

diff --git a/src/gallium/drivers/pvr/meson.build
b/src/gallium/drivers/pvr/meson.build
index .......... .. ..........
--- a/src/gallium/drivers/pvr/meson.build
+++ b/src/gallium/drivers/pvr/meson.build
@@ -24,6 +24,7 @@ libpvr_compile_args = [

 libpvr_dependencies = [
   dep_libdrm,
+  idep_dispatch_h,
   idep_mesautil,
 ]

Thanks,
Antoine

