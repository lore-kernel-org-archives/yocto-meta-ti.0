Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FCEEEAA6E
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 19:57:23 +0000 (UTC)
Subject: [kirkstone] beaglebone-ai64
To: meta-ti@lists.yoctoproject.org
From: "Joel Winarske" <joel.winarske@gmail.com>
X-Originating-Location: Bellingham, Washington, US (73.83.100.132)
X-Originating-Platform: Linux Firefox 117
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 14 Sep 2023 12:57:17 -0700
Message-ID: <cJr9.1694721437908350278.lV3S@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 19:57:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16977

Hi folks,

I've built core-image-weston for beaglebone-ai64.

I'm imaging sdcard using:
    sudo bmaptool copy ./core-image-weston-beaglebone-ai64.wic.xz /dev/sda

The image is not booting.

Are there any known issues with this layer on kirkstone tip of tree?


(I'm looking into making flutter-auto (AGL) run on this device; I'm the aut=
hor of flutter-auto)


Thanks,
Joel

