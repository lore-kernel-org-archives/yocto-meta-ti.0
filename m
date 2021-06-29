Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8172.1624972869567522344
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 06:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xTCBiZqW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15TDL85K037175;
	Tue, 29 Jun 2021 08:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624972868;
	bh=5ZaHJmEiCJQG0q2eRr2osYU4+PcT0LAuYXPJz+FWOOg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=xTCBiZqW7JU3FSIPoaLxmsrLkueMOu1Ha7y36JySC1kqoYgg+VchXik6CDWnlvHXv
	 Hf8+rSPVecJEH58iCmUDVNMuxEgOJ3a3I+IpzAFUPcveF4XC4MiKqjAyWZKpO5fsIg
	 DOGMOXwgbfYIzePPeezywpRh1UUC4RSpH7BVKQGM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15TDL8VR028146
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Jun 2021 08:21:08 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 29
 Jun 2021 08:21:08 -0500
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2176.012; Tue, 29 Jun 2021 08:21:08 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [dunfell PATCH] optee-os: upgrade to upstream 3.12.0
Thread-Topic: [dunfell PATCH] optee-os: upgrade to upstream 3.12.0
Thread-Index: AQHXaifcpoPaAPxB5Ua05bRpGwgdqasq/tIg
Date: Tue, 29 Jun 2021 13:21:08 +0000
Message-ID: <be345d5cc88b4416b4d883676a5c6a57@ti.com>
References: <20210626010906.20835-1-praneeth@ti.com>
In-Reply-To: <20210626010906.20835-1-praneeth@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.66.120]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Applied to dunfell

-----Original Message-----
From: Bajjuri, Praneeth=20
Sent: Friday, June 25, 2021 8:09 PM
To: Bajjuri, Praneeth <praneeth@ti.com>; Siraswar, Yogesh <yogeshs@ti.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>; meta-ti@lists.yoctoproject.org
Subject: [dunfell PATCH] optee-os: upgrade to upstream 3.12.0

From: Praneeth Bajjuri <praneeth@ti.com>

Upgrade optee-os to upstream 3.12.0 on dunfell branch.

upstream optee 3.13.0 tag has the following patches.
f50962e3 ta_dev_kit.mk: make sure that libutils is linked second time
73196b58 link.mk: implement support for libnames-after-libgcc variable
36e784f6 libutils: provide empty __getauxval() implementation

Hence removing from here.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 ...ide-empty-__getauxval-implementation.patch | 62 -------------------  ..=
.t-support-for-libnames-after-libgcc-.patch | 55 ----------------  ...ke-su=
re-that-libutils-is-linked-seco.patch | 44 -------------
 recipes-security/optee/optee-os_%.bbappend    |  7 +--
 4 files changed, 2 insertions(+), 166 deletions(-)  delete mode 100644 rec=
ipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxval-implem=
entation.patch
 delete mode 100644 recipes-security/optee/optee-os/0002-link.mk-implement-=
support-for-libnames-after-libgcc-.patch
 delete mode 100644 recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make=
-sure-that-libutils-is-linked-seco.patch

diff --git a/recipes-security/optee/optee-os/0001-libutils-provide-empty-__=
getauxval-implementation.patch b/recipes-security/optee/optee-os/0001-libut=
ils-provide-empty-__getauxval-implementation.patch
deleted file mode 100644
index 0120f5c2..00000000
--- a/recipes-security/optee/optee-os/0001-libutils-provide-empty-__getauxv=
al-implementation.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 36e784f621bf5d5be9183beba35f39426277c110 Mon Sep 17 00:00:00 2001
-From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Date: Tue, 13 Oct 2020 22:45:39 +0300
-Subject: [PATCH 1/3] libutils: provide empty __getauxval() implementation
-
-Never version of libgcc are built with LSE implementation in mind. To -det=
ermine if LSE is available on platform it calls __getauxval(), so in -some =
cases we can get undefined reference to __getauxval() error.
-
-Prominent case is libgcc_eh.a library, which is used by C++ TAs. Exception=
 -handler depends on atomic operations, so it tries to call
