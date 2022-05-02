Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03EBC433FE
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 18:24:17 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.921.1651515849051253682
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 11:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9D3E140C2A;
	Mon,  2 May 2022 18:24:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id glYsusr6Q9yf; Mon,  2 May 2022 18:24:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7A7F840B86;
	Mon,  2 May 2022 18:24:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AC307174916; Mon,  2 May 2022 14:24:04 -0400 (EDT)
Date: Mon, 2 May 2022 14:24:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Khem Raj <raj.khem@gmail.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] uio-module-drv-test: Fix build with clang
Message-ID: <20220502182404.GV9834@denix.org>
References: <20220501164920.2828087-1-raj.khem@gmail.com>
 <53c2b96d-676c-e4b7-6f74-33f1211e8912@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53c2b96d-676c-e4b7-6f74-33f1211e8912@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 18:24:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14674

On Mon, May 02, 2022 at 12:59:59PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> Was this patch sent to the upstream repository maintainer?  This
> seems like a very basic change that should work for all compilers
> and so should be pushed upstream.

If only the upstream project was still alive:

https://git.ti.com/cgit/keystone-linux/uio-module-drv/

This code is used for PRU using UIO on AM3/BBB, AM4, AM5 and DRA7.


> On 5/1/2022 11:49, Khem Raj wrote:
> >Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >---
> >  ...-instead-of-int8_t-in-main-signature.patch | 89 +++++++++++++++++++
> >  .../uio-module-drv/uio-module-drv-test_git.bb |  4 +
> >  2 files changed, 93 insertions(+)
> >  create mode 100644 meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch
> >
> >diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch
> >new file mode 100644
> >index 00000000..172ed7cb
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch
> >@@ -0,0 +1,89 @@
> >+From 972b8514cc99e76508363d2304bb13c27df99cd6 Mon Sep 17 00:00:00 2001
> >+From: Khem Raj <raj.khem@gmail.com>
> >+Date: Sun, 1 May 2022 09:39:42 -0700
> >+Subject: [PATCH] tests: Use char instead of int8_t in main signature
> >+
> >+int8_t is a define in C99 which is flagged by C compiler ( clang )
> >+
> >+Fixes errors like below
> >+
> >+pruss_uio_test.c:264:6: error: second parameter of 'main' (argument array) must be of type 'char **'
> >+void main (int32_t argc, int8_t **argv)
> >+
> >+Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >+---
> >+ test/gen_ipc_int.c                       | 2 +-
> >+ test/prussdrv_test/test/pruss_uio_test.c | 2 +-
> >+ test/uio_cic2_int_multithread_test.c     | 2 +-
> >+ test/uio_int_test.c                      | 2 +-
> >+ test/uio_mem_test.c                      | 2 +-
> >+ 5 files changed, 5 insertions(+), 5 deletions(-)
> >+
> >+diff --git a/test/gen_ipc_int.c b/test/gen_ipc_int.c
> >+index 2be3a9d..313c76a 100644
> >+--- a/test/gen_ipc_int.c
> >++++ b/test/gen_ipc_int.c
> >+@@ -26,7 +26,7 @@ static int64_t clock_diff (struct timespec *start, struct timespec *end)
> >+              + end->tv_nsec - start->tv_nsec;
> >+ }
> >+
> >+-void main(int32_t argc, int8_t **argv)
> >++void main(int32_t argc, char **argv)
> >+ {
> >+ 	int size;
> >+ 	char *map ;
> >+diff --git a/test/prussdrv_test/test/pruss_uio_test.c b/test/prussdrv_test/test/pruss_uio_test.c
> >+index 5af4a2c..7391fbd 100644
> >+--- a/test/prussdrv_test/test/pruss_uio_test.c
> >++++ b/test/prussdrv_test/test/pruss_uio_test.c
> >+@@ -261,7 +261,7 @@ int bsp_init()
> >+
> >+ }
> >+
> >+-void main (int32_t argc, int8_t **argv)
> >++void main (int32_t argc, char **argv)
> >+ {
> >+     int ret_val;
> >+
> >+diff --git a/test/uio_cic2_int_multithread_test.c b/test/uio_cic2_int_multithread_test.c
> >+index 0d9f126..15db958 100755
> >+--- a/test/uio_cic2_int_multithread_test.c
> >++++ b/test/uio_cic2_int_multithread_test.c
> >+@@ -287,7 +287,7 @@ void *wait_inthread_for_interrupt(void *arg)
> >+ 	}
> >+ }
> >+
> >+-void main(int32_t argc, int8_t **argv)
> >++void main(int32_t argc, char **argv)
> >+ {
> >+ 	thread_arg_t thread_arg[MAX_NUM_THREADS];
> >+ 	int ret, err;
> >+diff --git a/test/uio_int_test.c b/test/uio_int_test.c
> >+index 7095a0a..e0ba5a9 100644
> >+--- a/test/uio_int_test.c
> >++++ b/test/uio_int_test.c
> >+@@ -161,7 +161,7 @@ static int64_t clock_diff (struct timespec *start, struct timespec *end)
> >+              + end->tv_nsec - start->tv_nsec;
> >+ }
> >+
> >+-void main(int32_t argc, int8_t **argv)
> >++void main(int32_t argc, char **argv)
> >+ {
> >+ 	int  fd_uio;
> >+ 	int ret;
> >+diff --git a/test/uio_mem_test.c b/test/uio_mem_test.c
> >+index aad13ac..3cdba37 100644
> >+--- a/test/uio_mem_test.c
> >++++ b/test/uio_mem_test.c
> >+@@ -121,7 +121,7 @@ err_exit1:
> >+ 	return ret;
> >+ }
> >+
> >+-void main(int32_t argc, int8_t **argv)
> >++void main(int32_t argc, char **argv)
> >+ {
> >+ 	int  fd_map;
> >+ 	int ret;
> >+--
> >+2.36.0
> >+
> >diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> >index dc17a1e9..41270042 100644
> >--- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> >+++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
> >@@ -2,6 +2,8 @@ DESCRIPTION = "Test code for user space IO (UIO) driver"
> >  include uio-module-drv.inc
> >+SRC_URI += "file://0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch"
> >+
> >  PR = "r1"
> >  COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x"
> >@@ -33,3 +35,5 @@ do_install:append:ti33x () {
> >  do_install:append:ti43x () {
> >          install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
> >  }
> >+
> >+CLEANBROKEN = "1"
> >
> >
> >
> >
> >
> 
> -- 
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

