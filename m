Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.8975.1645503246032869514
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A3D4940C79
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQhqzlQu8vfi for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 89D1A40C87
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:02 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 552C9174738
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 10/17] meta-ti: move cuia to meta-ti-extras
Date: Tue, 22 Feb 2022 04:13:54 +0000
Message-Id: <20220222041401.2840172-11-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041401.2840172-1-denis@denix.org>
References: <20220222041401.2840172-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Move TI Unified Instrumentation Architecture in C (cUIA) to meta-ti-extra=
s under
recipes-devtools.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-devtools}/cuia/cuia_1.0.0.13.bb                       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-ti-bsp/recipes-bsp =3D> meta-ti-extras/recipes-devtools}/cu=
ia/cuia_1.0.0.13.bb (100%)

diff --git a/meta-ti-bsp/recipes-bsp/cuia/cuia_1.0.0.13.bb b/meta-ti-extr=
as/recipes-devtools/cuia/cuia_1.0.0.13.bb
similarity index 100%
rename from meta-ti-bsp/recipes-bsp/cuia/cuia_1.0.0.13.bb
rename to meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
--=20
2.25.1

