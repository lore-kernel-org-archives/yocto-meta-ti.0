Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B21CD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 13:19:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45409.1781183951586462223
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 06:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=j8O/e7nT;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WwCuA+gq+rvoXjk91BDtGbT0V6DjZ0P3joGuSj7BHKQ=; b=j8O/e7nTFAwGt0e+OnH8XOJMMh
	gpx4sjlQL9IcSzo8oaEKANtr1Xn2xSeDHCAGVI8YnK0U/fhuKxM4auN8zEFtaKwtX2DBkjCNIxjic
	/yPpLt1EqDfv/punECLyFd+DDRjlK40gGXTAiLkoFfKHO2WmsME1ZeFNtsF2L5Qqjj1D4aAx80+VV
	5nKhNWyRdnWYwQJos7C1Tb3rj+wn5GDAe2YjyLLkcSrEKo+ZUcMaBQCdHXoD6+YQ7yzsDCxgOUYiW
	4XcYMmmdJBDTLkaNlO9rFw/C9bqHdOaaKDLLC9QajMd30iF0rAhmy8dQjOIv6fV/HMcrVqM+deBfD
	J2eCrZ9g==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:50792 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXfJM-0000000BfQA-3woc
	for meta-ti@lists.yoctoproject.org;
	Thu, 11 Jun 2026 09:19:09 -0400
Date: Thu, 11 Jun 2026 09:19:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-ti mailing list <meta-ti@lists.yoctoproject.org>
Subject: want to clarify (simple) instructions to build for beagleplay
Message-ID: <fae8ab1f-e451-9357-de74-ba776a3ca658@crashcourse.ca>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 13:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20021


  friend just got a beagleplay, asked me whether there was any
complication in building a simple core-image-minimal with yocto
project ... i did some quick research and, from what i read, it's as
simple as:

  1) check out oe-core, meta-ti and meta-arm layers
  2) add all the relevant layers to bblayers.conf
  3) Set MACHINE = "beagleplay"
  4) "bitbake core-image-minimal"

and one should get an appropriate wic image.

  one question -- are the "master" branches safe for all of the above,
or should one play it safe and check out "wrynose" for all of the
above?

  seems pretty straightforward.

rday


