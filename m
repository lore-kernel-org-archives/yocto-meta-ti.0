Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B58C7EE29
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 03:40:47 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.119996.1682998841875541456
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 May 2023 20:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BCC3740C13
	for <meta-ti@lists.yoctoproject.org>; Tue,  2 May 2023 03:40:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4uTrG4XLwnl for <meta-ti@lists.yoctoproject.org>;
	Tue,  2 May 2023 03:40:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC2AF40C5D
	for <meta-ti@lists.yoctoproject.org>; Tue,  2 May 2023 03:40:40 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6D342163893
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 May 2023 23:39:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 0/3] Rogue DDK 23.1 upgrade cherry-pick from kirkstone
Date: Tue,  2 May 2023 03:40:35 +0000
Message-Id: <20230502034038.3527224-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 May 2023 03:40:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16467

From: Denys Dmytriyenko <denys@konsulko.com>

Cherry-pick Rogue DDK 23.1 upgrade commits from kirkstone.

Randolph Sapp (3):
  mesa: locally overlay 22.3.5-specific patches from oe-core/master
  mesa: update pvr-mesa for the 22.3.5 version of mesa
  graphics: upgrade rogue graphics to 23.1.6404501

 ...bb =3D> ti-img-rogue-driver_23.1.6404501.bb} |   4 +-
 ...bb =3D> ti-img-rogue-umlibs_23.1.6404501.bb} |   4 +-
 ...nd-deprecate-drm_handle_format-and-d.patch | 157 ------------------
 ...e-unsigned-instead-of-uint-to-fix-mu.patch |  43 +++++
 ...fine-__NR_futex-if-it-does-not-exist.patch |  34 ----
 ...-backend-fix-gbm-compile-without-dri.patch |  64 +++++++
 ...sdetects-64bit-atomics-on-mips-clang.patch |   2 +-
 ...k-for-all-linux-host_os-combinations.patch |  18 +-
 ...ormat-Check-for-NEON-before-using-it.patch |   6 +-
 ...02-meson.build-make-TLS-ELF-optional.patch |  61 -------
 .../recipes-graphics/mesa/pvr-mesa.inc        |  15 +-
 11 files changed, 133 insertions(+), 275 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.18=
.6276027.bb =3D> ti-img-rogue-driver_23.1.6404501.bb} (92%)
 rename meta-ti-bsp/recipes-graphics/libgles/{ti-img-rogue-umlibs_1.18.62=
76027.bb =3D> ti-img-rogue-umlibs_23.1.6404501.bb} (93%)
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-Revert-e=
gl-wayland-deprecate-drm_handle_format-and-d.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-freedren=
o-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-futex.h-=
Define-__NR_futex-if-it-does-not-exist.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0001-gbm-back=
end-fix-gbm-compile-without-dri.patch
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/files/0002-meson.bu=
ild-make-TLS-ELF-optional.patch

--=20
2.25.1


