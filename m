Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6E4CD3430
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 14:54:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16726.1777906442558616516
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 May 2026 07:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C850840C85;
	Mon,  4 May 2026 14:54:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNDnJUTxNggo; Mon,  4 May 2026 14:54:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 99892409EB;
	Mon,  4 May 2026 14:54:00 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D8FCC17D1F1;
	Mon,  4 May 2026 10:53:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] weston: make bbappend version-specific, again
Date: Mon,  4 May 2026 10:53:09 -0400
Message-Id: <20260504145309.731536-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 May 2026 14:54:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19923

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

As discussed on the mailing list, it is not always safe to have a
version-agnostic bbappend, as there could be different versions
of weston recipe provided by downstream layers, not compatible
with our patch, resulting in breakage. Make our bbappend again
version-specific.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 .../wayland/{weston_%.bbappend =3D> weston_15.0.%.bbappend}         | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/recipes-graphics/wayland/{weston_%.bbappend =3D> west=
on_15.0.%.bbappend} (100%)

diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston_%.bbappend b/met=
a-ti-bsp/recipes-graphics/wayland/weston_15.0.%.bbappend
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/wayland/weston_%.bbappend
rename to meta-ti-bsp/recipes-graphics/wayland/weston_15.0.%.bbappend
--=20
2.25.1


