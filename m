Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C435C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 11:34:59 +0000 (UTC)
Subject: Custom device tree overlay for BBB
To: meta-ti@lists.yoctoproject.org
From: "Lukasz Przenioslo" <bremenpl@gmail.com>
X-Originating-Location: Szarcz, Lubusz, PL (83.20.77.153)
X-Originating-Platform: Windows Firefox 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 21 Dec 2023 03:34:54 -0800
Message-ID: <YQk4.1703158494387381940.GjTV@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Dec 2023 11:34:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17360

Hello there,

I was able to compile the Poky image (Dunfell) with meta-ti included for th=
e BBB. I am working on an open source project intended for home automation =
based on the BBB: https://github.com/Beaglenode/BeagleNodeHW

The next step I am trying to make is to prepare a proper device tree overla=
y that would align with the HW requirements of this project (or "cape"). I =
need to:
- Disable the HDMI pins,
- configure multiple pins as either PRU0 or PRU1 controlled.

For that I thought the best approach would be to prepare a DTO, instead of =
modifying the default one for BBB. I don't know how to prepare that DTO yet=
 and I don't know how to include it in my build. I would like to ask for so=
me help in this manner, especially the prior part (how to load the custom D=
TO). Right now I am still modifying everything in the local.conf, as I do n=
ot have the knowledge yet to build my own distro for this device (that's th=
e end plan).

I would appreciate all help!

