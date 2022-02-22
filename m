Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8942.1645503242935188957
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 608D940A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WEynM_Ztx8U for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5109C40C85
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 21CE217476F
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 04/17] meta-ti: move WiLink components to meta-ti-extras
Date: Tue, 22 Feb 2022 04:13:48 +0000
Message-Id: <20220222041401.2840172-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Move WiLink WiFi and BT components from meta-ti-bsp to meta-ti-extras lay=
er.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/bt-fw/bt-fw_git.bb    | 0
 .../wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch   | 0
 .../recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb                 | 0
 .../recipes-connectivity/uim/uim-sysfs_8.5.bb                     | 0
 ...001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch | 0
 .../wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb                  | 0
 .../0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch    | 0
 .../wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb          | 0
 .../recipes-connectivity/wlconf/wlconf_8.7.3.bb                   | 0
 9 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/bt-fw/bt-fw_git.bb =
(100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/wl18xx-fw/wl18xx-fw=
/0001-Add-Makefile-to-install-firmware-files.patch (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-bsp/wl18xx-fw/wl18xx-fw=
_8.9.0.0.86.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-connectivity/uim/uim-sy=
sfs_8.5.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-connectivity/wl18xx-cal=
ibrator/wl18xx-calibrator/0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_E=
NMT-type-e.patch (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-connectivity/wl18xx-cal=
ibrator/wl18xx-calibrator_8.7.3.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-connectivity/wl18xx-tar=
get-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-s=
h-with-bin-sh.patch (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-connectivity/wl18xx-tar=
get-scripts/wl18xx-target-scripts_8.7.3.bb (100%)
 rename {meta-ti-bsp =3D> meta-ti-extras}/recipes-connectivity/wlconf/wlc=
onf_8.7.3.bb (100%)

diff --git a/meta-ti-bsp/recipes-bsp/bt-fw/bt-fw_git.bb b/meta-ti-extras/=
recipes-bsp/bt-fw/bt-fw_git.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/bt-fw/bt-fw_git.bb
rename to meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
diff --git a/meta-ti-bsp/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefil=
e-to-install-firmware-files.patch b/meta-ti-extras/recipes-bsp/wl18xx-fw/=
wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile=
-to-install-firmware-files.patch
rename to meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefil=
e-to-install-firmware-files.patch
diff --git a/meta-ti-bsp/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/=
meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
rename to meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
diff --git a/meta-ti-bsp/recipes-connectivity/uim/uim-sysfs_8.5.bb b/meta=
-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
similarity index 100%
rename from meta-ti-bsp/recipes-connectivity/uim/uim-sysfs_8.5.bb
rename to meta-ti-extras/recipes-connectivity/uim/uim-sysfs_8.5.bb
diff --git a/meta-ti-bsp/recipes-connectivity/wl18xx-calibrator/wl18xx-ca=
librator/0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch =
b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator=
/0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch
similarity index 100%
rename from meta-ti-bsp/recipes-connectivity/wl18xx-calibrator/wl18xx-cal=
ibrator/0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch
rename to meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-ca=
librator/0001-plt.h-Do-not-define-EFUSE_PARAMETER_TYPE_ENMT-type-e.patch
diff --git a/meta-ti-bsp/recipes-connectivity/wl18xx-calibrator/wl18xx-ca=
librator_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx-calibrator=
/wl18xx-calibrator_8.7.3.bb
similarity index 100%
rename from meta-ti-bsp/recipes-connectivity/wl18xx-calibrator/wl18xx-cal=
ibrator_8.7.3.bb
rename to meta-ti-extras/recipes-connectivity/wl18xx-calibrator/wl18xx-ca=
librator_8.7.3.bb
diff --git a/meta-ti-bsp/recipes-connectivity/wl18xx-target-scripts/wl18x=
x-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.pat=
ch b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-tar=
get-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch
similarity index 100%
rename from meta-ti-bsp/recipes-connectivity/wl18xx-target-scripts/wl18xx=
-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patc=
h
rename to meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18x=
x-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.pat=
ch
diff --git a/meta-ti-bsp/recipes-connectivity/wl18xx-target-scripts/wl18x=
x-target-scripts_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx-ta=
rget-scripts/wl18xx-target-scripts_8.7.3.bb
similarity index 100%
rename from meta-ti-bsp/recipes-connectivity/wl18xx-target-scripts/wl18xx=
-target-scripts_8.7.3.bb
rename to meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18x=
x-target-scripts_8.7.3.bb
diff --git a/meta-ti-bsp/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/me=
ta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
similarity index 100%
rename from meta-ti-bsp/recipes-connectivity/wlconf/wlconf_8.7.3.bb
rename to meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
--=20
2.25.1