-init_have_lse_atomics() first. This function in turn calls __getauxval(), =
-which causes linking error.
-
-In the future we can make __getauxval() to return actual platform -capabil=
ities.
-
-Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jerome Forissier <jerome@forissier.org>
----
- lib/libutils/ext/arch/arm/auxval.c | 12 ++++++++++++
- lib/libutils/ext/arch/arm/sub.mk   |  1 +
- 2 files changed, 13 insertions(+)
- create mode 100644 lib/libutils/ext/arch/arm/auxval.c
-
-diff --git a/lib/libutils/ext/arch/arm/auxval.c b/lib/libutils/ext/arch/ar=
m/auxval.c
-new file mode 100644
-index 00000000..98bca850
---- /dev/null
-+++ b/lib/libutils/ext/arch/arm/auxval.c
-@@ -0,0 +1,12 @@
-+// SPDX-License-Identifier: BSD-2-Clause
-+/*
-+ * Copyright (c) 2020, EPAM Systems
-+ */
-+
-+#include <compiler.h>
-+
-+unsigned long int __getauxval (unsigned long int type); unsigned long=20
-+int __getauxval (unsigned long int type __unused) {
-+	return 0;
-+}
-diff --git a/lib/libutils/ext/arch/arm/sub.mk b/lib/libutils/ext/arch/arm/=
sub.mk
-index dc5eed67..2e779066 100644
---- a/lib/libutils/ext/arch/arm/sub.mk
-+++ b/lib/libutils/ext/arch/arm/sub.mk
-@@ -3,6 +3,7 @@ srcs-$(CFG_ARM32_$(sm)) +=3D aeabi_unwind.c
- endif
- srcs-$(CFG_ARM32_$(sm)) +=3D atomic_a32.S
- srcs-$(CFG_ARM64_$(sm)) +=3D atomic_a64.S
-+srcs-y +=3D auxval.c
- ifneq ($(sm),ldelf) # TA, core
- srcs-$(CFG_ARM32_$(sm)) +=3D mcount_a32.S
- srcs-$(CFG_ARM64_$(sm)) +=3D mcount_a64.S
---
-2.25.1
-
diff --git a/recipes-security/optee/optee-os/0002-link.mk-implement-support=
-for-libnames-after-libgcc-.patch b/recipes-security/optee/optee-os/0002-li=
nk.mk-implement-support-for-libnames-after-libgcc-.patch
deleted file mode 100644
index 11296c8c..00000000
--- a/recipes-security/optee/optee-os/0002-link.mk-implement-support-for-li=
bnames-after-libgcc-.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 73196b58ea6978ffa5e581738030f51c5789ef73 Mon Sep 17 00:00:00 2001
-From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Date: Tue, 13 Oct 2020 22:54:13 +0300
-Subject: [PATCH 2/3] link.mk: implement support for libnames-after-libgcc
- variable
-
-Newer versions of libgcc depend on external __getauxval() symbol, which is=
 -now provided by libutils. But libgcc is linked after libutils, so linker =
-can't resolve that symbol. We can't include libgcc into linking group with=
 -libtutils, because libgcc provides symbols that conflict with libutil's -=
ones, like __aeabi_idiv with friends for instance.
-
-So, to resolve libgcc dependency on libutils we need to link with libutils=
 -second time. To make things more generic, we will introduce
