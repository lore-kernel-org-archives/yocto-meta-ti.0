Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95143C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 19:44:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1949.1654717438180669528
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 12:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8837C40CC3;
	Wed,  8 Jun 2022 19:43:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OxEyaFhQ8mE; Wed,  8 Jun 2022 19:43:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6670540C3E;
	Wed,  8 Jun 2022 19:43:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 234F0174968; Wed,  8 Jun 2022 15:43:54 -0400 (EDT)
Date: Wed, 8 Jun 2022 15:43:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: afd@ti.com, Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v2 1/2] trusted-firmware-a: Update to
 latest upstream master
Message-ID: <20220608194354.GZ9834@denix.org>
References: <20220608171418.576-1-afd@ti.com>
 <20220608192017.GW9834@denix.org>
 <2c842ab2-39f6-bba3-f3ea-af9789b2992c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c842ab2-39f6-bba3-f3ea-af9789b2992c@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jun 2022 19:44:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14804

On Wed, Jun 08, 2022 at 02:21:40PM -0500, Ryan Eatmon wrote:
> 
> He sent this one as a mistake.  He is going to send a V3 that moves
> the optee-[client|test|examples] out of meta-arago and into meta-ti
> so that all of the optee stuff is in one place.

What is the pressing need to update optee in dunfell to the very latest?


> On 6/8/2022 14:20, Denys Dmytriyenko wrote:
> >What is the difference between v1 and v2 of these patches?
> >
> >
> >On Wed, Jun 08, 2022 at 12:14:17PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> >>For TF-A we work against upstream first, our fork has only been
> >>used in the rare cases we need to ship a feature before we can
> >>get it upstream. This is not currently the case so lets switch
> >>to upstream repo until there is a need for our fork.
> >>
> >>Signed-off-by: Andrew Davis <afd@ti.com>
> >>---
> >>  recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 +---
> >>  1 file changed, 1 insertion(+), 3 deletions(-)
> >>
> >>diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> >>index 68bfa899..207f3dac 100644
> >>--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> >>+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> >>@@ -1,8 +1,6 @@
> >>  PV_k3 = "2.6"
> >>  LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
> >>-BRANCH_k3 = "ti-atf"
> >>-SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
> >>-SRCREV_tfa_k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
> >>+SRCREV_tfa_k3 = "453abc80b2eacbf2816c838e47e40f063227d934"
> >>  COMPATIBLE_MACHINE_k3 = "k3"
> >>  TFA_BUILD_TARGET_k3 = "all"
> >>  TFA_INSTALL_TARGET_k3 = "bl31"
> >>-- 
> >>2.36.1
> >>

