Return-Path: <jpanis@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7736AEB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 10:05:25 +0000 (UTC)
Subject: Re: [master][PATCH 02/22] conf: Add extlinux.conf support on some 32bit platforms
To: meta-ti@lists.yoctoproject.org
From: "Julien Panis" <jpanis@baylibre.com>
X-Originating-Location: Treon, Centre-Val de Loire, FR (77.205.22.26)
X-Originating-Platform: Linux Firefox 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 05 Jul 2023 03:05:25 -0700
References: <1635795192-43144-3-git-send-email-denis@denix.org>
In-Reply-To: <1635795192-43144-3-git-send-email-denis@denix.org>
Message-ID: <5762.1688551525268157432@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Jul 2023 10:05:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16812

Today the SDK for AM335x/AM437x loads kernel/dtb from the boot partition, b=
ut all K3 devices load kernel/dtb from the root partition. This inconsisten=
cy confuses customers.

Is it possible to locate 'extlinux.conf' on boot partition with kernel/dtb =
on root partition ?
This old link explains that we can't:
https://unix.stackexchange.com/questions/258545/extlinux-conf-on-separate-p=
artition
Does it still apply ?

