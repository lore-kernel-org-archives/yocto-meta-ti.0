Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CECC7EE2C
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 02:37:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.15231.1683340664399624111
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 May 2023 19:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9AAFE40C93
	for <meta-ti@lists.yoctoproject.org>; Sat,  6 May 2023 02:37:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hONTAaqeD1om for <meta-ti@lists.yoctoproject.org>;
	Sat,  6 May 2023 02:37:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 80E6740A3D
	for <meta-ti@lists.yoctoproject.org>; Sat,  6 May 2023 02:37:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2CADE163843
	for <meta-ti@lists.yoctoproject.org>; Fri,  5 May 2023 22:37:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 0/4] Enable Vulkan cherry-pick from kirkstone
Date: Sat,  6 May 2023 02:37:39 +0000
Message-Id: <20230506023743.1259692-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 May 2023 02:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16493

From: Denys Dmytriyenko <denys@konsulko.com>

Cherry-pick Vulkan enabling changes from kirsktone.

Randolph Sapp (4):
  ti-img-rogue-umlibs: bump srcrev, add vulkan, update deps
  pvr-mesa: add new vulkan configuration options and wsi
  cairo: resolve opengl version
  ti-img-rogue-umlibs: package firmware separately

 .../recipes-graphics/cairo/cairo_%.bbappend   |  1 +
 .../recipes-graphics/cairo/pvr-cairo.inc      |  5 +++
 .../ti-img-rogue-umlibs_23.1.6404501.bb       | 33 +++++++++++++++----
 .../recipes-graphics/mesa/pvr-mesa.inc        |  6 +++-
 4 files changed, 37 insertions(+), 8 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc

--=20
2.25.1


