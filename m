Return-Path: <arcady.ruvidic@clearsy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFBFC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 09:07:20 +0000 (UTC)
Subject: Yocto Development for custom AM335x/OSD335x board and more
To: meta-ti@lists.yoctoproject.org
From: "Arcadius" <arcady.ruvidic@clearsy.com>
X-Originating-Location: La Murette, Auvergne-Rhone-Alpes, FR (5.226.5.184)
X-Originating-Platform: Windows Firefox 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 20 Aug 2024 02:07:13 -0700
Message-ID: <xdSV.1724144833468760472.3FMY@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Aug 2024 09:07:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17943

Hello everyone,

This is my first attempt at working with Linux on a custom board, which see=
ms quite differently from RTOS development I am used to.
I have been looking into the Yocto Project to create a custom distribution,=
 but before modifying Linux itself I would like to understand how to start =
working from the default Poky distro to get it running on a custom board.
I currently have the OSD3358-SM-RED dev kit board from Octavo Systems and w=
ill soon have my custom board based on the OSD3358 C-SiP (SiP with AM3358 i=
nside).
As a first step I would like to get Poky running on the dev kit.

I have checked that Yocto succeeds building the minimal image for Qemu on b=
ranch Scarthgap and Ubuntu 22.04 host.
I got the device tree sources for the board from Octavo Systems' GitHub.
I guess that adding the meta-ti layer along with its dependencies should ad=
d support for the AM3358 processor (although I am unsure as to what exactly=
 Arago is and if I can ignore it for a minimal Poky build).
Then I would probably need a custom layer to add custom recipes including t=
he device tree sources.
But with my current knowledge, I can't get much further than this.

I have seen the processor SDK for AM335x but I was wondering if there would=
 be a more direct way of doing things starting from Poky.
Additionally, I would like to be able to use my Linux distro on other custo=
m boards which won't necessarily use TI processors (e.g. Microchip's SAMA7G=
54), so I was unsure if the SDK was a good development environment for this=
 case.
I would basically like to learn a process that would work for any board wit=
h any processor as long as BSPs are provided.
I have checked the documents from Octavo Systems but their approach of "hac=
king" a Beaglebone image doesn't really fit into my objective.

So, any help would be appreciated!

