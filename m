Return-Path: <ari.parkkila@qt.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E560EB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 11:15:17 +0000 (UTC)
Subject: Re: am62xx-evm: bootloader config not specified
To: meta-ti@lists.yoctoproject.org
From: "Ari Parkkila" <ari.parkkila@qt.io>
X-Originating-Location: Oulu, North Ostrobothnia, FI (78.27.70.251)
X-Originating-Platform: Linux Firefox 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 28 Jun 2023 04:15:12 -0700
References: <CANPvuRk=RrL8k7qRr90We1hE+QvpXz2xxJMaxLC17OiL-EWSZQ@mail.gmail.com>
In-Reply-To: <CANPvuRk=RrL8k7qRr90We1hE+QvpXz2xxJMaxLC17OiL-EWSZQ@mail.gmail.com>
Message-ID: <32086.1687950912804991254@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 Jun 2023 11:15:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16795

Thanks Jos=C3=A9,

Multiconfig seems to cause conflict that only one recipe should copy to DEP=
LOY_DIR, e.g.:

ERROR: mc:k3r5-hs-se:linux-libc-headers-6.1-r0 do_package_write_ipk: The re=
cipe linux-libc-headers is trying to install files into a shared area when =
those files already exist. Those files and their manifest location are:
  build-am62xx-evm/deploy/ipk/armv7at2hf-vfp/linux-libc-headers-dbg_6.1-r0_=
armv7at2hf-vfp.ipk
    (not matched to any task)
  build-am62xx-evm/deploy/ipk/armv7at2hf-vfp/linux-libc-headers-dev_6.1-r0_=
armv7at2hf-vfp.ipk
    (not matched to any task)
  build-am62xx-evm/deploy/ipk/armv7at2hf-vfp/linux-libc-headers-lic_6.1-r0_=
armv7at2hf-vfp.ipk
    (not matched to any task)
Please verify which recipe should provide the above files.

