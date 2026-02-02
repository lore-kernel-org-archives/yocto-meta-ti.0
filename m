Return-Path: <ManWag@FastMail.FM>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D2DE7DF19
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 18:13:00 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59608.1770055972450860056
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 10:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm3 header.b=PGfU9Z0i;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=ZuEIu/oO;
 spf=pass (domain: fastmail.fm, ip: 202.12.124.152, mailfrom: manwag@fastmail.fm)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D91627A002F
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 Feb 2026 13:12:51 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-03.internal (MEProxy); Mon, 02 Feb 2026 13:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1770055971; x=1770142371; bh=pwILFBHwQR
	mmEAeWt6ldnWPUpLHXTr3AXkzGDDQtusU=; b=PGfU9Z0ithdhq/S2mRzEcqrYoE
	2rUsA1ZpEGlDkiZr1P39TlLEMdbpBMJHJUvFhRBmygwF2LqLpAsRF6nH2RrkaDR4
	2nBwT6izNXoOotmZlyVeM/KxlCceurUfLz1fMeuUevnjOt53ByE2PHJmFlutDuvq
	JtU9zjZiPSt1c40o940G5buh4si4r4v/yCQw+p7rQ0qOS6UF/S77SItqrGvH10vg
	NnZdEF0UGYHY0yGmZEfOBTf1rz0KzT3pqYSl9cgni46DqT2MIiK8RLFJdAuDrnfE
	2urDD5SVu9Re52y23D6xW+buUE5azFL2FZOcpvg8V8C0C4sJCf5GpPfws4DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770055971; x=1770142371; bh=pwILFBHwQRmmEAeWt6ldnWPUpLHXTr3AXkz
	GDDQtusU=; b=ZuEIu/oOSEmrZnvlVSnW0JpRInAgCu5bTU6MQHC2rRaHuL+UOHi
	J6PwFa+fUOHtUwxsyfVKKOzuZZ3vxgbCm7L77tJSIAjgi7yrDgXD+NpL3NsTg6E8
	QAO24aTkARZPVFQYtbBi3kk8e9K/TRUDCX5CeWLbi7Jqw1/e/dJGujCOm6KOzRbC
	RQ7G6ZY1dRHWA5P7FqKVhLA3+Wn1vrundTcFXTKJfVR9kjm/wgveaAIHIcCsSUR3
	9hRRpzSc1JAvbACpScQ+bIzVIluoarcVgErE4wEXU3xD/+K39/LIunm1ahhtYrMu
	zPpf7IWv8NyO99Yk0GvL9lRUs5lJyeb+gKQ==
X-ME-Sender: <xms:I-mAaTEmnY5XMGjxRBXBlJ0yCGgT2prOeQkmf9etNCwzIz-y5ij5Qw>
    <xme:I-mAabIc9Hc0s30q1Va83462-9cXhAOKLkRXBiHJ4kn11lPFRxDrnu20Sll7LRxd-
    iZvAj4AjCZl_7J4FCe0jZRTcPPYRsHq5s_c3JlWwGgd_LhEbC9XSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeekfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkffutgfgsehtqhertdertd
    ejnecuhfhrohhmpedfofgrnhhuvghlucghrghgvghsrhgvihhthhgvrhdfuceoofgrnhgh
    rghgsefhrghsthforghilhdrhffoqeenucggtffrrghtthgvrhhnpeevgeegleeiuddvue
    eljeeuveffjeekjeefhedvhffgfefggeetieeukeegfefhleenucffohhmrghinhepthhi
    rdgtohhmpdihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeforghnhggrgheshfgrshhtofgrihhlrdfh
    ofdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmh
    gvthgrqdhtiheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:I-mAaQ2_AzPWMuRG01gkrjEQTohbpOaXDkAgcjK-l9pS8GFaLvuW_w>
    <xmx:I-mAabCHr-TKbdB9gEXgb6FTc9mUXzAipm8ggmAqTadj-7Rr8mkr5Q>
    <xmx:I-mAaVzbCWpRX1j2dazxSwRdHRxOsCkjuAl1ub57M2fTaeK8GcSruw>
    <xmx:I-mAaRn7wcMfcWOFW1F1Ped8CqbcVOFVlnPTVo6R-coWqyOOIZAVGQ>
    <xmx:I-mAaaNfceDcmGyQ4ImnmxDOLFTfeMHgRxjH5lBjyeYMdOlrIgC5Kejq>
Feedback-ID: icb4a41f2:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6BC101060065; Mon,  2 Feb 2026 13:12:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 02 Feb 2026 19:12:31 +0100
From: "Manuel Wagesreither" <ManWag@FastMail.FM>
To: meta-ti@lists.yoctoproject.org
Message-Id: <cfc1ab6b-fb2d-4f62-ba4d-acf95c568f68@app.fastmail.com>
Subject: Which MACHINE for AM62A starter kit?
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Feb 2026 18:13:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19451

Dear all,

I'd like to build an image for the SK-AM62A-LP "AM62A starter kit for lo=
w-power Sitara=E2=84=A2 processors". [1]

I'm not sure which of those two MACHINEs to choose:
* am62axx-evm [2], which seems to be specifically for the AM62 *A*
* am62xx-lp-evm [3], probably being specifically for the *LP* (whatever =
that stands for)

[1] https://www.ti.com/tool/SK-AM62A-LP
[2] http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/meta-ti-bsp/c=
onf/machine/am62axx-evm.conf?h=3Dmaster
[3] http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/meta-ti-bsp/c=
onf/machine/am62xx-lp-evm.conf?h=3Dmaster

Thanks for advice,
Manuel

