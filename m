Return-Path: <rafal.tomczyk1992@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4A9D38FEE
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 16:54:16 +0000 (UTC)
Subject: How to add support for CC3301 for Beagley-AI
To: meta-ti@lists.yoctoproject.org
From: rafal.tomczyk1992@gmail.com
X-Originating-Location: Warsaw, Mazovia, PL (147.161.248.163)
X-Originating-Platform: Windows Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Jan 2026 08:54:11 -0800
Message-ID: <TEdn.1768409651510788479.EPUD@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jan 2026 16:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19416

Hi All!
I recently bought this board and successfuly built Yocto image for it. Now =
I would like to add support for CC3301 WiFi module. From what I have seen, =
this chip is already supported in kernel (it is enabled as a module). Howev=
er, after running system, I cannot load this module via modprobe:

modprobe: FATAL: Module cc33xx not found in directory /lib/modules/6.12.43-=
ti

What I need to do to make work it? Any help is highly appreciated.

