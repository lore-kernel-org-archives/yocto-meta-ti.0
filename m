Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6E4C433F5
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 17:00:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.22541.1653584438194992333
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 May 2022 10:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 348ED40D00;
	Thu, 26 May 2022 17:00:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWupLGmPKKOI; Thu, 26 May 2022 17:00:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0C3C240CEB;
	Thu, 26 May 2022 17:00:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5A3AC17495A; Thu, 26 May 2022 13:00:33 -0400 (EDT)
Date: Thu, 26 May 2022 13:00:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 2/2] optee-os: Upgrade to upstream
 3.17.0
Message-ID: <20220526170033.GY9834@denix.org>
References: <20220526155254.32536-1-afd@ti.com>
 <20220526155254.32536-2-afd@ti.com>
 <ffbeb651-6209-1382-0854-814622f6aee1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffbeb651-6209-1382-0854-814622f6aee1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 May 2022 17:00:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14763

On Thu, May 26, 2022 at 11:52:17AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 5/26/22 10:52 AM, Andrew Davis wrote:
> >Update to the latest upstream master which is 3.17.
> >The extra patches do not look to be needed anymore.
> >
> >While here switch to git checkout with https.
> >
> >Signed-off-by: Andrew Davis <afd@ti.com>
> >---
> >  ...ow-setting-sysroot-for-libgcc-lookup.patch | 34 -------------------
> >  ...0007-allow-setting-sysroot-for-clang.patch | 29 ----------------
> >  recipes-security/optee/optee-os_%.bbappend    | 12 +++----
> >  3 files changed, 4 insertions(+), 71 deletions(-)
> >  delete mode 100644 recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
> >  delete mode 100644 recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
> >
> >diff --git a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
> >deleted file mode 100644
> >index 17005396..00000000
> >--- a/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
> >+++ /dev/null
> >@@ -1,34 +0,0 @@
> >-From 0bab935695ebcf0c533b49896ab18ff33d4a47d1 Mon Sep 17 00:00:00 2001
> >-From: Ross Burton <ross.burton@arm.com>
> >-Date: Tue, 26 May 2020 14:38:02 -0500
> >-Subject: [PATCH] allow setting sysroot for libgcc lookup
> >-
> >-Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when searching
> >-for the compiler libraries as there's no easy way to reliably pass --sysroot
> >-otherwise.
> >-
> >-Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188]
> >-Signed-off-by: Ross Burton <ross.burton@arm.com>
> >----
> >- mk/gcc.mk | 6 +++---
> >- 1 file changed, 3 insertions(+), 3 deletions(-)
> >-
> >-diff --git a/mk/gcc.mk b/mk/gcc.mk
> >-index adc77a24..81bfa78a 100644
> >---- a/mk/gcc.mk
> >-+++ b/mk/gcc.mk
> >-@@ -13,11 +13,11 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
> >- 			-print-file-name=include 2> /dev/null)
> >-
> >- # Get location of libgcc from gcc
> >--libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
> >-+libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
> >- 			-print-libgcc-file-name 2> /dev/null)
> >--libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> >-+libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> >- 			-print-file-name=libstdc++.a 2> /dev/null)
> >--libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> >-+libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> >- 			-print-file-name=libgcc_eh.a 2> /dev/null)
> >-
> >- # Define these to something to discover accidental use
> >diff --git a/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch b/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
> >deleted file mode 100644
> >index 5c0d0a56..00000000
> >--- a/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
> >+++ /dev/null
> >@@ -1,29 +0,0 @@
> >-From 3167f2c0dba4db59d61b60a8fe66f969d20aafa9 Mon Sep 17 00:00:00 2001
> >-From: Brett Warren <brett.warren@arm.com>
> >-Date: Wed, 23 Sep 2020 09:27:34 +0100
> >-Subject: [PATCH] optee: enable clang support
> >-
> >-When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
> >-to provide a sysroot wasn't included, which results in not locating
> >-compiler-rt. This is mitigated by including the variable as ammended.
> >-
> >-Upstream-Status: Pending
> >-ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
> >-Signed-off-by: Brett Warren <brett.warren@arm.com>
> >----
> >- mk/clang.mk | 2 +-
> >- 1 file changed, 1 insertion(+), 1 deletion(-)
> >-
> >-diff --git a/mk/clang.mk b/mk/clang.mk
> >-index 0f48c836..47465523 100644
> >---- a/mk/clang.mk
> >-+++ b/mk/clang.mk
> >-@@ -27,7 +27,7 @@ comp-cflags-warns-clang := -Wno-language-extension-token \
> >-
> >- # Note, use the compiler runtime library (libclang_rt.builtins.*.a) instead of
> >- # libgcc for clang
> >--libgcc$(sm)	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
> >-+libgcc$(sm)	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
> >- 			-rtlib=compiler-rt -print-libgcc-file-name 2> /dev/null)
> >-
> >- # Core ASLR relies on the executable being ready to run from its preferred load
> >diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> >index 4e01ea74..9feea049 100644
> >--- a/recipes-security/optee/optee-os_%.bbappend
> >+++ b/recipes-security/optee/optee-os_%.bbappend
> >@@ -1,14 +1,10 @@
> >  FILESEXTRAPATHS_prepend_ti-soc := "${THISDIR}/${PN}:"
> >-PV_ti-soc = "3.12.0+git${SRCPV}"
> >+PV_ti-soc = "3.17.0+git${SRCPV}"
> >+SRCREV_ti-soc = "332dec4a4bb9935e650b9925577cef5d485af724"
> >+SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_os.git;protocol=https"
> >-SRCREV_ti-soc = "3d47a131bca1d9ed511bfd516aa5e70269e12c1d"
> >-
> >-SRC_URI_ti-soc = " \
> >-    git://github.com/OP-TEE/optee_os.git \
> >-    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> >-    file://0007-allow-setting-sysroot-for-clang.patch \
> >-"
> >+DEPENDS_append_k3 = "python3-cryptography-native"
> 
> 
> Just realized, this should probably be 'DEPENDS_append_ti-soc', we need
> python cryptography for all builds not just K3. Will fix for v2.

And make sure you have a leading whitespace when used with _append...


> >  EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

