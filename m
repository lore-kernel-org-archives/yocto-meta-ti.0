Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8DBC3ABBC
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 01:58:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1843.1746583090181487898
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 May 2025 18:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9569B40C8A;
	Wed,  7 May 2025 01:58:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UaZrrFITLft; Wed,  7 May 2025 01:58:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7A79940C2B;
	Wed,  7 May 2025 01:58:08 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 38FDF16794A;
	Tue,  6 May 2025 21:58:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] optee-test: Suppress new gcc-15 -Wunterminated-string-initialization
Date: Tue,  6 May 2025 21:58:07 -0400
Message-Id: <20250507015807.1692882-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 May 2025 01:58:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18539

From: Denys Dmytriyenko <denys@konsulko.com>

Mark corresponding arrays with nonstring attribute to suppress the new
gcc-15 warning -Wunterminated-string-initialization that becomes an
error due to the global -Werror.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../optee/optee-test-ti-version.inc           |  3 +
 ...-15-Wunterminated-string-initializat.patch | 69 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-test/0001-Su=
ppress-new-gcc-15-Wunterminated-string-initializat.patch

diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc=
 b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 3c1fedc9..e4b3a384 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,2 +1,5 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-test:"
+
 PV =3D "4.4.0+git"
 SRCREV =3D "695231ef8987866663a9ed5afd8f77d1bae3dc08"
+SRC_URI +=3D "file://0001-Suppress-new-gcc-15-Wunterminated-string-initi=
alizat.patch"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test/0001-Suppress-=
new-gcc-15-Wunterminated-string-initializat.patch b/meta-ti-bsp/recipes-s=
ecurity/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-in=
itializat.patch
new file mode 100644
index 00000000..0f52f3d6
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-test/0001-Suppress-new-gcc=
-15-Wunterminated-string-initializat.patch
@@ -0,0 +1,69 @@
+From a8e58203dcb4c13ee340259cd2692202ac8414d1 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@konsulko.com>
+Date: Tue, 6 May 2025 21:35:55 -0400
+Subject: [PATCH] Suppress new gcc-15 -Wunterminated-string-initializatio=
n
+
+GCC 15 now warns when character arrays are being initialized by strings
+and terminating NUL character doesn't fit. GCC 15.1 also allows marking
+such arrays with nonstring attribute to suppress the warning. W/o such
+attribute, the warning becomes error due to the global -Werror. Add the
+attribute accordingly.
+
+Fixes these errors:
+
+| ./regression_4000_data.h:7919:9: error: initializer-string for array o=
f 'unsigned char' truncates NUL terminator but destination lacks 'nonstri=
ng' attribute (20 chars into 19 available) [-Werror=3Dunterminated-string=
-initialization]
+|  7919 |         "encryption standard";
+|       |         ^~~~~~~~~~~~~~~~~~~~~
+| ./regression_4000_data.h:8387:9: error: initializer-string for array o=
f 'unsigned char' truncates NUL terminator but destination lacks 'nonstri=
ng' attribute (113 chars into 112 available) [-Werror=3Dunterminated-stri=
ng-initialization]
+|  8387 |         "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomn"
+|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| ./regression_4000.c:1295:47: error: initializer-string for array of 'u=
nsigned char' truncates NUL terminator but destination lacks 'nonstring' =
attribute (4 chars into 3 available) [-Werror=3Dunterminated-string-initi=
alization]
+|  1295 | static const uint8_t hash_data_sm3_a1_in[3] =3D "abc";
+|       |                                               ^~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
+---
+ host/xtest/regression_4000.c      | 2 +-
+ host/xtest/regression_4000_data.h | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/host/xtest/regression_4000.c b/host/xtest/regression_4000.c
+index 3aa15be..46e6f8e 100644
+--- a/host/xtest/regression_4000.c
++++ b/host/xtest/regression_4000.c
+@@ -1292,7 +1292,7 @@ static const uint8_t hash_data_shake256_out2[] =3D=
 {
+  * https://tools.ietf.org/html/draft-sca-cfrg-sm3-02
+  * Appendix A.1
+  */
+-static const uint8_t hash_data_sm3_a1_in[3] =3D "abc";
++static const uint8_t hash_data_sm3_a1_in[3] __attribute__((nonstring)) =
=3D "abc";
+=20
+ static const uint8_t hash_data_sm3_a1_out[] =3D {
+ 	0x66, 0xc7, 0xf0, 0xf4, 0x62, 0xee, 0xed, 0xd9,
+diff --git a/host/xtest/regression_4000_data.h b/host/xtest/regression_4=
000_data.h
+index 0881ac3..eb101b2 100644
+--- a/host/xtest/regression_4000_data.h
++++ b/host/xtest/regression_4000_data.h
+@@ -7914,7 +7914,7 @@ static struct derive_key_ecdh_t {
+ };
+=20
+ /* G/MT 0003 (SM2) Part 5 Annex C.2 - encryption/decryption */
+-static const uint8_t gmt_0003_part5_c2_sm2_testvector_ptx[19] =3D
++static const uint8_t gmt_0003_part5_c2_sm2_testvector_ptx[19] __attribu=
te__((nonstring)) =3D
+ /* M */
+ 	"encryption standard";
+ static const uint8_t gmt_0003_part5_c2_sm2_testvector_private[] =3D {
+@@ -8383,7 +8383,7 @@ static const uint8_t mac_data_sha3_512_out1[] =3D =
{
+  * GM/T 0042-2015
+  * Section D.3 Test vector 1
+  */
+-static const uint8_t mac_data_sm3_d31_in[112] =3D
++static const uint8_t mac_data_sm3_d31_in[112] __attribute__((nonstring)=
) =3D
+ 	"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomn"
+ 	"opnopqabcdbcdecdefdefgefghfghighijhijkijkljklmklmn"
+ 	"lmnomnopnopq";
+--=20
+2.25.1
+
--=20
2.25.1


