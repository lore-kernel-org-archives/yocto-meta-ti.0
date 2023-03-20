Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99157C7EE22
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 04:12:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6716.1679285565751231219
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 21:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0C52F40CB5
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mu4AFcj-w_fh for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 04:12:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0312140C62
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1370B1637CB
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 00:12:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 19/54] optee-os-tadevkit: update to match optee-os
Date: Mon, 20 Mar 2023 04:12:06 +0000
Message-Id: <20230320041241.1293077-20-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320041241.1293077-1-denis@denix.org>
References: <20230320041241.1293077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16130

From: Denys Dmytriyenko <denys@konsulko.com>

This installs shared OPTEE-OS APIs and needs to match in order for latest
client/test/examples to be able to build.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-security/optee/optee-os-tadevkit_%.bbappend       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbapp=
end b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
index 4300c1a9..7109c342 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
@@ -1,2 +1,2 @@
-PV:ti-soc =3D "3.17.0+git${SRCPV}"
-SRCREV:ti-soc =3D "15a746d28d10df3d79d72bc9fe4a5a654b88bcca"
+PV:ti-soc =3D "3.20.0+git${SRCPV}"
+SRCREV:ti-soc =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
--=20
2.25.1


