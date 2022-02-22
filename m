Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1171.1645574179171129279
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 15:56:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3288040C2E;
	Tue, 22 Feb 2022 23:56:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1fQ4YCZZWTI7; Tue, 22 Feb 2022 23:56:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1BC7F40A77;
	Tue, 22 Feb 2022 23:56:17 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C7F16174738;
	Tue, 22 Feb 2022 18:56:16 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] meta-ti: add README for meta-ti-extras and update maintainer
Date: Tue, 22 Feb 2022 23:56:16 +0000
Message-Id: <20220222235616.614689-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Add README for the newly added meta-ti-extras layer and update the mainta=
iner.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/README                     |  2 +-
 {meta-ti-bsp =3D> meta-ti-extras}/README | 14 ++++++--------
 2 files changed, 7 insertions(+), 9 deletions(-)
 copy {meta-ti-bsp =3D> meta-ti-extras}/README (60%)

diff --git a/meta-ti-bsp/README b/meta-ti-bsp/README
index d832609a..c5780531 100644
--- a/meta-ti-bsp/README
+++ b/meta-ti-bsp/README
@@ -29,5 +29,5 @@ Please note - meta-ti mailing list requires subscriptio=
n for posting:
 https://lists.yoctoproject.org/g/meta-ti
=20
 Maintainers:
-Praneeth Bajjuri <praneeth@ti.com>
+Ryan Eatmon <reatmon@ti.com>
 Denys Dmytriyenko <denys@konsulko.com>
diff --git a/meta-ti-bsp/README b/meta-ti-extras/README
similarity index 60%
copy from meta-ti-bsp/README
copy to meta-ti-extras/README
index d832609a..1b38921a 100644
--- a/meta-ti-bsp/README
+++ b/meta-ti-extras/README
@@ -1,4 +1,4 @@
-The official OpenEmbedded/Yocto BSP layer for Texas Instruments platform=
s.
+OpenEmbedded/Yocto layer that extends and supplements Texas Instruments =
BSP layer.
=20
 It is hosted on http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/ with =
the
 source repository at git://git.yoctoproject.org/meta-ti
@@ -14,12 +14,10 @@ URI: git://git.yoctoproject.org/meta-arm
 layers: meta-arm
 branch: master
=20
-
-The base BSP part of meta-ti should work with different OpenEmbedded/Yoc=
to
-distributions and layer stacks, such as:
-distro-less (only with OE-Core), with Yocto/Poky, with Angstrom or Arago=
.
-
-Please follow the recommended setup procedures of your OE distribution.
+URI: git://git.yoctoproject.org/meta-ti
+branch: master
+revision: HEAD
+layers: meta-ti-bsp
=20
=20
 Send pull requests, patches, comments or questions to:
@@ -29,5 +27,5 @@ Please note - meta-ti mailing list requires subscriptio=
n for posting:
 https://lists.yoctoproject.org/g/meta-ti
=20
 Maintainers:
-Praneeth Bajjuri <praneeth@ti.com>
+Ryan Eatmon <reatmon@ti.com>
 Denys Dmytriyenko <denys@konsulko.com>
--=20
2.25.1

