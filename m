Return-Path: <anthony@ajmartinez.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8704ECA0FEE
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 17:48:26 +0000 (UTC)
Subject: Re: poky [kirkstone] + systemd fails to mount /boot on beaglebone machine - missing nls_ascii?
To: meta-ti@lists.yoctoproject.org
From: "Anthony Martinez" <anthony@ajmartinez.com>
X-Originating-Location: Damon, Texas, US (135.26.88.21)
X-Originating-Platform: Linux Firefox 102
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 01 Sep 2023 10:48:20 -0700
References: <16486.1693574479250247115@lists.yoctoproject.org>
In-Reply-To: <16486.1693574479250247115@lists.yoctoproject.org>
Message-ID: <18904.1693590500533966350@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Sep 2023 17:48:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16915

A SRCREV mismatch stopped me from using `devtool` to modify the layer, but =
the following changes in meta-ti got me up and running:

```
meta-ti$ git diff
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti=
-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index e134fb84..144cb07f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -16,10 +16,10 @@ KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} =
${EXTRA_DTC_ARGS}"
=20
 S =3D "${WORKDIR}/git"
=20
-# 5.10.162 version for 32-bit
-SRCREV:armv7a =3D "982fde4eb381f98ec8be946e8d33dd0c9f9416ab"
-PV:armv7a =3D "5.10.162+git${SRCPV}"
-BRANCH:armv7a =3D "v5.10.162-ti-r59"
+# 5.10.168 version for 32-bit
+SRCREV:armv7a =3D "a943fc1987e1b8057b0b5219ecd3c5a85285d62a"
+PV:armv7a =3D "5.10.168+git${SRCPV}"
+BRANCH:armv7a =3D "v5.10.168-ti-r70"
=20
 # 5.10.162 version for 64-bit
 SRCREV:aarch64 =3D "a2f5d5746b6c389e58d20fda0a0fa88403da428b"
@@ -30,5 +30,5 @@ SRC_URI =3D " \
     git://github.com/beagleboard/linux.git;protocol=3Dhttps;branch=3D${BRA=
NCH} \
     file://defconfig \
 "
-
-SRC_URI:append:armv7a =3D " file://0001-defconfig-switch-default-kernel-co=
mpression-to-LZMA.patch"
+# This patch does not appear to be needed
+#SRC_URI:append:armv7a =3D " file://0001-defconfig-switch-default-kernel-c=
ompression-to-LZMA.patch"
```

After running `bitbake core-image-base` and flashing my SD card, booting wi=
th systemd works great.

It's probably cleaner to just remove the LZMA patch that is no longer neede=
d in the newer kernel, than to comment it out as I did but what I posted is=
 exactly what was in place when I built. There's also no change made for th=
e 64-bit target, as I don't know what that ought to be (or if it should be =
changed or not).

Thanks for the help!

Regards,
Anthony Martinez

