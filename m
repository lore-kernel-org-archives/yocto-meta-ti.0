Return-Path: <w.egorov@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C216CD49232
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 14:28:35 +0000 (UTC)
Subject: Re: [scarthgap][PATCH v4] ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2
To: meta-ti@lists.yoctoproject.org
From: "Wadim Egorov" <w.egorov@phytec.de>
X-Originating-Location: Limassol, Limassol District, CY (31.153.17.137)
X-Originating-Platform: Mac Safari 26.1
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 12 Dec 2025 06:28:26 -0800
References: <20251112202652.3718660-1-a-christidis@ti.com>
In-Reply-To: <20251112202652.3718660-1-a-christidis@ti.com>
Message-ID: <134418.1765549706546332207@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Dec 2025 14:28:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19357

Hello,

with this change I can see the following errors

  root@phyboard-lyra-am62xx-3:~# journalctl  -p err
  ...
  phyboard-lyra-am62xx-3 kernel: powervr fd00000.gpu: [drm] *ERROR* failed =
to load firmware powervr/rogue_33.15.11.3_v1.fw (err=3D-2)
  phyboard-lyra-am62xx-3 kernel: powervr fd00000.gpu: probe with driver pow=
ervr failed with error -2

Regards,
Wadim

