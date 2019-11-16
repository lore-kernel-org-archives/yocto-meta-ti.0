Return-Path: <paul@betafive.co.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C826E00D8B; Sat, 16 Nov 2019 03:51:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
	low *      trust
	*      [66.111.4.25 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 461 seconds by postgrey-1.32 at yocto-www;
	Sat, 16 Nov 2019 03:51:21 PST
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7932AE00AE6
	for <meta-ti@yoctoproject.org>; Sat, 16 Nov 2019 03:51:21 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E532F21B01;
	Sat, 16 Nov 2019 06:43:39 -0500 (EST)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Sat, 16 Nov 2019 06:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:date:from:to:subject:content-type; s=
	fm3; bh=XT/7SJ3/S/hhqmnR0E9jvuxiTWWGQ3GA/EBYPjivlTY=; b=mwY6Sw09
	Cj2fab8SUsuYR9jSbcJq2tIGCW++DgxSeZPwM6QNCk8zWebFt0o6YmltFnZWatnM
	N3EkK3FHRU9fhnOSk2//uxjcumtroIsD4zqRWDHUySKohw5vhrTDH7In8VGjGcFD
	of2DH706MvFdruVocTCd5ufd1M6i/fP2QRXtA16I1OPmHcfqTm0V0jHnAbnGhh3G
	fMOEzcewnJoM6lpUXNusjjF0apxZ2LsX4kPErVhFtVArsZ2FAqbm8hwL4Z5pnXcy
	nZWjy/0Pv42/Ayzz6k0SnGallBYtJG9Lrt/mlr51BRVr4DFay4Ql6nL9YCdmbC9X
	1wzTeXIiJLKN2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=XT/7SJ3/S/hhqmnR0E9jvuxiTWWGQ
	3GA/EBYPjivlTY=; b=BcI+GnMVp9do6oWFFhuo9CHQwzmUmWkC+m9qQeEGUyqTe
	QKq/dyhTRFShCIV/5aN000GurUIU7uTjMSXfYtlhwSoTMJ4IVFY/CYIFswAWqNBg
	gIf93I9kSdYu69NWmJvuq1SapFXfOqB96Uv9MAaYYg0AhlnI/DhvbEOpfY2NDO47
	N6CqLjn6Afb5cPnIO7rVpgyK7ONh/KCuKY4SkYzhbOD3GNR6PbAS1GVnYiHF65Pm
	VdMQ/OKJIMX5cbO9FTfd44mDSvMXGdzChGAbVpQL5pwSj5fFasGIFcwxsvEvA+YD
	Wl4SFLsRdHJxdqypmaronJFTir9h0gEXRkPTVwrMA==
X-ME-Sender: <xms:6-DPXYUZKhFcbG-sm5bx3PWJiAiLXQPgByNOP7fN_aBn9FAOIq5-VA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudefledgtdejucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
	erredtnecuhfhrohhmpedfrfgruhhluceurghrkhgvrhdfuceophgruhhlsegsvghtrghf
	ihhvvgdrtghordhukheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhessggvth
	grfhhivhgvrdgtohdruhhknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6-DPXaMWFkyBaZQxkt6Vbd7esyASKPmnm0QyPO8KNhEwdBkFI8RyVw>
	<xmx:6-DPXTynOkXGoZQQy5-dl5TfTaCTMyLxSk_MTokXGOfI0rrVqX5S-Q>
	<xmx:6-DPXfjosDEtU61semGdoHz3jEZLu5SycZss33BYfLfkbgXvmKXELw>
	<xmx:6-DPXTw4Sch6kl__pwlR2Lvf6uiXatzbwH6Is4WHACDMuZvNiwOe2Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 64475E00A3; Sat, 16 Nov 2019 06:43:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-562-gfd0633a-fmstable-20191114v1
Mime-Version: 1.0
Message-Id: <2972340c-d2ba-481b-900c-9c758cb60fde@www.fastmail.com>
Date: Sat, 16 Nov 2019 11:43:19 +0000
From: "Paul Barker" <paul@betafive.co.uk>
To: meta-ti@yoctoproject.org, denys@ti.com
Subject: Backport request for thud
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Nov 2019 11:51:22 -0000
Content-Type: text/plain

I'm currently seeing build failures on the thud branch with meta-ti under Centos 7 and Centos 8. As /lib and /lib64 are links to /usr/lib and /usr/lib64 respectively, the logic in ti-unpack.inc is looking for the 32-bit C library under /lib32 which doesn't exist.

Could you backport 6f80b1e5595a13eec465581cfb352efcb0286bc8 from master to thud to fix this?

Thanks,

-- 
Paul Barker

