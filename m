Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01417C2BA18
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 01:18:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.63066.1718932675115128338
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 18:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5C14540CC3;
	Fri, 21 Jun 2024 01:17:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N80AYj_NIBo3; Fri, 21 Jun 2024 01:17:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3F26340CC2;
	Fri, 21 Jun 2024 01:17:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E3B28163FC2; Thu, 20 Jun 2024 21:17:52 -0400 (EDT)
Date: Thu, 20 Jun 2024 21:17:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Khan, Sabeeh" <sabeeh-khan@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [RFC][master/scarthgap][PATCH 4/4]
 cc33xx-target-scripts: add cc33xx scripts to control TI cc33xx WLAN device
Message-ID: <20240621011752.GG18231@denix.org>
References: <20240620032202.169122-1-sabeeh-khan@ti.com>
 <20240620032202.169122-5-sabeeh-khan@ti.com>
 <20240620202733.GF18231@denix.org>
 <224a7234-e455-44a1-971d-326761968609@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <224a7234-e455-44a1-971d-326761968609@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 01:18:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17789

On Thu, Jun 20, 2024 at 03:37:12PM -0500, Khan, Sabeeh wrote:
> 
> On 6/20/2024 3:27 PM, Denys Dmytriyenko wrote:
> >On Wed, Jun 19, 2024 at 10:22:02PM -0500, Sabeeh Khan via lists.yoctoproject.org wrote:
> >>[...]
> >>
> >>diff --git a/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
> >>new file mode 100644
> >>index 00000000..2f13f911
> >>--- /dev/null
> >>+++ b/meta-ti-extras/recipes-connectivity/cc33xx-target-scripts/cc33xx-target-scripts.bb
> >>@@ -0,0 +1,22 @@
> >>+DESCRIPTION = "Scripts and configuration files for TI cc33xx wireless drivers"
> >SUMMARY
> 
> Apologies for not being familiar, but are you suggesting here
> 
> to have "SUMMARY" variable instead of "DESCRIPTION", or in addition to?
> 
> Can I please have some more context over the ask here?
> 
> I don't see "SUMMARY" variable in other meta-ti recipes, so I'm
> looking for a reference.

https://docs.yoctoproject.org/ref-manual/variables.html#term-SUMMARY
https://docs.yoctoproject.org/ref-manual/variables.html#term-DESCRIPTION

SUMMARY is a shorter version of the package description (one-line under 72 
characters), while DESCRIPTION can be a longer multi-line description.

DESCRIPTION can be omitted and will be derived from SUMMARY, but not the other 
way around.

In the very old days only the DESCRIPTION was used, hence old recipes still 
don't set SUMMARY, but newly added recipes should not do that.

Here's one of the many recipes in meta-ti that properly uses/sets both:
https://git.yoctoproject.org/meta-ti/tree/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc


> >>[...]
> >>+
> >>+do_install() {
> >>+	install -d ${D}${datadir}/cc33xx/
> >>+
> >>+	scripts=`find ./* -type f -name "*.*"`
> >Is this find command necessary?
> 
> The recipe should install .sh and .conf files from the git repo only.
> 
> This was done to ignore any README or license files and not have
> them installed.

I believe you can use globs directly with install, unless there's a 
directory hierarchy:

install -m 0755 *.* ${D}${datadir}/cc33xx/

-- 
Denys

