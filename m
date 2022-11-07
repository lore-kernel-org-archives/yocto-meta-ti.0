Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A62DC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:18:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2079.1667848678808048624
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 11:17:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F27F740D35;
	Mon,  7 Nov 2022 19:17:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zTJhqCSpq8N; Mon,  7 Nov 2022 19:17:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DB77040D20;
	Mon,  7 Nov 2022 19:17:56 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B2763162035;
	Mon,  7 Nov 2022 14:17:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [kirkstone][PATCH] optee: make bbappends version-specific
Date: Mon,  7 Nov 2022 19:17:52 +0000
Message-Id: <20221107191752.829183-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Nov 2022 19:18:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15331

From: Denys Dmytriyenko <denys@konsulko.com>

Kirkstone branch of meta-arm comes with 2 versions of optee-os and
optee-client - 3.14 and 3.16. They have different dependencies and
slightly different build flows.

In our bbappends we bump SRCREV to latest version for newer platform
support and also update PV to indicate the correct version. While
bbappends are expected to be applied against newer 3.16 version of the
recipes, they use wildcard versioning and are not version-specific.

That results in bbappends applied to both versions of the recipes and
PV set to be the same, while the content is different. At this point
bitbake can pick up any version of the base recipe and if it gets
3.14 to apply the bbappend, the build fails due to that version being
too old and have different dependencies and build flows.

Making bbappends version-specific avoids the problem. Alternatively,
a whole recipe of the required newer version could be added, instead
of using bbappends.

Also, this is specific to Kirkstone, where meta-arm provides two
versions of optee - 3.14 and 3.16. In Lagdale and master only a
single 3.18 version of optee is provided.

Another hacky approach would be to not bump PV and let it be set by
the base recipe. That would avoid the build issue and keep bbappends
version-agnostic across branches, but result in incorrect versioning
of the binary packages, which might be confusing.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../{optee-client_%.bbappend =3D> optee-client_3.16%.bbappend}      | 0
 .../optee/{optee-os_%.bbappend =3D> optee-os_3.16%.bbappend}        | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/recipes-security/optee/{optee-client_%.bbappend =3D> =
optee-client_3.16%.bbappend} (100%)
 rename meta-ti-bsp/recipes-security/optee/{optee-os_%.bbappend =3D> opte=
e-os_3.16%.bbappend} (100%)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b=
/meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
similarity index 100%
rename from meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
rename to meta-ti-bsp/recipes-security/optee/optee-client_3.16%.bbappend
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
similarity index 100%
rename from meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
rename to meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
--=20
2.25.1


