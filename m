Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC336C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 19:08:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.21214.1699816073012136003
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 12 Nov 2023 11:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0932440BD4;
	Sun, 12 Nov 2023 19:07:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuxhY0HmMGk7; Sun, 12 Nov 2023 19:07:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6CD2E40ACD;
	Sun, 12 Nov 2023 19:07:49 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 256C9163D5B;
	Sun, 12 Nov 2023 14:07:49 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] k3r5: ensure separate TMPDIR used for this multiconfig
Date: Sun, 12 Nov 2023 19:07:43 +0000
Message-Id: <20231112190743.1496752-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 12 Nov 2023 19:08:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17293

From: Denys Dmytriyenko <denys@konsulko.com>

This k3r5 multiconfig builds baremetal components (and corresponding nati=
ve,
nativesdk and cross tools) and sets TCLIBC accordingly to "baremetal". Th=
e
expectation is that those components and tools will use a separate TMPDIR
to isolate from the main Linux build that uses "glibc" TCLIBC and to avoi=
d
potential conflicts.

OE-Core "nodistro" default configuration already sets TCLIBCAPPEND facili=
ty
to automatically add a suffix to TMPDIR, resulting in "tmp-baremetal" tem=
p
directory for this multiconfig and "tmp-glibc" for the main Linux one. Ot=
her
distros like Arago follow this convention and even extend a bit (e.g. Ara=
go
also adds TCMODE suffix to TMPDIR for external toolchain support separati=
on).

But Poky (and derivative distros, like AGL or YoE) disable TCLIBCAPPEND a=
nd
result in a combined TMPDIR, leading to potential conflicts, such as:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15273

And that's just the beginning, there were other conflicts observed later =
in
the build, e.g. during nativesdk builds - that's why we also set a unique
SDKPKGSUFFIX here.

To force a separate TMPDIR for k3r5 multiconfig, we have to directly appe=
nd
a suffix to it. Multiple other options were tested in hopes of making it
slightly cleaner, but they either didn't work or were dismissed. For exam=
ple,
trying to override TCLIBCAPPEND getting cleared by a distro would require
using a machine/soc-override, which doesn't have enough scope (nativesdk)
or forcing it with :forcevariable would also change the main Linux TMPDIR
and affect existing CI flows. Also, using TCLIBC itself as a suffix to ad=
d
to TMPDIR may result in getting it appended twice (tmp-baremetal-baremeta=
l)
when normal TCLIBCAPPEND facility is used. Hence the least invasive/confu=
sing
option is to always append "-k3r5" suffix to this multiconfig TMPDIR. Tha=
t
results in "tmp-k3r5" in Poky (leaving main TMPDIR as "tmp"), while OE-Co=
re
"nodistro" and Arago would end up with "tmp-baremetal-k3r5" (and "tmp-gli=
bc"
for the main).

Also note, meta-ti-bsp layer.conf sets up images and sdks to be deployed
into a common location outside of TMPDIRs, but TI_COMMON_DEPLOY variable
that controls it is set weakly, allowing to be modified from a distro
configuration or local.conf. It means that all images and sdks can be
deployed into the main TMPDIR if one's CI flow expects tmp/deploy/ as
the final destination, by using :=3D for immediate variable expansion:
TI_COMMON_DEPLOY :=3D "${TMPDIR}/deploy"

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/mu=
lticonfig/k3r5.conf
index 04b9a746..e36c87ed 100644
--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
@@ -4,4 +4,6 @@ DEPLOY_DIR_IMAGE:k3r5 =3D "${TI_COMMON_DEPLOY}/images/${M=
AINMACHINE}"
=20
 MACHINE:append =3D "-k3r5"
 TCLIBC =3D "baremetal"
+TMPDIR:append =3D "-k3r5"
+
 SDKPKGSUFFIX =3D "k3r5-nativesdk"
--=20
2.25.1


