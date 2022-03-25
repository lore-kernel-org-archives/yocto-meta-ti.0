Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53385C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 20:31:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.39.1648240264496990867
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 13:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7B56740C46;
	Fri, 25 Mar 2022 20:31:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxKtgdm1Ih1y; Fri, 25 Mar 2022 20:31:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4B4A040B05;
	Fri, 25 Mar 2022 20:30:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7E0391748B6; Fri, 25 Mar 2022 16:30:57 -0400 (EDT)
Date: Fri, 25 Mar 2022 16:30:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: reatmon@ti.com, Yogesh Siraswar <yogeshs@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH v3] machine: Add am62xx evm
 configuration
Message-ID: <20220325203057.GH23554@denix.org>
References: <20220324222129.9313-1-reatmon@ti.com>
 <a0625acc-3a60-a54d-655f-e4438ba1e917@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0625acc-3a60-a54d-655f-e4438ba1e917@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Mar 2022 20:31:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14555

On Thu, Mar 24, 2022 at 08:47:12PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> On 3/24/22 5:21 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >@@ -167,6 +182,10 @@ ALTERNATIVE_${PN}_am64xx = "\
> >                      am64-main-r5f1_1-fw \
> >                      am64-mcu-m4f0_0-fw \
> >                      "
> >+ALTERNATIVE_${PN}_am62xx = "\
> >+                    am62-mcu-m4f0_0-fw \
> >+		            am62-main-r5f0_0-fw \
> 
> 
> ^^ Looks like some tabs found there way in here..
> 
> Why do we have these indented so far anyway, this whole file has wacky
> indenting, needs normalized.

Some quotes from the manual for 3 different cases - shell code, python code 
and multi-line statements:

===============================================
Indentation: Use spaces for indentation rather than than tabs. For shell 
functions, both currently work. However, it is a policy decision of the Yocto 
Project to use tabs in shell functions. Realize that some layers have a policy 
to use spaces for all indentation.

Python Function Whitespace: All Python functions must now use four spaces for 
indentation. Previously, an inconsistent mix of spaces and tabs existed, which 
made extending these functions using _append or _prepend complicated given 
that Python treats whitespace as syntactically significant. If you are 
defining or extending any Python functions (e.g. populate_packages, do_unpack, 
do_patch and so forth) in custom recipes or classes, you need to ensure you 
are using consistent four-space indentation.

Line Continuation: \ - Use the backward slash (\) character to split a 
statement over multiple lines. Place the slash character at the end of the 
line that is to be continued on the next line:

     VAR = "A really long \
            line"
===============================================

As you can see in the final example of multi-line, it shows the second line 
starting where its content begins in the previous line. But it is not required 
to indent like that, especially if the left part before the assignment sign is 
very long, e.g.:

ALTERNATIVE_${PN}_am62xx = "am62-mcu-m4f0_0-fw \
                            am62-main-r5f0_0-fw \

Instead, you could start at the beginning of the line or use minimal 
indentation of few spaces (no tabs here):

ALTERNATIVE_${PN}_am62xx = " \
am62-mcu-m4f0_0-fw \
am62-main-r5f0_0-fw \

ALTERNATIVE_${PN}_am62xx = " \
    am62-mcu-m4f0_0-fw \
    am62-main-r5f0_0-fw \

Both are acceptable.

Tabs to be only used in shell functions, such as do_compile, do_install, etc.

And one more final comment - when making functional changes, please keep the 
existing indentation as is. If indentation need to be cleaned up or changed 
for a recipe, should be a separate patch just for that w/o any functionality 
or code changes - don't mix them in a single patch, unless it's a one-off.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

