Return-Path: <sebastian.krahl@lacon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB0BC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 14:57:55 +0000 (UTC)
Subject: core-image-sato scarthgap beaglebone x11 startup error
To: meta-ti@lists.yoctoproject.org
From: "Sebastian" <sebastian.krahl@lacon.de>
X-Originating-Location: Berlin, State of Berlin, DE (79.140.115.105)
X-Originating-Platform: Windows Chrome 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 06 May 2025 07:57:48 -0700
Message-ID: <4weC.1746543468071238638.sYyH@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 May 2025 14:57:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18534

I've tested meta-ti for kirkstone the xserver starts up correctly into an X=
 session.

With meta-ti for scarthgap it fails. As it looks for a /dev/fb device which=
 is not present.

Aside of this, with kirkstone and scarthgap in yocto-bsp and beaglebone-yoc=
to it works in both cases.

The framebuffer is filled up by the splash screen also in powering down.

What am I missing?

What info to supply?

Regards,

Sebastian

