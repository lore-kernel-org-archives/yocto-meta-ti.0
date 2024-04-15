Return-Path: <sasikumar.e@fdss.co.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E976C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 04:07:25 +0000 (UTC)
Subject: Re: yocto linux development for AM3359 ICE development board
To: meta-ti@lists.yoctoproject.org
From: "SasiKumar E" <sasikumar.e@fdss.co.in>
X-Originating-Location: Tiruchi, Tamil Nadu, IN (122.165.190.191)
X-Originating-Platform: Linux Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 14 Apr 2024 21:07:24 -0700
References: <21132769-cb58-44ef-b0d2-2f0ee360dbaa@ti.com>
In-Reply-To: <21132769-cb58-44ef-b0d2-2f0ee360dbaa@ti.com>
Message-ID: <22488.1713154044174996671@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 Apr 2024 04:07:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17567

Hi Praneeth,
we are starting the design with AM3359 development board but for the final =
custom board we are intended to design with AM5729 microprocessor, thus TI =
provides different SDK for both processors we thought working in yocto will=
 provide a greater advantage since it does not provide a specific setup for=
 each processor.
I have done the quick build for QEMU but then switching to machine specific=
 the example provided is for altera board and I am going through the docs p=
rovided by yocto"https://docs.yoctoproject.org/", this is a lengthy procedu=
re. if I had any documents relating to implementing the yocto in AM3359 boa=
rds it would be good.

Thank you
Sasikumar E=20

