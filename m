Return-Path: <sebastian.krahl@lacon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644FAC3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 20:37:17 +0000 (UTC)
Subject: Re: core-image-sato scarthgap beaglebone x11 startup error
To: meta-ti@lists.yoctoproject.org
From: "Sebastian" <sebastian.krahl@lacon.de>
X-Originating-Location: Berlin, State of Berlin, DE (79.140.115.112)
X-Originating-Platform: Android Phone Firefox 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 08 May 2025 13:37:14 -0700
References: <20250508191329.GL18383@denix.org>
In-Reply-To: <20250508191329.GL18383@denix.org>
Message-ID: <1705.1746736634040091875@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 May 2025 20:37:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18548

Hi there,

I forgot to mention. At first I was running on my custom board.

The logs are captured from my BeagleBoneBlack so there is no difference in =
means of patched device tree. It was built only by using meta-ti and vanill=
a yocto.

Is there a hidden switch to be added for building sato for a wayland setup?

Regards=20

Sebastian=20

