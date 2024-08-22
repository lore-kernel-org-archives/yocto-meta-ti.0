Return-Path: <arcady.ruvidic@clearsy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE73C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 13:03:03 +0000 (UTC)
Subject: Re: Yocto Development for custom AM335x/OSD335x board and more
To: meta-ti@lists.yoctoproject.org
From: "Arcadius" <arcady.ruvidic@clearsy.com>
X-Originating-Location: La Murette, Auvergne-Rhone-Alpes, FR (5.226.5.184)
X-Originating-Platform: Windows Firefox 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 22 Aug 2024 06:03:00 -0700
References: <15565.1724327520184039524@lists.yoctoproject.org>
In-Reply-To: <15565.1724327520184039524@lists.yoctoproject.org>
Message-ID: <8116.1724331780320896346@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Aug 2024 13:03:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17946

I just noticed that u-boot looks for the path specified for FDTDIR + am335x=
-osd3358-sm-red-v4.dtb.
I don't know where this device tree name comes from, since I can only find =
the non-v4 one in the linux sources, and the v4 only seems to exist in some=
 Beaglebone boards.
Where is it configured to look for this file is a mystery.