-$(libnames-after-libgcc) variable for libraries that should be linked afte=
r -libgcc.
-
-Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jerome Forissier <jerome@forissier.org>
----
- ta/arch/arm/link.mk | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/ta/arch/arm/link.mk b/ta/arch/arm/link.mk -index 445c285d..30=
25acb1 100644
---- a/ta/arch/arm/link.mk
-+++ b/ta/arch/arm/link.mk
-@@ -55,8 +55,11 @@ link-ldflags +=3D --eh-frame-hdr
- link-ldadd +=3D $(libstdc++$(sm)) $(libgcc_eh$(sm))
- endif
- link-ldadd +=3D --end-group
--ldargs-$(user-ta-uuid).elf :=3D $(link-ldflags) $(objs) $(link-ldadd) $(l=
ibgcc$(sm))
-=20
-+link-ldadd-after-libgcc +=3D $(addprefix -l,$(libnames-after-libgcc))
-+
-+ldargs-$(user-ta-uuid).elf :=3D $(link-ldflags) $(objs) $(link-ldadd) \
-+				$(libgcc$(sm)) $(link-ldadd-after-libgcc)
-
- link-script-cppflags-$(sm) :=3D \
- 	$(filter-out $(CPPFLAGS_REMOVE) $(cppflags-remove), \
-@@ -76,6 +79,7 @@ $(link-script-pp$(sm)): $(link-script$(sm)) $(conf-file)=
 $(link-script-pp-makefi
- 		$(link-script-cppflags-$(sm)) $$< -o $$@
-
- $(link-out-dir$(sm))/$(user-ta-uuid).elf: $(objs) $(libdeps) \
-+					  $(libdeps-after-libgcc) \
- 					  $(link-script-pp$(sm)) \
- 					  $(dynlistdep) \
- 					  $(additional-link-deps)
---
-2.25.1
-
diff --git a/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-t=
hat-libutils-is-linked-seco.patch b/recipes-security/optee/optee-os/0003-ta=
_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
deleted file mode 100644
index 88ba5f85..00000000
--- a/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-lib=
utils-is-linked-seco.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From f50962e3f56f0932662b2ffa10afe53339a335dd Mon Sep 17 00:00:00 2001
-From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Date: Fri, 16 Oct 2020 16:36:08 +0300
-Subject: [PATCH 3/3] ta_dev_kit.mk: make sure that libutils is linked seco=
nd
- time
-
-libgcc depends on __getauxval symbol from libuils. As, generally libutils =
-is linked before libgcc, we will get "unresolved symbol" error. To resolve=
 -this dependency we need to link libutils second time - after libgcc.
-
-Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jerome Forissier <jerome@forissier.org>
----
- ta/mk/ta_dev_kit.mk | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/ta/mk/ta_dev_kit.mk b/ta/mk/ta_dev_kit.mk -index e28be677..d0=
e66317 100644
---- a/ta/mk/ta_dev_kit.mk
-+++ b/ta/mk/ta_dev_kit.mk
-@@ -78,6 +78,16 @@ endif
- libnames +=3D dl
- libdeps +=3D $(ta-dev-kit-dir$(sm))/lib/libdl.a
-=20
-+# libutils provides __getauxval symbol which is needed by libgcc 10.x.=20
-+We can't # link libutils after libgcc, because libgcc will replace=20
-+some symbols provided # by libutils, which will cause further linking iss=
ues.
-+#
-+# But if we place libutils before libgcc, linker will not be able to=20
-+resolve # __getauxval. So we need to link with libutils twice: before and=
 after libgcc.
-+# Hence it included both in $(libnames) and in=20
-+$(libnames-after-libgcc) libnames-after-libgcc +=3D utils=20
-+libdeps-after-libgcc +=3D $(ta-dev-kit-dir$(sm))/lib/libutils.a
-+
- # Pass config variable (CFG_) from conf.mk on the command line
- cppflags$(sm) +=3D $(strip \
- 	$(foreach var, $(filter CFG_%,$(.VARIABLES)), \
---
-2.25.1
-
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/=
optee/optee-os_%.bbappend
index 8072490f..c90d85ea 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -1,16 +1,13 @@
 FILESEXTRAPATHS_prepend_ti-soc :=3D "${THISDIR}/${PN}:"
=20
-PV_ti-soc =3D "3.11.0+git${SRCPV}"
+PV_ti-soc =3D "3.12.0+git${SRCPV}"
=20
-SRCREV_ti-soc =3D "c4def2a8262a03244d9a88461699b9b8e43c6b55"
+SRCREV_ti-soc =3D "3d47a131bca1d9ed511bfd516aa5e70269e12c1d"
=20
 SRC_URI_ti-soc =3D " \
     git://github.com/OP-TEE/optee_os.git \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
     file://0007-allow-setting-sysroot-for-clang.patch \
-    file://0001-libutils-provide-empty-__getauxval-implementation.patch \
-    file://0002-link.mk-implement-support-for-libnames-after-libgcc-.patch=
 \
-    file://0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch=
 \
 "
=20
 do_compile_prepend_ti-soc() {
--
2.17.1

