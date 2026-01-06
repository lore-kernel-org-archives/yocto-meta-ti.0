Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402CCCDC196
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 12:44:50 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89085.1767703471672322588
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 04:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Jzy5moc1;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i79kD625LyiydV8AAwGjBGduBC/ldeLvug82DLhHKyg=; b=Jzy5moc1DMdtvr/ErqFsUjRH5Z
	UaNRsxgQlDEeupioeMwW2U5syHqaF96HgRIwhlKb5sm8VsJplT7H1qFWtvn9MFwk+CxhGhyB1qVWG
	BBMoagQ2kQKJfsENm9u985+r50KKaOZSp/0lD4e/Yc8jb1Ad1nmwAoILObTpOroMO3Vl0OEZ1mENA
	cqNpWDSuKx+n20AruGXA0STgUdpb1yH0/LO5DLRDjgOMgFoICe7aKd/5NZaLQC7iQIOqVKL9qxpyo
	yC1njXgyZO4hWdJqLEfWgmj48NzMLtmAkauSJMFuxgrBfR1h/1qIbFt4AoeUBid2sZFlcjvVlOUQf
	JizfaO1A==;
Received: from [147.129.179.166] (port=54902 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vd6QG-0000000BjlC-3CNp
	for meta-ti@lists.yoctoproject.org;
	Tue, 06 Jan 2026 07:44:29 -0500
Date: Tue, 6 Jan 2026 07:47:22 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-ti mailing list <meta-ti@lists.yoctoproject.org>
Subject: These days, what is the most straightforward for building
 core-image-minimal for Beagleplay?
Message-ID: <5ac19ff5-d52a-851c-e4a9-4f99c2efbc24@crashcourse.ca>
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
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jan 2026 12:44:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19394


  From what I see in the meta-ti layer:

https://git.yoctoproject.org/meta-ti/tree/

the meta-beagle layer has a MACHINE definition for beagleplay.conf, so
is that the "obvious" basic build to get started?

rday

