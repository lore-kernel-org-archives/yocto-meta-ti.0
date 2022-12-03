Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFC1C352A1
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 15:48:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.106677.1670082504953617526
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 03 Dec 2022 07:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AC8DA40BC4;
	Sat,  3 Dec 2022 15:48:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQqwbgkSMXBw; Sat,  3 Dec 2022 15:48:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6C9B3406B7;
	Sat,  3 Dec 2022 15:48:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 14BC51636A4; Sat,  3 Dec 2022 10:48:09 -0500 (EST)
Date: Sat, 3 Dec 2022 10:48:09 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Manorit Chawdhry <m-chawdhry@ti.com>, meta-ti@lists.yoctoproject.org,
	Andrew Davis <afd@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH] optee: update optee-client,
 optee-test, optee-examples to 3.19 tag
Message-ID: <20221203154808.GV22689@denix.org>
References: <20221202100452.1868797-1-m-chawdhry@ti.com>
 <b1812e45-6c73-4a2a-16a1-704393f35e3a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1812e45-6c73-4a2a-16a1-704393f35e3a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 03 Dec 2022 15:48:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15400

On Fri, Dec 02, 2022 at 08:04:52PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 12/2/2022 4:04, Manorit Chawdhry wrote:
> >optee-os was updated to 3.19 tag but the others were still outdated.
> >
> >Updates other optee components to 3.19 tag
> >
> >Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> >---
> >  recipes-security/optee/optee-client_%.bbappend   | 4 ++--
> >  recipes-security/optee/optee-examples_%.bbappend | 4 ++--
> >  recipes-security/optee/optee-test_%.bbappend     | 4 ++--
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >
> >diff --git a/recipes-security/optee/optee-client_%.bbappend b/recipes-security/optee/optee-client_%.bbappend
> >index 5675570a..6737ba92 100644
> >--- a/recipes-security/optee/optee-client_%.bbappend
> >+++ b/recipes-security/optee/optee-client_%.bbappend
> >@@ -1,2 +1,2 @@
> >-PV_ti-soc = "3.17.0+git${SRCPV}"
> >-SRCREV_ti-soc = "a5c30b1277466a9bf85b62f45a6b00e79774e29c"
> >+PV_ti-soc = "3.19.0+git${SRCPV}"
> >+SRCREV_ti-soc = "140bf463046071d3ca5ebbde3fb21ee0854e1951"
> 
> optee-client will not build against this SRCREV.  They added a call
> to pkg-config which is not readily available to the recipe without a
> change to your patch.
> 
> You need to add:
> 
> DEPENDS += "pkgconfig"

You probably don't want a target pkgconfig, but a native one.
Do this instead:

inherit pkgconfig


> Please do so and resubmit the patch.
> 
> 
> >diff --git a/recipes-security/optee/optee-examples_%.bbappend b/recipes-security/optee/optee-examples_%.bbappend
> >index 9941b345..dda7cbbf 100644
> >--- a/recipes-security/optee/optee-examples_%.bbappend
> >+++ b/recipes-security/optee/optee-examples_%.bbappend
> >@@ -1,5 +1,5 @@
> >-PV_ti-soc = "3.17.0+git${SRCPV}"
> >-SRCREV_ti-soc = "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
> >+PV_ti-soc = "3.19.0+git${SRCPV}"
> >+SRCREV_ti-soc = "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
> >  SRC_URI_ti-soc = "git://github.com/linaro-swg/optee_examples.git;protocol=https"
> >  DEPENDS_append_ti-soc = " python3-cryptography-native"
> >diff --git a/recipes-security/optee/optee-test_%.bbappend b/recipes-security/optee/optee-test_%.bbappend
> >index d81ae521..79b4b4d6 100644
> >--- a/recipes-security/optee/optee-test_%.bbappend
> >+++ b/recipes-security/optee/optee-test_%.bbappend
> >@@ -1,5 +1,5 @@
> >-PV_ti-soc = "3.17.0+git${SRCPV}"
> >-SRCREV_ti-soc = "8a698baf9e8e010e4d8d52e6aded42dfc31e5b25"
> >+PV_ti-soc = "3.19.0+git${SRCPV}"
> >+SRCREV_ti-soc = "ab9863cc187724e54c032b738c28bd6e9460a4db"
> >  SRC_URI_ti-soc = "git://github.com/OP-TEE/optee_test.git;protocol=https"
> >  DEPENDS_append_ti-soc = " python3-cryptography-native"
> 
> -- 
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15397): https://lists.yoctoproject.org/g/meta-ti/message/15397
> Mute This Topic: https://lists.yoctoproject.org/mt/95403088/3617104
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [denis@denix.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

