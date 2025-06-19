Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5278AC7115C
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 11:50:54 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.12963.1750333846134767769
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jun 2025 04:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=OFNkTi4H;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QR/bfbUOcd6CqMIxr7Aaq3PC75QEVTUo1oAqju0hVXA=; b=OFNkTi4Hf5o3iRBGQwZae+aZ0O
	BIMXNBppTFw7eE30FrW/QwPVRYnvwvAYoFqV32iYVvviMKmm4tvVVppqCQVTjE1YRZKGCPn2hDFZG
	ihPMiPCuyvu41ABGw52T1bJTvZSE/fwksji0zR7eh9ifZgtXLgGybc91E3bYJCLKOfnNYNygBIPSj
	Xxiu50bgSTwjh/PuXDRPsPTsCJtTUksqpauG1iavBzORRdoD6l5LL0ESi45Bnm0X+nybemz44ahz3
	p+T3YoL8UkBL1eFe8cXvVGDBEPkc7VTskJHaDUPb04BGktfyu9RkMMgt3ICTVdJqr6NyGSr8Su3yg
	tyJiF+Vg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:49702 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uSDmx-0000000CUoJ-0xmm
	for meta-ti@lists.yoctoproject.org;
	Thu, 19 Jun 2025 07:50:41 -0400
Date: Thu, 19 Jun 2025 07:50:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-ti@lists.yoctoproject.org
Subject: is this the right place to ask about building for PocketBeagle 2?
Message-ID: <23a7970c-aeb0-9441-7740-d0324aecce55@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Jun 2025 11:50:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18657


  I'm trying to build a simple core-image-minimal for the
PocketBeagle 2; I've checked out the walnascar branch for Poky, and
the master branches for all of meta-ti and meta-arm. (I'm using
MACHINE "pocketbeagle2").

  I started a fresh build by building the kernel first, and that
worked. So I then fired off a build of core-image-minimal, but I can't
get past this point:

$ bitbake core-image-minimal

...snip ...

| /home/rpjday/oe/builds/pocket2/tmp-k3r5/hosttools/ld:
src/options/re2d-symtab.o: in function
`re2c::add_named_def(std::map<char const*, re2c::AstNode const*,
re2c::symtab_cmp_t, std::allocator<std::pair<char const* const,
re2c::AstNode const*> > >&, char const*, re2c::AstNode const*,
re2c::Input&)':
| symtab.cc:(.text+0x1f2): undefined reference to
`re2c::Input::error_at_tok(char const*, ...) const'
| /home/rpjday/oe/builds/pocket2/tmp-k3r5/hosttools/ld: warning:
creating DT_TEXTREL in a PIE
| collect2: error: ld returned 1 exit status
| make[2]: Leaving directory
'/home/rpjday/oe/builds/pocket2/tmp-k3r5/work/x86_64-linux/re2c-native/4.1/build'
| make[2]: *** [Makefile:4410: re2d] Error 1
| make[1]: Leaving directory
'/home/rpjday/oe/builds/pocket2/tmp-k3r5/work/x86_64-linux/re2c-native/4.1/build'
| make[1]: *** [Makefile:16347: all-recursive] Error 1
| make: *** [Makefile:3670: all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
ERROR: Task
(mc:k3r5:virtual:native:/home/rpjday/oe/layers/walnascar/poky/meta/recipes-support/re2c/re2c_4.1.bb:do_compile)
failed with exit code '1'

I can clean everything and start from scratch, but does this any of
this look familiar?  Am I using the correct branches?

rday

