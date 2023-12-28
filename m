Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADCAC4706F
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 16:06:40 +0000 (UTC)
Subject: Custom dts recipe
To: meta-ti@lists.yoctoproject.org
From: "Lukasz Przenioslo" <bremenpl@gmail.com>
X-Originating-Location: Szczecin, West Pomerania, PL (83.20.46.193)
X-Originating-Platform: Windows Firefox 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 28 Dec 2023 08:06:36 -0800
Message-ID: <tcKd.1703779596370036081.fG9M@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Dec 2023 16:06:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17373

Hello,
For a while now I am trying to create a custom device tree overlay for the =
BBB/ BBG. It doesn't go so well. I started to think whether it would not be=
 more feasible to have a custom base dts file instead (just like `am335x-bo=
negreen.dts` or `am335x-boneblack.dts`. Based on one of these 2 files I cou=
ld create, say, `am335x-bonepink.dts`. Assuming this `am335x-bonepink.dts` =
would reside in some dir I have access to, what would be the preffered Poky=
 way of implementing it into the build? By that I mean that during bitbake =
it would be compiled to a *.dtb and placed in the boot directory along with=
 the other dtb files. Do I need to create a custom recipe/ layer for that a=
nd add it to the build via `bitbake-layers add-layer`? If yes, how would th=
e steps look like in practice (I am quite new to Yocto/ Poky)?

I would appreciate all feedback!=20

