Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45ACC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 20:21:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.152534.1719260468800934091
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 13:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E25D040CAF;
	Mon, 24 Jun 2024 20:21:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r7WriuhG6_f1; Mon, 24 Jun 2024 20:21:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C39FA40BA8;
	Mon, 24 Jun 2024 20:21:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E17BF163FC6; Mon, 24 Jun 2024 16:21:05 -0400 (EDT)
Date: Mon, 24 Jun 2024 16:21:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: sabeeh-khan@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 1/4] cc33conf: add new
 cc33conf tool for cc33xx devices
Message-ID: <20240624202105.GI18231@denix.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-2-sabeeh-khan@ti.com>
 <20240620202002.GD18231@denix.org>
 <3311702c-1cc8-4542-8661-72af6262443a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3311702c-1cc8-4542-8661-72af6262443a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Jun 2024 20:21:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17805

On Thu, Jun 20, 2024 at 03:40:22PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
> 
> On 6/20/2024 3:20 PM, Denys Dmytriyenko wrote:
> >On Wed, Jun 19, 2024 at 10:21:59PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
> >>cc33conf is a tool provided by TI to configure
> >>cc33xx WLAN devices. It can be used to change
> >>the RF parameters and other features of the target.
> >>Documentation for this tool is provided within the following link:
> >>https://www.ti.com/tool/CC33XX-SOFTWARE
> >>
> >>Signed-off-by: Sabeeh Khan<sabeeh-khan@ti.com>
> >>---
> >>  .../cc33conf/cc33conf_git.bb                  | 29 +++++++++++++++++++
> >>  1 file changed, 29 insertions(+)
> >>  create mode 100644 meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
> >>
> >>diff --git a/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
> >>new file mode 100644
> >>index 00000000..1e4faa77
> >>--- /dev/null
> >>+++ b/meta-ti-extras/recipes-connectivity/cc33conf/cc33conf_git.bb
> >>@@ -0,0 +1,29 @@
> >>+DESCRIPTION = "Configuration utility for TI CC33xx wireless devices"
> >>+LICENSE = "BSD-3-Clause"
> >>+LIC_FILES_CHKSUM ="file://COPYING;md5=d5fc448a36efe573623542dcb989afc4"
> >>+
> >>+SRCREV = "a2f84140b8d67cfc94472cf92676a409d1e47d86"
> >>+SRC_URI = "git://git.ti.com/git/cc33xx-wlan/cc33xx-utils.git;branch=master;protocol=https"
> >>+
> >>+PV = "1.7.0.120"
> >>+
> >>+S = "${WORKDIR}/git/cc33conf"
> >>+
> >>+EXTRA_OEMAKE = "CC="${CC}""
> >>+
> >>+do_install() {
> >>+	install -d ${D}${sbindir}
> >>+	install -d ${D}${sbindir}/cc33conf/
> >>+
> >>+	install -m 0755 cc33xxconf ${D}${sbindir}/cc33conf/
> >>+	install -m 0755 dictionary.txt ${D}${sbindir}/cc33conf/
> >>+	install -m 0755 default.conf ${D}${sbindir}/cc33conf/
> >>+	install -m 0755 README ${D}${sbindir}/cc33conf/
> >>+	install -m 0755 cc33xx-conf.conf ${D}${sbindir}/cc33conf/
> >>+	install -m 0755 cc33xx-conf.ini ${D}${sbindir}/cc33conf/
> >>+	install -m 0755 conf.h ${D}${sbindir}/cc33conf/
> >Should all these files really go into sbindir?
> 
> This recipe and tool is based off of wlconf. Since wlconf was
> already accepted,
> 
> I figured installing to a similar location would be practical.
> 
> However, I am open to other locations if you have suggestions.
> 
> The tool does use all of these files.

Well, wlconf does indeed set a bad precedent...

Are those files being used relative to the binary and hence should reside 
there?

The standard is to have conf files in /etc, binaries in /usr/bin or /bin, 
docs/READMEs in /usr/share/doc and .h headers in /usr/include.

And bitbake.conf sets all the corresponding variables accordingly, such as 
sysconfdir, bindir, datadir, docdir, includedir, etc:
https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf

So, if the tool is capable of locating its files in the proper system-wide 
locations, the recipe should definitely install them in the right location.

-- 
Denys

