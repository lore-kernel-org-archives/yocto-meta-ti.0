Return-Path: <ari.parkkila@qt.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8707FEB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 08:56:46 +0000 (UTC)
Subject: am62xx-evm: bootloader config not specified
To: meta-ti@lists.yoctoproject.org
From: "Ari Parkkila" <ari.parkkila@qt.io>
X-Originating-Location: Oulu, North Ostrobothnia, FI (78.27.70.251)
X-Originating-Platform: Linux Firefox 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 28 Jun 2023 01:56:44 -0700
Message-ID: <JTuj.1687942604017219187.Ez1v@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 Jun 2023 08:56:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16793

I'm trying to fix am62xx-evm/multiconfig build problem with a patch "multic=
onfig: use diferent TMPDIR for each machine" (https://lists.yoctoproject.or=
g/g/meta-ti/topic/91431962) but my build is failing:

WARNING: bootloader config not specified, using defaults
ERROR: _exec_cmd: install -m 0644 -D build-am62xx-evm/tmp/deploy/images/am6=
2xx-evm/tiboot3.bin build-am62xx-evm/tmp/work/am62xx_evm-poky-linux/b2qt-em=
bedded-qt6-image/1.0-r0/tmp-wic/boot.1/tiboot3.bin returned '1' instead of =
0
| output: install: cannot stat 'build-am62xx-evm/tmp/deploy/images/am62xx-e=
vm/tiboot3.bin': No such file or directory

The patch will use a separate folder for each multiconfig (tmp tmp-am62xx-e=
vm-k3r5-gp tmp-am62xx-evm-k3r5-hs-se tmp-am62xx-evm-k3r5-hs-fs) so it seems=
 that some more bootloaders configs are needed?

